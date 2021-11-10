from numpy.lib.function_base import percentile
from scipy.spatial import ConvexHull, convex_hull_plot_2d
import numpy as np
import math
import matplotlib.pyplot as plt



center1 = [0,0]
center2 = [3,3]
center3 = [2,1.5]
center4 = [3,1.5]
center5 = [0,4.6]


center = [center1, center2, center3, center4, center5]
print(center)


def convexHull(peopleCentrum):
    x=[]
    y=[]
    array=[]
    maxPoint = 2
    radius = 0.8


    for angle in range(1, maxPoint):
        for i in range(0, len(peopleCentrum)):
            x.append(radius * math.cos(angle) + peopleCentrum[i][0])
            y.append(radius * math.sin(angle) + peopleCentrum[i][1])
    print(x)
    array = np.array(list(zip(x, y)))
    print(array)

    hull = ConvexHull(array)
    plt.plot(array[:,0], array[:,1], 'o')
    for simplex in hull.simplices:
        plt.plot(array[simplex, 0], array[simplex, 1], 'k-')
        print("x",array[simplex[0],0])
        print("y",array[simplex[0],1])
    print("ny",array)
    plt.savefig('Convexhull.png')
    plt.show()
    

convexHull(center)
