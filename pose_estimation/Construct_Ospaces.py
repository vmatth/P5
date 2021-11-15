import numpy as np
from scipy.spatial import ConvexHull, convex_hull_plot_2d
import matplotlib.pyplot as plt
import math
import generate_OspaceCombinations

center1 = [0,0, math.pi/4] # 0,0
center2 = [0,2, -math.pi/4] # 3,3
center3 = [2,2, math.pi+math.pi/4] # 2,1.5
center4 = [1.5,1] # 3,1
center5 = [1,1.1] # 0,4

center = [center1, center2, center3]


arr = np.array([center]).reshape(-1, 3)
#arr = np.array(list(zip(x, y)))
#print("right:", arr)

def convexHull(peopleCentrum):
    combinations = generate_OspaceCombinations.oSpaceCombinations(len(peopleCentrum))
    #print("comb: ",combinations)
    array=[]
    arr=[]
    returnList = []
    array=peopleCentrum
    tempArray = []
    tempArrayPeople = []
    for i in range(0,len(combinations)):
        tempArrayPeople = []
        tempArray = []
        for j in range(0, len(combinations[i])):
        #print(combinations[0][0])
            tempArrayPeople.append(array[(combinations[i][j])-1])
            #print("Fist time seen:", tempArrayPeople)
            tempNpArrayPeople = np.array(tempArrayPeople)
 #   print('Rigtig array: ', array)
 #   print('HIT!: ', tempArrayPeople)
            plt.plot(array[:,0], array[:,1], '+')
        #print("temp", tempNpArrayPeople, type(tempNpArrayPeople))
        #print("array", array, type(array))
        if len(tempNpArrayPeople) > 2:
            #print("hulllll: ", tempNpArrayPeople[0][2])
            hull = ConvexHull(tempNpArrayPeople[:,:2])
            for simplex in hull.simplices:
                #plt.plot(tempArrayPeople[simplex, 0], tempArrayPeople[simplex, 1], 'k-')
                #print("shity", tempNpArrayPeople, type(tempNpArrayPeople))
                #print("xxxxxxxxxxxxxxxxx",tempNpArrayPeople)
                #print("semplex",simplex[0])
                arr = np.array([[tempNpArrayPeople[simplex[0], 0], tempNpArrayPeople[simplex[0], 1], tempNpArrayPeople
                [simplex[0]][2]],[tempNpArrayPeople[simplex[1], 0],tempNpArrayPeople[simplex[1], 1], tempNpArrayPeople[simplex[1]][2]]]).reshape(-1, 3)
                tempArray.append(arr)
                #print("shitty is: ", arr)
                #print('TEMPARRAYY: ', tempArray)
        elif len(tempNpArrayPeople) == 2:
            tempArray.append(tempNpArrayPeople)
            #print('TMEPOREP: ', len(tempNpArrayPeople))
            
        if len(tempArray) < len(tempNpArrayPeople):
            #print("len tempnparray: ", len(tempNpArrayPeople))
            # print("tempNP: ", tempNpArrayPeople)
            # print("len tempArray: ", len(tempArray))
            # print("temp array: ", tempArray)
            if len(tempArray) == 1: # append to return list, if it is only two persons
                returnList.append(tempArray)
            else:
                tempArray = []
            #print('The polygon is not valid aw :(')
        else:
            returnList.append(tempArray)
#    print('array1: ', returnList)
    return returnList
   # plt.show()

#Test om inputlængde og output længde er det samme

convexHull(arr)