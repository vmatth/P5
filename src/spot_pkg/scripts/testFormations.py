#!/usr/bin/env python
import rospy
from spot_pkg.msg import formationPoints
from geometry_msgs.msg import Point

if __name__ == '__main__':
    rospy.init_node('testFormations')
    rospy.loginfo("Starting test formations")

    pub = rospy.Publisher('/formations', formationPoints, queue_size=10)

    rate = rospy.Rate(0.5) # 10hz
    while not rospy.is_shutdown():

        formation = formationPoints()

        for i in range(0, 41, 1):
            p = Point()
            p.x = 1
            p.y = (i * 0.05) -1
            formation.points.append(p)

        pub.publish(formation)
        rate.sleep()


    rospy.spin()

