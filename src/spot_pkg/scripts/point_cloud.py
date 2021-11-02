#!/usr/bin/env python2.7
import rospy
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2




class image_converter:

    def __init__(self):
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/spot/depth/frontleft/image",Image, self.callback)

    def callback(self,data):
        print("camera callback!")
        rospy.loginfo("height: %d", data.height)
        rospy.loginfo("width: %d", data.width)
        try: 
            cv_image = self.bridge.imgmsg_to_cv2(data, "mono16")
        except CvBridgeError as e:
            print(e)
        
        cv2.imshow("Image window", cv_image)
        cv2.waitKey(3)
 

if __name__ == '__main__':
    ic = image_converter()
    rospy.init_node('point_cloud_listener')
    rospy.loginfo("Starting point_cloud node")
    rospy.spin()
