from prody import *
import numpy as np
import matplotlib

emd = parseEMD('input_data/emd_6323/emd_6323.map', cutoff=1.2, n_nodes=5000, num_iter=30, map=False, make_nodes=True)
writePDB('input_data/emd_6323/emd_6323.pdb', emd)
