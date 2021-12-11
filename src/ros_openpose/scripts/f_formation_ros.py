#!/usr/bin/env python3
# import modules
#from ros_openpose.scripts.LineDot import pointConstructor
import queue
import rospy
from ros_openpose.msg import BodyPoints
from spot_pkg.msg import formationPoints
from geometry_msgs.msg import Point
import numpy as np
import sys
import time
import math
from rospy.core import rospyinfo
from sklearn.linear_model import LinearRegression
from numpy.core.fromnumeric import reshape, squeeze
from scipy.spatial import ConvexHull, convex_hull_plot_2d
from collections import namedtuple 

from spot_pkg.msg import people
from spot_pkg.msg import person 


class F_formation:
    def __init__(self):
        self.formations_pub = rospy.Publisher('formations', formationPoints, queue_size=10)
        self.people_pub = rospy.Publisher('people', people, queue_size=10)
        rospy.Subscriber("/BodyPoints", BodyPoints, self.callback)

    def callback(self, msg): #Callback for new BodyPoint
        if(self.checkForPeople(msg)):
            #rospy.loginfo("There are people!")
            self.createFFormations(msg)

    def createFFormations(self, msg):
        persons = self.getCenterAndAngle(msg)
        self.publishPeoplePoints(persons)
        #rospy.loginfo("persons before 3 m %s", persons)
        persons = self.excludeDistance(persons, 3)

        if(self.checkForArray(persons)): #Check if there are people in a combinations
            combinations = self.oSpaceCombinations(len(persons))
            #rospy.loginfo("Combinations %s", combinations)
            personsArray = self.reshape(persons) #List to Array
            oSpaces = self.constructOSpaces(personsArray, combinations)
            #rospy.loginfo("ospace lines before %s", oSpaces)
            oSpaces = self.constructOSpacesWithDirections(oSpaces, 2)
            #rospy.loginfo("ospace lines new %s", oSpaces)
            oSpaces = self.removeInvalidOspaces(oSpaces, personsArray)
            rospy.loginfo("Final OSpace! %s", oSpaces)
            oPoints = self.convertFormationToPoints(oSpaces)
            #rospy.loginfo("Points for the oSpaces: %s", oPoints)
            self.publishFormationPoints(oPoints)
        else:
            rospy.loginfo("There are no combinations")

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
            PointNum = 6 #2 hips and 2 ankles and 2 knees = 6 Points
            PersNormalAngle = 0
          # print('Finding Angle...')
            persPointLeftHip = self.convertPointToArray(msg.LeftHip[i])
            persPointLeftAnkle = self.convertPointToArray(msg.LeftAnkle[i])
            persPointRightHip = self.convertPointToArray(msg.RightHip[i])
            persPointRightAnkle = self.convertPointToArray(msg.RightAnkle[i])
            persPointRightKnee = self.convertPointToArray(msg.RightKnee[i])
            persPointLeftKnee = self.convertPointToArray(msg.LeftKnee[i])

            persPointList = np.array([persPointLeftHip, persPointLeftAnkle, persPointRightHip, persPointRightAnkle, persPointLeftKnee, persPointRightKnee])
            persx = np.array([None, None, None, None, None, None]).reshape(-1, 1)
            persy = np.array([None, None, None, None, None, None])

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
                        r=0.2
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
                        r=0.2
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
                    check = self.ray_casting.Ray_casting(oSpace[i], [new_array_People[j][0], new_array_People[j][1]])
                    if check == True:
                        count = count +1
            if count == 0:
                listarray.append(oSpace[i])    
        return listarray

    def pointConstructor(self, point1, point2, dist):
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

    #Uses the oSpace list and get convert all lines to points
    def convertFormationToPoints(self, oSpaces):
        points = [] #Points that construct all oSpaces
        for oSpace in oSpaces: #Loop all oSpaces
            for line in oSpace: #Loop all lines
                point1 = []
                point1.append(line[0][0])
                point1.append(line[0][1]) 
                point2 = []
                point2.append(line[1][0])
                point2.append(line[1][1])

                tempPoints = self.pointConstructor(point1, point2, 10)

                for p in tempPoints:
                    points.append(Point(p[0], p[1], 0))
                    
        #rospy.loginfo("Points for the oSpaces: %s", points)
        return points

    #Publish formation points to the formations topic
    def publishFormationPoints(self, points):
        formation = formationPoints()
        #Change x and y to fit with spots coordinate frame
        for point in points:
            p = Point()
            p.x = point.y
            p.y = point.x * -1
            formation.points.append(p)

        self.formations_pub.publish(formation)

    def publishPeoplePoints(self, points):
        ppl = people()

        for p in points: 
            point = Point()
            point.x = p[1]
            point.y = p[0] * -1

            pers = person()
            pers.position = point
            ppl.people.append(pers)

        self.people_pub.publish(ppl)




def main():
    rospy.init_node('F_Formation', anonymous=False)
    F_formation()
    rospy.spin()


if __name__ == '__main__':
    main()
