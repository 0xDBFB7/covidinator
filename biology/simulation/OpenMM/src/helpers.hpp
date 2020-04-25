#ifndef HELPERS_H
#define HELPERS_H


#include "OpenMM.h"

#include "sim.hpp"

#include <vector>
#include <iostream>
#include <fstream>
#include <algorithm>
#include <numeric>
#include <math.h>


#include <pdb++.h>


void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state);
std::vector<OpenMM::Vec3> import_PDB(std::string filename);
OpenMM::CustomExternalForce* init_electric_force();
std::vector<int> find_neighbors(Sim &sim, int p1_id, int tag, int num_neighbors);
void stretchy_bond_neighbors(Sim &sim, int tag, int num_neighbors, double coefficient);
double angle(OpenMM::Vec3 particle_1, OpenMM::Vec3 particle_2, OpenMM::Vec3 particle_3);

#endif
