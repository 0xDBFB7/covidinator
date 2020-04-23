#ifndef JAMES_H
#define JAMES_H

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

#include <pdb++.h>
//pdb++ taken from
//http://www.csb.yale.edu/userguides/graphics/midas/man/pdb++.html
//http://cci.lbl.gov/svn/ksdssp/trunk/libpdb++/pdb++.h


#define X 0
#define Y 1
#define Z 2

#define primary_type float

struct Particles{
    //SoA is 5x faster than AoS

    //using LAMMPS 'nano' reduced units style (https://lammps.sandia.gov/doc/units.html)
                                    //time is nanoseconds.

    std::vector<primary_type> positions; //nanometers
    std::vector<primary_type> forces; //piconewtons

    std::vector<primary_type> velocities; //nanometers/nanosecond
    std::vector<primary_type> charges; // multiple of e-
    std::vector<primary_type> masses; // attograms
    std::vector<int> tags;
    std::vector<bool> frozen; // velocities and acclerations are always zeroed.

    std::vector<primary_type> new_positions; //used only by the verlet system
    std::vector<primary_type> accelerations; //nanometers/nanosecond/nanosecond - these units and the mass and force work out
                                        //accelerations shouldn't be modified externally.

    void add_particle(std::vector<primary_type> position, primary_type charge, primary_type mass, int tag, bool is_frozen);
    void add_particle(std::vector<primary_type> position, primary_type charge, primary_type mass);

    std::vector<primary_type> distance_vector(int particle_1, int particle_2);
    primary_type distance_scalar(int particle_1, int particle_2);
    primary_type angle(int particle_1, int particle_2, int particle_3);
    void apply_force(int particle_id, std::vector<primary_type> &force_vector);

    void begin_timestep(primary_type timestep);
    void integrate_particle_trajectory(primary_type timestep);

    int idx(int id, int dim);
    int size();

    void import_PDB(std::string filename, primary_type charge, primary_type mass, int tag, int is_frozen, int divisor);
    void dump_to_xyz_file(std::string filename, int iteration);
    void apply_damping(primary_type tag, primary_type constant);


};

struct stretchy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<primary_type> neutral_lengths;
    std::vector<primary_type> coefficients;

    std::vector<primary_type> breaking_force;
    std::vector<bool> broken;


    void add_bond(Particles &particles, int particle_1, int particle_2, primary_type coefficient);
    void bond_neighbors(Particles &particles, int num_neighbors, int tag, primary_type coefficient);
    void compute_all_bonds(Particles &particles);
    void compute_bond_force(Particles &particles, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2, int bond_id);
};

struct bendy_bonds{
    std::vector<int> p1;
    std::vector<int> pivots;
    std::vector<int> p3;
    std::vector<primary_type> neutral_angles;
    std::vector<primary_type> coefficients;

    std::vector<primary_type> breaking_force;
    std::vector<bool> broken;

    void add_bond(Particles &particles, int particle_1, int particle_2, int particle_3, primary_type coefficient);

    void compute_bond_force(Particles &particles, int bond_id);
    void compute_leg_force_direction_vectors(Particles &particles, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2, int bond_id);
    void compute_pivot_force_vector(Particles &particles, std::vector<primary_type> &leg_1_force,
                                                                                    std::vector<primary_type> &leg_2_force,
                                                                                    std::vector<primary_type> &pivot_force, int bond_id);
    void bond_neighbors(Particles &particles, int num_neighbors, int tag, primary_type coefficient);
    void compute_all_bonds(Particles &particles);

    void compute_leg_force_magnitude(Particles &particles, primary_type &leg_1_force, primary_type &leg_2_force, int bond_id);

};

primary_type norm(std::vector<primary_type> vector_1);
primary_type norm(primary_type x, primary_type y, primary_type z);
std::vector<primary_type> opposite_vector(std::vector<primary_type> vector_1);

std::vector<primary_type> normalize(std::vector<primary_type> input);

std::vector<primary_type> cross_product(std::vector<primary_type> vector_1, std::vector<primary_type> vector_2);

std::vector<primary_type> sum_vector(std::vector<primary_type> vector_1, std::vector<primary_type> vector_2);

std::vector<primary_type> scale_vector(std::vector<primary_type> vector_1, primary_type scalar);

std::vector<int> find_neighbors(Particles &particles, int p1_id, int tag, int num_neighbors);

int count_particles_in_PDB(std::string filename,int divisor);

void compute_coulomb_force(Particles &particles, int particle_1, int particle_2, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2);
void compute_electric_force(Particles &particles, int particle_1, std::vector<primary_type> &electric_field_vector, std::vector<primary_type> &force_vector_1);
void handle_interparticle_forces(Particles &particles, std::vector<primary_type> &electric_field_vector, primary_type cutoff_distance);
void compute_all_electric_forces(Particles &particles, std::vector<primary_type> &electric_field_vector);
#endif
