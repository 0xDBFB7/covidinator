import numpy as np
import matplotlib.pyplot as plt
import scipy.fftpack
import parse_result as pr

data = []

flag = 0
for line in open("feedback_loop.dat"):
    if(flag):
        try:
            data.append(float(line))
        except:
            break
    if("<dep V1.Vt time>" in line):
        flag = 1



# Number of samplepoints
N = len(data)
# sample spacing
T = 1/(1e-6/1000.0)
x = np.linspace(0.0, N*T, N)
y = data
yf = scipy.fftpack.fft(y)
xf = np.linspace(0.0, 1.0/(2.0*T), int(N/2))

fig, ax = plt.subplots()
ax.plot(xf, 2.0/N * np.abs(yf[:N//2]))
plt.show()
