#include "thermal.hpp"

MLX90621 thermal_sensor;

float temperatures[64];

void init_thermal(){
    thermal_sensor.initialise(4);

}

void get_max_temp(){
    thermal_sensor.get_temperatures(temperatures);

    float max = 0;
    for(int i=0;i<64;i++){
        if(temperatures[i] > max){
            max = temperatures[i];
        }
    }
//
