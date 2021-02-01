
import numpy as np
import math

import torch



dtype = torch.float
#device = torch.device("cpu")
device = torch.device("cuda:0") # Uncomment this to run on GPU

nx=100
ny=100
nz=100

potential = torch.zeros((nx,ny,nz), device=device, dtype=dtype);
eps = torch.ones((nx,ny,nz), device=device, dtype=dtype);
kappa_squared = torch.zeros((nx,ny,nz));
value = torch.zeros(1);

for x in range(1,nx-1):
    for y in range(1,ny-1):
        for z in range(1,nz-1):
            value = 0
            value += -1.0*eps[x-1,y,z] * (potential[x-1,y,z]-potential[x,y,z]);
            value += -1.0*eps[x,y,z] * (potential[x+1,y,z]-potential[x,y,z]);
            value += -1.0*eps[x,y-1,z] * (potential[x,y-1,z]-potential[x,y,z]);
            value += -1.0*eps[x,y,z] * (potential[x,y+1,z]-potential[x,y,z]);
            value += -1.0*eps[x,y,z-1] * (potential[x,y,z-1]-potential[x,y,z]);
            value += -1.0*eps[x,y,z] * (potential[x,y,z+1]-potential[x,y,z]);
            value += eps[x,y,z]*kappa_squared[x,y,z]*potential[x,y,z];
