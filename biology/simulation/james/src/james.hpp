#include <iostream>
#include <math.h>
#include <vector>


struct particles{
    //SoA is 5x faster than AoS
    std::vector<double> positions; //x,y,z - using this linear format so CUDA support can be added without undue struggle
    std::vector<double> velocities; //x,y,z
    std::vector<double> charges;
    std::vector<double> masses;


    void add_particle(std::vector<double> position, std::vector<double> velocity, double charge, double mass);
    void add_particle(std::vector<double> position, double charge, double mass);

};

struct stretchy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<double> neutral_lengths;
};

struct bendy_bonds{
    std::vector<int> p1;
    std::vector<int> p2;
    std::vector<int> p3;
    std::vector<double> neutral_angle;
};
