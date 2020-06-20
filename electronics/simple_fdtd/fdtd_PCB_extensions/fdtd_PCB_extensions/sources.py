

#need a function that slices including the PML margin

class Port:
    def __init__(self, pcb, SPICE_net, F_x, F_y):

        self.SPICE_net = SPICE_net

        self.N_x = pcb.xy_margin+int((F_x)/pcb.cell_size)
        self.N_y = pcb.xy_margin+int((F_y)/pcb.cell_size)

        if(not pcb.copper_mask[self.N_x, self.N_y, pcb.component_plane_z]):
            raise Exception("Port added without copper above.")

        self.voltage = 0.0
        self.current = 0.0
        self.voltage_history = []
        self.current_history = []

        pcb.copper_mask[self.N_x,self.N_y,pcb.ground_plane_z_top:pcb.component_plane_z-3] = 1 #make a conductor
        pcb.copper_mask[self.N_x,self.N_y,pcb.component_plane_z-2:pcb.component_plane_z] = 1 #make a conductor



def compute_all_voltages(pcb):
    for port in pcb.component_ports:
        # port.voltage = self.e_field_integrate(port, self.reference_port)
        # Perfect Electrical Conductors have zero internal electric field

        port.voltage = float(sum(self.grid.E[port.N_x,port.N_y,pcb.component_plane_z-3:pcb.component_plane_z-2,Z])*self.cell_size)
        port.voltage_history.append(port.voltage)

def compute_all_currents(self):
    for idx, port in enumerate(self.component_ports):

        #
        # self.grid.E[port.N_x,port.N_y,self.ground_plane_z_top:self.component_plane_z-3,Z] = 0 #make a conductor
        # self.grid.E[port.N_x,port.N_y,self.component_plane_z-2:self.component_plane_z,Z] = 0 #make a conductor
        #
        # C = epsilon_0*(self.cell_size**2.0)*(self.substrate_permittivity)/(1.0*self.cell_size)
        # # print(C)
        #
        # # C *= 10.0
        #
        # dvdt = (port.current / C)
        #
        # port.voltage += (dvdt * self.grid.time_step)
        #
        # self.grid.E[port.N_x,port.N_y,self.component_plane_z-3:self.component_plane_z-2,Z] = port.voltage / (self.cell_size)


        #equation 4, 5 in [Toland 1993]

        # a slightly simplified version is
        # https://www.eecs.wsu.edu/~schneidj/ufdtd/chap3.pdf, eq. 3.26
        # Aha! First we let the update occur normally, *then* we apply the J source, eq. 3.28 in the latter.

        # self.current = 1.0

        z_slice = slice(self.component_plane_z-3,self.component_plane_z-2)

        perm_factor = ((self.substrate_permittivity * 8.85e-12)/self.grid.time_step)
        E_n = self.grid.E[port.N_x,port.N_y,z_slice,Z]*perm_factor

        L_H =  ((self.grid.H[port.N_x,port.N_y-1,z_slice,X] - self.grid.H[port.N_x,port.N_y,z_slice,X]) / self.cell_size)
        L_H += ((self.grid.H[port.N_x,port.N_y,z_slice,Y] - self.grid.H[port.N_x-1,port.N_y,z_slice,Y]) / self.cell_size)

        I = -1.0*(port.old_current+port.current)/(2.0*(self.cell_size**2.0))
        print(E_n, L_H, I)
        E_new =  E_n
        E_new += L_H
        E_new -= I

        E_new /= perm_factor

        self.grid.E[port.N_x,port.N_y,z_slice,Z] = E_new

        print("E_new",E_new)

        port.old_current = port.current


def zero_conductor_fields(pcb):
    pcb.grid.E[self.copper_mask] = 0


def FDTD_step(pcb):
    pcb.grid.update_E()

    zero_conductor_fields(pcb)

    apply_all_currents(pcb)
    # self.constrain_values()
    pcb.grid.update_H()

    pcb.grid.time_steps_passed += 1
    pcb.time += self.grid.time_step # the adaptive
    pcb.times.append(self.time)


#
# def forcings(self):
#     for port in self.component_ports:
#     # if(current > 0.5
#     # port.voltage = np.clip(port.voltage, -40, 40)
#         port.current = np.clip(port.current, -10, 10)
#
# def to_taste(self):
#     #Using an adaptive timestep method as per [Ciampolini 1995]
#
#     z_slice = slice(self.component_plane_z-3,self.component_plane_z-2)
#
#     failsafe_port_voltages = []
#     failsafe_port_currents = []
#     failsafe_port_old_currents = []
#
#     for idx,port in enumerate(self.component_ports):
#         failsafe_port_voltages.append(self.grid.E[port.N_x,port.N_y,z_slice,Z].cpu())
#         failsafe_port_currents.append(port.current)
#         failsafe_port_old_currents.append(port.old_current)
#     # failsafe_ports = copy.deepcopy(self.component_ports)
#
#     delta_v = 0
#
#
#
#     # we know the dV/dt, just compute the timestep directly.
#
#     # this coefficient is somewhat tricky.
#     # higher, and the loop below will have to try more timesteps to find convergence.
#     # lower, and changes in required timestep will take longer to propagate.
#     self.set_time_step(self.grid.time_step*4.0)
#
#     # a better convergence metric would be useful.
#     while(True):
#
#         self.apply_all_currents()
#         self.compute_all_voltages()
#
#         delta_vs = [abs(failsafe_port_voltages[idx]-val.voltage) for idx,val in enumerate(self.component_ports)]
#         delta_v = max(delta_vs)
#         fastest_net = self.component_ports[delta_vs.index(delta_v)].SPICE_net
#         print("DV",delta_v)
#         # print("Delta V:" , delta_v)
#         convergence = delta_v < 0.1
#
#         if(convergence):
#             break
#         else:
#             self.set_time_step(self.grid.time_step*0.5)
#             print("Decreased timestep to " , self.grid.time_step)
#
#             for idx,port in enumerate(self.component_ports):
#                 self.grid.E[port.N_x:port.N_x+1,port.N_y:port.N_y+1,z_slice,Z] = failsafe_port_voltages[idx]
#                 print("AAAAAAAA",self.grid.E[port.N_x,port.N_y,z_slice,Z])
#                 port.current = failsafe_port_currents[idx]
#                 port.old_current = failsafe_port_old_currents[idx]
#
#         # prev_convergence = copy.copy(new_convergence)


def set_time_step(self, ts):
    self.grid.time_step = ts
    self.grid.courant_number = self.grid.time_step/(self.grid.grid_spacing / 3.0e8)
