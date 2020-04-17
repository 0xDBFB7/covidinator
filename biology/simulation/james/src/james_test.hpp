#include <james.hpp>

TEST(data_structure, data_structure_test_1){

    Particles particles;

    std::vector<double> position_1 = {0,0,0};
    particles.add_particle(position_1,1.1,1.2);
}


TEST(data_structure, subtract_position){
    Particles particles;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    ASSERT_NEAR(particles.distance_vector(0,1)[0],0,1e-3);
    ASSERT_NEAR(particles.distance_vector(0,1)[1],0,1e-3);
    ASSERT_NEAR(particles.distance_vector(0,1)[2],0,1e-3);
}



TEST(data_structure, angle_1){
    Particles particles;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,1,0};
    particles.add_particle(position_3,1.1,1.2);

    ASSERT_NEAR(particles.angle(0,1,2),1.570,1e-3);
}

TEST(data_structure, stretchy_bonds_1){
    Particles particles;
    stretchy_bonds stretchy_obj;

    std::vector<double> position_1 = {0,0,0};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,1};
    particles.add_particle(position_2,1.1,1.2);

    stretchy_obj.add_bond(particles,0,1,0.5);

    particles.positions[particles.idx(1,2)] = 0.5; //move particle 1 0.5- in z
    //particle 0 should feel a restoring force in the -Z direction
    //particle 1 should feel a restoring force in the +Z direction

    std::vector<double> force_vector_1(3);
    std::vector<double> force_vector_2(3);
    stretchy_obj.compute_bond_force(particles, force_vector_1, force_vector_2, 0);


    ASSERT_NEAR(force_vector_1[Z],-0.25,1e-3);
    ASSERT_NEAR(force_vector_2[Z],0.25,1e-3);

    particles.apply_force(0, force_vector_1);
    particles.apply_force(1, force_vector_2);

    ASSERT_NEAR(particles.forces[particles.idx(0,Z)],-0.25,1e-3);
    ASSERT_NEAR(particles.forces[particles.idx(1,Z)],0.25,1e-3);

}


TEST(data_structure, bendy_bonds_force_directions_1){
    Particles particles;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles,0,1,2,0.5); //this factor has units of N-m/radian, recall.

    //          |            ^
    //     //   |    ^       Z+
    //     //   0 - -0       X+  >
    //     //   |
    //     //   |
    //     // < 0
    // a line of Particles in Z. Now we bend the top one down to +X

    particles.positions[particles.idx(0,X)] = 1;
    particles.positions[particles.idx(0,Z)] = 0;

    //particle 0 should feel a restoring force in the +Z direction
    //particle 2 should feel a restoring force in the -X direction

    std::vector<double> force_direction_vector_1;
    std::vector<double> force_direction_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles, force_direction_vector_1, force_direction_vector_2, 0);

    //force on the first particle
    ASSERT_NEAR(force_direction_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Z],1,1e-3);

    ASSERT_NEAR(force_direction_vector_2[X],-1,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Z],0,1e-3);


}

TEST(data_structure, bendy_bonds_force_directions_2){
    Particles particles;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles,0,1,2,0.5); //this factor has units of N-m/radian, recall.

    //          |            ^
    //     //   |    ^       Z+
    //     //   0 - -0       X-  >
    //     //   |
    //     //   |
    //     // < 0
    // a line of Particles in Z. Now we bend the top one down to -X

    particles.positions[particles.idx(0,X)] = -1;
    particles.positions[particles.idx(0,Z)] = 0;

    //particle 0 should feel a restoring force in the Z direction
    //particle 2 should feel a restoring force in the +X direction

    std::vector<double> force_direction_vector_1;
    std::vector<double> force_direction_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles, force_direction_vector_1, force_direction_vector_2, 0);

    //force on the first particle
    ASSERT_NEAR(force_direction_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Z],1,1e-3);

    ASSERT_NEAR(force_direction_vector_2[X],1,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Z],0,1e-3);
}

