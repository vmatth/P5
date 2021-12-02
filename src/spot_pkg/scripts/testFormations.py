#!/usr/bin/env python
import rospy
from spot_pkg.msg import formationPoints
from geometry_msgs.msg import Point

if __name__ == '__main__':
    rospy.init_node('testFormations')
    rospy.loginfo("Starting test formations")

    pub = rospy.Publisher('/formations', formationPoints, queue_size=10)

    rate = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():

        formation = formationPoints()

        for i in range(0, 10, 1):
            p = Point()
            p.x = i
            p.y = i
            formation.points.append(p)

        pub.publish(formation)
        rate.sleep()


    rospy.spin()

