import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppenwolf/host/')


from functions import *
link = device_comms.connect()
from matplotlib import pyplot as plt

voltages = np.arange(0, 12, 0.5)

input("Remove sample")

background = measure_spectrum(link, voltages, 1, 4)

input("insert sample")

sample = measure_spectrum(link, voltages, 1, 4)


output = sample - background

plt.plot(voltages,output)
plt.show()
