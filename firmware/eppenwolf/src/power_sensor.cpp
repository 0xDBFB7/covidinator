
#include <ADS1115_lite.h>
#include "host_comms.hpp"

ADS1115_lite near_adc(ADS1115_ADDRESS_ADDR_GND);
ADS1115_lite far_adc(ADS1115_ADDRESS_ADDR_VDD);

// #define ADS1115_REG_CONFIG_PGA_6_144V   (0x0000)  // +/-6.144V range = Gain 2/3
// #define ADS1115_REG_CONFIG_PGA_4_096V   (0x0200)  // +/-4.096V range = Gain 1
// #define ADS1115_REG_CONFIG_PGA_2_048V   (0x0400)  // +/-2.048V range = Gain 2 (default)
// #define ADS1115_REG_CONFIG_PGA_1_024V   (0x0600)  // +/-1.024V range = Gain 4
// #define ADS1115_REG_CONFIG_PGA_0_512V   (0x0800)  // +/-0.512V range = Gain 8
// #define ADS1115_REG_CONFIG_PGA_0_256V   (0x0A00)  // +/-0.256V range = Gain 16

#define PGA ADS1115_REG_CONFIG_PGA_4_096V
#define PGA_scale 4.096

const int scale_settings[] = {0x0000, 0x0200, 0x0400, 0x0600, 0x0800, 0x0A00};
const float scale_voltages[] = {6.144, 4.096, 2.048, 1.024, 0.512, 0.256};

int near_scale = 0;
int far_scale = 0;

void init_ADCs(){

    near_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_1);
    near_adc.setGain(PGA);
    near_adc.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);


    far_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);
    far_adc.setGain(PGA);
    far_adc.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);

    if (!near_adc.testConnection()) {
      debug_serial.println("Near ADC Failed");
    }
    if (!far_adc.testConnection()) {
      debug_serial.println("Far ADC Failed");
    }

}

void get_power_levels(){
    //worst-case, on highest PGA scale,
    
    near_adc.triggerConversion();
    uint16_t near_single_diode_value = near_adc.getConversion();

    far_adc.triggerConversion();
    uint16_t far_single_diode_value = far_adc.getConversion();

    debug_serial.print(((float)((near_single_diode_value)/(float)32768))*scale_voltages[near_scale], 7);
    debug_serial.print(",");
    debug_serial.println(((float)(far_single_diode_value)/(float)32768)*scale_voltages[far_scale], 7);


}

//
// void loop(void) {
//

// }
