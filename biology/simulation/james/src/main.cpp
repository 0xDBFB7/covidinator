#include <james.hpp>

int main(){


    double timestep = 0.002;
    int steps = 500;
    int record_interval = 10;

    double cutoff_distance = 1;

    std::vector<double> electric_field_vector = {0, 0, 100};

    Particles particles;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    // std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/james/1coo.pdb";

    // particles.import_PDB(input_file, 0.0, 0.0813664, 0, 0, 50);
    //
    // for(int i = 0; i < 100; i++){
    std::vector<double> position_1 = {0,0,0};
    particles.add_particle(position_1,1,1);
    // }

    // coefficient: piconewtons / nanometer
    // forces are perhaps on the order of 10 piconewtons;
    // deflections are perhaps 10 nanometers.
    // the coefficient should be on the order 1.
    stretchy_obj.bond_neighbors(particles, 1, 0, 1);


    // coefficient: piconewton-meters / radian
    // forces are perhaps on the order of 10 piconewton;
    // deflections are perhaps 0.5 rad
    //distances, perhaps 0.2 nm
    // the coefficient should be on the order 1.
    // bendy_obj.bond_neighbors(particles, 3, 0, 1);

    particles.positions[particles.idx(0,Z)] *= 3;

    particles.velocities[particles.idx(0,Z)] += 5;

    std::vector<double> x_position;

    for(int step = 0; step < steps; step++){

        // electric_field_vector[Z] = 100.0*sin(steps*timestep*2.0*M_PI);

        particles.begin_timestep(timestep);
        //
        stretchy_obj.compute_all_bonds(particles);
        bendy_obj.compute_all_bonds(particles);
        //
        handle_interparticle_forces(particles, electric_field_vector, cutoff_distance);
        compute_all_electric_forces(particles, electric_field_vector);

        // particles.apply_damping(0, 0.005);

        particles.integrate_particle_trajectory(timestep);
        if(!(step % record_interval)){
            particles.dump_to_xyz_file("output",step);
        }
        std::cout << "Step " << step << " finished." << "\n";

        mglGraph gr;
        gr.FPlot("sin(pi*x)"); //recall: array linking:
        for(int i=0;i<50;i++)   a[i] = sin(M_PI*i/49.);
        mglData y;
        y.Link(x_position.data(),50);
        gr.WriteFrame("test.png");
    }


}
