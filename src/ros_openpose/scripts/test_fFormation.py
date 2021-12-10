#!/usr/bin/env python3
# import modules
import numpy as np
import sys
import time
import math
from sklearn.linear_model import LinearRegression
from numpy.core.fromnumeric import reshape, squeeze
from scipy.spatial import ConvexHull, convex_hull_plot_2d
from collections import namedtuple  

import scipy.io
import matplotlib.pyplot as plt
from pathlib import Path


class F_formation:
    def __init__(self):
        data = self.getTestData()
        print("length of data", len(data))
        #return None
        for i in range(0, len(data)):
        #     self.createFFormations(data[i],i)
            plt.cla() 
            print("picture index: ", i)
            self.createFFormations(data[i],i+1, data[i])

    def getTestData(self):
        data = self.testData()
        synth = data
        dataPerson = []
        for i in range(0,len(synth)):
        #for i in range(0,2):
            data = []
            for j in range(0, len(synth[i])):
                x = synth[i][j][0]
                y = synth[i][j][1]
                o = synth[i][j][2]
                tempPerson = [x,y,o]
                data.append(tempPerson)
            dataPerson.append(data)
        return dataPerson

    def createFFormations(self, msg, index, data):
        persons = self.excludeDistance(msg, 3)
        if(self.checkForArray(persons)): #Check if there are people in a combinations
            print("Persons detected")
        #    combinations = self.oSpaceCombinations(len(persons))
            #rospy.loginfo("Combinations %s", combinations)
        #    personsArray = self.reshape(persons) #List to Array
        #    oSpaces = self.constructOSpaces(personsArray, combinations)
            #rospy.loginfo("ospace lines before %s", oSpaces)
        #    oSpaces = self.constructOSpacesWithDirections(oSpaces, 0.80)
            #rospy.loginfo("ospace lines new %s", oSpaces)
        #    oSpaces = self.removeInvalidOspaces(oSpaces, personsArray)
            #rospy.loginfo("Final OSpace! %s", oSpaces)
            #print("Final OSpace!: ", oSpaces)
            #if len(oSpaces)>0:
            if(False):
                for i in range(0, len(oSpaces)):
                    print("index i:", i)
                    for j in range(0,len(oSpaces[i])):
                        points = self.pointConstructor(oSpaces[i][j][0], oSpaces[i][j][1], 10)
                        print("j:", j)
                        str = f"src/ros_openpose/scripts/testFiles/Frame{index}.png"
                        title = f"Frame {index}"
                        self.plotPoints(points, Path(str), title, data)
            else:
                print("no persons detected")
                for j in range(0, len(msg)):
                    str = f"src/ros_openpose/scripts/testFiles/Frame_ref{index}.png"
                    title = f"Frame {index}"
                    # xAngle = 0.2 * math.cos(msg[j][2]) + msg[j][0]
                    # yAngle = 0.2 * math.sin(msg[j][2]) + msg[j][1]
                    # x=[msg[j][0], xAngle]
                    # y=[msg[j][1], yAngle]
                    # plt.plot(msg[j][0], msg[j][1],'o')
                    # plt.plot(x,y, color='red')
                    plt.title(title)
                    plt.xlim([-5, 9])
                    plt.ylim([-4, 9])
                    plt.xlabel("distance [m]")
                    plt.ylabel("distance [m]")
                    for j in range(0, len(data)):
                        xAngle = 0.4 * math.cos(data[j][2]) + data[j][0]
                        yAngle = 0.4 * math.sin(data[j][2]) + data[j][1]
                        x=[data[j][0], xAngle]
                        y=[data[j][1], yAngle]
                        plt.plot(data[j][0], data[j][1],'o')
                        plt.plot(x,y, color='red')
                    plt.savefig(str)
        else:
            #rospy.loginfo("There are no combinations")
            pass

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
        #rospy.loginfo("Person list %s",persons)
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

    def reshape(self, arr): #List to Array
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


    #Returns o-space with only people looking into the o-space
    def constructOSpacesWithDirections(self, array, margin):
        Ospacearray = []
        hull = array
        for i in range(0, len(hull)):
            PointArray = []
            tempArray = []
            if len(hull[i]) > 1:
                # her skal vi tjekke o-space ved personer over 2 personer
                for j in range(0, len(hull[i])):
                    for k in range(0, len(hull[i][j])):
                        r=0.02
                        x = r*math.cos(hull[i][j][k][2]) + hull[i][j][k][0]
                        y = r*math.sin(hull[i][j][k][2]) + hull[i][j][k][1]
                        temparr = np.array([hull[i][j][k][0], hull[i][j][k][1], x, y])
                        tempArray.append(temparr)
                        tempNP = np.array(tempArray)
                new_array = [tuple(row) for row in tempNP]
                uniques = np.unique(new_array, axis=0)
                for j in range(0, len(uniques)):
                    TempPointArray = np.array([uniques[j][2], uniques[j][3]])
                    PointArray.append(TempPointArray)
                count = 0
                for j in range(0, len(PointArray)):
                    if self.rayCasting(hull[i], PointArray[j]) == True:
                        count = count + 1
                if count == len(PointArray):
                    Ospacearray.append(hull[i])
        
            elif len(hull[i]) == 1:
                # her skal vi tjekke o-space ved 2 personer
                # Calculate the vector between the two persons
                x1=hull[i][0][0][0]
                y1=hull[i][0][0][1]
                x2=hull[i][0][1][0]
                y2=hull[i][0][1][1]
                vectorCommon1 = [x2-x1 , y2-y1]
                vectorCommon2 = [x1-x2 , y1-y2]

                # Calculating the direction vector of each person
                for j in range(0, len(hull[i])):
                    for k in range(0, len(hull[i][j])):
                        r=0.02
                        x = r*math.cos(hull[i][j][k][2]) + hull[i][j][k][0]
                        y = r*math.sin(hull[i][j][k][2]) + hull[i][j][k][1]
                        temparr = np.array([hull[i][j][k][0], hull[i][j][k][1], x, y])
                        tempArray.append(temparr)
                        tempNP = np.array(tempArray)
                per1X1 = tempNP[0][0]
                per1y1 = tempNP[0][1]
                per1X2 = tempNP[0][2]
                per1y2 = tempNP[0][3]
                vectorPers1 = [per1X2 - per1X1 , per1y2 - per1y1]

                per2X1 = tempNP[1][0]
                per2y1 = tempNP[1][1]
                per2X2 = tempNP[1][2]
                per2y2 = tempNP[1][3]
                vectorPers2 = [per2X2 - per2X1 , per2y2 - per2y1]

                # calculationg the angle of each vector starting from the positive x-axis
                atanvinkelCommon1 = math.atan2(vectorCommon1[1], vectorCommon1[0])
                atanvinkelCommon2 = math.atan2(vectorCommon2[1], vectorCommon2[0])
                atanvinkelCommon = math.atan2(vectorCommon1[1], vectorCommon1[0])
                atanvinkelPers1 = math.atan2(vectorPers1[1], vectorPers1[0])
                atanvinkelPers2 = math.atan2(vectorPers2[1], vectorPers2[0])

                commonDistance =  math.sqrt(vectorCommon1[0]**2 + vectorCommon1[1]**2)
                if atanvinkelPers1 > atanvinkelCommon1:
                    vinkel1 = atanvinkelPers1 - atanvinkelCommon1
                else:
                    vinkel1 = atanvinkelCommon1 - atanvinkelPers1

                if atanvinkelPers2 > atanvinkelCommon2:
                    vinkel2 = atanvinkelPers2 - atanvinkelCommon2
                else:
                    vinkel2 = atanvinkelCommon2 - atanvinkelPers2
                # checking if the persons is looking towards each other
                if vinkel1 > -margin and vinkel1 < margin and vinkel2 > -margin and vinkel2 < margin and commonDistance < 3: 
                    Ospacearray.append(hull[i])
            else:
                print('ERROR noobs')
        return Ospacearray
    

    def lineConstructor(self, arr):
    #Dan linjens ligning ud fra 
        y1 = arr[0][1]
        y2 = arr[1][1]
        x1 = arr[0][0]
        x2 = arr[1][0]

        deltay = y2-y1
        deltax = x2-x1
        if deltax == 0:
            #print('The line is vertical')
            x1 = x1 + 0.000001
            deltay = y2-y1
            deltax = x2-x1
        a = deltay/deltax
        b = y1-a*x1
        return a, b
    
    def rayCasting(self, polyArr, point):
        count = 0
        Boolean = False
        for i in range(0,len(polyArr)):
            # check if the point is on the Line
            a,b = self.lineConstructor(polyArr[i])
            dist = abs(a * point[0] + b - point[1]) / (math.sqrt(a*a+1))
            if dist < 0.000001 and dist > 0:
                return True
                
            if self.rayIntersectSeg(point, polyArr[i]):
                count = count + 1
        if count == 0 or count > 1:
            Boolean = False
        elif count == 1:
            Boolean = True
        else :
            Boolean = False
            print('Something is wrong')

        return Boolean


    def rayIntersectSeg(self, point, Line):
        Point = namedtuple('Point', 'x, y')
        _eps = 0.00001
        _huge = sys.float_info.max
        _tiny = sys.float_info.min
        intersect = False
        
        a = Point(Line[0][0], Line[0][1])
        b = Point(Line[1][0], Line[1][1])
        point = Point(point[0], point[1])
        # b has to be on top
        if a.y > b.y:
            a,b = b,a
        
        # check if point y coordianate is equal to the lines y coordinates
        # Change the point y coordinate if this is true
        if point.y == a.y or point.y == b.y:
            yy = point.y
            point._replace(y=yy+_eps)
            #point.y = point.y + _eps
        
        # Check if the point over b or below a, or if point is greater at the x-axis
        # if true - then no intersection can occur
        if (point.y > b.y or point.y < a.y) or (
            point.x > max(a.x, b.x)):
            return False
        
        # Check if the point is on one side or the other of the edge presented by the points a and b
        if point.x < min(a.x, b.x):
            intersect = True
        else:
            if abs(a.x - b.x) > _tiny:
                m_red = (b.y - a.y) / float(b.x - a.x)
            else:
                m_red = _huge
            if abs(a.x - point.x) > _tiny:
                m_blue = (point.y - a.y) / float(point.x - a.x)
            else:
                m_blue = _huge
            intersect = m_blue >= m_red
        return intersect

    def removeInvalidOspaces(self, oSpace, persons):
        listarray = []
        for i in range(0,len(oSpace)):
            tempPeopleList = []
            tempLineList = []
            tempListMerged = []
            for k in range(len(persons)):
                temparray = np.array([persons[k][0], persons[k][1], persons[k][2]])
                tempPeopleList.append(temparray)
            for h in range(len(oSpace[i])):
                for g in range(len(oSpace[i][h])):
                    tempLineList.append(oSpace[i][h][g]) 
            tempPeopleArray = np.array(tempPeopleList)
            tempLineArray = np.array(tempLineList)
            new_array_People = [tuple(row) for row in tempPeopleArray]
            new_array_Line = [tuple(row) for row in tempLineArray]
            uniques = np.unique(new_array_Line, axis=0)
            new_array_uniques = [tuple(row) for row in uniques]

            for t in range(len(new_array_uniques)):
                new_array_People.remove(new_array_uniques[t])
            count = 0
            check = False
            for j in range(0, len(new_array_People)):
                if len(oSpace[i]) > 1:
                    check = self.rayCasting(oSpace[i], [new_array_People[j][0], new_array_People[j][1]])
                    if check == True:
                        count = count +1
            if count == 0:
                listarray.append(oSpace[i])    
        return listarray
    
    def pointConstructor(self, point1, point2, dist):
        #print("points", point1[0])
        distance = math.sqrt((point2[0]-point1[0])**2+(point2[1]-point1[1])**2)
        #print("distance", distance)

        distance = distance * 100
        NumberOfPoints = distance // dist
        NumberOfPoints = int(NumberOfPoints)
        #print("number",NumberOfPoints)

        deltax = point2[0] - point1[0]
        deltay = point2[1] - point1[1]

        xslope = deltax/(NumberOfPoints-1)
        #print(xslope)
        yslope = deltay/(NumberOfPoints-1)
        #print(yslope)

        xCalc = point1[0] + xslope
        yCalc = point1[1] + yslope

        LinePoints = []
        for x in range(1, NumberOfPoints-1, 1):
            temp1 = xCalc
            temp2 = yCalc
            LinePoints.append(np.array([temp1,temp2]))
            xCalc = xCalc + xslope
            yCalc = yCalc + yslope

        return LinePoints
    
    def plotPoints(self, msg, str, title,data):
        x = []
        y = []
        for i in range(0,len(msg)):
            x.append(msg[i][0])
            y.append(msg[i][1])
        plt.plot(x, y, 'x', alpha=0.8)
        plt.title(title)
        plt.xlim([-5, 9])
        plt.ylim([-4, 9])
        plt.xlabel("distance [m]")
        plt.ylabel("distance [m]")
        for j in range(0, len(data)):
            xAngle = 0.4 * math.cos(data[j][2]) + data[j][0]
            yAngle = 0.4 * math.sin(data[j][2]) + data[j][1]
            x=[data[j][0], xAngle]
            y=[data[j][1], yAngle]
            plt.plot(data[j][0], data[j][1],'o')
            plt.plot(x,y, color='red')
        plt.savefig(str)




    def testData(self):
        p1 = [2.2, 3.2, -0.8]
        p2 = [3.1, 2.5, 2.8]

        p3 = [0.2, 3.2, 4.8]
        p4 = [1.1, 3.1, 4.7]

        p5 = [2.7, 4.2, 0.2]
        p6=[4, 4.1, 3]

        p7=[1.7, 2.8, 0.4]
        p8=[2.4, 2.3, 2]

        p9=[1.7, 2.8, -0.1]
        p10=[2.4, 2, 1.7]

        frame11 = [p1, p2]
        frame12 = [p3, p4]
        frame13 = [p5, p6]
        frame14 = [p7,p8]
        frame15 = [p9,p10] 

        ################################################3
        p211=[-2, 3.8, 4.2]
        p212=[-3, 2.4, 1]
        p213=[-1, 1.6, 1.6]
        p214=[0, 5.5, 4.7]
        p215=[1,4.5,3]
        p216=[1.1,1.5,5]

        p221=[-1.5,4.2,4.1]
        p222=[-2.6,3,0.9]
        p223=[-2,0.5,1.4]
        p224=[-1.9,2.4,4.7]
        p225=[3,4,4.9]
        p226=[3.8,2.5,2]
        p227=[-4,0.1,0.8]

        p231=[-2,6.3,4.7]
        p232=[-2.8,5.4,0.1]
        p233=[-2,2,0.3]
        p234=[-0.9,2.5,4]
        p235=[2.2,4,2.6]
        p236=[1.3,5,5.6]
        p237=[2,1,2.6]
        p238=[1,2,5]
        p239=[-3.3,4,4]

        p241=[-1.2,2,1.1]
        p242=[-1,5,-0.1]
        p243=[0,3,3.2]
        p244=[0.5,5.6,4]
        p245=[-0.4,1,1.4]

        p251=[0,3,-0.5]
        p252=[1,1.8,2]
        p253=[-1,2.8,4.67]
        p254=[-1.1,1.4,1.578]
        p255=[-1.1,4,0.8]
        p256=[1,5,3.9]
        p257=[2,3.6,1.56]


        frame21=[p211,p212,p213,p214,p215,p216]
        frame22=[p221,p222,p223,p224,p225,p226,p227]
        frame23=[p231,p232,p233,p234,p235,p236,p237,p238,p239]
        frame24=[p241,p242,p243,p244,p245]
        frame25=[p251,p252,p253,p254,p255,p256, p257]

        ########################################################

        p311=[1,3,0]
        p312=[2,2,1.57]
        p313=[3,2.5,2.35]
        p314=[2,4,5]
        p315=[-2,-2,0.785]
        p316=[4,-1,5.5]
        p317=[4,3.6,1]

        p321=[1,1,0.392]
        p322=[2.5,0,2.35]
        p323=[2,4,4.71]
        p324=[4.5,-0.5,1.96]

        p331=[1,1,5.49]
        p332=[1,-0.5,0.78]
        p333=[2,-2,0.78]
        p334=[4,-2,1.96]
        p335=[5.5,-1,2.35]
        p336=[5.5,1,3.14]
        p337=[4.5,1.5,3.92]
        p338=[3,2,4.71]
        p339=[0,-3.5,0.78]
        p3310=[2,4,3.92]

        p341=[1,1,0.78]
        p342=[3.5,1.5,3.14]
        p343=[2.75,2.5,4.71]
        p344=[1.5,2,5.10]
        p345=[0,-2,5.49]
        p346=[-0.5,-1,1.17]

        p351=[1,1.5,0.7]
        p352=[1.8,3,-0.8]
        p353=[2.9,3.2,4.6]
        p354=[3.7,2.7,3.5]
        p355=[2.2,0.1,0.3]

        frame31=[p311,p312,p313,p314,p315,p316,p317]
        frame32=[p321,p322,p323,p324]
        frame33=[p331,p332,p333,p334,p335,p336,p337,p338,p339,p3310]
        frame34=[p341,p342,p343,p344,p345,p346]
        frame35=[p351,p352,p353,p354,p355]


        ##############################


        p411=[-2,5,1]
        p412=[-1,6,4]
        p413=[-1.7,6.5,5]
        p414=[-1,7,5.8]
        p415=[0,5.5,1.6]
        p416=[0.1,7.5,4.7]
        p417=[1,7.5,4.3]
        p418=[0,3,1.6]
        p419=[1,3.5,4.5]
        p4110=[2,5,1.6]

        p421=[-3,3,0.7]
        p422=[-2.5,4.5,4.8]
        p423=[-1.7,4,3.4]
        p424=[1,5,0.6]
        p425=[0.9,5.8,5.8]
        p426=[1.2,6.6,5]
        p427=[1.7,6.6,4.5]
        p428=[2,6,4.2]
        p429=[-2,2.7,0]
        p4210=[1.4,3.5,3]
        p4211=[2,3,2]

        p431=[1,5.001,0.78]
        p432=[1,6,5.18]
        p433=[2,6,3.92]
        p434=[2,4,2.18]
        p435=[1.5,1,0.78]
        p436=[4.1,3,0]
        p437=[3,8,4.71]
        p438=[6,51,1.57]
        p439=[5,51.5,0.78]
        p4310=[5,6.5,0]
        p4311=[7,5.5,1.57]
        p4312=[7.01,6.5,3.14]
        p4313=[5.5,7.5,5.18]
        p4314=[6.5,7.5,3.8]
        p4315=[8,8.1,4.7]
        p4316=[5.67,4.9,1.57]

        p441=[0,1,1.047]
        p442=[0,2,5.75]
        p443=[1,0.502,1.57]
        p444=[2,1,2.35]
        p445=[3.001,5,1.57]
        p446=[2.003,6,0]
        p447=[3.5,6.25,3.92]
        p448=[5.002,4.5,0.78]
        p449=[6.1,4,1.57]
        p4410=[5,6,5.49]
        p4411=[6.02,6.1,4,71]
        p4412=[4,0.501,0.78]
        p4413=[4,1.5,5.49]
        p4414=[5,0.5,1.57]
        p4415=[5.5,1.25,3.14]
        #p4416=[7,2,5.49]
        #p4417=[7.25,1.01,2.35]
        #p4418=[8,1.25,2.35]
        p4419=[1,4,3.14]
        p4420=[3,3,0]

        p451=[1,1,1.57]
        p452=[1,3,-1.57]
        p453=[0,2,0]
        p454=[2,2.01,3.14]
        p455=[3,2.001,0]
        p456=[5,2,3.14]
        p457=[4,1,1.57]
        p458=[4,3,-1.57]

        frame51=[p411,p412,p413,p414,p415,p416,p417,p418,p419,p4110]
        frame52=[p421,p422,p423,p424,p425,p426,p427,p428,p429,p4210,p4211]
        frame53=[p431,p432,p433,p434,p435,p436,p437,p438,p439,p4310,p4311,p4312,p4313,p4314,p4315,p4316]
        frame54=[p441,p442,p443,p444,p445,p446,p447,p448,p449,p4410,p4411,p4412,p4413,p4414,p4415,p4419,p4420]
        frame55=[p451,p452,p453,p454,p455,p456,p457,p458]

        data = [frame11, frame12,  frame13, frame14, frame15, frame21,frame22,frame23,frame24,frame25,frame31,frame32,frame33,frame34,frame35,frame51,frame52,frame53,frame54,frame55]

        return data

def main():
    F_formation()


if __name__ == '__main__':
    main()
