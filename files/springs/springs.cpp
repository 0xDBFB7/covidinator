#include <iostream>
#include <math.h>
#include <vector>
#include <openmp.h>

#define MAX_N_POINTS 10
#define POINT_MASS (1/1000)
#define CUTOFF 1

#define ELECTRIC_CONSTANT (1)

//compile with:
//need damping?
//try springs later

//based on https://people.sc.fsu.edu/~jburkardt/cpp_src/md_openmp/md_openmp.cpp
//pdb reader from https://graphics.stanford.edu/~drussel/pdb/


int dist(double x, double y, double z){

}

int calculate_neighbors(){

}

int force(double particle_charge_1, double particle_charge_1, double dist){
    //regularize
    lennard_jones_force =
    coulomb_force = (particle_charge_1*particle_charge_2)/((dist-)*dist);
}

// void make_sphere(std::vector<double> points, double total_charge, double radius, int N){
//     surface_area = 4.0 * M_PI * (radius*radius);
//
// }


//bond angles can also be represented by a Hooks-ian spring.
//https://en.wikibooks.org/wiki/Molecular_Simulation/Intramolecular_Forces#Bond_Angle_Bending

struct Bond{
    p2
}

struct particle_data{
    std::vector<double> positions; //x,y,z,x,y,z
    std::vector<double> velocities; //x,y,z,x,y,z
    std::vector<double> charge; //e-
    std::vector<double> mass; //
    std::vector<>; //AoS! Oh noes
}

int main(){

}

//export can be a set of .xyz or csv files.
