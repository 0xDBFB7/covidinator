
#include <james.hpp>

#define MAX_N_POINTS 10
#define POINT_MASS (1/1000)
#define CUTOFF_DISTANCE 1

#define ELECTRIC_CONSTANT (1)


//need damping?

//based on https://people.sc.fsu.edu/~jburkardt/cpp_src/md_openmp/md_openmp.cpp
//pdb reader from https://graphics.stanford.edu/~drussel/pdb/

void particles::add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.insert(velocity.end(), velocity.begin(), velocity.end());
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
}

void particles::add_particle(std::vector<double> position, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
}

//
// std::vector<int> neighbors(positions, float cutoff_distance){
//     //returns a list of particle IDs within radius cutoff of particle
//
// }
//
// int dist(double x, double y, double z){
//
// }
//
// int force(double particle_charge_1, double particle_charge_1, double dist){
//     //regularize
//     lennard_jones_force =
//     coulomb_force = (particle_charge_1*particle_charge_2)/((dist-)*dist);
//     //electric field
// }
//
// // void make_sphere(std::vector<double> points, double total_charge, double radius, int N){
// //     surface_area = 4.0 * M_PI * (radius*radius);
// //
// // }
//
//
// //bond angles can also be represented by a Hooks-ian spring.
// //https://en.wikibooks.org/wiki/Molecular_Simulation/Intramolecular_Forces#Bond_Angle_Bending
//
