import numpy as np
from sympy.core import symbol
from sympy.solvers import solve
from sympy import Symbol

array1 = np.array([[0, 4],[0,0]]).reshape(-1, 2)
array2 = np.array([[0, 4],[3,3]]).reshape(-1, 2)
array3 = np.array([[3, 1],[3,3]]).reshape(-1, 2)
array4 = np.array([[3, 1],[0,0]]).reshape(-1, 2)

polyarray = [array1, array2, array3, array4]

def Line_constructor(arr):
    #Dan linjens ligning ud fra 
    y1 = arr[0][1]
    y2 = arr[1][1]
    x1 = arr[0][0]
    x2 = arr[1][0]

    deltay = y2-y1
    deltax = x2-x1
    if deltax == 0:
        print('The line is vertical')
        x1 = x1 + 0.000001
        deltay = y2-y1
        deltax = x2-x1
    a = deltay/deltax
    b = y1-a*x1
    return a, b
    
def Ray_casting(polyArr, point):
    count = 0
    pointArray = np.array([[point[0], point[1]],[point[0]+20,point[1]]]).reshape(-1, 2)
    rayA,rayB = Line_constructor(pointArray)
    for i in range(0,len(polyArr)):
        a,b = Line_constructor(polyArr[i])
        x = Symbol('x')
        xcrossing = solve(rayA*x+rayB - a*x+b,x)
        print('xcrossing: ', xcrossing)
        ycrossing = rayA*xcrossing[0] + rayB
        print('ycrossing: ', ycrossing)
        if xcrossing[0] > point[0] and xcrossing[0] < point[0]+20 and ycrossing == point[1]:
            count = count + 1
    print(count)


    return 0

#print("output: ",Line_constructor(array))
Ray_casting(polyarray, [-1,1.5])
