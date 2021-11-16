import numpy as np
import math
import ray_casting
import centerNdirection
import test_persons4
import generate_OspaceCombinations
import Construct_Ospaces
#import test
#import class_person
#import convexhull_personSpace
import NEW_Distance_excluder
import LookingInOut


#persons = test_persons4.test_data()# input "print" into argument, if person data shall be written to terminal
#### test data 

pers1PointLeftHip = np.array([2.2, 1])
pers1PointLeftAnkle = np.array([2, 1])
pers1PointRightHip = np.array([2.8, 2])
pers1PointRightAnkle = np.array([3, 2])

pers2PointLeftHip = np.array([1.8, 3])
pers2PointLeftAnkle = np.array([2, 3])
pers2PointRightHip = np.array([1.2, 2])
pers2PointRightAnkle = np.array([1, 2])

pers3PointLeftHip = np.array([3.8, 2])
pers3PointLeftAnkle = np.array([4, 2])
pers3PointRightHip = np.array([3.2, 3])
pers3PointRightAnkle = np.array([3, 3])

pers4PointLeftHip = np.array([1.2, 1])
pers4PointLeftAnkle = np.array([1, 1])
pers4PointRightHip = np.array([1.8, 0])
pers4PointRightAnkle = np.array([2, 0])

LeftHip = [pers1PointLeftHip, pers2PointLeftHip, pers3PointLeftHip, pers4PointLeftAnkle]
RightHip = [pers1PointLeftAnkle, pers2PointRightHip, pers3PointRightHip, pers4PointRightHip]
LeftAnkle = [pers1PointLeftAnkle, pers2PointLeftAnkle, pers3PointLeftAnkle, pers4PointLeftAnkle]
RightAnkle = [pers1PointRightAnkle, pers2PointRightAnkle, pers3PointRightAnkle, pers4PointRightAnkle]

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
#testdata = test_persons4.test_data()
persons = []
for i in range(0, 4):
    data = centerNdirection.Find_angle(LeftHip[i], LeftAnkle[i], RightHip[i], RightAnkle[i])
    persons.append(data)
print(persons)

#3.
#Newtestdata = NEW_Distance_excluder.Distance_excluder(testdata, 3)    

#4. input number of people detected
    # Calculate the posible combinations people can be arranged in
#combinations = oSpace_combinations = generate_OspaceCombinations.oSpaceCombinations(len(Newtestdata))

#5. 
    # Based on the coordinates from #3, and the posibles solutions from #4
    # 5.1   Remove any convexhull if not all people from the specific solution is used to create the convexhull
#arr = np.array([Newtestdata]).reshape(-1, 3)
#LineList = Construct_Ospaces.convexHull(arr, combinations)

#6.
#listarray = []
#for i in range(0,len(LineList)):
#    count = 0
#    check = False
#    for j in range(0, len(Newtestdata)):
#        #print("lineList i: ", len(LineList[i]))
#        if len(LineList[i]) > 1:
#            check = ray_casting.Ray_casting(LineList[i], Newtestdata[j])
#            if check == True:
#                count = count +1
#    if count == 0:
#        listarray.append(LineList[i])
    

    # Check O-space
    #6.1    Remove O-space if a person is inside a O-space
            # point in polygon method
            # Ray casting algorithm
    #6.2    Remove O-space if one or more person is not looking into the O-space
#FinalOpspace = LookingInOut.lookingInto(listarray, 0.5)
#print("FInal Array",FinalOpspace)
            # point in polygon method, but here construct a point in the orientation axis
    #6.2.1    find a method for when only two persons form a o-space

#7. 
    # Construct a convexhull based of the valid O-spaces from #6
        # incoorporate person-proxemics   
    # iterate this process so all valid O-spaces has a convexhull
    # Save thsi file as a .png, so the ros::map_server() can pic the map up

# Input is array of people with x,y
#convexhull_personSpace.convexhull(x,y)