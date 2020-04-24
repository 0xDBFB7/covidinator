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


    // Load any shared libraries containing GPU implementations.
    OpenMM::Platform::loadPluginsFromDirectory("/home/arthurdent/Programs/openmm-7.4.1/openmm-7.4.1/install/lib/plugins");
    // Create a system with nonbonded forces.
    OpenMM::System system;
    OpenMM::VerletIntegrator integrator(0.004); // step size in ps


    OpenMM::NonbondedForce* lennard_jones_force = new OpenMM::NonbondedForce();
    system.addForce(lennard_jones_force);


    OpenMM::CustomExternalForce* force = new OpenMM::CustomExternalForce("k*((x-x0)^2+(y-y0)^2+(z-z0)^2)");
    force->addGlobalParameter("k", 100.0);
    force->addPerParticleParameter("x0");

    // Create three atoms.
    std::vector<OpenMM::Vec3> initial_position(3);
    for (int a = 0; a < 3; ++a)
    {
        initial_position[a] = OpenMM::Vec3(0.5*a,0,0); // location, nm

        system.addParticle(39.95); // mass of Ar, grams per mole

        // charge, L-J sigma (nm), well depth (kJ)
        lennard_jones_force->addParticle(0.0, 0.3350, 0.996); // vdWRad(Ar)=.188 nm
    }


    OpenMM::Platform& platform = OpenMM::Platform::getPlatformByName("CUDA");
    std::map<std::string, std::string> properties;
    properties["DeviceIndex"] = "0";
    OpenMM::Context context(system, integrator, platform, properties);

    context.setPositions(initial_position);

    // Simulate.
    for (int iteration=0; ;iteration++) {
        // Output current state information.
        OpenMM::State state    = context.getState(OpenMM::State::Positions);
        const double  timeInPs = state.getTime();
        dump_to_xyz_file("output", iteration, state);


        if (timeInPs >= 10.)
            break;

        // Advance state many steps at a time, for efficient use of OpenMM.
        integrator.step(10); // (use a lot more than this normally)
    }




    std::cout << "\033[1;33m\n Simulation complete! \033[0m\n\n";

    return 0; // success!
    }
    // Catch and report usage and runtime errors detected by OpenMM and fail.
    catch(const std::exception& e) {
        printf("EXCEPTION: %s\n", e.what());
        return 1; // failure!
    }
}
