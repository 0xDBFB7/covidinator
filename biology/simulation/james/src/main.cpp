#include <james.hpp>

int main(){


    double timestep = 0.001;
    int steps = 1000;
    int record_interval = 1;

    ;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";


    pdb_import(input_file, 1000, 100, 0);


    for(int step = 0; step < steps; step++){
        particles_obj.begin_timestep(timestep);
        particles_obj.forces[particles_obj.idx(0,Z)] = 10;
        particles_obj.integrate_particle_trajectory(1);
        if(!(step % record_interval)){
            particles_obj.dump_to_xyz_file("output",t);
        }
    }


}
