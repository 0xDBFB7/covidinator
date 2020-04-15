#include <james.hpp>

TEST(data_structure, data_structure_test_1){

    particles particles_obj;

    std::vector<double> position_1 = {0,0,0};
    particles_obj.add_particle(position_1,1.1,1.2);
}


TEST(data_structure, subtract_position){
    particles particles_obj;

    std::vector<double> position_1 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    ASSERT_NEAR(particles_obj.distance_vector(0,1)[0],0,1e-3);
    ASSERT_NEAR(particles_obj.distance_vector(0,1)[1],0,1e-3);
    ASSERT_NEAR(particles_obj.distance_vector(0,1)[2],0,1e-3);
}



TEST(data_structure, angle_1){
    particles particles_obj;

    std::vector<double> position_1 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles_obj.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,1,0};
    particles_obj.add_particle(position_3,1.1,1.2);

    ASSERT_NEAR(particles_obj.angle(0,1,2),1.570,1e-3);
}

TEST(data_structure, stretchy_bonds_1){
    particles particles_obj;
    stretchy_bonds stretchy_obj;

    std::vector<double> position_1 = {0,0,0};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,1};
    particles_obj.add_particle(position_2,1.1,1.2);

    stretchy_obj.add_bond(particles_obj,0,1,0.5);

    particles_obj.positions[particles_obj.idx(1,2)] = 0.5; //move particle 1 0.5- in z
    //particle 0 should feel a restoring force in the -Z direction
    //particle 1 should feel a restoring force in the +Z direction

    stretchy_obj.compute_bond_force(particles_obj, 0);

    ASSERT_NEAR(particles_obj.forces[particles_obj.idx(0,Z)],-0.25,1e-3);
    ASSERT_NEAR(particles_obj.forces[particles_obj.idx(1,Z)],0.25,1e-3);

}


TEST(data_structure, bendy_bonds_force_directions_1){
    particles particles_obj;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles_obj.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles_obj.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles_obj,0,1,2,0.5); //this factor has units of N-m/radian, recall.

    //          |            ^
    //     //   |    ^       Z+
    //     //   0 - -0       X+  >
    //     //   |
    //     //   |
    //     // < 0
    // a line of particles in Z. Now we bend the top one down to +X

    particles_obj.positions[particles_obj.idx(0,X)] = 1;
    particles_obj.positions[particles_obj.idx(0,Z)] = 0;

    //particle 0 should feel a restoring force in the +Z direction
    //particle 2 should feel a restoring force in the -X direction

    std::vector<double> force_direction_vector_1;
    std::vector<double> force_direction_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles_obj, force_direction_vector_1, force_direction_vector_2, 0);

    //force on the first particle
    ASSERT_NEAR(force_direction_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Z],1,1e-3);

    ASSERT_NEAR(force_direction_vector_2[X],-1,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Z],0,1e-3);


}

TEST(data_structure, bendy_bonds_force_directions_2){
    particles particles_obj;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles_obj.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles_obj.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles_obj,0,1,2,0.5); //this factor has units of N-m/radian, recall.

    //          |            ^
    //     //   |    ^       Z+
    //     //   0 - -0       X-  >
    //     //   |
    //     //   |
    //     // < 0
    // a line of particles in Z. Now we bend the top one down to -X

    particles_obj.positions[particles_obj.idx(0,X)] = -1;
    particles_obj.positions[particles_obj.idx(0,Z)] = 0;

    //particle 0 should feel a restoring force in the Z direction
    //particle 2 should feel a restoring force in the +X direction

    std::vector<double> force_direction_vector_1;
    std::vector<double> force_direction_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles_obj, force_direction_vector_1, force_direction_vector_2, 0);

    //force on the first particle
    ASSERT_NEAR(force_direction_vector_1[X],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_1[Z],1,1e-3);

    ASSERT_NEAR(force_direction_vector_2[X],1,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Y],0,1e-3);
    ASSERT_NEAR(force_direction_vector_2[Z],0,1e-3);
}

TEST(data_structure, bendy_bonds_force_magnitude_1){
    particles particles_obj;
    bendy_bonds bendy_obj;

    std::vector<double> position_1 = {0,0,1};
    particles_obj.add_particle(position_1,1.1,1.2);

    std::vector<double> position_2 = {0,0,0};
    particles_obj.add_particle(position_2,1.1,1.2);

    std::vector<double> position_3 = {0,0,-1};
    particles_obj.add_particle(position_3,1.1,1.2);

    bendy_obj.add_bond(particles_obj,0,1,2,0.5); //this factor has units of N-m/radian, recall.
    // a line of particles in Z. Now we bend the top one down to +X
    particles_obj.positions[particles_obj.idx(0,X)] = 1;
    particles_obj.positions[particles_obj.idx(0,Z)] = 0;
    //this applies an angular displacement of 1.57 rad, *K =
    // 0.785 N-m, / leg length of 1,
    // force = 0.785

    double force_magnitude_1;
    double force_magnitude_2;
    bendy_obj.compute_leg_force_magnitude(particles_obj, force_magnitude_1, force_magnitude_2, 0);

    ASSERT_NEAR(force_magnitude_1,0.78,1e-2);
    ASSERT_NEAR(force_magnitude_2,0.78,1e-2);

    std::vector<double> leg_force_vector_1;
    std::vector<double> leg_force_vector_2;
    bendy_obj.compute_leg_force_direction_vectors(particles_obj, leg_force_vector_1, leg_force_vector_2, 0);

    scale_vector(leg_force_vector_1, force_magnitude_1);
    scale_vector(leg_force_vector_2, force_magnitude_2);

    std::vector<double> pivot_force_vector;
    bendy_obj.compute_pivot_force_vector();

    
}



//
// TEST(data_structure, cross_product){
//     std::vector<double> position_1 = {1,0,0};
//     std::vector<double> position_2 = {0,1,0};
//
//     ASSERT_NEAR(cross_product,1,1e-3);
// }
