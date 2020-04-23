
#include <james.hpp>

//need damping?

//based on https://people.sc.fsu.edu/~jburkardt/cpp_src/md_openmp/md_openmp.cpp
//pdb reader from https://graphics.stanford.edu/~drussel/pdb/



void Particles::add_particle(std::vector<primary_type> position, primary_type charge, primary_type mass, int tag, bool is_frozen){
    positions.insert(positions.end(), position.begin(), position.end());
    velocities.resize(velocities.size()+3,0);
    charges.push_back(charge); //slow, whatever
    masses.push_back(mass);
    tags.push_back(tag);
    frozen.push_back(is_frozen);
    accelerations.resize(accelerations.size()+3,0.0);
    forces.resize(forces.size()+3,0.0);
}

void Particles::add_particle(std::vector<primary_type> position, primary_type charge, primary_type mass){
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


primary_type Particles::angle(int particle_1, int particle_2, int particle_3){
    //returns angle in radians, dot products
    std::vector<primary_type> vector_1 = distance_vector(particle_1, particle_2);
    std::vector<primary_type> vector_2 = distance_vector(particle_2, particle_3);

    primary_type dot = std::inner_product(std::begin(vector_1),std::end(vector_1),std::begin(vector_2), 0.0); //dot product

    primary_type mag = norm(vector_1) * norm(vector_2);

    if(mag == 0.0){
        std::cout << "Particles::angle singularity\n";
        return 0;
    }

    return acos(dot/mag);
}

std::vector<primary_type> Particles::distance_vector(int particle_1, int particle_2){
    std::vector<primary_type> output = {0,0,0};
    for(int dim = 0; dim < 3; dim++){
        output[dim] = positions[idx(particle_1,dim)] - positions[idx(particle_2,dim)];
    }
    return output;
}

primary_type Particles::distance_scalar(int particle_1, int particle_2){
    primary_type x = positions[idx(particle_1,X)] - positions[idx(particle_2,X)];
    primary_type y = positions[idx(particle_1,Y)] - positions[idx(particle_2,Y)];
    primary_type z = positions[idx(particle_1,Z)] - positions[idx(particle_2,Z)];
    return norm(x,y,z);
}


// void Particles::distance_vector(int particle_1, int particle_2){


void Particles::apply_force(int particle_id, std::vector<primary_type> &force_vector){
    forces[idx(particle_id,X)] += force_vector[X];
    forces[idx(particle_id,Y)] += force_vector[Y];
    forces[idx(particle_id,Z)] += force_vector[Z];
}

int Particles::idx(int id, int dim){
    return (id*3)+dim;
}

primary_type norm(primary_type x, primary_type y, primary_type z){
    return sqrt((x*x) + (y*y) + (z*z));
}

primary_type norm(std::vector<primary_type> vector_1){
    return sqrt((vector_1[0]*vector_1[0])+(vector_1[1]*vector_1[1])+(vector_1[2]*vector_1[2]));
}

std::vector<primary_type> normalize(std::vector<primary_type> input){
    primary_type mag = norm(input);
    std::vector<primary_type> output = {0,0,0};
    for(int dim = 0; dim < 3; dim++){
        output[dim] = input[dim] / mag;
    }
    return output;
}

void stretchy_bonds::add_bond(Particles &particles, int particle_1, int particle_2, primary_type coefficient){
    neutral_lengths.push_back(norm((particles.distance_vector(particle_1,particle_2))));
    p1.push_back(particle_1);
    p2.push_back(particle_2);
    coefficients.push_back(coefficient);
}

void stretchy_bonds::compute_bond_force(Particles &particles, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2, int bond_id){
    int p1_id = p1[bond_id];
    int p2_id = p2[bond_id];

    primary_type p1_x = particles.positions[particles.idx(p1_id,0)];
    primary_type p1_y = particles.positions[particles.idx(p1_id,1)];
    primary_type p1_z = particles.positions[particles.idx(p1_id,2)];

    primary_type p2_x = particles.positions[particles.idx(p2_id,0)];
    primary_type p2_y = particles.positions[particles.idx(p2_id,1)];
    primary_type p2_z = particles.positions[particles.idx(p2_id,2)];

    primary_type distance_x = p1_x - p2_x;
    primary_type distance_y = p1_y - p2_y;
    primary_type distance_z = p1_z - p2_z;

    primary_type distance = norm(distance_x,distance_y,distance_z);
    primary_type displacement = distance-neutral_lengths[bond_id];

    primary_type force = -1.0*coefficients[bond_id]*displacement;

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction
}

std::vector<int> find_neighbors(Particles &particles, int p1_id, int tag, int num_neighbors){
    std::vector<int> neighbor_ids(num_neighbors);
    std::vector<primary_type> neighbor_distances(num_neighbors);
    std::fill(neighbor_distances.begin(), neighbor_distances.end(), std::numeric_limits<primary_type>::max());

    int found_particles = 0;
    for(int p2_id = 0; p2_id < particles.size(); p2_id++){
        if(p2_id == p1_id) continue;
        if(particles.tags[p2_id] != tag) continue;

        primary_type distance = particles.distance_scalar(p2_id,p1_id);
        for(int neighbor_id = 0; neighbor_id < num_neighbors; neighbor_id++){
            if(distance < neighbor_distances[neighbor_id]){

                for(int i = num_neighbors-2; i >= neighbor_id; i--){
                    neighbor_ids[i+1] = neighbor_ids[i];
                    neighbor_distances[i+1] = neighbor_distances[i];
                }

                neighbor_distances[neighbor_id] = distance;
                neighbor_ids[neighbor_id] = p2_id;
                found_particles += 1;
                break;
            }
        }
    }
    assert(found_particles >= num_neighbors);

    return neighbor_ids;
}

void stretchy_bonds::bond_neighbors(Particles &particles, int num_neighbors, int tag, primary_type coefficient){
    for(int p1_id = 0; p1_id < particles.size(); p1_id++){
        if(particles.tags[p1_id] != tag) continue;

        std::vector<int> neighbor_ids = find_neighbors(particles, p1_id, tag, num_neighbors);
        for(int neighbor_id = 0; neighbor_id < num_neighbors; neighbor_id++){
            add_bond(particles, p1_id, neighbor_ids[neighbor_id], coefficient);
        }
    }
}

void stretchy_bonds::compute_all_bonds(Particles &particles){

    #pragma omp parallel
    {
        std::vector<primary_type> force_vector_1 = {0,0,0};
        std::vector<primary_type> force_vector_2 = {0,0,0};
        #pragma omp for
        for(int bond_id = 0; bond_id < (int)p1.size(); bond_id++){

            compute_bond_force(particles, force_vector_1, force_vector_2, bond_id);

            particles.apply_force(p1[bond_id], force_vector_1);
            particles.apply_force(p2[bond_id], force_vector_2);
        }
    }
}

void bendy_bonds::add_bond(Particles &particles, int particle_1, int pivot_particle, int particle_3, primary_type coefficient){
    neutral_angles.push_back(particles.angle(particle_1,pivot_particle,particle_3));
    p1.push_back(particle_1);
    pivots.push_back(pivot_particle);
    p3.push_back(particle_3);
    coefficients.push_back(coefficient);
}


void bendy_bonds::bond_neighbors(Particles &particles, int num_neighbors, int tag, primary_type coefficient){
    for(int pivot = 0; pivot < particles.size(); pivot++){
        if(particles.tags[pivot] != tag) continue;

        std::vector<int> neighbor_ids = find_neighbors(particles, pivot, tag, num_neighbors);

        for(int p1_id = 0; p1_id < (int)neighbor_ids.size(); p1_id++){
            for(int p2_id = 0; p2_id < (int)neighbor_ids.size(); p2_id++){
                if(p1_id == p2_id) continue;

                add_bond(particles, neighbor_ids[p1_id], pivot, neighbor_ids[p2_id], coefficient); //might be wrong
            }
        }
    }
}


void bendy_bonds::compute_all_bonds(Particles &particles){

    #pragma omp parallel
    {
        primary_type force_magnitude_1;
        primary_type force_magnitude_2;
        std::vector<primary_type> leg_force_vector_1;
        std::vector<primary_type> leg_force_vector_2;
        std::vector<primary_type> pivot_force_vector;

        #pragma omp for
        for(int bond_id = 0; bond_id < (int)p1.size(); bond_id++){

            compute_leg_force_magnitude(particles, force_magnitude_1, force_magnitude_2, bond_id);


            compute_leg_force_direction_vectors(particles, leg_force_vector_1, leg_force_vector_2, bond_id);

            leg_force_vector_1 = scale_vector(leg_force_vector_1, force_magnitude_1);
            leg_force_vector_2 = scale_vector(leg_force_vector_2, force_magnitude_2);

            compute_pivot_force_vector(particles, leg_force_vector_1, leg_force_vector_2, pivot_force_vector, bond_id);

            particles.apply_force(p1[bond_id], leg_force_vector_1);
            particles.apply_force(p3[bond_id], leg_force_vector_2);
            particles.apply_force(pivots[bond_id], pivot_force_vector);

        }
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



void bendy_bonds::compute_leg_force_magnitude(Particles &particles, primary_type &leg_1_force, primary_type &leg_2_force, int bond_id){
    //determine the amount to scale the leg force direction vectors by
    int p1_id = p1[bond_id];
    int pivot_id = pivots[bond_id];
    int p3_id = p3[bond_id];

    std::vector<primary_type> leg_vector_1 = particles.distance_vector(pivot_id, p1_id);
    std::vector<primary_type> leg_vector_2 = particles.distance_vector(pivot_id, p3_id);

    primary_type angle = particles.angle(p1_id,pivot_id,p3_id); // DRY. take distance_vector out of .angle()
    //coefficient has units piconewton-nanometers of torque per radian
    primary_type displacement = angle-neutral_angles[bond_id];
    primary_type leg_torque = 1.0*displacement * coefficients[bond_id];

    leg_1_force = leg_torque / norm(leg_vector_1); //force = torque/radius
    leg_2_force = leg_torque / norm(leg_vector_2);

    //the force magnitude can never be negative - that's handled by the direction vectors
    leg_1_force = fabs(leg_1_force);
    leg_2_force = fabs(leg_2_force);
}

void bendy_bonds::compute_leg_force_direction_vectors(Particles &particles, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2, int bond_id){
    int p1_id = p1[bond_id];
    int pivot_id = pivots[bond_id];
    int p3_id = p3[bond_id];

    std::vector<primary_type> leg_vector_1 = particles.distance_vector(pivot_id, p1_id);
    std::vector<primary_type> leg_vector_2 = particles.distance_vector(pivot_id, p3_id);

    std::vector<primary_type> torque_vector = cross_product(leg_vector_1, leg_vector_2);

    force_vector_1 = cross_product(torque_vector, leg_vector_1);
    force_vector_2 = cross_product(opposite_vector(torque_vector), leg_vector_2);

    force_vector_1 = normalize(force_vector_1); // now we abandon all magnitude information from these vectors.
    force_vector_2 = normalize(force_vector_2); // why? it's inelegant!
}

void bendy_bonds::compute_pivot_force_vector(Particles &particles, std::vector<primary_type> &leg_1_force,
                                                                                std::vector<primary_type> &leg_2_force,
                                                                                std::vector<primary_type> &pivot_force, int bond_id){
    //unlike the leg force direction vectors, this isn't normalized.
    // inputs should be the actual scaled force vectors, output is the same.
    std::vector<primary_type> force_sum = sum_vector(leg_1_force,leg_2_force);

    pivot_force = opposite_vector(force_sum);

}



std::vector<primary_type> cross_product(std::vector<primary_type> vector_1, std::vector<primary_type> vector_2){
    //a x b

    std::vector<primary_type> output = {0,0,0};
    output[0] = vector_1[1] * vector_2[2] - vector_1[2] * vector_2[1];
    output[1] = vector_1[2] * vector_2[0] - vector_1[0] * vector_2[2];
    output[2] = vector_1[0] * vector_2[1] - vector_1[1] * vector_2[0];
    return output;
}

std::vector<primary_type> sum_vector(std::vector<primary_type> vector_1, std::vector<primary_type> vector_2){
    std::vector<primary_type> output = {0,0,0};
    output[X] = vector_1[X] + vector_2[X];
    output[Y] = vector_1[Y] + vector_2[Y];
    output[Z] = vector_1[Z] + vector_2[Z];
    return output;
}

std::vector<primary_type> scale_vector(std::vector<primary_type> vector_1, primary_type scalar){
    std::vector<primary_type> output = {0,0,0};
    output[X] = vector_1[X] * scalar;
    output[Y] = vector_1[Y] * scalar;
    output[Z] = vector_1[Z] * scalar;
    return output;
}


std::vector<primary_type> opposite_vector(std::vector<primary_type> vector_1){
    //a x b

    std::vector<primary_type> output  = {0,0,0};
    output[X] = -1.0*vector_1[X];
    output[Y] = -1.0*vector_1[Y];
    output[Z] = -1.0*vector_1[Z];
    return output;
}


void compute_coulomb_force(Particles &particles, int particle_1, int particle_2, std::vector<primary_type> &force_vector_1, std::vector<primary_type> &force_vector_2){
    const primary_type coulomb_constant = 230.7077; //piconewtons per nm^2 / unitless integer electron charge
    primary_type singularity_epsilon = std::numeric_limits<primary_type>::epsilon();

    primary_type p1_x = particles.positions[particles.idx(particle_1,0)];
    primary_type p1_y = particles.positions[particles.idx(particle_1,1)];
    primary_type p1_z = particles.positions[particles.idx(particle_1,2)];

    primary_type p2_x = particles.positions[particles.idx(particle_2,0)];
    primary_type p2_y = particles.positions[particles.idx(particle_2,1)];
    primary_type p2_z = particles.positions[particles.idx(particle_2,2)];

    primary_type distance_x = p1_x - p2_x;
    primary_type distance_y = p1_y - p2_y;
    primary_type distance_z = p1_z - p2_z;

    primary_type distance = norm(distance_x,distance_y,distance_z);

    primary_type charge_1 = particles.charges[particle_1];
    primary_type charge_2 = particles.charges[particle_2];

    primary_type force = coulomb_constant*(charge_1*charge_2)/((distance*distance)+singularity_epsilon);

    force_vector_1[X] = force*(distance_x/distance); //vector projection
    force_vector_1[Y] = force*(distance_y/distance);
    force_vector_1[Z] = force*(distance_z/distance);

    force_vector_2 = opposite_vector(force_vector_1); // equal and opposite reaction

}


void compute_electric_force(Particles &particles, int particle_1, std::vector<primary_type> &electric_field_vector, std::vector<primary_type> &force_vector_1){
    const primary_type field_constant = 1.602e-7; //piconewtons per (volt per meter) per e-

    primary_type charge_1 = particles.charges[particle_1];
    force_vector_1 = scale_vector(electric_field_vector,charge_1*field_constant);
}

void compute_all_electric_forces(Particles &particles, std::vector<primary_type> &electric_field_vector){

    #pragma omp parallel
    {
        std::vector<primary_type> force_vector_1 = {0,0,0};
        #pragma omp for
        for(int i = 0; i < particles.size(); i++){
            compute_electric_force(particles, i, electric_field_vector, force_vector_1);
            particles.apply_force(i, force_vector_1);
        }
    }
}


void handle_interparticle_forces(Particles &particles, std::vector<primary_type> &electric_field_vector, primary_type cutoff_distance){


    #pragma omp parallel
    {
        std::vector<primary_type> force_vector_1 = {0,0,0};
        std::vector<primary_type> force_vector_2 = {0,0,0};

        #pragma omp for
        for(int i = 0; i < particles.size(); i++){
            for(int j = 0; j < particles.size(); j++){ // I remember seeing a better looping strategy somewhere.
                if(i == j) continue;                        //ah, yes, "Basics of molecular dynamics"
                if(particles.distance_scalar(i,j) > cutoff_distance) continue;

                compute_coulomb_force(particles, i, j, force_vector_1, force_vector_2);
                particles.apply_force(i, force_vector_1);
                particles.apply_force(j, force_vector_2);


            }
        }
    }

}

void Particles::begin_timestep(primary_type timestep){
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


void Particles::integrate_particle_trajectory(primary_type timestep){
    //currently using velocity verlet
    //if not tagged motionless
    //stolen direct from https://en.wikipedia.org/wiki/Verlet_integration

    //compute forces

    #pragma omp parallel
    {
        std::vector <primary_type> new_accelerations = {0,0,0};

        #pragma omp for
        for(int particle = 0; particle < size(); particle++){
            for(int dim = 0; dim < 3; dim++){
                new_accelerations[dim] = forces[idx(particle,dim)] / masses[particle];
                velocities[idx(particle,dim)] += (accelerations[idx(particle,dim)]+new_accelerations[dim])*(timestep*0.5);
                velocities[idx(particle,dim)] *= !frozen[particle];
                accelerations[idx(particle,dim)] = new_accelerations[dim];
            }
        }
    }

    positions.swap(new_positions);
}

void Particles::apply_damping(primary_type tag, primary_type constant){
    for(int particle = 0; particle < size(); particle++){
        for(int dim = 0; dim < 3; dim++){
            forces[idx(particle,dim)] -= constant*velocities[idx(particle,dim)];
        }
    }
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

int count_particles_in_PDB(std::string filename, int divisor){
    std::fstream fs;
    fs.open(filename, std::fstream::in);

    PDB record;

    std::vector<primary_type> position = {0,0,0};
    int particle = 0;
    int num_particles = 0;

    while (fs >> record) {
        if((record.type() == PDB::ATOM || record.type() == PDB::HETATM) && particle % divisor == 0) {
            num_particles++;
        }
        particle++;
    }
    fs.close();
    return num_particles;
}


void Particles::import_PDB(std::string filename, primary_type charge, primary_type mass, int tag, int is_frozen, int divisor){
    //charge and mass refer to the total charge and mass on this shell.

    int num_particles = count_particles_in_PDB(filename, divisor);

    std::fstream fs;
    fs.open(filename, std::fstream::in);

    PDB record;

    std::vector<primary_type> position = {0,0,0};
    int particle = 0;
    while (fs >> record) {
        if((record.type() == PDB::ATOM || record.type() == PDB::HETATM) && particle % divisor == 0) {
            position[X] = record.atom.xyz[X] / 10.0; //PDB units are assumed to be angstroms
            position[Y] = record.atom.xyz[Y] / 10.0;
            position[Z] = record.atom.xyz[Z] / 10.0;
            add_particle(position, charge/num_particles, mass/num_particles, tag, is_frozen);
        }
        particle++;
    }
    std::cout << "Imported " << size() << " particles." << "\n";
}

//Steps:
//import Particles.


//for (auto i: particles.positions) std::cout << i << ',';

// // void make_sphere(std::vector<primary_type> points, primary_type total_charge, primary_type radius, int N){
// //     surface_area = 4.0 * M_PI * (radius*radius);
// //
// // }
//
//
