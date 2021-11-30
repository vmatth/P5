#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# echo.py: sample script to print ros message to terminal
# Author: Ravi Joshi
# Date: 2020/03/02

# import modules
import rospy
from ros_openpose.msg import Frame
from ros_openpose.msg import BodyPoints
from geometry_msgs import Point
import sys
# insert at position 1 in the path, as 0 is the path of this file.
#import f_FormationDetector
#import test
#import f_FormationDetector
import numpy as np

pub = None

def callback(msg):
    i = 0
    leftHip = []
    leftAnkle = []
    rightHip = []
    rightAnkle = []
    rospy.loginfo("Person")
    # for person in msg.persons: 
    #     t = [person.bodyParts]
    # rospy.loginfo('%s\n' % t)
    #text = [bodyPart.point for person in msg.persons for bodyPart in person.bodyParts]
    for person in msg.persons:
        i = i +1
        #for bodyPart in person.bodyParts:
        rospy.loginfo("nosejob, person: %d" ,i)
        text = [person.bodyParts[8].point, person.bodyParts[11].point, person.bodyParts[10].point, person.bodyParts[13].point]
        rospy.loginfo('%s\n' % text)
        #leftHiptemp = np.array([text[1].x, text[1].z]) # I think it is x and z (look at picture on desktop)

        leftHipPoint = Point(x = text[1].x, y = text[1].z)

        leftAnklePoint = Point(x = text[3].x, y = text[3].z)

        rightHipPoint = Point(x = text[0].x, y = text[0].z)

        rightAnklePoint = Point(x = text[2].x, y = text[2].z)

        #leftHip.append(leftHipPoint)
        #leftAnkle.append(leftAnklePoint)

        #rightHip.append(rightHipPoint)
        #rightAnkle.append(rightAnklePoint)
        
        #leftAnkletemp = np.array([text[3].x, text[3].z]) # I think it is x and z (look at picture on desktop)
        #leftAnkle.append(leftAnkletemp)

        #rightHiptemp = np.array([text[0].x, text[0].z]) # I think it is x and z (look at picture on desktop)
        #rightHip.append(rightHiptemp)

        #rightAnkletemp = np.array([text[2].x, text[2].z]) # I think it is x and z (look at picture on desktop)
        #rightAnkle.append(rightAnkletemp)

    bodyPoints = BodyPoints()
    bodyPoints.LeftHip = leftHipPoint
    bodyPoints.RightHip = rightHipPoint
    bodyPoints.LeftAnkle = leftAnklePoint
    bodyPoints.RightAnkle = rightAnklePoint

    pub.publish(bodyPoints)

    
    #rospy.loginfo(leftHip)
    #rospy.loginfo(leftAnkle)
    #rospy.loginfo(rightHip)
    #rospy.loginfo(rightAnkle)
    #rospy.logdebug(f_FormationDetector.formationDetector(leftHip, leftAnkle, rightHip, rightAnkle))


def main():
    pub = rospy.Publisher('BodyPoints', BodyPoints, queue_size=1)
    rospy.init_node('persondata', anonymous=False)

    # read the parameter from ROS parameter server
    #frame_topic = rospy.get_param('~pub_topic')

    rospy.Subscriber("/frame", Frame, callback)

    rospy.spin()


if __name__ == '__main__':
    main()
