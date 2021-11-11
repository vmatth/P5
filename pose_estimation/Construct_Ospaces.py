import numpy as np
from scipy.spatial import ConvexHull, convex_hull_plot_2d
import matplotlib.pyplot as plt
import random
center1 = [0,0]
center2 = [3,3]
center3 = [2,1.5]
center4 = [3,1]
center5 = [0,4]


center = [center1, center2, center3, center4, center5]



arr = np.array([center]).reshape(-1, 2)
#arr = np.array(list(zip(x, y)))
print("right:", arr)

def convexHull(peopleCentrum):

    array=[]
    array=peopleCentrum

    plt.plot(array[:,0], array[:,1], '+')
    hull = ConvexHull(array)
    for simplex in hull.simplices:
        plt.plot(array[simplex, 0], array[simplex, 1], 'k-')
        print("x",array[simplex,0])
        print("y",array[simplex,1])
    plt.show()

    if 2+2==4:
        print("simon er gay")

convexHull(arr)