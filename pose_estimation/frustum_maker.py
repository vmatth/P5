
# import the random module
import random
import matplotlib.pyplot as plt 
import math
import numpy as np

  
# determining the values of the parameters
muu = 0
sigmaa = 100
numbers = 1000
xaxis = []
yaxis = []  
xaxisDEAD = []
yaxisDEAD = []
theta = math.pi /2
alpha = 2.79
l = 300
p = np.array([0,0])

def gauss_2d(mu, sigma):
    x = random.gauss(mu, sigma)
    y = random.gauss(mu, sigma)
    return (x, y)

for j in range(0, numbers):
    x, y = gauss_2d(muu, sigmaa)
    s = np.array([x,y])
    lengthS = math.sqrt(((s[1]-p[1])**2+(s[0]-p[0])**2))
    fL = np.array([math.cos(theta)*l, math.sin(theta)*l])
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
print(math.sin(theta))
plt.plot(frustumx, frustumy)

plt.show()
