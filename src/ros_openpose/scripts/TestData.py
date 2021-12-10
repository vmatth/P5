import scipy.io
import os
mat = scipy.io.loadmat('src/ros_openpose/scripts/features.mat')
synth = mat['features'][0]
dataPerson = []
for i in range(0,2):
    data = []
    for j in range(0, len(synth[i])):
        x = synth[i][j][1]
        x = x/100
        y = synth[i][j][2]
        y = y/100
        o = synth[i][j][3]
        tempPerson = [x,y,o]
        data.append(tempPerson)
    dataPerson.append(data)

print(dataPerson) # This indexing the whole test set (100 test groups)
print(dataPerson[0]) # This indexing a test group e.g 8 people
print(dataPerson[0][0]) # This indexing a test person
print(dataPerson[0][0][0]) # This indexing the x coordinate of testperson 1


[
    [
        [2.2, 3.2, -0.8], 
        [3.1, 2.5, 2.8]
    ], 

    [
        [0.2, 3.2, 4.8], 
        [1.1, 3.1, 4.7]
    ]
]

[
    [
        [2.6, 2.0, 0.0], 
        [2.8, 2.41, 4.71238898038469], 
        [2.0, 3.2, 4.1887902047863905], 
        [2.0, 2.0, 2.0943951023931953], 
        [1.4, 2.8, 5.497787143782138], 
        [0.6, 2.8, 1.5707963267948966], 
        [3.8, 1.4, 0.7853981633974483], 
        [1.2, 0.8, 4.71238898038469]
    ], 

    [
        [2.5963162286075825, 2.002525451822129, 0.0], 
        [2.7988116718326705, 2.401243204050297, 4.71238898038469], 
        [2.0061876027220062, 3.195297675829334, 4.1887902047863905], 
        [1.9985508678217616, 2.0002231484367794, 2.0943951023931953], 
        [1.402974161687121, 2.8019842221036573, 5.497787143782138], 
        [0.5976139127103199, 2.7993770990065743, 1.5707963267948966], 
        [3.799352836670194, 1.394753842290302, 0.7853981633974483], 
        [1.2010912326088676, 0.7965118643057787, 4.71238898038469]
    ]
]