// -----------------------------------------------------------------------------
//           OpenMM(tm) HelloArgon example in C++ (June 2009)
// -----------------------------------------------------------------------------
// This program demonstrates a simple molecular simulation using the OpenMM
// API for GPU-accelerated molecular dynamics simulation. The primary goal is
// to make sure you can compile, link, and run with OpenMM and view the output.
// The example is available in C++, C, and Fortran 95.
//
// The system modeled here is a small number of argon atoms in a vacuum.
// A multi-frame PDB file is written to stdout which  can be read by VMD or
// other visualization tool to produce an animation of the resulting trajectory.
// -----------------------------------------------------------------------------

#include "sim.hpp"




int main(){ try {

    double timestep = 0.004; //picoseconds
    double end_time = 10; //also picoseconds

    // Load any shared libraries containing GPU implementations.
    OpenMM::Platform::loadPluginsFromDirectory("/home/arthurdent/Programs/openmm-7.4.1/openmm-7.4.1/install/lib/plugins");
    // Create a system with nonbonded forces.
    OpenMM::System system;
    OpenMM::VerletIntegrator integrator(timestep);


    // OpenMM::NonbondedForce* lennard_jones_force = new OpenMM::NonbondedForce();
    // system.addForce(lennard_jones_force);


    //the force is specified by a potential energy function

    OpenMM::CustomExternalForce* electric_force = new OpenMM::CustomExternalForce("Ex*charge");
    electric_force->addGlobalParameter("Ex", 100.0);
    electric_force->addPerParticleParameter("charge");

    // Create three atoms.
    std::vector<OpenMM::Vec3> initial_position(1);
    for (int a = 0; a < 1; ++a)
    {
        initial_position[a] = OpenMM::Vec3(0.5*a,0,0); // location, nm

        system.addParticle(39.95); // mass of Ar, grams per mole

        electric_force.addParticle();

        // charge, L-J sigma (nm), well depth (kJ)
        // lennard_jones_force->addParticle(0.0, 0.3350, 0.996); // vdWRad(Ar)=.188 nm
    }


    OpenMM::Platform& platform = OpenMM::Platform::getPlatformByName("CUDA");
    std::map<std::string, std::string> properties;
    properties["DeviceIndex"] = "0";
    OpenMM::Context context(system, integrator, platform, properties);

    context.setPositions(initial_position);

    std::vector<double> x_position;
    std::vector<double> x_force;

    // Simulate.
    for (int iteration=0; ;iteration++) {
        // Output current state information.
        OpenMM::State state    = context.getState(OpenMM::State::Positions | OpenMM::State::Forces);

        dump_to_xyz_file("output", iteration, state);

        const std::vector<OpenMM::Vec3>& positions = state.getPositions();
        x_position.push_back(positions[0][X]);
        const std::vector<OpenMM::Vec3>& forces = state.getForces();
        x_force.push_back(forces[0][X]);


        const double current_time = state.getTime();
        if (current_time >= end_time) break;

        // Advance state many steps at a time, for efficient use of OpenMM.
        integrator.step(10); // (use a lot more than this normally)
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
