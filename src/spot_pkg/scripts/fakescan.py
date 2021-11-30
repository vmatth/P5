#!/usr/bin/env python
import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Header
import math

def callback(frontleft, frontright):
    print("callback :D!") 

    print(frontright.height)


if __name__ == '__main__':
    rospy.init_node('fakescan')
    rospy.loginfo("Starting fakescan")

    pub = rospy.Publisher('/fakescan', LaserScan, queue_size=10)

    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():

        h = Header()
        h.stamp = rospy.Time.now()
        h.frame_id = "sick_tim"

        laser = LaserScan()
        laser.header = h
        laser.angle_min = 0
        laser.angle_max = 2 * math.pi

        laser.angle_increment = (2 * math.pi / 10)

        laser.time_increment = 0

        laser.scan_time = 0

        laser.range_min = 0
        laser.range_min = 30

        laser.ranges = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5]


        pub.publish(laser)
        rate.sleep()


    rospy.spin()

