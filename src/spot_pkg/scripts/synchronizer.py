#!/usr/bin/env python
from genpy import message
import rospy
import message_filters
from sensor_msgs.msg import PointCloud2


def callback(frontleft, frontright):
    print("callback :D!") 

    print(frontright.height)


if __name__ == '__main__':
    rospy.init_node('synchronizer_node')
    rospy.loginfo("Starting synchronizer node")

    points_pub = rospy.Publisher('/points/combined', PointCloud2, queue_size=10)

    frontleft_sub = message_filters.Subscriber('/points/frontleft', PointCloud2)
    frontright_sub = message_filters.Subscriber('/points/frontright', PointCloud2)

    ts = message_filters.ApproximateTimeSynchronizer([frontleft_sub, frontright_sub], 10, 0.1)
    ts.registerCallback(callback)

    rospy.spin()
