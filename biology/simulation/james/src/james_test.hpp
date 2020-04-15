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
