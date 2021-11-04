
# import the random module
import random
import matplotlib.pyplot as plt 
import math
import numpy as np

  
# determining the values of the parameters
muu = 0
sigmaa = 300
numbers = 1000
xaxis = []
yaxis = []  
xaxisDEAD = []
yaxisDEAD = []
theta = math.pi /2
alpha = 2.79
l = sigmaa * sigmaa
p = np.array([220,200])

def gauss_2d(mux, muy, sigma):
    x = random.gauss(mux, sigma)
    y = random.gauss(muy, sigma)
    return (x, y)

for j in range(0, numbers):
    x, y = gauss_2d(p[0], p[1], sigmaa)
    s = np.array([x,y])
    print(s)
    lengthS = math.sqrt((s[1]-p[1])**2+(s[0]-p[0])**2)
    print(lengthS)
    fL = np.array([math.cos(theta)*l, math.sin(theta)*l])
    print("do1t", (np.dot(s,fL)))
    print("dot2", ((lengthS*l)))

    first = math.acos((np.dot(s,fL))/(lengthS*l))
    second = alpha /2
    if first <= second:
        xaxis.append(x)
        yaxis.append(y)
    else: 
        xaxisDEAD.append(x)
        yaxisDEAD.append(y)

plt.plot(xaxis,yaxis,marker="o",linestyle="",color='green') 
plt.plot(xaxisDEAD,yaxisDEAD,marker="o",linestyle="",color='red') 
frustumx = np.array([p[0], fL[0]])
frustumy = np.array([p[1], fL[1]])
#plt.plot(frustumx, frustumy)

plt.show()
