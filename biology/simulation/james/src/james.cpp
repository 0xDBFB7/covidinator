
#include <james.hpp>

//need damping?

//based on https://people.sc.fsu.edu/~jburkardt/cpp_src/md_openmp/md_openmp.cpp
//pdb reader from https://graphics.stanford.edu/~drussel/pdb/




void particles::add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.insert(velocity.end(), velocity.begin(), velocity.end());
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(0);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}


void particles::add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass, int tag){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.insert(velocity.end(), velocity.begin(), velocity.end());
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(tag);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}

void particles::add_particle(std::vector<double> position, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(0);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}

int particles::size(){
    return masses.size();
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

void particles::initialize_timestep(){
    std::fill(std::begin(forces),std::end(forces),0.0);
    std::fill(std::begin(accelerations),std::end(accelerations),0.0);
}

void particles::apply_force(int particle_id, std::vector<double> &force_vector){
    forces[idx(particle_id,X)] += force_vector[X];
    forces[idx(particle_id,Y)] += force_vector[Y];
    forces[idx(particle_id,Z)] += force_vector[Z];
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

std::vector<double> normalize(std::vector<double> input){
    double mag = norm(input);
    std::vector<double> output(3);
    for(int dim = 0; dim < 3; dim++){
        output[dim] = input[dim] / mag;
    }
    return output;
}

void stretchy_bonds::add_bond(particles &particle_obj, int particle_1, int particle_2, double coefficient){
    neutral_lengths.push_back(norm(particle_obj.distance_vector(particle_1,particle_2)));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    coefficients.push_back(coefficient);
}

void stretchy_bonds::compute_bond_force(particles &particle_obj, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id){
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

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction
}




void bendy_bonds::add_bond(particles &particle_obj, int particle_1, int particle_2, int particle_3, double coefficient){
    neutral_angles.push_back(particle_obj.angle(particle_1,particle_2,particle_3));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    p3.push_back(particle_3);
    coefficients.push_back(coefficient);
}


//     //
//     //the bendy bond can be imagined as two rods and three points:
//     //        ^
//     //   0----0
//     //   |
//     //   |
//     // < 0
//     // bending the bond applies a torque about the pivot.
//     // We need to get the two force vectors, which always points 90 deg from each leg radially.
//     //  - the magnitude is pretty easy to get
//     // first we'll cross product the two legs to get the torque pivot vector.
//     // then we'll cross one leg with this new torque vector and normalize to get the force vector.
//        the torque vector for the other leg is opposite.
//     // then the force on the third particle is just the elementwise sum of the two vectors,
//     // but of opposite signs.

//     // then you put one leg out, one leg in, and you shake it all about



void bendy_bonds::compute_leg_force_magnitude(particles &particle_obj, double &leg_1_force, double &leg_2_force, int bond_id){
    //determine the amount to scale the leg force direction vectors by
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];
    int p3_id = p3[bond_id];

    std::vector<double> leg_vector_1 = particle_obj.distance_vector(p2_id, p1_id);
    std::vector<double> leg_vector_2 = particle_obj.distance_vector(p2_id, p3_id);

    double angle = particle_obj.angle(p1_id,p2_id,p3_id); // DRY. take distance_vector out of .angle()
    //coefficient has units piconewton-nanometers of torque per radian
    double displacement = angle-neutral_angles[bond_id];
    double leg_torque = 1.0*displacement * coefficients[bond_id];

    leg_1_force = leg_torque / norm(leg_vector_1); //force = torque/radius
    leg_2_force = leg_torque / norm(leg_vector_2);

    //the force magnitude can never be negative - that's handled by the direction vectors
    leg_1_force = fabs(leg_1_force);
    leg_2_force = fabs(leg_2_force);
}

void bendy_bonds::compute_leg_force_direction_vectors(particles &particle_obj, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id){
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];
    int p3_id = p3[bond_id];

    std::vector<double> leg_vector_1 = particle_obj.distance_vector(p2_id, p1_id);
    std::vector<double> leg_vector_2 = particle_obj.distance_vector(p2_id, p3_id);

    std::vector<double> torque_vector = cross_product(leg_vector_1, leg_vector_2);

    force_vector_1 = cross_product(torque_vector, leg_vector_1);
    force_vector_2 = cross_product(opposite_vector(torque_vector), leg_vector_2);

    force_vector_1 = normalize(force_vector_1); // now we abandon all magnitude information from these vectors.
    force_vector_2 = normalize(force_vector_2); // why? it's inelegant!
}

