
#include "helpers.hpp"

std::vector<OpenMM::Vec3> import_PDB(std::string filename){
    std::vector<OpenMM::Vec3> positions;

    std::fstream fs;
    fs.open(filename, std::fstream::in);

    PDB record;


    while (fs >> record) {
        if((record.type() == PDB::ATOM || record.type() == PDB::HETATM)) {
            OpenMM::Vec3 position(
                record.atom.xyz[X] / 10.0,
                record.atom.xyz[Y] / 10.0,
                record.atom.xyz[Z] / 10.0
            );
            positions.push_back(position);
        }
    }
    std::cout << "Imported " << positions.size() << " particles." << "\n";
    return positions;
}

void dump_to_xyz_file(std::string filename, int iteration, const OpenMM::State& state){
    //visualize with Chimera: under MD / Ensemble analysis, MD Movie, set XYZ.

    // std::vector<char> tag_atom_lookup = {'C','O'};

    std::fstream fs;
    filename += std::to_string(iteration);
    filename += ".xyz";
    fs.open(filename, std::fstream::out);

    const std::vector<OpenMM::Vec3>& positions = state.getPositions();

    fs << (int)positions.size() << "\n";
    // fs << time << "\n";
    fs << "\n"; // description on second line


    for (int a = 0; a < (int)positions.size(); a++){
        fs << "O" <<
            " " << positions[a][X]*10.0 << // nm -> angstrom conversion factor
            " " << positions[a][Y]*10.0 <<
            " " << positions[a][Z]*10.0 << "\n";
    }
    fs.close();
}


OpenMM::CustomExternalForce* init_electric_force(){
    //the force is specified by a potential energy function

    //Force unit in OpenMM is kJ/(mol-nm); 1 unit is 1.6605397 piconewtons.

    //1 V/m * (1 electron charge)  in piconewtons = 1.602e-7
    //1 V/m * (1 electron charge) in kJ/(mol-nm) = 9.649e-8

    //observed force with 1e, Ex=1: 9.63919e-08 kJ/(mol-nm) = 1.60063 piconewtons.

    OpenMM::CustomExternalForce* electric_force = new OpenMM::CustomExternalForce(
                                                "-Ex*electric_constant*charge*x+-Ey*electric_constant*charge*y+-Ez*electric_constant*charge*z");

    electric_force->addGlobalParameter("electric_constant", 9.649e-8);
    electric_force->addGlobalParameter("Ex", 0.0);
    electric_force->addGlobalParameter("Ey", 0.0);
    electric_force->addGlobalParameter("Ez", 0.0);
    electric_force->addPerParticleParameter("charge");

    return electric_force;
}

double norm(OpenMM::Vec3 input){
    return sqrt((input[X]*input[X]) + (input[Y]*input[Y]) + (input[Z]*input[Z]));
}

void stretchy_bond_neighbors(Sim &sim, int tag, int num_neighbors, double coefficient){
    std::vector<OpenMM::Vec3> positions = sim.initial_positions;

    for (int p1 = 0; p1 < (int)positions.size(); p1++){
        if(sim.tags[p1] != tag) continue;

        std::vector<int> neighbor_ids = find_neighbors(sim, p1, tag, num_neighbors);

        for (int p2 = 0; p2 < (int)neighbor_ids.size(); p2++){
            double distance = norm(positions[p1]-positions[neighbor_ids[p2]]);

            sim.stretchy_force->addBond(distance,p1,neighbor_ids[p2],coefficient);
        }
    }
}


double angle(OpenMM::Vec3 particle_1, OpenMM::Vec3 particle_2, OpenMM::Vec3 particle_3){
    //returns angle in radians, dot products
    OpenMM::Vec3 vector_1 = particle_1 - particle_2;
    OpenMM::Vec3 vector_2 = particle_2 - particle_3;

    double dot = vector_1.dot(vector_2);

    double mag = norm(vector_1) * norm(vector_2);

    if(mag == 0.0){
        std::cout << "Particles::angle singularity\n";
        return 0;
    }

    if(dot/mag < -1 || dot/mag > 1){
        std::cout << "Particles::angle out of range\n";
        return 0;
    }

    return acos(std::max(-1.0, std::min(dot/mag, 1.0)));
}



void bendy_bond_neighbors(Sim &sim, int tag, int num_neighbors, double coefficient){
    std::vector<OpenMM::Vec3> positions = sim.initial_positions;

    for(int pivot = 0; pivot < (int)positions.size(); pivot++){
        if(sim.tags[pivot] != tag) continue;

        std::vector<int> neighbor_ids = find_neighbors(sim, pivot, tag, num_neighbors);

        for(int p1_id = 0; p1_id < (int)neighbor_ids.size(); p1_id++){
            for(int p2_id = 0; p2_id < (int)neighbor_ids.size(); p2_id++){
                if(p1_id == p2_id) continue;

                double bond_angle = angle(positions[neighbor_ids[p1_id]], positions[pivot], positions[neighbor_ids[p2_id]]);

                sim.bendy_force->addAngle(neighbor_ids[p1_id], pivot, neighbor_ids[p2_id], bond_angle, coefficient); //might be wrong
            }
        }
    }
}


std::vector<int> find_neighbors(Sim &sim, int p1_id, int tag, int num_neighbors){
    //for the given position in positions, find the nearest neighbor_ids

    std::vector<int> neighbor_ids(num_neighbors);
    std::vector<double> neighbor_distances(num_neighbors);
    std::fill(neighbor_distances.begin(), neighbor_distances.end(), std::numeric_limits<double>::max());

    std::vector<OpenMM::Vec3> positions = sim.initial_positions;

    int found_particles = 0;
    for(int p2_id = 0; p2_id < (int)positions.size(); p2_id++){
        if(p2_id == p1_id) continue;
        if(sim.tags[p2_id] != tag) continue;

        double distance = norm(positions[p1_id]-positions[p2_id]);

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



// // Handy homebrew PDB writer for quick-and-dirty trajectory output.
// void writePdbFrame(int frameNum, const OpenMM::State& state)
// {
//     std::fstream fs;
//     filename += std::to_string(iteration);
//     filename += ".xyz";
//     // Reference atomic positions in the OpenMM State.
//     const std::vector<OpenMM::Vec3>& posInNm = state.getPositions();
//
//     // Use PDB MODEL cards to number trajectory frames
//     printf("MODEL     %d\n", frameNum); // start of frame
//     for (int a = 0; a < (int)posInNm.size(); ++a)
//     {
//         printf("ATOM  %5d  AR   AR     1    ", a+1); // atom number
//         printf("%8.3f%8.3f%8.3f  1.00  0.00\n",      // coordinates
//             // "*10" converts nanometers to Angstroms
//             posInNm[a][0]*10, posInNm[a][1]*10, posInNm[a][2]*10);
//     }
//     printf("ENDMDL\n"); // end of frame
// }
