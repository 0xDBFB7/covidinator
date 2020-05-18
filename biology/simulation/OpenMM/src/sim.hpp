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

#define OPENMM_PLUGIN_DIRECTORY "/home/arthurdent/Programs/openmm-7.4.1/openmm-7.4.1/install/lib/plugins"

void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state);



struct Sim{
    OpenMM::System system;
    OpenMM::Context* context;
    OpenMM::LangevinIntegrator* integrator;
    OpenMM::CustomExternalForce* electric_force;
    OpenMM::NonbondedForce* LJ_coulomb_force;

    OpenMM::HarmonicBondForce* stretchy_force;
    OpenMM::HarmonicAngleForce* bendy_force;

    std::vector<OpenMM::Vec3> initial_positions;
    std::vector<int> tags;
    int num_particles = 0;

    Sim(double timestep);

    void initialize_context();
    void add_particle(OpenMM::Vec3 position, double mass, double charge, int tag, double LJ_sigma, double LJ_well_depth);
    void set_electric_field(double Ex, double Ey, double Ez);
    void add_particles(std::vector<OpenMM::Vec3> positions, double total_mass, double total_charge, int tag, double LJ_sigma, double LJ_well_depth);

};



#endif
