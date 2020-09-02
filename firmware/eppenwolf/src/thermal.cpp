#include "thermal.hpp"

MLX90621 thermal_sensor;

float temperatures[64];

void init_thermal(){
    select_all_dacs(); //address conflict
    delay(1);
    thermal_sensor.initialise(4);
    unselect_dacs();
    delay(1);
}

float get_max_temp(){
    select_all_dacs(); //address conflict
    delay(5);
    thermal_sensor.get_temperatures(temperatures);
    // thermal_sensor.print_temperatures(debug_serial);
    float max = -100.0;
    for(int i=0;i<64;i++){
        // debug_serial.print(i);
        // debug_serial.print(",");
        // debug_serial.println(temperatures[i]);
        if(temperatures[i] > max){
            max = temperatures[i];
        }
    }
    unselect_dacs();
    delay(5);
    return max;
}
//
