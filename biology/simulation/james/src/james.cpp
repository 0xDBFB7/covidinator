
#include <james.hpp>

//need damping?

//based on https://people.sc.fsu.edu/~jburkardt/cpp_src/md_openmp/md_openmp.cpp
//pdb reader from https://graphics.stanford.edu/~drussel/pdb/



void Particles::add_particle(std::vector<double> position, double charge, double mass, int tag, bool is_frozen){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(tag);
    frozen.push_back(is_frozen);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}

void Particles::add_particle(std::vector<double> position, double charge, double mass){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(0);
    frozen.push_back(0);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}

int Particles::size(){
    return masses.size();
}

double Particles::angle(int particle_1, int particle_2, int particle_3){
    //returns angle in radians, dot products
    std::vector<double> vector_1 = distance_vector(particle_1, particle_2);
    std::vector<double> vector_2 = distance_vector(particle_2, particle_3);

    double dot = std::inner_product(std::begin(vector_1),std::end(vector_1),std::begin(vector_2), 0.0); //dot product

    double mag = norm(vector_1) * norm(vector_2);

    if(mag == 0.0){
        std::cout << "Particles::angle singularity\n";
        return 0;
    }

    return acos(dot/mag);
}

std::vector<double> Particles::distance_vector(int particle_1, int particle_2){
    std::vector<double> output(3);
    for(int dim = 0; dim < 3; dim++){
        output[dim] = positions[idx(particle_1,dim)] - positions[idx(particle_2,dim)];
    }
    return output;
}

//
// double Particles::determine_mean_neighbor_distance(){
//     //determine how far away the 3 nearest neighbors are, on average
//
//     const int N = 100; // sample a reasonable ensemble
//
//     double output;
//     for(int p1_id = 0; p1_id < particles.size(); p1_id+=(particles.size()/N)){
//
//     }
//     return output;
// }



void Particles::apply_force(int particle_id, std::vector<double> &force_vector){
    forces[idx(particle_id,X)] += force_vector[X];
    forces[idx(particle_id,Y)] += force_vector[Y];
    forces[idx(particle_id,Z)] += force_vector[Z];
}

int Particles::idx(int id, int dim){
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

void stretchy_bonds::add_bond(Particles &particles, int particle_1, int particle_2, double coefficient){
    neutral_lengths.push_back(norm(particles.distance_vector(particle_1,particle_2)));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    coefficients.push_back(coefficient);
}

void stretchy_bonds::compute_bond_force(Particles &particles, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id){
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];

    double p1_x = particles.positions[particles.idx(p1_id,0)];
    double p1_y = particles.positions[particles.idx(p1_id,1)];
    double p1_z = particles.positions[particles.idx(p1_id,2)];

    double p2_x = particles.positions[particles.idx(p2_id,0)];
    double p2_y = particles.positions[particles.idx(p2_id,1)];
    double p2_z = particles.positions[particles.idx(p2_id,2)];

    double distance_x = p1_x - p2_x;
    double distance_y = p1_y - p2_y;
    double distance_z = p1_z - p2_z;

    double distance = norm(distance_x,distance_y,distance_z);
    double displacement = distance-neutral_lengths[bond_id];

    double force = -1.0*coefficients[bond_id]*displacement;

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction
}


void stretchy_bonds::bond_neighbors(Particles &particles, double radius, int tag, double coefficient){
    for(int p1_id = 0; p1_id < particles.size(); p1_id++){
        if(particles.tags[p1_id] != tag) continue;

        for(int p2_id = 0; p2_id < particles.size(); p2_id++){

            if(p2_id == p1_id) continue;
            if(particles.tags[p2_id] != tag) continue;
            if(norm(particles.distance_vector(p2_id,p1_id)) > radius) continue;

            add_bond(particles, p1_id, p2_id, coefficient); //might be wrong
        }
    }
}

void stretchy_bonds::compute_all_bonds(Particles &particles){

    #pragma omp parallel for
    for(int bond_id = 0; bond_id < (int)p1.size(); bond_id++){

        std::vector<double> force_vector_1(3);
        std::vector<double> force_vector_2(3);
        compute_bond_force(particles, force_vector_1, force_vector_2, bond_id);

        particles.apply_force(p1[bond_id], force_vector_1);
        particles.apply_force(p2[bond_id], force_vector_2);
    }
}

void bendy_bonds::add_bond(Particles &particles, int particle_1, int pivot_particle, int particle_3, double coefficient){
    neutral_angles.push_back(particles.angle(particle_1,pivot_particle,particle_3));
    p1.push_back(particle_1);
    pivots.push_back(pivot_particle);
    p3.push_back(particle_3);
    coefficients.push_back(coefficient);
}


