from operator import sub
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import math as math

# plane = ax + by + cz = d

#Use ransac for plane

peopleNum = 2 #cols
subjectPoints = 3 #rows

matrix = [[0]*peopleNum for _ in range(subjectPoints)]
print('matrix: ', matrix)

index = np.array([0, 1, 2])
maxElement = np.amax(index)
print('Max element: ', maxElement)
#Set points as arrays
pers1Point1 = np.array([1, 2, 3])
pers1Point2 = np.array([4, 6, 9])
pers1Point3 = np.array([12, 11, 9])

pers1Point1 = np.array([1, 2, 3])
pers1Point2 = np.array([4, 6, 9])
pers1Point3 = np.array([12, 11, 9])


#for i in index:
pointList = [[pers1Point1[maxElement-(subjectPoints-1)], pers1Point1[maxElement-(subjectPoints-2)], pers1Point1[maxElement-(subjectPoints-3)]], 
[pers1Point2[maxElement-(subjectPoints-1)], pers1Point2[maxElement-(subjectPoints-2)], pers1Point2[maxElement-(subjectPoints-3)]],
[pers1Point3[maxElement-(subjectPoints-1)], pers1Point3[maxElement-(subjectPoints-2)], pers1Point3[maxElement-(subjectPoints-3)]]]
print('PointList: ', pointList)

for i in range(0, subjectPoints):
        for j in range(0, peopleNum):
                matrix[i][j] = pointList[i][j]
#                print('i:', i)
#                print('j:', j)

# Two vectors in the plane
v1 = p3 - p1
v2 = p3 - p2

#Cross-product of the two vectors is a vector normal to the plane
cp = np.cross(v1, v2)
print('Cross product: ', cp)
a, b, c = cp

d = np.dot(cp, p3)

print('The equation is {0}x + {1}y + {2}z = {3}'.format(a, b, c, d))


normVector2D = np.array([cp[0], cp[1]])
print('2d normal vector is: ', normVector2D)

normvector_hat = normVector2D / (normVector2D**2).sum()**0.5

tail = [0, 0]

x_values = [tail[0], normvector_hat[0]]
y_values = [tail[1], normvector_hat[1]]
plt.plot(x_values, y_values)

print(normvector_hat)

# Lidt pythagoras
c = math.sqrt(normvector_hat[0]*normvector_hat[0]+normvector_hat[1]*normvector_hat[1])
print('norm vector length: ', c)

#plt.show()

#matplotlib

# import matplotlib.pyplot as plt
# from mpl_toolkits.mplot3d import Axes3D

# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')

# x = np.linspace(-2, 14, 5)
# y = np.linspace(-2, 14, 5)
# X, Y = np.meshgrid(x, y)

# Z = (d - a * X - b * Y) / c

# # plot the mesh. Each array is 2D, so we flatten them to 1D arrays
# ax.plot(X.flatten(),
#         Y.flatten(),
#         Z.flatten(), 'bo ')

# # plot the original points. We use zip to get 1D lists of x, y and z
# # coordinates.
# ax.plot(*zip(p1, p2, p3), color='r', linestyle=' ', marker='o')

# origin = np.array([[0, 0, 0], [0, 0, 0]])

# #cp = np.array([-30, 48, -17])

# normVecZip = zip(origin, cp)

# cpPoint = ax.plot(*zip(cp), color='g', linestyle='dashed', marker='o')
# print('Crossproduct has been plotted!')

# # adjust the view so we can see the point/plane alignment
# ax.view_init(0, 22)
# plt.tight_layout()
# plt.savefig('images/plane.png')
# plt.show()