#include <james.hpp>

int main(){


    double timestep = 100;
    int steps = 100;
    int record_interval = 1;

    double cutoff_distance = 1;

    std::vector<double> electric_field_vector = {0, 0, 100};

    Particles particles;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    // std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/james/1coo.pdb";

    particles.import_PDB(input_file, 1, 1, 0, 0, 50);


    // coefficient: piconewtons / nanometer
    // forces are perhaps on the order of 1 piconewton;
    // deflections are perhaps 10 nanometers.
    // the coefficient should be on the order of 0.1.
    stretchy_obj.bond_neighbors(particles, cutoff_distance, 0, 0.1);


    // coefficient: piconewtons / radian
    // forces are perhaps on the order of 1 piconewton;
    // deflections are perhaps 0.5 rad
    // the coefficient should be on the order of 0.1.
    // bendy_obj.bond_neighbors(particles, cutoff_distance, 0, 0.0000001);



    for(int step = 0; step < steps; step++){

        electric_field_vector[Z] = 100.0*sin(steps*timestep*2.0*M_PI);

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
