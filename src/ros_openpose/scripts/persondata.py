#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# echo.py: sample script to print ros message to terminal
# Author: Ravi Joshi
# Date: 2020/03/02

# import modules
import rospy
from ros_openpose.msg import Frame
from ros_openpose.msg import BodyPoints
from geometry_msgs.msg import Point
import sys
# insert at position 1 in the path, as 0 is the path of this file.
#import f_FormationDetector
#import test
#import f_FormationDetector
import numpy as np

from rospy.core import rospyinfo
#pub=None

class PersonData:

    def __init__(self):
        self.pub = rospy.Publisher('BodyPoints', BodyPoints, queue_size=10)
        rospy.Subscriber("/frame", Frame, self.callback)

    def checkForPoint(self, point): #Returns true if a point is over 0.1

        return (abs(point.x) > 0.0001 and abs(point.y) > 0.0001 and abs(point.x) < 20 and abs(point.y) < 20)


    def callback(self, msg):
        i = 0
        leftHip = []
        leftAnkle = []
        rightHip = []
        rightAnkle = []
        leftKnee = []
        rightKnee = []

        for person in msg.persons:
            i = i +1
            rospy.loginfo("Person: %d", i)
            text = [person.bodyParts[9].point, person.bodyParts[12].point, person.bodyParts[11].point, person.bodyParts[14].point, person.bodyParts[10].point, person.bodyParts[13].point]
            #rospy.loginfo('%s\n' % text)

            leftHipPoint = Point(x = text[1].x, y = text[1].z, z = text[1].y)
            leftAnklePoint = Point(x = text[3].x, y = text[3].z, z = text[3].y)
            rightHipPoint = Point(x = text[0].x, y = text[0].z, z = text[0].y)
            rightAnklePoint = Point(x = text[2].x, y = text[2].z, z = text[2].y)
            leftKneePoint = Point(x = text[5].x, y = text[5].z, z = text[5].y)
            rightKneePoint = Point(x = text[4].x, y = text[4].z, z = text[4].y)

            rospy.loginfo("left Hip %s", leftHipPoint)
            rospy.loginfo("right Hip %s", rightHipPoint)
            rospy.loginfo("left Ankle %s", leftAnklePoint)
            rospy.loginfo("right Ankle %s", rightAnklePoint)
            rospy.loginfo("left Knee %s", leftKneePoint)
            rospy.loginfo("right Knee %s", rightKneePoint)

            #Add this person if all 4 body points exist (are not very small numbers)
            if (self.checkForPoint(leftHipPoint) and self.checkForPoint(leftAnklePoint) and self.checkForPoint(rightHipPoint) and self.checkForPoint(rightAnklePoint) and self.checkForPoint(rightKneePoint) and self.checkForPoint(leftKneePoint)): #Returns true all points are over 0.1
                leftHip.append(leftHipPoint)
                leftAnkle.append(leftAnklePoint)

                rightHip.append(rightHipPoint)
                rightAnkle.append(rightAnklePoint)

                leftKnee.append(leftKneePoint)
                rightKnee.append(rightKneePoint)
                rospy.loginfo("This person exists!")
            else:
                rospy.loginfo("This person does not have all body parts")

        if(len(leftHip) > 0): #Only publish points if there are any

            bodyPoints = BodyPoints()
            bodyPoints.LeftHip = leftHip
            bodyPoints.RightHip = rightHip
            bodyPoints.LeftAnkle = leftAnkle
            bodyPoints.RightAnkle = rightAnkle
            bodyPoints.LeftKnee = leftKnee
            bodyPoints.RightKnee = rightKnee

            self.pub.publish(bodyPoints)



def main():
    rospy.init_node('persondata', anonymous=False)
    PersonData()
    rospy.spin()


if __name__ == '__main__':
    main()
