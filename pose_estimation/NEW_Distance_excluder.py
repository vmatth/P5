import numpy as np
import math as math

from numpy.core.fromnumeric import squeeze

pi = math.pi

person1 = [5,5.5, pi - pi/4]
person2 = [4,5,pi/4]
person3 = [6,4,pi + pi/4]
person4 = [1,8,3*pi/2]
person5 = [20,40,pi]

#array = [person1, person2, person3, person4]
array = [person1, person3, person5, person2, person4]
#print(array)

maxDistance = 3

def countIncidenceArray(arr, thredshold):
    count = 0
    for i in range(len(arr)):
        if arr[i] > thredshold: #boi
            count = count + 1
    return count

def Distance_excluder(peopleArray, maxDist): #Parameters are: a list with the people (x, y, orientation), number of people in list, maximum idstance between persons
    #print('The peoplearray: ', peopleArray)
    peopleNum = len(peopleArray)
    point = np.full([peopleNum, 2], None)
#    print('point start: ', point)
    for i in range(peopleNum): # Range(Number of persons in array)
        for j in range(2): #range(1) for 2D range(2) for 3D
            point[i][j] = peopleArray[i][j]
            #print('i: ', i, 'j: ', j)
            #print('Point: ', point)

    for i in range(peopleNum):
        for j in range(peopleNum):
            tempPointDiffLengthArray = np.full([peopleNum], 0)
            pointDiff = point[j] - point[i]
            #print('Point i: ', point[i], 'Point j: ', point[j])
            #print('Point diffs: ', pointDiff)
            pointDiffLength = math.sqrt((pointDiff[0]*pointDiff[0])+(pointDiff[1]*pointDiff[1]))
            #print('Length: ', pointDiffLength)
            if pointDiffLength > maxDist:
                #print('Points in question: ', point[j], point[i])
                tempPoint = point
                tempPointDiff = pointDiff
                for k in range(peopleNum):
                    tempPointDiff = point[j] - tempPoint[k]
#                    print('Temp Point Diff: ', tempPointDiff)
                    tempPointDiffLength = math.sqrt((tempPointDiff[0]*tempPointDiff[0])+(tempPointDiff[1]*tempPointDiff[1]))

                    tempPointDiffLengthArray[k] = tempPointDiffLength
                #print("k_loop: ",tempPointDiffLengthArray)
                if (countIncidenceArray(tempPointDiffLengthArray, maxDistance) == (len(tempPointDiffLengthArray)-1)):
                    peopleArray[j] = 999
            # if (tempPointDiffLengthArray[0] > maxDist and tempPointDiffLengthArray[1] > maxDist and tempPointDiffLengthArray[2] > maxDist or 
            #     tempPointDiffLengthArray[0] > maxDist and tempPointDiffLengthArray[1] > maxDist and tempPointDiffLengthArray[3] > maxDist or 
            #     tempPointDiffLengthArray[0] > maxDist and tempPointDiffLengthArray[2] > maxDist and tempPointDiffLengthArray[3] > maxDist or 
            #     tempPointDiffLengthArray[1] > maxDist and tempPointDiffLengthArray[2] > maxDist and tempPointDiffLengthArray[3] > maxDist):
            #     peopleArray[j] = 999
    #print("people111: ", peopleArray)
    while 999 in peopleArray: #wtf is this
        peopleArray.remove(999)

    return peopleArray

#Distance_excluder(array, maxDistance)
#print ('FINAL ARRAY: ', array)