TEST(data_structure, bendy_bonds_force_magnitude_1){
    Particles particles;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles,0,1,2,0.5); //this factor has units of N-m/radian, recall.

    //          |            ^
    //     //   |    ^       Z+
    //     //   0 - -0       X+  >
    //     //   |
    //     //   |
    //     // < 0
    // a line of Particles in Z. Now we bend the top one down to +X
    particles.positions[particles.idx(0,X)] = 1;
    particles.positions[particles.idx(0,Z)] = 0;
    //this applies an angular displacement of 1.57 rad, *K =
    // 0.785 N-m, / leg length of 1,
    // force = 0.785

    double force_magnitude_1;
    double force_magnitude_2;
    bendy_obj.compute_leg_force_magnitude(particles, force_magnitude_1, force_magnitude_2, 0);

    ASSERT_NEAR(force_magnitude_1,0.78,1e-2);
    ASSERT_NEAR(force_magnitude_2,0.78,1e-2);

    std::vector<double> leg_force_vector_1;
    std::vector<double> leg_force_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles, leg_force_vector_1, leg_force_vector_2, 0);

    leg_force_vector_1 = scale_vector(leg_force_vector_1, force_magnitude_1);
    leg_force_vector_2 = scale_vector(leg_force_vector_2, force_magnitude_2);

    std::vector<double> pivot_force_vector;
    bendy_obj.compute_pivot_force_vector(particles, leg_force_vector_1, leg_force_vector_2, pivot_force_vector, 0);

    ASSERT_NEAR(pivot_force_vector[X],0.785,1e-3);
    ASSERT_NEAR(pivot_force_vector[Y],0,1e-3);
    ASSERT_NEAR(pivot_force_vector[Z],-0.785,1e-3);
}

TEST(coulomb_force, coulomb_force_1){ //TODO: re-confirm field constants
    Particles particles;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,2,2);

    std::vector<double> position_2 = {0,0,0};
    particles.add_particle(position_2,2,2);

    std::vector<double> force_vector_1(3);
    std::vector<double> force_vector_2(3);
    compute_coulomb_force(particles, 0,1, force_vector_1, force_vector_2);

    //coulomb constant * ((2 electron charges)^2)  / (1 nanometer^2) = 922 piconewtons
    ASSERT_NEAR(force_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_vector_1[Z],922.83,1e-2);

    ASSERT_NEAR(force_vector_2[X],0,1e-3);
    ASSERT_NEAR(force_vector_2[Y],0,1e-3);
    ASSERT_NEAR(force_vector_2[Z],-922.83,1e-2);
}


TEST(coulomb_force, electric_force){ //TODO: re-confirm field constants
    Particles particles;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles.add_particle(position_1,2,2);

    std::vector<double> electric_field_vector = {0,0,1e6};
    std::vector<double> force_vector_1(3);
    compute_electric_force(particles, 0, electric_field_vector, force_vector_1);

    ASSERT_NEAR(force_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_vector_1[Z],0.1602*2,1e-3);

}





TEST(move_Particles, move_Particles_1){
    Particles particles;

    std::vector<double> position_1 = {0,0,0};
    particles.add_particle(position_1,1,2);

    //acceleration = 5

    for(int t = 0; t < 100; t++){
        particles.begin_timestep(1);
        particles.forces[particles.idx(0,Z)] = 10;

        particles.integrate_particle_trajectory(1);
    }

    ASSERT_NEAR(particles.positions[particles.idx(0,Z)],0.5*5*(100*100),1000);
    //predicted 25000, got 24750. Decent.
    //delta x = 0.5 at^2


}

TEST(pdb_import, import_1){
    std::fstream fs;
    fs.open("/home/arthurdent/Projects/covidinator/biology/simulation/GROMACS/T4/input_data/emd_6323.pdb", std::fstream::in);

    PDB record;
    while (fs >> record) {
        switch (record.type()) {
            case PDB::HETATM: //variable depending on source of PDB file
                // std::cout << record.atom.xyz[X] << ' ' << record.atom.xyz[Y]
                //  << ' ' << record.atom.xyz[Z] << std::endl;
            break;
        }
    }
}

TEST(write_file, dump_to_xyz_file_1){
    Particles particles;

    std::vector<double> position_1 = {0,0,0};
    particles.add_particle(position_1,1,2);

    for(int t = 0; t < 100; t++){
        particles.begin_timestep(1);
        particles.forces[particles.idx(0,Z)] = 10;
        particles.integrate_particle_trajectory(1);
        particles.dump_to_xyz_file("output",t);
    }
}
