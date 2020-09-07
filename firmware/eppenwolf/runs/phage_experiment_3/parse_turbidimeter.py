import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

data = np.genfromtxt('slides.csv', delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

beginnings = np.where(data[:-1,1] != data[1:,1])[0]



data = np.vsplit(data,beginnings)

data = data[2:] #first run was with

slide_0 = data[::2]
slide_1 = data[1::2]

# print(slide_0)

times = []
slide_0_peaks = np.array(None)
slide_1_peaks = np.array(None)
for i in range(0, len(slide_0)):
    peaks, _ = find_peaks(slide_0[i][:,2], height=50, distance=60)

    if(slide_0_peaks.size > 1):
        slide_0_peaks = np.vstack((slide_0[i][:,2][peaks],slide_0_peaks))
    else:
        slide_0_peaks = slide_0[i][:,2][peaks]


    peaks, _ = find_peaks(slide_1[i][:,2], height=50, distance=60)
    peaks = peaks[::-1]
    if(slide_1_peaks.size > 1):
        slide_1_peaks = np.vstack((slide_1_peaks, slide_1[i][:,2][peaks]))
    else:
        slide_1_peaks = slide_1[i][:,2][peaks]


    times.append(slide_0[i][:,0][0])

# print(times)
# print(slide_0_peaks)
# print(np.shape(times))
#
# print(np.shape(slide_0_peaks))
# # plt.plot(slide_0[0][:,2])
# # plt.plot(slide_1[0][:,2])

# print(times, slide_0_peaks[:,0])

colors = ["r", "g", "y", "y", "b", "g", "r", "b"] #where yellow is control broth, red is exposed, and blue is phage
labels = [""]

for i in range(0,8):
    plt.plot(times, slide_0_peaks[:,i], colors[i])

plt.figure()

for i in range(0,8):
    plt.plot(times, slide_1_peaks[:,i], colors[i])


#
# for i in range(0,8):
#     plt.plot(times, slide_1_peaks[:,i])
# plt.plot(peaks, slide_0[0][:,2][peaks])
#
# # print(data)
#     # plt.plot(i[:,2])
plt.legend()
plt.show()
