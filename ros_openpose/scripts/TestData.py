import scipy.io
import os
mat = scipy.io.loadmat('ros_openpose/scripts/features.mat')
synth = mat['features'][0]
dataPerson = []
for i in range(0,len(synth)):
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

