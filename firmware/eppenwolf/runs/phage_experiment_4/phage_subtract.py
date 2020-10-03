import numpy as np
import matplotlib.pyplot as plt
from math import pi, sqrt, e, log, isclose, exp
import pickle
import scipy.integrate as integrate

valid_lines = []
with open('phage_run_4_slide_0.csv', "r") as f:
    for line in f:
        if(line.count(',') == 15):
            valid_lines.append(line)


with open('phage_run_4_slide_1.csv', "r") as f:
    for line in f:
        if(line.count(',') == 15):
            valid_lines.append(line)


data = np.genfromtxt(valid_lines, delimiter=",", dtype=np.float, encoding='ascii', skip_header=0)

data = np.array(np.vsplit(data, np.ndarray.flatten(np.argwhere(data[:,0] == 11.95)+1)))[0:-1]


with open('choices.pkl', 'rb') as f:
    data = pickle.load(f)

phage_0 = 0
phage_1 = 4
phage_2 = 6
phage_3 = 7

autoclaved_phage_0 = 1
autoclaved_phage_1 = 5

sterile_broth_0 = 2
sterile_broth_1 = 3

near_sensor = 1
far_sensor = 2

slide_0 = 0
slide_1 = 1


#in this run, (looking after the fact, was blind before), on slide 0,  group B was not exposed, group A was.
#same for slide 1

# 2, pulse, 1, 1, iterations of
# 2 slides, 8 cuvettes, 5 sweeps

# data = np.vsplit(data, np.shape(data)[0]/2)

data = np.reshape(data, (4, 2, 8, 5))

print(np.shape(data))


def get_data(test, slide, cuvette, parameter):
    data_ = data[test, slide, cuvette][:,parameter]
    data_ /= np.linalg.norm(data_)
    return data_


def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(data[0, 0, 0][:,0])








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


plt.legend()
plt.show()
