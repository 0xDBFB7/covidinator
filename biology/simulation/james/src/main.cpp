#include <james.hpp>

int main(){


    double timestep = 0.001;
    int steps = 1000;
    int record_interval = 1;

    Particles particles;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    particles.import_PDB(input_file, 1000, 100, 0, 0);


    for(int step = 0; step < steps; step++){
        particles.begin_timestep(timestep);

        stretchy_obj.compute_all_bonds(particles);
        bendy_obj.compute_all_bonds(particles);


        particles.integrate_particle_trajectory(timestep);
        if(!(step % record_interval)){
            particles.dump_to_xyz_file("output",step);
        }
    }


}