void bendy_bonds::compute_pivot_force_vector(particles &particle_obj, std::vector<double> &leg_1_force,
                                                                                std::vector<double> &leg_2_force,
                                                                                std::vector<double> &pivot_force, int bond_id){
    //unlike the leg force direction vectors, this isn't normalized.
    // inputs should be the actual scaled force vectors, output is the same.
    std::vector<double> force_sum = sum_vector(leg_1_force,leg_2_force);

    pivot_force = opposite_vector(force_sum);

}



std::vector<double> cross_product(std::vector<double> vector_1, std::vector<double> vector_2){
    //a x b

    std::vector<double> output(3);
    output[0] = vector_1[1] * vector_2[2] - vector_1[2] * vector_2[1];
    output[1] = vector_1[2] * vector_2[0] - vector_1[0] * vector_2[2];
    output[2] = vector_1[0] * vector_2[1] - vector_1[1] * vector_2[0];
    return output;
}

std::vector<double> sum_vector(std::vector<double> vector_1, std::vector<double> vector_2){
    std::vector<double> output(3);
    output[X] = vector_1[X] + vector_2[X];
    output[Y] = vector_1[Y] + vector_2[Y];
    output[Z] = vector_1[Z] + vector_2[Z];
    return output;
}

std::vector<double> scale_vector(std::vector<double> vector_1, double scalar){
    std::vector<double> output(3);
    output[X] = vector_1[X] * scalar;
    output[Y] = vector_1[Y] * scalar;
    output[Z] = vector_1[Z] * scalar;
    return output;
}


std::vector<double> opposite_vector(std::vector<double> vector_1){
    //a x b

    std::vector<double> output(3);
    output[X] = -1.0*vector_1[X];
    output[Y] = -1.0*vector_1[Y];
    output[Z] = -1.0*vector_1[Z];
    return output;
}


void compute_coulomb_force(particles &particle_obj, int particle_1, int particle_2, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2){
    const double electric_constant = 230.7077; //piconewtons per nm^2 / unitless integer electron charge
    double singularity_epsilon = std::numeric_limits<double>::epsilon();

    double p1_x = particle_obj.positions[particle_obj.idx(particle_1,0)];
    double p1_y = particle_obj.positions[particle_obj.idx(particle_1,1)];
    double p1_z = particle_obj.positions[particle_obj.idx(particle_1,2)];

    double p2_x = particle_obj.positions[particle_obj.idx(particle_2,0)];
    double p2_y = particle_obj.positions[particle_obj.idx(particle_2,1)];
    double p2_z = particle_obj.positions[particle_obj.idx(particle_2,2)];

    double distance_x = p1_x - p2_x;
    double distance_y = p1_y - p2_y;
    double distance_z = p1_z - p2_z;

    double distance = norm(distance_x,distance_y,distance_z);

    double charge_1 = particle_obj.charges[particle_1];
    double charge_2 = particle_obj.charges[particle_2];

    double force = electric_constant*(charge_1*charge_2)/((distance*distance)+singularity_epsilon);

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction

}

void compute_electric_force(particles &particle_obj, int particle_1, std::vector<double> &electric_field_vector, std::vector<double> &force_vector_1){
    const double field_constant = 1.602e-7; //piconewtons per (volt per meter) per e-

    double charge_1 = particle_obj.charges[particle_1];
    force_vector_1 = scale_vector(electric_field_vector,charge_1*field_constant);
}

void handle_interparticle_forces(particles &particles_obj, std::vector<double> &electric_field_vector, double cutoff_distance){

    std::vector<double> force_vector_1;
    std::vector<double> force_vector_2;
    for(int i = 0; i < particles_obj.size(); i++){
        for(int j = 0; j < particles_obj.size(); j++){ // I remember seeing a better looping strategy somewhere.
            if(i == j) continue;                        //ah, yes, "Basics of molecular dynamics"
            if(norm(particles_obj.distance_vector(i,j)) > cutoff_distance) continue;

            compute_coulomb_force(particles_obj, i, j, force_vector_1, force_vector_2);
            particles_obj.apply_force(i, force_vector_1);
            particles_obj.apply_force(j, force_vector_2);
        }
    }
}




//
//
// void particles::integrate_particle_trajectory(){
//     //currently using velocity verlet
//     //if not tagged motionless
//     void update(double dt){
//         Vec3d new_pos = pos + vel*dt + acc*(dt*dt*0.5);
//         Vec3d new_acc = apply_forces(); // only needed if acceleration is not constant
//         Vec3d new_vel = vel + (acc+new_acc)*(dt*0.5);
//         pos = new_pos;
//         vel = new_vel;
//         acc = new_acc;
//     }
// }
//



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
