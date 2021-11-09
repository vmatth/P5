import numpy as np
import math as math

from numpy.core.fromnumeric import squeeze

pi = math.pi

person1 = [5,5.5, pi - pi/4]
person2 = [4,5,pi/4]
person3 = [6,4,pi + pi/4]
person4 = [1,8,3*pi/2]

array = [person1, person2, person3, person4]
print(array)

def Distance_excluder(peopleArray):
    print('The array: ', peopleArray)
#    xyCoords = np.array([peopleArray[0][0], peopleArray[0][1], peopleArray[1][0], peopleArray[1][1]])
    xyCoords = [peopleArray[0][0], peopleArray[0][1], peopleArray[1][0], peopleArray[1][1]]
    point = np.full([4, 2], None)
    print('point start: ', point)
    for i in range(4): # Range(Number of persons in array)
        for j in range(2): #range(1) for 2D range(2) for 3D
            point[i][j] = peopleArray[i][j]
            print('i: ', i, 'j: ', j)
            print('Point: ', point)


    for i in range(4):
        for j in range(4):
            pointDiff = point[j] - point[i]
            print('Point diffs: ', pointDiff)
            pointDiffLength = math.sqrt((pointDiff[0]*pointDiff[0])+(pointDiff[1]*pointDiff[1]))
            print('Length: ', pointDiffLength)
            if pointDiffLength > 3:
                print('Points in question: ', point[j], point[i])
                tempPoint = point
                tempPointDiff = pointDiff
                tempPointDiffLengthArray = np.full([4], None)
                for k in range(4):
                    tempPointDiff = point[j] - tempPoint[k]
#                    print('Temp Point Diff: ', tempPointDiff)
                    tempPointDiffLength = math.sqrt((tempPointDiff[0]*tempPointDiff[0])+(tempPointDiff[1]*tempPointDiff[1]))
                    print('TempDiffLength: ', tempPointDiffLength)
                    tempPointDiffLengthArray[k] = tempPointDiffLength
                    print('Temppointlenghtarray: ', tempPointDiffLengthArray)
#                    for l in range(4):
#                        if tempPointDiffLengthArray[l] > 3:

                    if tempPointDiffLengthArray[0] and tempPointDiffLengthArray[1] and tempPointDiffLengthArray[2] > 3 or tempPointDiffLengthArray[0] and tempPointDiffLengthArray[1] and tempPointDiffLengthArray[3] > 3 or tempPointDiffLengthArray[0] and tempPointDiffLengthArray[2] and tempPointDiffLengthArray[3] > 3 or tempPointDiffLengthArray[1] and tempPointDiffLengthArray[2] and tempPointDiffLengthArray[3] > 3:
                        print('Point removed from temp: ', tempPoint[j])
#                        point.remove(j)
#                print('Point removed!')
#                point[i][j]

        #find difference between points
        #find length of the vector between points (difference between points) - Det er lige meget hvilken vej vektoren peger, for afstanden er altid den samme

#Not quite right:            vectorLength = math.sqrt((point[0]*point[0])+(point[1]*point[1]))

Distance_excluder(array)