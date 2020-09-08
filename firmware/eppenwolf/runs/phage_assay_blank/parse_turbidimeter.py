import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

data = np.genfromtxt('slides.csv', delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

beginnings = np.where(data[:-1,1] != data[1:,1])[0]



data = np.vsplit(data,beginnings+1)

data = data[2:] #first run was with

slide_0 = data[::2]
slide_1 = data[1::2]

# print(slide_0)

times = []
slide_0_peaks = np.array(None)
slide_1_peaks = np.array(None)
for i in range(0, len(slide_0)):
    slide_0[i][:,2][0:100] = 0
    peaks, _ = find_peaks(-slide_0[i][:,2], height=-800, distance=60)

    temp_peaks = np.zeros((8))

    for idx, j in enumerate(peaks):
        trough = np.array(slide_0[i][:,2][j-15:j+15])
        temp_peaks[idx] = np.average(trough[np.where(trough < 900)])

    if(slide_0_peaks.size > 1):
        slide_0_peaks = np.vstack((slide_0_peaks,temp_peaks))
    else:
        slide_0_peaks = temp_peaks


    peaks, _ = find_peaks(-slide_1[i][:,2], height=-800, distance=60)
    peaks = peaks[::-1]

    temp_peaks = np.zeros((8))

    for idx, j in enumerate(peaks):
        trough = np.array(slide_1[i][:,2][j-15:j+15])
        temp_peaks[idx] = np.average(trough[np.where(trough < 900)])

    if(slide_1_peaks.size > 1):
        slide_1_peaks = np.vstack((slide_1_peaks,temp_peaks))
    else:
        slide_1_peaks = temp_peaks


    times.append(slide_0[i][:,0][0])

# print(times)
# print(slide_0_peaks)
# print(np.shape(times))
#
# print(np.shape(slide_0_peaks))
# # plt.plot(slide_0[0][:,2])
# # plt.plot(slide_1[0][:,2])

# print(times, slide_0_peaks[:,0])

# - 10 uL broth
# - 10 uL broth
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?]
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?]
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?] + 0.8 uL phage
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?] + 0.8 uL phage
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?] + 0.4 uL phage
# - 7.5 uL broth + 2.5 uL un-concentrated e.coli from E[16?] + 0.4 uL phage

colors = ["r", "r", "g", "g", "b", "b", "y", "y"]
labels = [""]

for i in range(0,8):
    plt.plot(times, slide_0_peaks[:,i], colors[i])

plt.figure()

for i in range(0,8):
    plt.plot(times ,slide_1_peaks[:,i], colors[i])


#
# for i in range(0,8):
#     plt.plot(times, slide_1_peaks[:,i])
# plt.plot(peaks, slide_0[0][:,2][peaks])
#
# # print(data)
#     # plt.plot(i[:,2])
plt.legend()
plt.show()
