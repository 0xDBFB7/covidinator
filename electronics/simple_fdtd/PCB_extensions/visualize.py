

def dump_to_vtk(self, filename, iteration, Ex_dump=False, Ey_dump=False, Ez_dump=False, Emag_dump=True, objects_dump=True, ports_dump=True):
    '''
    Extension is automatically chosen, you don't need to supply it

    thanks
    https://pyscience.wordpress.com/2014/09/06/numpy-to-vtk-converting-your-numpy-arrays-to-vtk-arrays-and-files/
    https://bitbucket.org/pauloh/pyevtk/src/default/src/hl.py

    Paraview needs a threshold operation to view the objects correctly.

    '''


    x = np.linspace(0, self.cell_size*self.grid.Nx, self.grid.Nx+1) #there might be an off-by-one error here.
    y = np.linspace(0, self.cell_size*self.grid.Ny, self.grid.Ny+1)
    z = np.linspace(0, self.cell_size*self.grid.Nz, self.grid.Nz+1)

    cellData = {}

    if(not isinstance(fdtd.backend, NumpyBackend)):
        E_copy = self.grid.E.cpu()
        cu_mask = self.copper_mask.cpu().numpy()
    else:
        E_copy = self.grid.E
        cu_mask = self.copper_mask

    if(objects_dump):
        objects = np.zeros_like(E_copy[:,:,:,X])
        for obj in self.grid.objects:
            if(obj.name == "substrate"):
                objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 1
            else:
                objects[obj.x.start:obj.x.stop, obj.y.start:obj.y.stop, obj.z.start:obj.z.stop] = 2
        objects += cu_mask*2
        cellData['objects'] = objects

    if(ports_dump):
        ports = np.zeros_like(E_copy[:,:,:,X])
        for port in [i for i in self.component_ports if i]:
                ports[port.N_x,port.N_y,self.component_plane_z-1] = 4

                # ports[port.N_x+1:port.N_x+2,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2] = 5
                # ports[port.N_x-1:port.N_x,port.N_y:port.N_y+1,self.component_plane_z-3:self.component_plane_z-2]  = 5
                # ports[port.N_x:port.N_x+1,port.N_y+1:port.N_y+2,self.component_plane_z-3:self.component_plane_z-2] = 5
                # ports[port.N_x:port.N_x+1,port.N_y-1:port.N_y,self.component_plane_z-3:self.component_plane_z-2]  = 5
        cellData['ports'] = ports


    if(Ex_dump):
        cellData['Ex'] = np.ascontiguousarray(E_copy[:,:,:,X])
    if(Ey_dump):
        cellData['Ey'] = np.ascontiguousarray(E_copy[:,:,:,Y])
    if(Ez_dump):
        cellData['Ez'] = np.ascontiguousarray(E_copy[:,:,:,Z])
    if(Emag_dump):
        cellData['Emag'] = np.ascontiguousarray(self.E_magnitude(E_copy)) # gridToVTK expects a contiguous array.


    gridToVTK(filename + str(iteration), x, y, z, cellData = cellData)
