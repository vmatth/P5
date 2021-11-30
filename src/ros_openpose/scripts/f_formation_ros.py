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
from numpy.core.fromnumeric import squeeze



class F_formation:
    def __init__(self):
        rospy.Subscriber("/BodyPoints", BodyPoints, self.callback)

    def callback(self, msg): #Callback for new BodyPoint
        if(self.checkForPeople(msg)):
            rospy.loginfo("There are people!")
            persons = self.getCenterAndAngle(msg)
            rospy.loginfo("persons before 3 m %s", persons)
            persons = self.excludeDistance(persons, 0.5)
            rospy.loginfo("persons after 3 m %s", persons)
        else:
            rospy.loginfo("There are no people")    

    def checkForPeople(self, msg): #Checks if there are people in BodyPoints
        return (len(msg.LeftHip) > 0 and len(msg.LeftAnkle) > 0 and len(msg.RightHip) > 0 and len(msg.RightAnkle) > 0)

    def convertPointToArray(self, point): #Converts point from x,y to an array
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
            x1 = 0
            x2 = 1
            persPoint1OnLine = persmodel.coef_*x1+persmodel.intercept_
            persPoint2OnLine = persmodel.coef_*x2+persmodel.intercept_
            dx = x2 - x1
            persdy = persPoint2OnLine - persPoint1OnLine

            #choose the normal vector that points the same way as the feet
            if persPointLeftAnkle[0] < persPointRightAnkle[0]:
                    persNormal1 = (-persdy, dx)
                    PersNormalAngle = math.atan2(persNormal1[1], persNormal1[0])

            elif persPointLeftAnkle[0] > persPointRightAnkle[0]:
                    persNormal2 = (persdy, -dx)

                    PersNormalAngle = math.atan2(persNormal2[1], persNormal2[0])

            #Calculate the approx center of the person
            if persPointRightAnkle[0] > persPointLeftAnkle[0] and persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff

            elif persPointRightAnkle[0] < persPointLeftAnkle[0] and persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff

            elif persPointRightAnkle[0] > persPointLeftAnkle[0] or persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff

            elif persPointRightAnkle[0] < persPointLeftAnkle[0] or persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff
            FinalList = [persCenter[0], persCenter[1], PersNormalAngle]
            ########################################
            persons.append(FinalList)
        rospy.loginfo("Person list %s",persons)
        return persons

    def countIncidenceArray(self, arr, thredshold):
        count = 0
        for i in range(len(arr)):
            if arr[i] > thredshold:
                count = count + 1
        return count

    #Removes people that are "maxDist" array from each other
    def excludeDistance(self, peopleArray, maxDist):
        peopleNum = len(peopleArray)
        point = np.full([peopleNum, 2], None)
        for i in range(peopleNum): # Range(Number of persons in array)
            for j in range(2): #range(1) for 2D range(2) for 3D
                point[i][j] = peopleArray[i][j]
        for i in range(peopleNum):
            for j in range(peopleNum):
                tempPointDiffLengthArray = np.full([peopleNum], 0)
                pointDiff = point[j] - point[i]
                pointDiffLength = math.sqrt((pointDiff[0]*pointDiff[0])+(pointDiff[1]*pointDiff[1]))
                if pointDiffLength > maxDist:
                    tempPoint = point
                    tempPointDiff = pointDiff
                    for k in range(peopleNum):
                        tempPointDiff = point[j] - tempPoint[k]
                        tempPointDiffLength = math.sqrt((tempPointDiff[0]*tempPointDiff[0])+(tempPointDiff[1]*tempPointDiff[1]))
                        tempPointDiffLengthArray[k] = tempPointDiffLength
                    if (self.countIncidenceArray(tempPointDiffLengthArray, maxDist) == (len(tempPointDiffLengthArray)-1)):
                        peopleArray[j] = 999
        while 999 in peopleArray: #wtf is this
            peopleArray.remove(999)
        return peopleArray


def main():
    rospy.init_node('F_Formation', anonymous=False)
    F_formation()
    rospy.spin()


if __name__ == '__main__':
    main()
