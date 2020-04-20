#include <james.hpp>

int main(){


    double timestep = 0.01;
    int steps = 10;
    int record_interval = 1;

    double cutoff_distance = 1e-3;

    std::vector<double> electric_field_vector = {0, 0, 0};

    Particles particles;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    //std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/james/1coo.pdb";

    particles.import_PDB(input_file, 1, 100, 0, 0);

    stretchy_obj.bond_neighbors(particles, cutoff_distance, 0, 1);
    bendy_obj.bond_neighbors(particles, cutoff_distance, 0, 1);

    

    for(int step = 0; step < steps; step++){
        particles.begin_timestep(timestep);
        //
        stretchy_obj.compute_all_bonds(particles);
        bendy_obj.compute_all_bonds(particles);
        //
        handle_interparticle_forces(particles, electric_field_vector, cutoff_distance);
        compute_all_electric_forces(particles, electric_field_vector);

        particles.integrate_particle_trajectory(timestep);
        if(!(step % record_interval)){
            particles.dump_to_xyz_file("output",step);
        }
        std::cout << "Step " << step << " finished." << "\n";
    }


}
