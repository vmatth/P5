from operator import sub
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import math as math
from sklearn.linear_model import LinearRegression

# plane = ax + by + cz = d

#Use ransac for plane

##SKIFT TIL 2D, for der er ingen grund til at gøre det i 3D. Skift fra plan til linje og fra 3 til 2 koordinater##

def Find_angle(persPointLeftHip, persPointLeftAnkle, persPointRightHip, persPointRightAnkle):
        PointNum = 4
        print('Finding Angle...')
        persPointList = np.array([persPointLeftHip, persPointLeftAnkle, persPointRightHip, persPointRightAnkle])
        persx = np.array([None, None, None, None]).reshape(-1, 1)
        persy = np.array([None, None, None, None])

        #Seperate the x and y values and put them in their own array
        for i in range(PointNum):
                persx[i] = persPointList[i][0]
                persy[i] = persPointList[i][1]

        #Make linear regression of the x and y
        persmodel = LinearRegression(). fit(persx, persy)
#        print('person intercept: ', persmodel.intercept_)
#        print('person slope: ', persmodel.coef_)

        #Find two points on the line and make a vector on the line
        x1 = 0
        x2 = 1
        persPoint1OnLine = persmodel.coef_*x1+persmodel.intercept_
        persPoint2OnLine = persmodel.coef_*x2+persmodel.intercept_
#        print('Person Point 1 on line: ', persPoint1OnLine[0])
#        print('Person Point 2 on line: ', persPoint2OnLine[0])

        persVectorOnLine = np.array([x2-x1, persPoint2OnLine[0]-persPoint1OnLine[0]])
#        print('Person vector on line: ', persVectorOnLine)

        #Find difference in x and y
        dx = x2 - x1
        persdy = persPoint2OnLine[0] - persPoint1OnLine[0]
#        print('pers1dx: ', dx, 'pers1dy: ', persdy)

        #choose the normal vector that points the same way as the feet
        if persPointLeftAnkle[0] < persPointRightAnkle[0]:
                persNormal1 = (-persdy, dx)
#                print('Person is facing in the direction of: ', persNormal1)
                PersNormalAngle = math.atan2(persNormal1[1], persNormal1[0])
#                print('Person has an angle of: ', PersNormalAngle)
        elif persPointLeftAnkle[0] > persPointRightAnkle[0]:
                persNormal2 = (persdy, -dx)
#                print('Person is facing in the direction of: ', persNormal2)
                PersNormalAngle = math.atan2(persNormal2[1], persNormal2[0])
#                print('Person has an angle of: ', PersNormalAngle) 

        #Calculate the approx center of the person
        if persPointRightAnkle[0] > persPointLeftAnkle[0] and persPointRightAnkle[1] > persPointLeftAnkle[1]:
                persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                persCenter = persPointLeftAnkle + persAnkleDiff
#                print('Person center: ', persCenter)
        elif persPointRightAnkle[0] < persPointLeftAnkle[0] and persPointRightAnkle[1] < persPointLeftAnkle[1]:
                persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                persCenter = persPointRightAnkle + persAnkleDiff
#                print('Person center: ', persCenter)
        elif persPointRightAnkle[0] > persPointLeftAnkle[0] or persPointRightAnkle[1] > persPointLeftAnkle[1]:
                persAnkleDiff = (persPointRightAnkle - persPointLeftAnkle)/2
                persCenter = persPointLeftAnkle + persAnkleDiff
#                print('Person center: ', persCenter)
        elif persPointRightAnkle[0] < persPointLeftAnkle[0] or persPointRightAnkle[1] < persPointLeftAnkle[1]:
                persAnkleDiff = (persPointLeftAnkle - persPointRightAnkle)/2
                persCenter = persPointRightAnkle + persAnkleDiff
#                print('Person center: ', persCenter)
        FinalList = [persCenter, persNormalAngle]
        return FinalList

# peopleNum = 2 #cols
# subjectPoints = 3 #rows

# matrix = [[0]*peopleNum for _ in range(subjectPoints)]
# print('matrix: ', matrix)

# index = np.array([0, 1])
# maxElement = np.amax(index)
# print('Max element: ', maxElement)

#Set points as arrays
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

#Find_angle(pers1PointLeftHip, pers1PointLeftAnkle, pers1PointRightHip, pers1PointRightAnkle)

persCenter, persNormalAngle = Find_angle(pers1PointLeftHip, pers1PointLeftAnkle, pers1PointRightHip, pers1PointRightAnkle)
print('Person center is: ', persCenter, 'Person angle is: ', persNormalAngle)