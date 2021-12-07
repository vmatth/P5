import scipy.io
mat = scipy.io.loadmat('features.mat')
synth = mat['features'][0]
data = []

for i in range(0,len(synth)):
    data.append(synth[i][:,[1,2,3]])
print(data)