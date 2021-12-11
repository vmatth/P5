#!/usr/bin/env python
import rospy
import csv
from nav_msgs.msg import Odometry
from visualization_msgs.msg import Marker

class Tracker:
    def __init__(self):
        self.vis_pub = rospy.Publisher('markers', Marker, queue_size=10)
        self.logPosition = []
        rospy.Subscriber("/odom", Odometry, self.callback)

    def callback(self, data):
        rospy.loginfo("Odom from spot: %s", data)
        self.logPosition.append(data.pose.position)

        with open('odom_log', 'w') as f:
            writer = csv.writer(f)
            writer.writerow(data.pose.position)

        marker = Marker()
        marker.header.frame_id = "/body"
        marker.type = marker.SPHERE
        marker.action = marker.ADD
        marker.scale.x = 0.05
        marker.scale.y = 0.05
        marker.scale.z = 0.05
        marker.color.a = 1.0
        marker.pose.orientation.w = 1.0
        marker.pose.position.x = data.pose.position.x
        marker.pose.position.y = data.pose.position.y
        marker.pose.position.z = data.pose.position.z

        self.vis_pub.publish(marker)






if __name__ == '__main__':
    rospy.init_node('F_Formation', anonymous=False)
    Tracker()
    rospy.spin()
