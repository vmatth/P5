#!/usr/bin/env python


import rospy
from std_msgs.msg import String

def func():
    print("fuck python")

pik=2

def dinmor():
    print("DIIIINNNN MOOOOOR")


if pik==2:
    dinmor()

if __name__ == '__main__':
    rospy.init_node('python_test', anonymous=True)
    func()

