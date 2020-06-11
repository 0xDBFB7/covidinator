from PCB_extensions import *

import os

fdtd.set_backend("torch.cuda.float32")


import matplotlib.pyplot as plt



source_dir = '/home/arthurdent/covidinator/electronics/kicad/wideband_LO/'
SPICE_source_file = source_dir + 'wideband_LO.cir'

KiCAD_source_file = source_dir + 'wideband_LO.kicad_pcb'

os.system("sed 's/VTP2 Net-_C3-Pad2_ /VTP2 Net-_C3-Pad2_ 0 /g' " + SPICE_source_file + " > /tmp/mod.cir")
os.system("sed -i 's/\.end/ /g' /tmp/mod.cir")

os.system("echo '\n.control\nsetcs DIOgradingCoeffMax=3.0\nsetcs DIOtDepCapMax=2.0\n.endc\n.end' >> /tmp/mod.cir")


pcb = PCB(0.0001)
pcb.initialize_grid_with_svg('test/basic_test.svg')
pcb.create_planes(0.032e-3, 6e7)
pcb.create_substrate(0.8e-3, 4.4, 0.02, 9e9)
pcb.construct_copper_geometry_from_svg(0.032e-3, 6e7, 'test/basic_test.svg')



pcb.initialize_kicad_and_spice(KiCAD_source_file , "/tmp/mod.cir", '/tmp/wideband_LO_mod.cir')

pcb.create_source_vias()



dump_step = 20
for i in range(0,500):
    pcb.step()

    if(i % dump_step == 0):
        pcb.dump_to_vtk('test/test_spice/dumps/test',i)

    print("Step {}".format(i))
    print("V1, {} V2 {}".format(pcb.component_ports[0].voltage,
                                                            pcb.component_ports[1].voltage))
    print("I1, {} I2 {}".format(pcb.component_ports[0].current,
                                                            pcb.component_ports[1].current))

    print("Time: {}".format(pcb.grid.time_passed/1.0e-12))

plt.plot(pcb.times, pcb.component_ports[0].voltage_history, label="input_terminated")
plt.plot(pcb.times, pcb.component_ports[1].voltage_history, label="output")
plt.legend()
plt.show()
