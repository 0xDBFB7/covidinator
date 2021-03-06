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


candidate_names = ["Phage           ", "Autoclaved Phage", "Broth           "]

phage_choice = 0
autoclaved_phage_choice = 1
broth_choice = 2

candidates = [0,1,2]
with open('choices.pkl', 'rb') as f:
    choices = np.array(pickle.load(f))



near_sensor = 1
far_sensor = 2

slide_0 = 0
slide_1 = 1

sample_pre_treatment = 0
sample_post_treatment = 1
sample_post_re_treatment = 2

data = np.reshape(data, (2, 8, 3, 5))

data = np.mean(data, 3)



def get_data(slide, cuvette, sample, parameter):
    data_ = data[slide, cuvette, sample][:,parameter]
    # data_ /= np.linalg.norm(data_)
    return data_


def freq_eq(x):
    #HMC732 VCO approx equation
 return 0.4794e9*x + 5.874e9

freqs = freq_eq(data[0, 0, 0][:,0])


treatment = np.zeros((2,8), dtype=bool)

treated_phage=[]
untreated_phage=[]
treated_autoclaved_phage=[]
untreated_autoclaved_phage=[]
control = []

for i in range(0,2):
    for j in range(0,8):
        treatment[i,j] = bool(data[i,j,0][0,15])
        #
        # print(data[i,j][0][:,1:3])
        # for k in range(0,3):
        #     data[i,j][k][:,1:3] /= np.linalg.norm(data[i,j][k][:,1:3])

        if(treatment[i,j] and choices[i,j] == phage_choice):
            treated_phage.append(data[i,j])
        if(not treatment[i,j] and choices[i,j] == phage_choice):
            untreated_phage.append(data[i,j])
        if(treatment[i,j] and choices[i,j] == autoclaved_phage_choice):
            treated_autoclaved_phage.append(data[i,j])
            control.append(data[i,j])
        if(not treatment[i,j] and choices[i,j] == autoclaved_phage_choice):
            untreated_autoclaved_phage.append(data[i,j])
            control.append(data[i,j])
        if(choices[i,j] == broth_choice):
            control.append(data[i,j])

print(treatment)
print(choices)

#For this run, there really aren't enough 'control's (only two!) - one PA and two broths.


treated_phage = np.array(treated_phage)
untreated_phage = np.array(untreated_phage)


#
# treated_autoclaved_phage = np.array(treated_autoclaved_phage)
# untreated_autoclaved_phage = np.array(untreated_autoclaved_phage)
# control = np.array(control)
#
# control = np.mean(control, 0)

# for i in treated_phage:
#     plt.plot(i[0][:,near_sensor])

# control_diff = )

#
# for i in untreated_phage:
#
    # plt.plot(freqs, i[0][:,far_sensor] - control[0][:,near_sensor])


treated_phage = np.mean(treated_phage, 0)
untreated_phage = np.mean(untreated_phage, 0)
# treated_autoclaved_phage = np.mean(treated_autoclaved_phage, 0)

# plt.plot(freqs, i[0][:,far_sensor] - control[0][:,near_sensor])



plt.plot(treated_phage[0][:,near_sensor] - treated_phage[1][:,near_sensor])
plt.plot(untreated_phage[0][:,near_sensor] - untreated_phage[1][:,near_sensor])


# plt.plot(treated_phage[0][:,far_sensor])

#
# plt.plot((untreated_phage[0][:,far_sensor] - untreated_phage[0][:,near_sensor]) - (control[0][:,far_sensor] - control[0][:,near_sensor]))
# plt.plot((untreated_phage[1][:,far_sensor] - untreated_phage[1][:,near_sensor]) - (control[1][:,far_sensor] - control[1][:,near_sensor]))
#





# plt.plot(freqs, treated_phage[sample_pre_treatment][:,near_sensor] - control[sample_pre_treatment][:,near_sensor])
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
