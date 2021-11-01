#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image

def callback(data):
    print("camera callback!")
    rospy.loginfo("height: %d", data.height)
    rospy.loginfo("width: %d", data.width)

def listener():
    
    rospy.Subscriber("/spot/depth/frontleft/camera/image", Image, callback)
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('point_cloud_listener')
    rospy.loginfo("Starting point_cloud node")
    listener()