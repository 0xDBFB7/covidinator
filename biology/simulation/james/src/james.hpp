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

#include <pdb++.h>
//pdb++ taken from
//http://www.csb.yale.edu/userguides/graphics/midas/man/pdb++.html
//http://cci.lbl.gov/svn/ksdssp/trunk/libpdb++/pdb++.h


#define X 0
#define Y 1
#define Z 2

struct Particles{
    //SoA is 5x faster than AoS

    //using LAMMPS 'nano' reduced units style (https://lammps.sandia.gov/doc/units.html)
                                    //time is nanoseconds.

    std::vector<double> positions; //nanometers
    std::vector<double> forces; //piconewtons

    std::vector<double> velocities; //nanometers/nanosecond
    std::vector<double> charges; // multiple of e-
    std::vector<double> masses; // attograms
    std::vector<int> tags;
    std::vector<bool> frozen; // velocities and acclerations are always zeroed.

    std::vector<double> new_positions; //used only by the verlet system
    std::vector<double> accelerations; //nanometers/nanosecond/nanosecond - these units and the mass and force work out
                                        //accelerations shouldn't be modified externally.

    void add_particle(std::vector<double> position, double charge, double mass, int tag, bool is_frozen);
    void add_particle(std::vector<double> position, double charge, double mass);

    std::vector<double> distance_vector(int particle_1, int particle_2);
    double angle(int particle_1, int particle_2, int particle_3);
    void apply_force(int particle_id, std::vector<double> &force_vector);

    void begin_timestep(double timestep);
    void integrate_particle_trajectory(double timestep);

    int idx(int id, int dim);
    int size();

    void import_PDB(std::string filename, double charge, double mass, int tag, int is_frozen, int divisor);
    void dump_to_xyz_file(std::string filename, int iteration);
    void apply_damping(double tag, double constant);

};

struct stretchy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<double> neutral_lengths;
    std::vector<double> coefficients;

    std::vector<double> breaking_force;
    std::vector<bool> broken;


    void add_bond(Particles &particles, int particle_1, int particle_2, double coefficient);
    void bond_neighbors(Particles &particles, int num_neighbors, int tag, double coefficient);
    void compute_all_bonds(Particles &particles);
    void compute_bond_force(Particles &particles, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id);
};

struct bendy_bonds{
    std::vector<int> p1;
    std::vector<int> pivots;
    std::vector<int> p3;
    std::vector<double> neutral_angles;
    std::vector<double> coefficients;

    std::vector<double> breaking_force;
    std::vector<bool> broken;

    void add_bond(Particles &particles, int particle_1, int particle_2, int particle_3, double coefficient);

    void compute_bond_force(Particles &particles, int bond_id);
    void compute_leg_force_direction_vectors(Particles &particles, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id);
    void compute_pivot_force_vector(Particles &particles, std::vector<double> &leg_1_force,
                                                                                    std::vector<double> &leg_2_force,
                                                                                    std::vector<double> &pivot_force, int bond_id);
    void bond_neighbors(Particles &particles, int num_neighbors, int tag, double coefficient);
    void compute_all_bonds(Particles &particles);

    void compute_leg_force_magnitude(Particles &particles, double &leg_1_force, double &leg_2_force, int bond_id);

};

double norm(std::vector<double> vector_1);
double norm(double x, double y, double z);
std::vector<double> opposite_vector(std::vector<double> vector_1);

std::vector<double> normalize(std::vector<double> input);

std::vector<double> cross_product(std::vector<double> vector_1, std::vector<double> vector_2);

std::vector<double> sum_vector(std::vector<double> vector_1, std::vector<double> vector_2);

std::vector<double> scale_vector(std::vector<double> vector_1, double scalar);

std::vector<int> find_neighbors(Particles &particles, int p1_id, int tag, int num_neighbors);

int count_particles_in_PDB(std::string filename,int divisor);

void compute_coulomb_force(Particles &particles, int particle_1, int particle_2, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2);
void compute_electric_force(Particles &particles, int particle_1, std::vector<double> &electric_field_vector, std::vector<double> &force_vector_1);
void handle_interparticle_forces(Particles &particles, std::vector<double> &electric_field_vector, double cutoff_distance);
void compute_all_electric_forces(Particles &particles, std::vector<double> &electric_field_vector);
#endif
