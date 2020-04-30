
from matplotlib import pyplot as plt
from subprocess import Popen, PIPE, STDOUT
import numpy as np

start_freq = 1
end_freq = 6000

x = np.zeros(start_freq*1e6)
data = np.zeros(1)

p = Popen('hackrf_sweep -f 1:6000 -a 0 -n8192 -w10000 -N1', stdout = PIPE, stderr = STDOUT, shell = True)
for line in p.stdout:
    try:
        # print(np.array([float(i) for i in line.decode().split(',')[6:]]))
        new_input = np.array([float(i) for i in line.decode().split(',')])
        for i in range(0, (len(new_input[6:]))):
            freq = new_input[2] + (new_input[2] - new_input[3]) / (len(new_input[6:]))*i
            data = np.append(data, new_input[i+6])
            
        # data = np.append(data,new_input)
    except Exception as e:
        print(e)
        pass

print(data)
plt.plot(data)
plt.show()
