#!/usr/bin/env python
from ctypes import resize
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

        num_readings = 100
        laser_frequency = 40
        ranges = []
        intensities = []
        count = 0

        i = 0

        while(i < num_readings):
            ranges.append(1.5 + i/100)
            intensities.append(4+count)
            i = i + 1

        laser = LaserScan()
        laser.header = h
        laser.angle_min = -1.57
        laser.angle_max = 1.57

        laser.angle_increment = (3.14 / num_readings)
        laser.time_increment = (1/laser_frequency) / (num_readings)

        laser.range_min = 0
        laser.range_min = 4

        laser.ranges = ranges
        laser.intensities = intensities


        pub.publish(laser)
        rate.sleep()


    rospy.spin()

