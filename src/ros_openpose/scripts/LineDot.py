import numpy as np
import math
import matplotlib.pyplot as plt

point1 = np.array([0,2])
point2 = np.array([1,5])

def pointConstructor(point1, point2, dist):
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
    #rint(yslope)

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
def convertFormationToPoints(oSpaces):
    points = [] #Points that construct all oSpaces
    for oSpace in oSpaces: #Loop all oSpaces
        for line in oSpace: #Loop all lines
            point1 = []
            point1.append(line[0][0])
            point1.append(line[0][1]) 
            point2 = []
            point2.append(line[1][0])
            point2.append(line[1][1])

            points.append(pointConstructor(point1, point2, 10))

    return points


boi = [[[[2.       , 3.2      , 4.1887902], [2.       , 2.       , 2.0943951]]], [[[2.        , 3.2       , 4.1887902 ], [1.4       , 2.8       , 5.49778714]], [[2.        , 2.        , 2.0943951 ], [1.4       , 2.8       , 5.49778714]], [[2.       , 2.       , 2.0943951],[2.       , 3.2      , 4.1887902]]], [[[2.        , 2.        , 2.0943951 ], [1.4       , 2.8       , 5.49778714]]]]
print(boi)
final = convertFormationToPoints(boi)
print("hej final")
print(final)
print("what the fuck ", len(final))
color = ['blue', 'orange', 'red', 'green', 'purple', 'brown', 'pink', 'gray', 'olive', 'cyan','blue', 'orange', 'red', 'green', 'purple', 'brown', 'pink', 'gray', 'olive', 'cyan']
symbol = ['1','2','3','4','+','x','*','1','2','3','4','+','x','*']
    
str = "src/ros_openpose/scripts/BOI.png"
#str = "src/ros_openpose/scripts/testFiles/test0.png"
x = []
y = []
print(len(final))
for i in range(0,len(final)):
    print(i)
    x.append(final[i][0])
    y.append(final[i][1])
plt.plot(x, y)
plt.savefig(str)