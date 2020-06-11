from PCB_extensions import *

import os

fdtd.set_backend("torch.cuda.float32")


import matplotlib.pyplot as plt



source_dir = '/home/arthurdent/covidinator/electronics/kicad/wideband_LO/'
SPICE_source_file = source_dir + 'wideband_LO.cir'

KiCAD_source_file = source_dir + 'wideband_LO.kicad_pcb'

SVG_source_file = "../kicad/wideband_LO/wideband_LO-F_Cu.svg"

os.system("sed 's/VTP2 nsource /VTP2 nsource 0 /g' " + SPICE_source_file + " > /tmp/mod.cir")
os.system("sed -i 's/\.end/ /g' /tmp/mod.cir")
os.system("cat append.cir >> /tmp/mod.cir")


pcb = PCB(0.0001)
pcb.initialize_grid_with_svg(SVG_source_file, courant_number = 0.005)
pcb.create_planes(0.032e-3, 6e7)
pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, SVG_source_file)



pcb.initialize_kicad_and_spice(KiCAD_source_file , "/tmp/mod.cir", '/tmp/wideband_LO_mod.cir', [])

pcb.create_source_vias()



dump_step = 20
for i in range(0,500):
    pcb.step()

    if(i % dump_step == 0):
        pcb.dump_to_vtk('dumps/test',i)

    print("Step {}".format(i))
    for i in pcb.component_ports:
        print(i.SPICE_net, i.voltage, i.current)
    # print("V1, {} V2 {}".format(pcb.component_ports[0].voltage,
    #                                                         pcb.component_ports[1].voltage))
    # print("I1, {} I2 {}".format(pcb.component_ports[0].current,
    #                                                         pcb.component_ports[1].current))

    print("Time: {}".format(pcb.grid.time_passed/1.0e-12))

plt.plot(pcb.times, pcb.component_ports[0].voltage_history, label="input_terminated")
plt.plot(pcb.times, pcb.component_ports[1].voltage_history, label="output")
plt.legend()
plt.show()
