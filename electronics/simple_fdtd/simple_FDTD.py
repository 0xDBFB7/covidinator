from PCB_extensions import *

import time
import os

import copy
# fdtd.set_backend("torch.cuda.HalfTensor")
fdtd.set_backend("torch.cuda.float32")
# fdtd.set_backend("numpy")

import matplotlib.pyplot as plt



source_dir = '/home/arthurdent/covidinator/electronics/kicad/wideband_LO/'
SPICE_source_file = source_dir + 'wideband_LO.cir'

KiCAD_source_file = source_dir + 'wideband_LO.kicad_pcb'

SVG_source_file = "../kicad/wideband_LO/wideband_LO-F_Cu.svg"

os.system("rm dumps/*")
os.system("sed 's/VTP2 nsource /VTP2 nsource 0 /g' " + SPICE_source_file + " > /tmp/mod.cir")
os.system("sed -i 's/\.end/ /g' /tmp/mod.cir")
os.system("cat append.cir >> /tmp/mod.cir")


pcb = PCB(0.0002)
pcb.initialize_grid_with_svg(SVG_source_file, courant_number = 0.001)
pcb.create_planes(0.032e-3, 6e7)
pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, SVG_source_file)



pcb.initialize_kicad_and_spice(KiCAD_source_file , "/tmp/mod.cir", '/tmp/wideband_LO_mod.cir', [])

pcb.create_source_vias()



dump_step = 200
i = 0
clock_time_before = 0
sim_time_before = 0

end_time = 100e-12
convergence = True

while(pcb.grid.time_passed < end_time):

    pcb.step()

    if(i % dump_step == 0):
        pcb.dump_to_vtk('dumps/test',i)

    print("Step {}".format(i))

    for port in pcb.component_ports:
        print(port.SPICE_net, port.voltage, port.current)

    print("Time: {}".format(pcb.grid.time_passed/1.0e-12))
    psps = ((pcb.grid.time_passed/1.0e-12)-sim_time_before)/(time.time()-clock_time_before)
    print("{} ps/s".format(psps))
    print("{} minutes left".format((((end_time/1.0e-12)-sim_time_before)/psps)/60.0))
    clock_time_before = time.time()
    sim_time_before = pcb.grid.time_passed/1.0e-12
    print(pcb.grid.time_step)
    i+=1


for port in pcb.component_ports:
    np.savetxt("data/"+port.SPICE_net+".csv", np.array(port.voltage_history).reshape(-1, 1), delimiter=",",fmt='%10.5f')
