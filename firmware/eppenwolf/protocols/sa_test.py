import sys
sys.path.append('/home/arthurdent/covidinator/firmware/eppendoofus/host/')

import device_comms
import sweep

averages = 5

freqs = np.zeros(0) #this gets set on the first run, and persists throughout to anchor frequencies

frequency_bins = np.linspace()

freqs, background = sweep.take_sample(freqs, averages, 1, 6000, 100000, 30.0, 0)

input("Do something! >")

freqs, averaged_data = sweep.take_sample(freqs, averages, 1, 6000, 100000, 30.0, 0)

averaged_data -= background

freqs, averaged_data = peak_detect(averaged_data, freqs)

file = input("filename? > ")
if file:
    plt.savefig("../media/" + file + ".png")

plt.plot(freqs,averaged_data)
plt.show()
