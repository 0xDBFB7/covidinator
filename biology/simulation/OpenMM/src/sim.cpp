
#include "sim.hpp"
#include <helpers.hpp>

Sim::Sim(double timestep){
    OpenMM::Platform::loadPluginsFromDirectory(OPENMM_PLUGIN_DIRECTORY);

    integrator = new OpenMM::LangevinIntegrator(0,2,timestep);

    electric_force = init_electric_force();
    system.addForce(electric_force);

    LJ_coulomb_force = new OpenMM::NonbondedForce();
    system.addForce(LJ_coulomb_force);
    // setCutoffDistance

    stretchy_force = new OpenMM::HarmonicBondForce();
    system.addForce(stretchy_force);

    bendy_force = new OpenMM::HarmonicAngleForce();
    system.addForce(bendy_force);
}

void Sim::initialize_context(){
    OpenMM::Platform& platform = OpenMM::Platform::getPlatformByName("CUDA");
    std::map<std::string, std::string> properties;
    properties["DeviceIndex"] = "0";
    context = new OpenMM::Context(system, *integrator, platform, properties);

    context->setPositions(initial_positions);
}


void Sim::add_particle(OpenMM::Vec3 position, double mass, double charge, int tag, double LJ_sigma, double LJ_well_depth){
    //position is in nanometers,
    //charge is in fractions of e-
    //mass is in amu.

    initial_positions.push_back(position); // location, nm

    system.addParticle(mass); // mass of Ar, grams per mole
    //zero mass freezes particle. That's useful. setPositions with a modified copy of state would be useful for the FEM tip.

    std::vector<double> electric_charge = {charge};
    electric_force->addParticle(num_particles, electric_charge);

    //charge, L-J sigma (nm)  0.3350, well depth (kJ) 0.996
    LJ_coulomb_force->addParticle(charge, LJ_sigma, LJ_well_depth);

    tags.push_back(tag);

    num_particles++;
}

void Sim::add_particles(std::vector<OpenMM::Vec3> positions, double total_mass, double total_charge, int tag, double LJ_sigma, double LJ_well_depth){
    //position is in nanometers,
    //charge is in fractions of e-
    //mass is in amu.
    int N = positions.size();
    for(int i = 0; i< (int) N; i++){
        add_particle(positions[i], total_mass/N, total_charge/N, tag, LJ_sigma, LJ_well_depth);
    }
}


void Sim::set_electric_field(double Ex, double Ey, double Ez){
    context->setParameter("Ex",Ex);
    context->setParameter("Ey",Ey);
    context->setParameter("Ez",Ez);
}
