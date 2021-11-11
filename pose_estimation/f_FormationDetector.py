import numpy as np
import math

import test_persons4
import generate_OspaceCombinations
#import Construct_Ospaces
import test
import class_person
import convexhull_personSpace


#persons = test_persons4.test_data()# input "print" into argument, if person data shall be written to terminal
#### test data 
num_persons = 4
pi = math.pi
person1 = [5,5.5, pi - pi/4]
person2 = [4,5,pi/4]
person3 = [6,4,pi + pi/4]
person4 = [1,8,3*pi/2]
Persons = []
Persons.append(class_person.Person(person1[0],person1[1],person1[2]))
Persons.append(class_person.Person(person2[0],person2[1],person2[2]))
Persons.append(class_person.Person(person3[0],person3[1],person3[2]))
Persons.append(class_person.Person(person4[0],person4[1],person4[2]))
print(Persons[0].y)

# 1. Grab (x,y, orientation) of each person detected
# 2. Contruct the data as a list inside a list
# 3. Remove any person who is more than 3m away from anogther person
# 4. Define all posible O-space combinations, based on the num of persons detected
# 5. Construct these O-spaces (as convexhull)
#   5.1 Remove if not all persons are use, then it is not a valid O-space
# 6. Check O-spaces
#   6.1. Remove O-space if a person is inside a O-space 
# 7. Construct a convexhull based on the O-space and person space 


#################################################################################################################
#################################################################################################################
#################################################################################################################
#################################################################################################################

#1. 
    # https://github.com/stevenjj/openpose_ros
    # https://github.com/dusty-nv/jetson-inference/releases
    # https://github.com/ravijo/ros_openpose
    #   subcribe to a ros topic to get the x,y,z position of desired keypoint
    # input this information into "centerNdirection" n-times(people detected)
#2.
    # contruct datastructure with (x,y,orientation) of each person detected
        # maybe a class structure or simple list in list ?
#3.
    # Jonathan / Vinh code here

#4. input number of people detected
    # Calculate the posible combinations people can be arranged in
oSpace_combinations = generate_OspaceCombinations.oSpaceCombinations(num_persons)

#5. 
    # Based on the coordinates from #3, and the posibles solutions from #4
    # 5.1   Remove any convexhull if not all people from the specific solution is used to create the convexhull

# ch = test.ConvexHull()
# ch.add(Persons)
# print("Points on hull:", ch.get_hull_points())
# ch.display()

#6.
    # Check O-space
    #6.1    Remove O-space if a person is inside a O-space
            # point in polygon method
    #6.2    Remove O-space if one or more person is not looking into the O-space
            # point in polygon method, but here construct a point in the orientation axis

#7. 
    # Construct a convexhull based of the valid O-spaces from #6
        # incoorporate person-proxemics   
    # iterate this process so all valid O-spaces has a convexhull
    # Save thsi file as a .png, so the ros::map_server() can pic the map up

# Input is array of people with x,y
#convexhull_personSpace.convexhull(x,y)