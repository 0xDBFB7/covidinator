
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

// #define ADS1115_REG_CONFIG_DR_8SPS    (0x0000)  // 8 SPS(Sample per Second), or a sample every 125ms
// #define ADS1115_REG_CONFIG_DR_16SPS    (0x0020)  // 16 SPS, or every 62.5ms
// #define ADS1115_REG_CONFIG_DR_32SPS    (0x0040)  // 32 SPS, or every 31.3ms
// #define ADS1115_REG_CONFIG_DR_64SPS    (0x0060)  // 64 SPS, or every 15.6ms
// #define ADS1115_REG_CONFIG_DR_128SPS   (0x0080)  // 128 SPS, or every 7.8ms  (default)
// #define ADS1115_REG_CONFIG_DR_250SPS   (0x00A0)  // 250 SPS, or every 4ms, note that noise free resolution is reduced to ~14.75-16bits, see table 2 in datasheet
// #define ADS1115_REG_CONFIG_DR_475SPS   (0x00C0)  // 475 SPS, or every 2.1ms, note that noise free resolution is reduced to ~14.3-15.5bits, see table 2 in datasheet
// #define ADS1115_REG_CONFIG_DR_860SPS   (0x00E0)  // 860 SPS, or every 1.16ms, note that noise free resolution is reduced to ~13.8-15bits, see table 2 in datasheet


#define num_scales 6
const int scale_settings[] = {0x0000, 0x0200, 0x0400, 0x0600, 0x0800, 0x0A00};
const float scale_voltages[] = {6.144, 4.096, 2.048, 1.024, 0.512, 0.256};

int near_scale = 5;
int far_scale = 5;

void init_ADCs(){

    near_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);
    near_adc.setSampleRate(ADS1115_REG_CONFIG_DR_475SPS);

    near_adc.setGain(scale_settings[near_scale]);
    far_adc.setGain(scale_settings[far_scale]);

    far_adc.setMux(ADS1115_REG_CONFIG_MUX_SINGLE_0);
    far_adc.setSampleRate(ADS1115_REG_CONFIG_DR_475SPS);

    if (!near_adc.testConnection()) {
      debug_serial.println("Near ADC Failed");
    }
    if (!far_adc.testConnection()) {
      debug_serial.println("Far ADC Failed");
    }

}

// void set_ADC_scales(int near_scale_, int far_scale_){
//     near_scale = near_scale_;
//     far_scale = far_scale_;
//     near_adc.setGain(scale_settings[near_scale]);
//     far_adc.setGain(scale_settings[far_scale]);
// }

void get_power_levels(){
    //worst-case, on highest PGA scale,
    float far_single_diode_voltage = 0;
    float near_single_diode_voltage = 0;

    int deadlock = 0;
    while(true){
        near_adc.triggerConversion();
        uint16_t near_single_diode_value = near_adc.getConversion();
        if(near_single_diode_value > 32768){
            break;
        }
        near_single_diode_voltage = ((float)((near_single_diode_value)/(float)32768))*scale_voltages[near_scale];

        if(near_single_diode_value >= 32760){
            if(near_scale > 0){
                near_scale -= 1;
                near_adc.setGain(scale_settings[near_scale]);
                continue;
            }
            else{
                break;
            }
        }
        else if(near_scale < 5 && near_single_diode_voltage < 0.8*scale_voltages[near_scale+1]){
            near_scale += 1;
            near_adc.setGain(scale_settings[near_scale]);
            continue;
        }
        else{
            break;
        }

        if(deadlock > 7) break;
        deadlock ++;
    }

    deadlock = 0;
    while(true){
        far_adc.triggerConversion();
        uint16_t far_single_diode_value = far_adc.getConversion();
        if(far_single_diode_value > 32768){
            break;
        }
        far_single_diode_voltage = ((float)((far_single_diode_value)/(float)32768))*scale_voltages[far_scale];

        if(far_single_diode_value >= 32760){
            if(far_scale > 0){
                far_scale -= 1;
                far_adc.setGain(scale_settings[far_scale]);

                continue;

            }
            else{
                break;
            }
        }
        else if(far_scale < 5 && far_single_diode_voltage < 0.8*scale_voltages[far_scale+1]){
            far_scale += 1;
            far_adc.setGain(scale_settings[far_scale]);

            continue;
        }
        else{
            break;
        }

        if(deadlock > 7) break;
        deadlock ++;

    }


    debug_serial.print(near_single_diode_voltage, 7);
    debug_serial.print(",");
    debug_serial.print(far_single_diode_voltage, 7);
    debug_serial.print(",");
    debug_serial.print(near_scale, 7);
    debug_serial.print(",");
    debug_serial.print(far_scale, 7);

}

//
// void loop(void) {
//

// }
