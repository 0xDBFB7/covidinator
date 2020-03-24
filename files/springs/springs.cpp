#include <iostream>
#include <math.h>
#include <vector>

#define MAX_N_POINTS 10
#define POINT_MASS (1/1000)
#define CUTOFF 1

#define ELECTRIC_CONSTANT (1)


//need damping
//try springs later



int dist(double x, double y, double z){

}

int calculate_neighbors(){

}

int force(double particle_charge_1, double particle_charge_1, double dist){
    //regularize
    lennard_jones_force =
    coulomb_force = (particle_charge_1*particle_charge_2)/((dist-)*dist);
}

void make_sphere(std::vector<double> points, double total_charge, double radius, int N){
    surface_area = 4.0 * M_PI * (radius*radius);

}



int main(){
    std::vector<double> points; //x,y,z, v_x, v_y, v_z, mass, charge, LJ rest distance
    // std::vector<std::vector<double>> neighbor_distances; //2d! oh noes


}
