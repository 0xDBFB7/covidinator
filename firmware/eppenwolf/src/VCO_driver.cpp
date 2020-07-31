#include "VCO_driver.hpp"

#define BASE_BIAS_PWM_PIN 9 //PWM
#define VARACTOR_PWM_PIN 10 //PWM

#define SUPPLY_PIN 16

#define PULSE_PIN 17


// non-inverting config. = 1 + Rf/Rin
#define BASE_BIAS_GAIN 11
#define VARACTOR_GAIN 11
#define SUPPLY_GAIN 11

void init_VCO(){
    analogWriteResolution(ANALOG_WRITE_RESOLUTION);
    analogReadResolution(ANALOG_READ_RESOLUTION);
    analogWriteFrequency(VARACTOR_PWM_PIN, 11718.75);

    pinMode(BASE_BIAS_PWM_PIN, OUTPUT);
    pinMode(VARACTOR_PWM_PIN, OUTPUT);
    pinMode(PULSE_PIN, OUTPUT);

    analogWrite(BASE_BIAS_PWM_PIN, 0);
    analogWrite(VARACTOR_PWM_PIN, 0);
    analogWrite(SUPPLY_PIN, 0);
    
    //p-channel inverts!
    digitalWriteFast(PULSE_PIN, 1);
}


void pulse_VCO(int pulse_duration){
    noInterrupts(); //sei

    //p-channel inverts!
    digitalWriteFast(PULSE_PIN, 0);
    volatile int i = 0;
    for(i = 0; i < 10; i++){
        // asm volatile("nop");
    }
    digitalWriteFast(PULSE_PIN, 1);
    interrupts();
    //cli
}


void set_VCO(float base_bias_voltage, float varactor_voltage, float supply_voltage, bool power_state){
    //
    // base_bias_voltage = constrain(base_bias_voltage, 0, ANALOG_WRITE_MAX_VAL);
    // varactor_voltage = constrain(varactor_voltage, 0, ANALOG_WRITE_MAX_VAL);
    supply_voltage = constrain(supply_voltage, 1.5, 6);

    const float lm317_offset_voltage = 1.5;
    uint16_t base_bias_value = ((base_bias_voltage/BASE_BIAS_GAIN)/CORE_SUPPLY_VOLTAGE) * ANALOG_WRITE_MAX_VAL;
    uint16_t varactor_value = ((varactor_voltage/VARACTOR_GAIN)/CORE_SUPPLY_VOLTAGE) * ANALOG_WRITE_MAX_VAL;
    uint16_t supply_value = (((supply_voltage-lm317_offset_voltage)/SUPPLY_GAIN)/CORE_SUPPLY_VOLTAGE) * ANALOG_WRITE_MAX_VAL;



    analogWrite(BASE_BIAS_PWM_PIN, base_bias_value);
    analogWrite(VARACTOR_PWM_PIN, varactor_value);
    analogWrite(SUPPLY_PIN, supply_value);

    //p-channel inverts!
    digitalWriteFast(PULSE_PIN, !power_state);

    debug_serial.printf("\nVCO set to %f, %f, %f, %i\n", base_bias_voltage, varactor_voltage, supply_voltage, power_state);
}

// void get_current()

//
//
// void transistor_driver::print(String message){
// }
//
//
// transistor_driver::transistor_driver(){
//     //split up because the preamp is just a bare transistor
//
//     analogWriteResolution(ANALOG_WRITE_RESOLUTION);
//     pinMode(BASE_BIAS_PWM_PIN, OUTPUT);
//     analogWrite(BASE_BIAS_PWM_PIN, 0);
// }
//
//
//
// void transistor_driver::set_base_bias_voltage(float voltage){
//     //freqs: https://www.pjrc.com/teensy/td_pulse.html
//     //with 10 uF and 10k,
//     //(3.3 V / 10000 ohms )/10 uF * 1 / 14.6e3 Hz -> V = 0.0022 v
//     //of ripple - 0.226% at 1v. That should be sufficient.
//     //otherwise, we can probably increase that to 50 or 100k.
//     (*this).print("");
//
//     if(voltage > CORE_SUPPLY_VOLTAGE || voltage < 0){
//         //????
//         run_abort("improper voltage");
//         return;
//     }
//
//     float value = (voltage/CORE_SUPPLY_VOLTAGE);
//
//     analogWrite(BASE_BIAS_PWM_PIN, value);
//
//     (*this).print("Updated base bias.");
// }
//
//
// struct VCO_driver{
//     int VARACTOR_OUTPUT_PIN = 0;
//     int VARACTOR_FEEDBACK_PIN = 0;
//
//
//     String name = "";
//
//     VCO_driver();
//     void varactor_feedback_voltage();
//     void set_tuning_varactor_voltage(float voltage);
// };
//
// // VCO_driver::VCO_driver(){
// //     analogWriteResolution(ANALOG_WRITE_RESOLUTION);
// //     pinMode(VARACTOR_OUTPUT_PIN, OUTPUT);
// // }
//
// // void VCO_driver::set_base_bias_voltage(float voltage){
// //     // I/C = dV/dt
// //     // dt = 1/frequency
// //     // I = (Vsupply/R)
// //     // ripple = ((Vsupply/R)/C)*(1/freq)
// //     // ((20 V / 1000 ohms) / 10 uF) * (1 / 14 kHz) -> V
// //     // freq = Vsupply / (C*R*ripple_voltage)
// //
// //
// //
// //     float duty_cycle = voltage/CORE_SUPPLY_VOLTAGE;
// //
// //     int max_val = pow(2.0, ANALOG_WRITE_RESOLUTION);
// //
// //     analogWrite(VBASE_BIAS_PWM_PIN, int(max_val * duty_cycle));
// //
// //     print("Base bias voltage changed to " + str(voltage));
// // }
// //
// //
// // float VCO_driver::get_base_bias_voltage(){
// //     pinMode(VBASE_BIAS_PWM_PIN, INPUT);
// //
// //     pinMode(VBASE_BIAS_PWM_PIN, OUTPUT);
// //     return 0;
// // }
//
// void VCO_driver::varactor_feedback_voltage(){
//
// }
//
//
// //
// // void VCO_driver::generate_varactor_tuning_table_checks(){
// //     DAC_write(VARACTOR_OUTPUT_PIN);
// // }
// //
// // void VCO_driver::generate_varactor_tuning_table(){
// //     ////////////////CHECKS/////////////////
// //     generate_varactor_tuning_table_checks();
// //
// // }
//
// void VCO_driver::set_tuning_varactor_voltage(float voltage){
//
//     // DAC_write();
//
// }
//
// // float VCO_driver::set_source_voltage(){
// //
// // }
//
//
//
//
//
//
// //Ie = Ic + Ib
// //Ib = (Vbase_resistor - 0.6v (base voltage)) / Rbase_resistor
