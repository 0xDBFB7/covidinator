#ifndef HELPERS_H
#define HELPERS_H


#include "OpenMM.h"

#include "sim.hpp"

#include <vector>
#include <iostream>
#include <fstream>

#include <pdb++.h>


void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state);
std::vector<OpenMM::Vec3> import_PDB(std::string filename);

#endif
