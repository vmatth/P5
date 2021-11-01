#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def callback(data):
    print("camera callback!")
    rospy.loginfo("height: %d", data.height)
    rospy.loginfo("width: %d", data.width)

    rospy.loginfo("data length: %d", len(data.data))
    i = 0
    for x in data.data:
        i = i + 1
        rospy.loginfo("Index[%d]: %s", i, x)

def listener():
    rospy.loginfo("listening")
    rospy.Subscriber("/spot/depth/frontleft/image", Image, callback)
    rospy.spin()

def publisher():
    pub = rospy.Publisher('/depth/frontleft', Image, queue_size=10)
    


    

if __name__ == '__main__':
    rospy.init_node('point_cloud_listener')
    rospy.loginfo("Starting point_cloud node")
    listener()
    ##publisher()
