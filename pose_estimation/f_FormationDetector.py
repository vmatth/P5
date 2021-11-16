import numpy as np
import math
import ray_casting
import centerNdirection
#import test_persons4
import generate_OspaceCombinations
import Construct_Ospaces
#import test
#import class_person
#import convexhull_personSpace
import NEW_Distance_excluder
import LookingInOut
import time
import matplotlib.pyplot as plt

start = time.perf_counter()

#persons = test_persons4.test_data()# input "print" into argument, if person data shall be written to terminal
#### test data 

pers1PointLeftHip = np.array([3.2, 0])
pers1PointLeftAnkle = np.array([3, 0])
pers1PointRightHip = np.array([3.8, 1])
pers1PointRightAnkle = np.array([4, 1])

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

pers5PointLeftHip = np.array([0, 4])
pers5PointLeftAnkle = np.array([-0.13, 3.87])
pers5PointRightHip = np.array([1.01, 4.99])
pers5PointRightAnkle = np.array([1.15, 5.14])

pers6PointLeftHip = np.array([-1.91, 4.91])
pers6PointLeftAnkle = np.array([-2.07, 5.07])
pers6PointRightHip = np.array([-1, 4])
pers6PointRightAnkle = np.array([-0.9, 3.9])

pers7PointLeftHip = np.array([0.3, 5.94])
pers7PointLeftAnkle = np.array([0.47, 5.95])
pers7PointRightHip = np.array([-0.83, 5.93])
pers7PointRightAnkle = np.array([-1.07, 5.93])

LeftHip = [pers1PointLeftHip, pers2PointLeftHip, pers3PointLeftHip, pers4PointLeftHip, pers5PointLeftHip, pers6PointLeftHip, pers7PointLeftHip]
RightHip = [pers1PointRightHip, pers2PointRightHip, pers3PointRightHip, pers4PointRightHip, pers5PointRightHip, pers6PointRightHip, pers7PointRightHip]
LeftAnkle = [pers1PointLeftAnkle, pers2PointLeftAnkle, pers3PointLeftAnkle, pers4PointLeftAnkle, pers5PointLeftAnkle, pers6PointLeftAnkle, pers7PointLeftAnkle]
RightAnkle = [pers1PointRightAnkle, pers2PointRightAnkle, pers3PointRightAnkle, pers4PointRightAnkle, pers5PointRightAnkle, pers6PointRightAnkle, pers7PointRightAnkle]

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
for i in range(0, 7):
    data = centerNdirection.Find_angle(LeftHip[i], LeftAnkle[i], RightHip[i], RightAnkle[i])
    persons.append(data)
print('Personés: ', persons)

plt.plot(persons[0][0], persons[0][1], '+')
plt.plot(persons[1][0], persons[1][1], 'o')
plt.plot(persons[2][0], persons[2][1], 'x')
plt.plot(persons[3][0], persons[3][1], '*')
plt.plot(persons[4][0], persons[4][1], '*')
plt.plot(persons[5][0], persons[5][1], '*')
plt.plot(persons[6][0], persons[6][1], '*')
plt.show()


#3.
Newtestdata = NEW_Distance_excluder.Distance_excluder(persons, 3)    
print("test pers", Newtestdata)
#4. input number of people detected
    # Calculate the posible combinations people can be arranged in
combinations = oSpace_combinations = generate_OspaceCombinations.oSpaceCombinations(len(Newtestdata))

#5. 
    # Based on the coordinates from #3, and the posibles solutions from #4
    # 5.1   Remove any convexhull if not all people from the specific solution is used to create the convexhull
arr = np.array([Newtestdata]).reshape(-1, 3)
##print("shit: ",arr)
LineList = Construct_Ospaces.convexHull(arr, combinations)
#print("linelist: ", len(LineList))

#6.
# listarray = []
# for i in range(0,len(LineList)):
#    count = 0
#    check = False
#    for j in range(0, len(Newtestdata)):
#        #print("lineList i: ", Newtestdata[j][0])
#        if len(LineList[i]) > 1:
#            print("linelist[i] over 1: i,j:", i, j)
#            check = ray_casting.Ray_casting(LineList[i], [Newtestdata[j][0], Newtestdata[j][1]])
#            print("check: ",check)
#            if check == True:
#                count = count +1
#    if count == 0:
#        listarray.append(LineList[i])
# print("6.2 check: ", listarray)   

    # Check O-space
    #6.1    Remove O-space if a person is inside a O-space
            # point in polygon method
            # Ray casting algorithm
    #6.2    Remove O-space if one or more person is not looking into the O-space
FinalOpspace = LookingInOut.lookingInto(LineList, 0.5)
print("FInal Array",FinalOpspace)
            # point in polygon method, but here construct a point in the orientation axis
    #6.2.1    find a method for when only two persons form a o-space

#7. 
    # Construct a convexhull based of the valid O-spaces from #6
        # incoorporate person-proxemics   
    # iterate this process so all valid O-spaces has a convexhull
    # Save thsi file as a .png, so the ros::map_server() can pic the map up

# Input is array of people with x,y
#convexhull_personSpace.convexhull(x,y)

end = time.perf_counter()
print("Executable time: ",end - start)