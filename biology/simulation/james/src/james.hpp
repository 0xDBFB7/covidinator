#ifndef JAMES_H
#define JAMES_H

#include <iostream>
#include <math.h>
#include <vector>
#include <numeric>

#define X 0
#define Y 1
#define Z 2

struct particles{
    //SoA is 5x faster than AoS

    std::vector<double> positions; //x,y,z - using this linear format so CUDA support can be added without undue struggle
    std::vector<double> forces;
    std::vector<double> accelerations;
    std::vector<double> velocities;
    std::vector<double> charges;
    std::vector<double> masses;
    std::vector<int> tags;

    void add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass);
    void add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass, int tag);
    void add_particle(std::vector<double> position, double charge, double mass);
    std::vector<double> distance_vector(int particle_1, int particle_2);
    double angle(int particle_1, int particle_2, int particle_3);
    void apply_force(int particle_id, std::vector<double> &force_vector);
    void initialize_timestep();
    int idx(int id, int dim);
};

struct stretchy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<double> neutral_lengths;
    std::vector<double> coefficients;

    void add_bond(particles &particle_obj, int particle_1, int particle_2, double coefficient);

    void compute_bond_force(particles &particle_obj, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id);
};

struct bendy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<int> p3;
    std::vector<double> neutral_angles;
    std::vector<double> coefficients;

    void add_bond(particles &particle_obj, int particle_1, int particle_2, int particle_3, double coefficient);

    void compute_bond_force(particles &particle_obj, int bond_id);
    void compute_leg_force_direction_vectors(particles &particle_obj, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id);
    void compute_pivot_force_vector(particles &particle_obj, std::vector<double> &leg_1_force,
                                                                                    std::vector<double> &leg_2_force,
                                                                                    std::vector<double> &pivot_force, int bond_id);

    void compute_leg_force_magnitude(particles &particle_obj, double &leg_1_force, double &leg_2_force, int bond_id);

};

double norm(std::vector<double> vector_1);
double norm(double x, double y, double z);
std::vector<double> opposite_vector(std::vector<double> vector_1);

std::vector<double> normalize(std::vector<double> input);

std::vector<double> cross_product(std::vector<double> vector_1, std::vector<double> vector_2);

std::vector<double> sum_vector(std::vector<double> vector_1, std::vector<double> vector_2);

std::vector<double> scale_vector(std::vector<double> vector_1, double scalar);

void compute_coulomb_force(particles &particle_obj, int particle_1, int particle_2, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2);
void compute_electric_force(particles &particle_obj, int particle_1, std::vector<double> &force_vector_1);

#endif
