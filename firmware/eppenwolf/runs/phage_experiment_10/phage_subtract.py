import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp
import pickle
import scipy.integrate as integrate

valid_lines = []
with open('phage_run_10.csv', "r") as f:
    for line in f:
        if(line.count(',') == 15):
            valid_lines.append(line)


data = np.genfromtxt(valid_lines, delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

data = np.array(np.vsplit(data, np.ndarray.flatten(np.argwhere(data[:,0] == 11.95)+1)))[0:-1]


data = np.reshape(data, (2))


near_sensor = 1
far_sensor = 2

def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(data[0][:,0])




plt.plot(freqs,data[0][:,far_sensor]/data[0][:,near_sensor])
plt.plot(freqs,data[1][:,far_sensor]/data[1][:,near_sensor])
plt.figure()
plt.plot(freqs,(data[0][:,far_sensor]/data[0][:,near_sensor])-(data[1][:,far_sensor]/data[1][:,near_sensor]))


# plt.plot(freqs, treated_phage[sample_post_treatment][:,near_sensor] - control[sample_post_treatment][:,near_sensor])
# plt.plot(freqs, treated_phage[sample_pre_treatment][:,near_sensor] - control[sample_pre_treatment][:,near_sensor])
# plt.plot(freqs, untreated_phage[sample_pre_treatment][:,near_sensor] - control[sample_pre_treatment][:,near_sensor])

# plt.plot(freqs, treated_phage[sample_post_treatment][:,near_sensor] - control[sample_post_treatment][:,near_sensor])
# plt.plot(freqs, untreated_phage[sample_post_treatment][:,near_sensor] - control[sample_post_treatment][:,near_sensor])
# plt.plot(freqs, treated_phage[sample_pre_treatment][:,near_sensor] - control[sample_pre_treatment][:,near_sensor])


plt.show()



# plt.plot(freqs, (averaged_sic[:,1] - averaged_background[:,1]) / averaged_background[:,1],label="'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, (averaged_sic[:,2] - averaged_background[:,2]) / averaged_background[:,2],label="'Far' sensor,  $\propto$S$_{21}$")
# plt.legend()
# plt.savefig("sic_9_1.svg")
# plt.title("Normalized silicon carbide susceptor spectrum")
# plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
# plt.xlabel("Frequency (GHz)")
# plt.figure()
# plt.plot(freqs, averaged_sic[:,1],label="SiC susceptor, 'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, averaged_sic[:,2],label="SiC susceptor, 'Far' sensor,  $\propto$S$_{21}$")
# plt.plot(freqs, averaged_background[:,1],label="Background, 'Near' sensor,  $\propto$S$_{11}$")
# plt.plot(freqs, averaged_background[:,2],label="Background, 'Far' sensor,  $\propto$S$_{21}$")
# plt.ticklabel_format(style='sci', axis='x', scilimits=(9,9))
# plt.legend()
# plt.xlabel("Frequency (GHz)")
# plt.ylabel("Voltage")
# plt.title("Raw detector voltage")
# plt.savefig("sic_9_2.svg")

#
# plt.legend()
# plt.show()
