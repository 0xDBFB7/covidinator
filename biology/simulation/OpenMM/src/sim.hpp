#ifndef SIM_H
#define SIM_H

#include "OpenMM.h"
#include <cstdio>
#include <iostream>
#include <math.h>
#include <vector>
#include <numeric>
#include <limits>
#include <fstream>
#include <assert.h>
#include <mgl2/mgl.h>
#include <algorithm>
#include <chrono>
#include <fenv.h>


#include <pdb++.h>
//pdb++ taken from
//http://www.csb.yale.edu/userguides/graphics/midas/man/pdb++.html
//http://cci.lbl.gov/svn/ksdssp/trunk/libpdb++/pdb++.h


#define X 0
#define Y 1
#define Z 2

void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state);


#endif
