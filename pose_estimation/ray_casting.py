import numpy as np
import sys
import math as math

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
        #print('The line is vertical')
        x1 = x1 + 0.000001
        deltay = y2-y1
        deltax = x2-x1
    a = deltay/deltax
    b = y1-a*x1
    return a, b
    
def Ray_casting(polyArr, point):
    count = 0
    Boolean = False
    for i in range(0,len(polyArr)):
        # check if the point is on the Line
        a,b = Line_constructor(polyArr[i])
        dist = abs(a * point[0] + b - point[1]) / (math.sqrt(a*a+1))
#        print("dist: ", dist)
        if dist < 0.000001 and dist > 0:
#            print("hallo")
            return True
            
        if rayintersectseg(point, polyArr[i]):
            count = count + 1
#            print("Count up: ", count)
    if count == 0 or count > 1:
        Boolean = False
        print("no intersect")
    elif count == 1:
        Boolean = True
    else :
        Boolean = False
        print('Something is wrong')

    return Boolean

######################################################################
from collections import namedtuple  
Point = namedtuple('Point', 'x, y')


def rayintersectseg(point, Line):
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
        point.y = point.y + _eps
    
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
########################################################################################
#print("output: ",Line_constructor(array))
print("Intersect: ",Ray_casting(polyarray, [1,3.2])) #3.46 is on line