void bendy_bonds::bond_neighbors(Particles &particles, double radius, int tag, double coefficient){
    for(int pivot = 0; pivot < particles.size(); pivot++){
        if(particles.tags[pivot] != tag) continue;

        for(int p1_id = 0; p1_id < particles.size(); p1_id++){
            if(p1_id == pivot) continue;
            if(particles.tags[p1_id] != tag) continue;
            if(norm(particles.distance_vector(p1_id,pivot)) > radius) continue;

            for(int p2_id = 0; p2_id < particles.size(); p2_id++){
                if(p2_id == pivot || p1_id == p2_id) continue;
                if(particles.tags[p2_id] != tag) continue;
                if(norm(particles.distance_vector(p2_id,pivot)) > radius) continue;

                add_bond(particles, p1_id, pivot, p2_id, coefficient); //might be wrong
            }
        }
    }
}


void bendy_bonds::compute_all_bonds(Particles &particles){

    #pragma omp parallel for
    for(int bond_id = 0; bond_id < (int)p1.size(); bond_id++){
        double force_magnitude_1;
        double force_magnitude_2;
        compute_leg_force_magnitude(particles, force_magnitude_1, force_magnitude_2, bond_id);

        std::vector<double> leg_force_vector_1;
        std::vector<double> leg_force_vector_2;
        compute_leg_force_direction_vectors(particles, leg_force_vector_1, leg_force_vector_2, bond_id);

        leg_force_vector_1 = scale_vector(leg_force_vector_1, force_magnitude_1);
        leg_force_vector_2 = scale_vector(leg_force_vector_2, force_magnitude_2);

        std::vector<double> pivot_force_vector;
        compute_pivot_force_vector(particles, leg_force_vector_1, leg_force_vector_2, pivot_force_vector, bond_id);

        particles.apply_force(p1[bond_id], leg_force_vector_1);
        particles.apply_force(p3[bond_id], leg_force_vector_2);
        particles.apply_force(pivots[bond_id], pivot_force_vector);

    }
}

// //bond angles can also be represented by a Hooks-ian spring.
// //https://en.wikibooks.org/wiki/Molecular_Simulation/Intramolecular_Forces#Bond_Angle_Bending
//
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



void bendy_bonds::compute_leg_force_magnitude(Particles &particles, double &leg_1_force, double &leg_2_force, int bond_id){
    //determine the amount to scale the leg force direction vectors by
    int p1_id = p1[bond_id];
    int pivot_id = pivots[bond_id];
    int p3_id = p3[bond_id];

    std::vector<double> leg_vector_1 = particles.distance_vector(pivot_id, p1_id);
    std::vector<double> leg_vector_2 = particles.distance_vector(pivot_id, p3_id);

    double angle = particles.angle(p1_id,pivot_id,p3_id); // DRY. take distance_vector out of .angle()
    //coefficient has units piconewton-nanometers of torque per radian
    double displacement = angle-neutral_angles[bond_id];
    double leg_torque = 1.0*displacement * coefficients[bond_id];

    leg_1_force = leg_torque / norm(leg_vector_1); //force = torque/radius
    leg_2_force = leg_torque / norm(leg_vector_2);

    //the force magnitude can never be negative - that's handled by the direction vectors
    leg_1_force = fabs(leg_1_force);
    leg_2_force = fabs(leg_2_force);
}

void bendy_bonds::compute_leg_force_direction_vectors(Particles &particles, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2, int bond_id){
    int p1_id = p1[bond_id];
    int pivot_id = pivots[bond_id];
    int p3_id = p3[bond_id];

    std::vector<double> leg_vector_1 = particles.distance_vector(pivot_id, p1_id);
    std::vector<double> leg_vector_2 = particles.distance_vector(pivot_id, p3_id);

    std::vector<double> torque_vector = cross_product(leg_vector_1, leg_vector_2);

    force_vector_1 = cross_product(torque_vector, leg_vector_1);
    force_vector_2 = cross_product(opposite_vector(torque_vector), leg_vector_2);

    force_vector_1 = normalize(force_vector_1); // now we abandon all magnitude information from these vectors.
    force_vector_2 = normalize(force_vector_2); // why? it's inelegant!
}

