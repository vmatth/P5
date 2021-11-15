
from numpy.lib import unique
from numpy.lib.polynomial import poly
import Construct_Ospaces
import math
import numpy as np
import ray_casting

center1 = [0,0, 1.22] # 0,0
center2 = [0,2, 5.62] # 3,3
center3 = [2,2, 3.64]# 2,1.5
center4 = [2,0, 2.25] # 3,1
center5 = [1,1.1] # 0,4

center = [center1, center2, center3]

#print(center)


arr = np.array([center]).reshape(-1, 3)

def lookingInto(array):
    Ospacearray = []
    hull = Construct_Ospaces.convexHull(array)
    #print("hulllllllll: ", hull)
    for i in range(0, len(hull)):
        PointArray = []
        tempArray = []
        print("len of hull[i]: ", len(hull[i]))
        if len(hull[i]) > 1:
            # her skal vi tjekke o-space ved personer over 2 personer
            for j in range(0, len(hull[i])):
                for k in range(0, len(hull[i][j])):
                    #print("hull i",hull[i])
                    #print("person:", hull[i][j][k])
                    r=0.2
                    x = r*math.cos(hull[i][j][k][2]) + hull[i][j][k][0]
                    y = r*math.sin(hull[i][j][k][2]) + hull[i][j][k][1]
                    temparr = np.array([hull[i][j][k][0], hull[i][j][k][1], x, y])
                    tempArray.append(temparr)
                    tempNP = np.array(tempArray)
           
           
            new_array = [tuple(row) for row in tempNP]
            uniques = np.unique(new_array, axis=0)

            for j in range(0, len(uniques)):
                TempPointArray = np.array([uniques[j][2], uniques[j][3]])
                PointArray.append(TempPointArray)
            #print("Point array: ", PointArray)
            count = 0
            for j in range(0, len(PointArray)):
                if ray_casting.Ray_casting(hull[i], PointArray[j]) == True:
                    count = count + 1
            #print("Count:", count)
            if count == len(PointArray):
                Ospacearray.append(hull[i])
    
        elif len(hull[i]) == 1:
            # her skal vi tjekke o-space ved 2 personer
            print("two person check", hull[i])
            x1=hull[i][0][0][0]
            y1=hull[i][0][0][1]
            x2=hull[i][0][1][0]
            y2=hull[i][0][1][1]
            vectorCommon1 = [x2-x1 , y2-y1]
            vectorCommon2 = [x1-x2 , y1-y2]


            for j in range(0, len(hull[i])):
                for k in range(0, len(hull[i][j])):
                    #print("hull i",hull[i])
                    #print("person:", hull[i][j][k])
                    r=0.2
                    x = r*math.cos(hull[i][j][k][2]) + hull[i][j][k][0]
                    y = r*math.sin(hull[i][j][k][2]) + hull[i][j][k][1]
                    temparr = np.array([hull[i][j][k][0], hull[i][j][k][1], x, y])
                    tempArray.append(temparr)
                    tempNP = np.array(tempArray)
            print("tempBP: ", tempNP)
            per1X1 = tempNP[0][0]
            per1y1 = tempNP[0][1]
            per1X2 = tempNP[0][2]
            per1y2 = tempNP[0][3]
            vectorPers1 = [per1X2 - per1X1 , per1y2 - per1y1]

            per2X1 = tempNP[1][0]
            per2y1 = tempNP[1][1]
            per2X2 = tempNP[1][2]
            per2y2 = tempNP[1][3]
            vectorPers2 = [per2X2 - per2X1 , per2y2 - per2y1]

            atanvinkelCommon1 = math.atan2(vectorCommon1[1], vectorCommon1[0])
            atanvinkelCommon2 = math.atan2(vectorCommon2[1], vectorCommon2[0])
            atanvinkelCommon = math.atan2(vectorCommon1[1], vectorCommon1[0])
            atanvinkelPers1 = math.atan2(vectorPers1[1], vectorPers1[0])
            atanvinkelPers2 = math.atan2(vectorPers2[1], vectorPers2[0])
            print("pers1:", vectorPers1)
            print("pers2:", vectorPers2)


            #vinkel1 = atanvinkelPers1 - atanvinkelCommon1
            if atanvinkelPers1 > atanvinkelCommon1:
                vinkel1 = atanvinkelPers1 - atanvinkelCommon1
            else:
                vinkel1 = atanvinkelCommon1 - atanvinkelPers1
            #vinkel1 = atanvinkelCommon1 - atanvinkelPers1
            if atanvinkelPers2 > atanvinkelCommon2:
                vinkel2 = atanvinkelPers2 - atanvinkelCommon2
            else:
                vinkel2 = atanvinkelCommon2 - atanvinkelPers2
            print("test vinkel med Atan2 - 1:", vinkel1)
            print("test vinkel med Atan2 - 1, pers:", atanvinkelPers1)
            print("test vinkel med Atan2 - 1 common:", atanvinkelCommon1)

            print("vinkler1", vinkel1)
            print("vinkler2", vinkel2)
            margin = 1000# 0.1745
            if vinkel1 > -margin and vinkel1 < margin and vinkel2 > -margin and vinkel2 < margin: 
                Ospacearray.append(hull[i])
        else:
            #print(" ")
            print('ERROR noobs')

    #print("final Temparray", uniques)
    print("o-space: ", Ospacearray)
    #print("dublicated:", )
    return 0


lookingInto(arr)