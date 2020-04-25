#include <sim.hpp>
#include <helpers.hpp>


int main(){ try {

    double timestep = 0.005; //picoseconds
    double end_time = 1000; //also picoseconds
    int dump_interval = 5; //iterations

    double electric_field_frequency = 10e9;

    Sim sim(timestep);

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    std::vector<OpenMM::Vec3> particles = import_PDB(input_file);
    particles = decimate(5,particles);
    std::cout << particles.size() << "\n\n";
    sim.add_particles(particles, 85000, 1, 0, 0.33, 1);
    stretchy_bond_neighbors(sim, 0, 5, 1e-2);
    bendy_bond_neighbors(sim, 0, 5, 1e-2);


    sim.initialize_context();

    std::vector<double> x_position;
    std::vector<double> x_force;



    // Simulate.
    int iteration=0;
    for (iteration=0; ;iteration++) {
        OpenMM::State state = sim.context->getState(OpenMM::State::Positions | OpenMM::State::Forces);

        const double current_time = state.getTime();

        if(iteration % dump_interval == 0){
            dump_to_xyz_file("output", iteration, state);
            std::cout << "t= "<<current_time << " / " << end_time << " file: output" << iteration << "\n";
        }

        const std::vector<OpenMM::Vec3>& positions = state.getPositions();
        x_position.push_back(positions[0][X]);
        const std::vector<OpenMM::Vec3>& forces = state.getForces();
        x_force.push_back(forces[0][X]);


        sim.set_electric_field(100000.0*sin(iteration*timestep*((electric_field_frequency)/1e12)*2.0*M_PI),0,0);

        if (current_time >= end_time) break;

        // Advance state many steps at a time, for efficient use of OpenMM.
        sim.integrator->step(100); // (use a lot more than this normally)
    }

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

    gr.WriteFrame("output.png");



    std::cout << "\033[1;33m\n Simulation complete. \033[0m\n\n";

    return 0; // success!
    }
    // Catch and report usage and runtime errors detected by OpenMM and fail.
    catch(const std::exception& e) {
        printf("EXCEPTION: %s\n", e.what());
        return 1; // failure!
    }
}
