#include <james.hpp>

//export OMP_NUM_THREADS=1
//make -j15 && ./src/james
//gprof ./src/james gmon.out
//sudo perf stat ./src/james
//valgrind --tool=massif ./src/james
//valgrind ms_print

int main(){
    feenableexcept(FE_INVALID | FE_OVERFLOW);


    primary_type timestep = 0.00001;
    int steps = 500000;
    int record_interval = 1000;

    primary_type cutoff_distance = 1;

    std::vector<primary_type> electric_field_vector = {0, 0, 100};

    Particles particles;
    bendy_bonds bendy_obj;
    stretchy_bonds stretchy_obj;

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    // std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/james/1coo.pdb";

    particles.import_PDB(input_file, 20, 0.0813664, 0, 0, 10);
    //
    // for(int i = 0; i < 100; i++){
    // std::vector<primary_type> position_1 = {0,0,0};
    // particles.add_particle(position_1,1,1);
    // std::vector<primary_type> position_2 = {0,0,1};
    // particles.add_particle(position_2,1,1);
    // }

    // coefficient: piconewtons / nanometer
    // forces are perhaps on the order of 10 piconewtons;
    // deflections are perhaps 10 nanometers.
    // the coefficient should be on the order 1.
    stretchy_obj.bond_neighbors(particles, 4, 0, 100);


    // coefficient: piconewton-meters / radian
    // forces are perhaps on the order of 10 piconewton;
    // deflections are perhaps 0.5 rad
    //distances, perhaps 0.2 nm
    // the coefficient should be on the order 1.
    bendy_obj.bond_neighbors(particles, 4, 0, 100);

    particles.positions[particles.idx(0,Z)] *= 1.1;

    // particles.velocities[particles.idx(0,Z)] += 5;

    std::vector<double> x_position(steps);
    std::vector<double> x_force(steps);

    primary_type frequency = 10e9;
    for(int step = 0; step < steps; step++){
        auto start = std::chrono::high_resolution_clock::now();

        electric_field_vector[Z] = 100000.0*sin(step*timestep*((frequency)/1e9)*2.0*M_PI);

        particles.begin_timestep(timestep);
        //
        stretchy_obj.compute_all_bonds(particles);
        bendy_obj.compute_all_bonds(particles);
        //

        handle_interparticle_forces(particles, electric_field_vector, cutoff_distance);
        compute_all_electric_forces(particles, electric_field_vector);

        particles.apply_damping(0, 0.01);

        particles.integrate_particle_trajectory(timestep);

        auto end = std::chrono::high_resolution_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>( end-start ).count();

        if(!(step % record_interval)){
            particles.dump_to_xyz_file("output",step);
            std::cout << "Step " << step << " finished in " << duration << " us, " << "\n";
        }




        x_position[step] = particles.positions[particles.idx(0,Z)];


        x_force[step] = particles.forces[particles.idx(0,Z)];

        // std::cout << particles.forces[particles.idx(0,Z)] << "\n";
        // std::cout << particles.forces[particles.idx(1,Z)] << "\n";

    }

    fedisableexcept(FE_ALL_EXCEPT);

    mglGraph gr;
    mglData x_pos_mgl;
    mglData x_force_mgl;

    x_pos_mgl.Link(x_position.data(),x_position.size());
    x_force_mgl.Link(x_force.data(),x_force.size());

    gr.SubPlot(1,2,0);
    gr.Box();
    gr.SetRange('y',*min_element(x_position.begin(), x_position.end()),*max_element(x_position.begin(), x_position.end()));
    gr.Plot(x_pos_mgl,"Y");
    gr.Axis();

    gr.SubPlot(1,2,1);
    gr.Box();
    gr.SetRange('y',*min_element(x_force.begin(), x_force.end()),*max_element(x_force.begin(), x_force.end()));
    gr.Plot(x_force_mgl,"R");
    gr.Axis();

    gr.WriteFrame("test.png");

}
