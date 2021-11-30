#!/usr/bin/env python3
# import modules
import rospy
from ros_openpose.msg import BodyPoints
from geometry_msgs.msg import Point
import numpy as np
import sys
import time
import math
from rospy.core import rospyinfo
from sklearn.linear_model import LinearRegression



class F_formation:
    def __init__(self):
        rospy.Subscriber("/BodyPoints", BodyPoints, self.callback)
        LeftHip = []
        LeftAnkle = []
        RightHip = []
        RightAnkle = []

    def callback(self, msg): #Callback for new BodyPoint
        if(self.checkForPeople(msg)):
            rospy.loginfo("There are people!")
            self.getCenterAndAngle(msg)
        else:
            rospy.loginfo("There are no people")    

    def checkForPeople(self, msg): #Checks if there are people in BodyPoints
        return (len(msg.LeftHip) > 0 and len(msg.LeftAnkle) > 0 and len(msg.RightHip) > 0 and len(msg.RightAnkle) > 0)

    def convertPointToArray(self, point):
        return np.array([point.x, point.y])

    def getCenterAndAngle(self, msg):
        persons = []
        for i in range(0, len(msg.LeftHip)): #Loop number of people
            PointNum = 4 #2 hips and 2 ankles = 4 Points
            PersNormalAngle = 0
          # print('Finding Angle...')
            persPointLeftHip = self.convertPointToArray(msg.LeftHip[i])
            persPointLeftAnkle = self.convertPointToArray(msg.LeftAnkle[i])
            persPointRightHip = self.convertPointToArray(msg.RightHip[i])
            persPointRightAnkle = self.convertPointToArray(msg.RightAnkle[i])

            persPointList = np.array([persPointLeftHip, persPointLeftAnkle, persPointRightHip, persPointRightAnkle])
            persx = np.array([None, None, None, None]).reshape(-1, 1)
            persy = np.array([None, None, None, None])

        # #Seperate the x and y values and put them in their own array
            for i in range(PointNum):
                 persx[i] = persPointList[i][0]
                 persy[i] = persPointList[i][1]

        #Make linear regression of the x and y

            persmodel = LinearRegression(). fit(persx, persy)
#        print('person intercept: ', persmodel.intercept_)
#        print('person slope: ', persmodel.coef_)
            x1 = 0
            x2 = 1
            persPoint1OnLine = persmodel.coef_*x1+persmodel.intercept_
            persPoint2OnLine = persmodel.coef_*x2+persmodel.intercept_
           # persVectorOnLine = np.array([x2-x1, persPoint2OnLine-persPoint1OnLine])
            #Find difference in x and y
            dx = x2 - x1
            persdy = persPoint2OnLine - persPoint1OnLine

            #choose the normal vector that points the same way as the feet
            if persPointLeftAnkle[0] < persPointRightAnkle[0]:
                    persNormal1 = (-persdy, dx)
    #                print('Person is facing in the direction of: ', persNormal1)
                    PersNormalAngle = math.atan2(persNormal1[1], persNormal1[0])
    #                print('Person has an angle of: ', PersNormalAngle)
            elif persPointLeftAnkle[0] > persPointRightAnkle[0]:
                    persNormal2 = (persdy, -dx)
    #                print('Person is facing in the direction of: ', persNormal2)
                    PersNormalAngle = math.atan2(persNormal2[1], persNormal2[0])
    #                print('Person has an angle of: ', PersNormalAngle) 

            #Calculate the approx center of the person
            if persPointRightAnkle[0] > persPointLeftAnkle[0] and persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff
    #                print('Person center: ', persCenter)
            elif persPointRightAnkle[0] < persPointLeftAnkle[0] and persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff
    #                print('Person center: ', persCenter)
            elif persPointRightAnkle[0] > persPointLeftAnkle[0] or persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff
    #                print('Person center: ', persCenter)
            elif persPointRightAnkle[0] < persPointLeftAnkle[0] or persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff
    #                print('Person center: ', persCenter)
            FinalList = [persCenter[0], persCenter[1], PersNormalAngle]
            ########################################
            persons.append(FinalList)
        rospy.loginfo("Person list %s",persons)




def main():
    rospy.init_node('F_Formation', anonymous=False)
    F_formation()
    rospy.spin()


if __name__ == '__main__':
    main()
