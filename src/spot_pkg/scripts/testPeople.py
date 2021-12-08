#!/usr/bin/env python
import rospy
from spot_pkg.msg import formationPoints
from geometry_msgs.msg import Point
from spot_pkg.msg import people
from spot_pkg.msg import person

if __name__ == '__main__':
    rospy.init_node('testPeople')
    rospy.loginfo("Starting test people")

    pub = rospy.Publisher('/people', people, queue_size=10)

    rate = rospy.Rate(0.5) # 10hz
    while not rospy.is_shutdown():

        point = Point()
        point.x = 1
        point.y = 0

        pers = person()
        pers.position = point

        ppl = people()
        ppl.people = [pers]

        pub.publish(ppl)
        rate.sleep()


    rospy.spin()

