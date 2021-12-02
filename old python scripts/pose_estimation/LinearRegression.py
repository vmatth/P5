import numpy as np
import sympy as sym
from sympy import Symbol, Eq, solve
from sympy.core.function import diff

#Least Square

def LinearRegression(inputList):

#Input
    #pers1PointLeftHip = np.array([2.2, 1])
    #pers1PointLeftAnkle = np.array([2, 1])
    #pers1PointRightHip = np.array([2.8, 2])
    #pers1PointRightAnkle = np.array([3, 2])

#Define a and b as symbol for calculations
    a = Symbol("a")
    b = Symbol("b")

#Input gathered in List
    #inputList = [pers1PointLeftHip, pers1PointLeftAnkle, pers1PointRightHip, pers1PointRightAnkle]
    #print("inputList", inputList)

    TotalPoints = []
#Loop all input as d=ax+b-y squared
    for i in range(len(inputList)):
        tempPoint = ((a*inputList[i][0]+b-inputList[i][1])**2)
        TotalPoints.append(tempPoint)
    #print("TotalPoints", TotalPoints)

#Sum all
    total_sum = sum(TotalPoints)

#Take derivative of total_sum with respect to a and b  
    Equation1 = sym.diff(total_sum, a)
#print(Equation1)
    Equation2 = sym.diff(total_sum, b)
#print(Equation2)

#Solve equations for most optimal regression.
    eq1 = Eq(Equation1, 0) #Set equation 1 = 0
    eq2 = Eq(Equation2, 0) #Set equation 2 = 0
#Solve two equations with two variables
    solution = solve((eq1, eq2), (a, b))
    return solution[a],solution[b]

#Regression = LinearRegression()
#print(Regression)