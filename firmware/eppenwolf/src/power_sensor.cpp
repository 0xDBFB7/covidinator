
#include <ADS1115_lite.h>
#include "host_comms.hpp"

ADS1115_lite near_adc(ADS1115_ADDRESS_ADDR_GND);
ADS1115_lite far_adc(ADS1115_ADDRESS_ADDR_VDD);

void init_ADCs(){

    near_adc.setGain(ADS1115_REG_CONFIG_PGA_2_048V);
    near_adc.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);
    near_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_1);

    far_adc.setGain(ADS1115_REG_CONFIG_PGA_2_048V);
    far_adc.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);
    far_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);

    if (!near_adc.testConnection()) {
      debug_serial.println("Near ADC Failed");
    }
    if (!far_adc.testConnection()) {
      debug_serial.println("Far ADC Failed");
    }

}

void get_power_levels(){

    near_adc.triggerConversion();
    uint16_t near_single_diode_value = near_adc.getConversion();
    debug_serial.println(((float)((near_single_diode_value)/(float)32768))*2.048, 7);

    far_adc.triggerConversion();
    uint16_t far_single_diode_value = far_adc.getConversion();
    debug_serial.println(((float)(far_single_diode_value)/(float)32768)*2.048, 7);


}

//
// void loop(void) {
//

// }
