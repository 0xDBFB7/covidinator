
#include <ADS1115_lite.h>
#include "host_comms.hpp"

ADS1115_lite adc_0(ADS1115_ADDRESS_ADDR_GND);
ADS1115_lite adc_1(ADS1115_ADDRESS_ADDR_VDD);

void init_ADCs(){

    adc_0.setGain(ADS1115_REG_CONFIG_PGA_2_048V);
    adc_0.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);
    adc_0.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);

    adc_1.setGain(ADS1115_REG_CONFIG_PGA_2_048V);
    adc_1.setSampleRate(ADS1115_REG_CONFIG_DR_128SPS);
    adc_1.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);





    if (!adc_0.testConnection()) {
      debug_serial.println("Near ADC Failed"); //oh man...something is wrong
      return;
    }
    if (!adc_1.testConnection()) {
      debug_serial.println("Far ADC Failed"); //oh man...something is wrong
      return;
    }
}

void get_power_levels(){

    adc_0.triggerConversion();
    uint16_t near_single_diode_value = adc_0.getConversion();
    debug_serial.println(((float)((near_single_diode_value-32768)/32768))*2.048);

    adc_1.triggerConversion();
    uint16_t far_single_diode_value = adc_1.getConversion();
    debug_serial.println(((float)(far_single_diode_value-32768)/32768)*2.048);


}

//
// void loop(void) {
//

// }
