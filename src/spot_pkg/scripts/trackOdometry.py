#!/usr/bin/env python
import rospy
import csv
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker

class Tracker:
    def __init__(self):
        self.vis_pub = rospy.Publisher('markers', Marker, queue_size=10)
        self.logPosition = []
        rospy.Subscriber("/spot/odometry", Odometry, self.callback)
	self.id = 0

    def callback(self, data):
        rospy.loginfo("Odom from spot: %s", data)
        self.logPosition.append(data.pose.pose.position)

        with open('odom_log', 'w') as f:
            writer = csv.writer(f)
            #writer.writerow(data.pose.pose.position)
	self.id = self.id + 1
        marker = Marker()
        marker.header.frame_id = "gpe"
        marker.type = marker.SPHERE
        marker.action = marker.ADD
	marker.id = self.id
	marker.frame_locked = True
        marker.scale.x = 0.1
        marker.scale.y = 0.1
        marker.scale.z = 0.1
        marker.color.a = 1.0
        marker.pose.orientation.w = 1.0
        marker.pose.position.x = 0#data.pose.pose.position.x
        marker.pose.position.y = 0#data.pose.pose.position.y
        marker.pose.position.z = 0#data.pose.pose.position.z

        self.vis_pub.publish(marker)






if __name__ == '__main__':
    rospy.init_node('F_Formation', anonymous=False)
    Tracker()
    rospy.spin()
