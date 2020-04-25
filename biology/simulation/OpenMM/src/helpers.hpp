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
OpenMM::CustomExternalForce* init_electric_force();
std::vector<int> find_neighbors(std::vector<OpenMM::Vec3> &positions, int p1_id, int start, int end, int num_neighbors);
void stretchy_bond_neighbors(OpenMM::HarmonicBondForce* stretchy_force, std::vector<OpenMM::Vec3> &positions, int start, int end, int num_neighbors, double coefficient);

#endif
