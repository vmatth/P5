#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2


def callback(data):
    print("camera callback!")
    rospy.loginfo("height: %d", data.height)
    rospy.loginfo("width: %d", data.width)

    rospy.loginfo("data length: %d", len(data.data))

    bridge = CvBridge()
    cv_image = bridge.imgmsg_to_cv2(data.data, "mono8")



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
