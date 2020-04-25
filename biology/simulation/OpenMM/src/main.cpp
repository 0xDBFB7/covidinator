#include <sim.hpp>
#include <helpers.hpp>


int main(){ try {

    double timestep = 0.004; //picoseconds
    double end_time = 10; //also picoseconds

    Sim sim(timestep);

    std::string input_file = "/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb";

    std::vector<OpenMM::Vec3> particles = import_PDB(input_file);
    std::cout << particles.size() << "\n\n";
    sim.add_particles(particles, 85000, 1000, 0, 0.33, 1);
    // stretchy_bond_neighbors( 5, coefficient);


    sim.initialize_context();

    std::vector<double> x_position;
    std::vector<double> x_force;

    // Simulate.
    for (int iteration=0; ;iteration++) {
        OpenMM::State state = sim.context->getState(OpenMM::State::Positions | OpenMM::State::Forces);

        dump_to_xyz_file("output", iteration, state);

        const std::vector<OpenMM::Vec3>& positions = state.getPositions();
        x_position.push_back(positions[0][X]);
        const std::vector<OpenMM::Vec3>& forces = state.getForces();
        x_force.push_back(forces[0][X]);

        sim.set_electric_field(1,1,1);


        const double current_time = state.getTime();
        if (current_time >= end_time) break;

        // Advance state many steps at a time, for efficient use of OpenMM.
        sim.integrator->step(10); // (use a lot more than this normally)
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



    std::cout << "\033[1;33m\n Simulation complete! \033[0m\n\n";

    return 0; // success!
    }
    // Catch and report usage and runtime errors detected by OpenMM and fail.
    catch(const std::exception& e) {
        printf("EXCEPTION: %s\n", e.what());
        return 1; // failure!
    }
}
