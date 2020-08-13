import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppenwolf/host/')


from functions import *
link = device_comms.connect()
from matplotlib import pyplot as plt

voltages = np.arange(2, 12, 0.1)
background = np.zeros_like(voltages)
sample = np.zeros_like(voltages)
for i in range(0, 3):
    input("Remove sample")

    background += measure_spectrum(link, voltages, 2, 5)

    input("insert sample")

    sample += measure_spectrum(link, voltages, 2, 5)


output = (sample - background)/3.0

plt.plot(voltages,output)
plt.figure()
plt.plot(voltages,sample)
plt.plot(voltages,background)

plt.show()
