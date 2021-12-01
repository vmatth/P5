import numpy as np

point1 = np.array([1,2])
point2 = np.array([3,5])

distance = 284

NumberOfPoints = distance // 10

deltax = point2[0] - point1[0]
deltay = point2[1] - point1[1]

xslope = deltax/(NumberOfPoints-1)
print(xslope)
yslope = deltay/(NumberOfPoints-1)
print(yslope)

LinePoints = []

xCalc = point1[0] + xslope
yCalc = point1[1] + yslope
for x in range(1, NumberOfPoints-1, 1):
    temp1 = xCalc
    temp2 = yCalc
    LinePoints.append(np.array([temp1,temp2]))
    xCalc = xCalc + xslope
    yCalc = yCalc + yslope

print(LinePoints)