void bendy_bonds::compute_pivot_force_vector(Particles &particles, std::vector<double> &leg_1_force,
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


void compute_coulomb_force(Particles &particles, int particle_1, int particle_2, std::vector<double> &force_vector_1, std::vector<double> &force_vector_2){
    const double coulomb_constant = 230.7077; //piconewtons per nm^2 / unitless integer electron charge
    double singularity_epsilon = std::numeric_limits<double>::epsilon();

    double p1_x = particles.positions[particles.idx(particle_1,0)];
    double p1_y = particles.positions[particles.idx(particle_1,1)];
    double p1_z = particles.positions[particles.idx(particle_1,2)];

    double p2_x = particles.positions[particles.idx(particle_2,0)];
    double p2_y = particles.positions[particles.idx(particle_2,1)];
    double p2_z = particles.positions[particles.idx(particle_2,2)];

    double distance_x = p1_x - p2_x;
    double distance_y = p1_y - p2_y;
    double distance_z = p1_z - p2_z;

    double distance = norm(distance_x,distance_y,distance_z);

    double charge_1 = particles.charges[particle_1];
    double charge_2 = particles.charges[particle_2];

    double force = coulomb_constant*(charge_1*charge_2)/((distance*distance)+singularity_epsilon);

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction

}

void compute_electric_force(Particles &particles, int particle_1, std::vector<double> &electric_field_vector, std::vector<double> &force_vector_1){
    const double field_constant = 1.602e-7; //piconewtons per (volt per meter) per e-

    double charge_1 = particles.charges[particle_1];
    force_vector_1 = scale_vector(electric_field_vector,charge_1*field_constant);
}

void compute_all_electric_forces(Particles &particles, std::vector<double> &electric_field_vector){

    #pragma omp parallel for
    for(int i = 0; i < particles.size(); i++){
        std::vector<double> force_vector_1(3);
        compute_electric_force(particles, i, electric_field_vector, force_vector_1);
        particles.apply_force(i, force_vector_1);
    }
}


void handle_interparticle_forces(Particles &particles, std::vector<double> &electric_field_vector, double cutoff_distance){

    std::vector<double> force_vector_1(3);
    std::vector<double> force_vector_2(3);
    #pragma omp parallel for collapse(2)
    for(int i = 0; i < particles.size(); i++){

        for(int j = 0; j < particles.size(); j++){ // I remember seeing a better looping strategy somewhere.
            if(i == j) continue;                        //ah, yes, "Basics of molecular dynamics"
            if(norm(particles.distance_vector(i,j)) > cutoff_distance) continue;

            compute_coulomb_force(particles, i, j, force_vector_1, force_vector_2);
            particles.apply_force(i, force_vector_1);
            particles.apply_force(j, force_vector_2);


        }
    }
}

void Particles::begin_timestep(double timestep){
    new_positions.resize(positions.size());

    #pragma omp parallel for
    for(int particle = 0; particle < size(); particle++){
        for(int dim = 0; dim < 3; dim++){
            new_positions[idx(particle,dim)] = positions[idx(particle,dim)]
                                                    + velocities[idx(particle,dim)]*timestep
                                                    + accelerations[idx(particle,dim)]*(timestep*timestep*0.5);
        }
    }

    std::fill(std::begin(forces),std::end(forces),0.0);
}


void Particles::integrate_particle_trajectory(double timestep){
    //currently using velocity verlet
    //if not tagged motionless
    //stolen direct from https://en.wikipedia.org/wiki/Verlet_integration

    //compute forces

    std::vector <double> new_accelerations(3);

    #pragma omp parallel for
    for(int particle = 0; particle < size(); particle++){
        for(int dim = 0; dim < 3; dim++){
            new_accelerations[dim] = forces[idx(particle,dim)] / masses[particle];
            velocities[idx(particle,dim)] += (accelerations[idx(particle,dim)]+new_accelerations[dim])*(timestep*0.5);
            velocities[idx(particle,dim)] *= !frozen[particle];
            accelerations[idx(particle,dim)] = new_accelerations[dim];
        }
    }
    positions.swap(new_positions);
}


void Particles::dump_to_xyz_file(std::string filename, int iteration){
    //visualize with Chimera: under MD / Ensemble analysis, MD Movie, set XYZ.
    std::vector<char> tag_atom_lookup = {'C','O'};

    std::fstream fs;
    filename += std::to_string(iteration);
    filename += ".xyz";
    fs.open(filename, std::fstream::out);

    fs << size() << "\n";
    // fs << time << "\n";
    fs << "\n"; // description on second line
    for(int particle = 0; particle < size(); particle++){
        fs << tag_atom_lookup[tags[particle] % tag_atom_lookup.size()] <<
                                                " " << positions[idx(particle,X)] <<
                                                " " << positions[idx(particle,Y)] <<
                                                " " << positions[idx(particle,Z)] << "\n";
    }
    fs.close();
}

void Particles::import_PDB(std::string filename, double charge, double mass, int tag, int is_frozen, int divisor){
    std::fstream fs;
    fs.open(filename, std::fstream::in);

    PDB record;
    std::vector<double> position(3);
    int particle = 0;
    while (fs >> record) {
        if((record.type() == PDB::ATOM || record.type() == PDB::HETATM) && particle % divisor == 0) {
            position[X] = record.atom.xyz[X];
            position[Y] = record.atom.xyz[Y];
            position[Z] = record.atom.xyz[Z];
            add_particle(position, charge, mass, tag, is_frozen);
        }
        particle++;
    }
    std::cout << "Imported " << size() << " particles." << "\n";
}

//Steps:
//import Particles.


//for (auto i: particles.positions) std::cout << i << ',';

// // void make_sphere(std::vector<double> points, double total_charge, double radius, int N){
// //     surface_area = 4.0 * M_PI * (radius*radius);
// //
// // }
//
//
