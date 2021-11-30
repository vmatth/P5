#!/usr/bin/env python3
# import modules
import rospy
from ros_openpose.msg import BodyPoints
from geometry_msgs.msg import Point
import numpy as np
import sys
import time
import math
from rospy.core import rospyinfo
from sklearn.linear_model import LinearRegression
from numpy.core.fromnumeric import reshape, squeeze
from scipy.spatial import ConvexHull, convex_hull_plot_2d



class F_formation:
    def __init__(self):
        rospy.Subscriber("/BodyPoints", BodyPoints, self.callback)

    def callback(self, msg): #Callback for new BodyPoint
        if(self.checkForPeople(msg)):
            rospy.loginfo("There are people!")
            persons = self.getCenterAndAngle(msg)
            #rospy.loginfo("persons before 3 m %s", persons)
            persons = self.excludeDistance(persons, 0.5)

            if(self.checkForArray(persons)): #Check if there are people in a combinations
                combinations = self.oSpaceCombinations(len(persons))
                rospy.loginfo("Combinations %s", combinations)
                persons = self.reshape(persons)
                oSpaces = self.constructOSpaces(persons, combinations)
                rospy.loginfo("ospace lines %s", oSpaces)

        else:
            rospy.loginfo("There are no people")    

    def checkForPeople(self, msg): #Checks if there are people in BodyPoints
        return (len(msg.LeftHip) > 0 and len(msg.LeftAnkle) > 0 and len(msg.RightHip) > 0 and len(msg.RightAnkle) > 0)

    def checkForArray(self, _array): #Checks if an array exists
        return (len(_array) > 0)

    def convertPointToArray(self, point): #Converts point from x,y to an array
        return np.array([point.x, point.y])

    #Returns Center point and angle for people
    def getCenterAndAngle(self, msg):
        persons = []
        for i in range(0, len(msg.LeftHip)): #Loop number of people
            PointNum = 4 #2 hips and 2 ankles = 4 Points
            PersNormalAngle = 0
          # print('Finding Angle...')
            persPointLeftHip = self.convertPointToArray(msg.LeftHip[i])
            persPointLeftAnkle = self.convertPointToArray(msg.LeftAnkle[i])
            persPointRightHip = self.convertPointToArray(msg.RightHip[i])
            persPointRightAnkle = self.convertPointToArray(msg.RightAnkle[i])

            persPointList = np.array([persPointLeftHip, persPointLeftAnkle, persPointRightHip, persPointRightAnkle])
            persx = np.array([None, None, None, None]).reshape(-1, 1)
            persy = np.array([None, None, None, None])

        # #Seperate the x and y values and put them in their own array
            for i in range(PointNum):
                 persx[i] = persPointList[i][0]
                 persy[i] = persPointList[i][1]

        #Make linear regression of the x and y

            persmodel = LinearRegression(). fit(persx, persy)
            x1 = 0
            x2 = 1
            persPoint1OnLine = persmodel.coef_*x1+persmodel.intercept_
            persPoint2OnLine = persmodel.coef_*x2+persmodel.intercept_
            dx = x2 - x1
            persdy = persPoint2OnLine - persPoint1OnLine

            #choose the normal vector that points the same way as the feet
            if persPointLeftAnkle[0] < persPointRightAnkle[0]:
                    persNormal1 = (-persdy, dx)
                    PersNormalAngle = math.atan2(persNormal1[1], persNormal1[0])

            elif persPointLeftAnkle[0] > persPointRightAnkle[0]:
                    persNormal2 = (persdy, -dx)

                    PersNormalAngle = math.atan2(persNormal2[1], persNormal2[0])

            #Calculate the approx center of the person
            if persPointRightAnkle[0] > persPointLeftAnkle[0] and persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff

            elif persPointRightAnkle[0] < persPointLeftAnkle[0] and persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff

            elif persPointRightAnkle[0] > persPointLeftAnkle[0] or persPointRightAnkle[1] > persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                    persCenter = persPointLeftAnkle + persAnkleDiff

            elif persPointRightAnkle[0] < persPointLeftAnkle[0] or persPointRightAnkle[1] < persPointLeftAnkle[1]:
                    persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                    persCenter = persPointRightAnkle + persAnkleDiff
            FinalList = [persCenter[0], persCenter[1], PersNormalAngle]
            ########################################
            persons.append(FinalList)
        rospy.loginfo("Person list %s",persons)
        return persons

    def countIncidenceArray(self, arr, thredshold):
        count = 0
        for i in range(len(arr)):
            if arr[i] > thredshold:
                count = count + 1
        return count

    #Removes people that are "maxDist" array from each other
    def excludeDistance(self, peopleArray, maxDist):
        peopleNum = len(peopleArray)
        point = np.full([peopleNum, 2], None)
        for i in range(peopleNum): # Range(Number of persons in array)
            for j in range(2): #range(1) for 2D range(2) for 3D
                point[i][j] = peopleArray[i][j]
        for i in range(peopleNum):
            for j in range(peopleNum):
                tempPointDiffLengthArray = np.full([peopleNum], 0)
                pointDiff = point[j] - point[i]
                pointDiffLength = math.sqrt((pointDiff[0]*pointDiff[0])+(pointDiff[1]*pointDiff[1]))
                if pointDiffLength > maxDist:
                    tempPoint = point
                    tempPointDiff = pointDiff
                    for k in range(peopleNum):
                        tempPointDiff = point[j] - tempPoint[k]
                        tempPointDiffLength = math.sqrt((tempPointDiff[0]*tempPointDiff[0])+(tempPointDiff[1]*tempPointDiff[1]))
                        tempPointDiffLengthArray[k] = tempPointDiffLength
                    if (self.countIncidenceArray(tempPointDiffLengthArray, maxDist) == (len(tempPointDiffLengthArray)-1)):
                        peopleArray[j] = 999
        while 999 in peopleArray: #wtf is this
            peopleArray.remove(999)
        return peopleArray
    
    #Calculates partitions between people
    def set_partitions(self, iterable, k=None):
        L = list(iterable)
        n = len(L)
        if k is not None:
            if k < 1:
                raise ValueError(
                    "Can't partition in a negative or zero number of groups"
                )
            elif k > n:
                return

        def set_partitions_helper(L, k):
            n = len(L)
            if k == 1:
                yield [L]
            elif n == k:
                yield [[s] for s in L]
            else:
                e, *M = L
                for p in set_partitions_helper(M, k - 1):
                    yield [[e], *p]
                for p in set_partitions_helper(M, k):
                    for i in range(len(p)):
                        yield p[:i] + [[e] + p[i]] + p[i + 1 :]
        if k is None:
            for k in range(1, n + 1):
                yield from set_partitions_helper(L, k)
        else:
            yield from set_partitions_helper(L, k)

    #Returns possible numbers of oSpaceCombinations from number of people
    def oSpaceCombinations(self, num):
        a=[]
        num = num+1
        for i in range(1,num):
            a.append(i)
        newCombination=[]
        newnew = []
        for k in 1, 2:
            for groups in list(self.set_partitions(a,k)):
                newnew.append(groups)
        newCombination.append(newnew[0][0])
        for i in range(1, len(newnew)):
            for j in range(0,2):
                if len(newnew[i][j]) != 1:
                    newCombination.append(newnew[i][j])
        return newCombination

    def reshape(self, arr):
         return np.array([arr]).reshape(-1, 3)

    #Construct o-spaces from people's centrum and o-space-combinations
    def constructOSpaces(self, peopleCentrum, combinations):
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
                tempArrayPeople.append(array[(combinations[i][j])-1])
                tempNpArrayPeople = np.array(tempArrayPeople)
            if len(tempNpArrayPeople) > 2:
                hull = ConvexHull(tempNpArrayPeople[:,:2])
                for simplex in hull.simplices:
                    arr = np.array([[tempNpArrayPeople[simplex[0], 0], tempNpArrayPeople[simplex[0], 1], tempNpArrayPeople
                    [simplex[0]][2]],[tempNpArrayPeople[simplex[1], 0],tempNpArrayPeople[simplex[1], 1], tempNpArrayPeople[simplex[1]][2]]]).reshape(-1, 3)
                    tempArray.append(arr)
            elif len(tempNpArrayPeople) == 2:
                tempArray.append(tempNpArrayPeople)               
            if len(tempArray) < len(tempNpArrayPeople):
                if len(tempArray) == 1: # append to return list, if it is only two persons
                    returnList.append(tempArray)
                else:
                    tempArray = []
            else:
                returnList.append(tempArray)
        return returnList

def main():
    rospy.init_node('F_Formation', anonymous=False)
    F_formation()
    rospy.spin()


if __name__ == '__main__':
    main()
