
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
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}


void particles::add_particle(std::vector<double> position, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}


double particles::angle(int particle_1, int particle_2, int particle_3){
    //returns angle in radians, dot products
    std::vector<double> vector_1 = distance_vector(particle_1, particle_2);
    std::vector<double> vector_2 = distance_vector(particle_2, particle_3);

    double dot = std::inner_product(std::begin(vector_1),std::end(vector_1),std::begin(vector_2), 0.0); //dot product

    double mag = norm(vector_1) * norm(vector_2);

    if(mag == 0.0){
        std::cout << "particles::angle singularity\n";
        return 0;
    }

    return acos(dot/mag);
}

std::vector<double> particles::distance_vector(int particle_1, int particle_2){
    std::vector<double> output(3);
    for(int dim = 0; dim < 3; dim++){
        output[dim] = positions[idx(particle_1,dim)] - positions[idx(particle_2,dim)];
    }
    return output;
}


int particles::idx(int id, int dim){
    return (id*3)+dim;
}

double norm(double x, double y, double z){
    return sqrt((x*x) + (y*y) + (z*z));
}

double norm(std::vector<double> vector_1){
    return sqrt((vector_1[0]*vector_1[0])+(vector_1[1]*vector_1[1])+(vector_1[2]*vector_1[2]));
}


void stretchy_bonds::add_bond(particles &particle_obj, int particle_1, int particle_2, double coefficient){
    neutral_lengths.push_back(norm(particle_obj.distance_vector(particle_1,particle_2)));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    coefficients.push_back(coefficient);
}

void stretchy_bonds::compute_bond_force(particles &particle_obj, int bond_id){
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];

    double p1_x = particle_obj.positions[particle_obj.idx(p1_id,0)];
    double p1_y = particle_obj.positions[particle_obj.idx(p1_id,1)];
    double p1_z = particle_obj.positions[particle_obj.idx(p1_id,2)];

    double p2_x = particle_obj.positions[particle_obj.idx(p2_id,0)];
    double p2_y = particle_obj.positions[particle_obj.idx(p2_id,1)];
    double p2_z = particle_obj.positions[particle_obj.idx(p2_id,2)];

    double distance_x = p1_x - p2_x;
    double distance_y = p1_y - p2_y;
    double distance_z = p1_z - p2_z;

    double distance = norm(distance_x,distance_y,distance_z);
    double displacement = distance-neutral_lengths[bond_id];

    double force = -1.0*coefficients[particle_obj.idx(p1_id,0)]*displacement;

    double force_x = force*(distance_x/distance); //vector projection
    double force_y = force*(distance_y/distance);
    double force_z = force*(distance_z/distance);

    particle_obj.forces[particle_obj.idx(p1_id,X)] += force_x;
    particle_obj.forces[particle_obj.idx(p1_id,Y)] += force_y;
    particle_obj.forces[particle_obj.idx(p1_id,Z)] += force_z;

    particle_obj.forces[particle_obj.idx(p2_id,X)] -= force_x; // equal and opposite reaction
    particle_obj.forces[particle_obj.idx(p2_id,Y)] -= force_y;
    particle_obj.forces[particle_obj.idx(p2_id,Z)] -= force_z;
}


void bendy_bonds::add_bond(particles &particle_obj, int particle_1, int particle_2, int particle_3, double coefficient){
    neutral_angles.push_back(particle_obj.angle(particle_1,particle_2,particle_3));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    p3.push_back(particle_3);
    coefficients.push_back(coefficient);
}


void bendy_bonds::compute_bond_force(particles &particle_obj, int bond_id){
    //
    //the bendy bond can be imagined as two rods and three points:
    //        ^
    //   0----0
    //   |
    //   |
    // < 0
    // bending the bond applies a torque about the pivot.
    // We need to get the two force vectors, which always points 90 deg from each leg radially.
    //  - the magnitude is pretty easy to get
    // first we'll cross product the two legs to get the torque pivot vector.
    // then we'll cross one leg with this torque vector and normalize to get the force vector.
    // then you put one leg out, one leg in, and you shake it all about
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];
    int p3_id = p3[bond_id];

    vector_1 = particle_obj.distance_vector(p1, p2);
    vector_2 = particle_obj.distance_vector(p1, p3);

    particle_obj.angle(particle_1,particle_2,particle_3); // DRY. take distance_vector out of .angle()

}

std::vector<double> cross_product(std::vector<double> vector_1, std::vector<double> vector_2){
    std::vector<double> output;
    
}


// void coulomb_force(particles &particle_obj){
//
// }








//Steps:
//import particles.


//vel. verlet integrator (https://en.wikipedia.org/wiki/Verlet_integration)


//for (auto i: particles_obj.positions) std::cout << i << ',';

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
