import numpy as np
import math

point1 = np.array([0,2])
point2 = np.array([1,5])

def pointConstructor(point1, point2, dist):
    distance = math.sqrt((point2[0]-point1[0])**2+(point2[1]-point1[1])**2)
    print("distance", distance)

    distance = distance * 100
    NumberOfPoints = distance // dist
    NumberOfPoints = int(NumberOfPoints)
    print("number",NumberOfPoints)

    deltax = point2[0] - point1[0]
    deltay = point2[1] - point1[1]

    xslope = deltax/(NumberOfPoints-1)
    print(xslope)
    yslope = deltay/(NumberOfPoints-1)
    print(yslope)

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

m = pointConstructor(point1, point2, 25)

print("Points: ", m)