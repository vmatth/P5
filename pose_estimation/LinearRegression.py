import numpy as np
import sympy as sym
from sympy import Symbol, Eq, solve
from sympy.core.function import diff

def LinearRegression():

#Input
    pers1PointLeftHip = np.array([2.2, 1])
    pers1PointLeftAnkle = np.array([2, 1])
    pers1PointRightHip = np.array([2.8, 2])
    pers1PointRightAnkle = np.array([3, 2])

#Define a and b as symbol for calc
    a = Symbol("a")
    b = Symbol("b")

    inputList = [pers1PointLeftHip, pers1PointLeftAnkle, pers1PointRightHip, pers1PointRightAnkle]
    print("inputlist", inputList)

    TotalPoints = []

    for i in range(len(inputList)):
        tempPoint = ((a*inputList[i][0]+b-inputList[i][1])**2)
        TotalPoints.append(tempPoint)

    print("TotalPoints", TotalPoints)

#d=ax+b-y
#point1 = (a*2.2+b-1)**2
#point2 = (a*2+b-1)**2
#point3 = (a*2.8+b-2)**2
#point4 = (a*3+b-2)**2

#print("Data før", point1, point2, point3, point4)

    total_sum = sum(TotalPoints)

    Equation1 = sym.diff(total_sum, a)
#print(Equation1)
    Equation2 = sym.diff(total_sum, b)
#print(Equation2)



#Differentiate
#x = Symbol("x")
#print(sym.diff(5*x))

#Solve two equations with two varaibles
    eq1 = Eq(Equation1, 0)
    eq2 = Eq(Equation2, 0)
    print(solve((eq1, eq2), (a, b)))
    solution = solve((eq1, eq2), (a, b))
    print(type(solve((eq1, eq2), (a, b))))

    return solution[a],solution[b]

Regression = LinearRegression()
print(Regression)