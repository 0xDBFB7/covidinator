#include "VCO_driver.hpp"
#define DRAIN_CURRENT_SENSE_PIN A0

#define VCO_POWER_CONTROL_PIN 5
#define AMP_POWER_CONTROL_PIN 6

#define TUNE_DAC_SELECT_PIN 2
#define GAIN_DAC_SELECT_PIN 3
#define GATE_DAC_SELECT_PIN 4

#define TUNE_DAC_SUPPLY_VOLTAGE 3.3
#define AMP_DAC_SUPPLY_VOLTAGE 3.3
// non-inverting config. = 1 + Rf/Rin
#define VARACTOR_GAIN 11
#define GAIN_DAC_GAIN 2
#define GATE_DAC_GAIN 0.5

MCP4725 DAC_instance;

void init_VCO(){
    analogWriteResolution(ANALOG_WRITE_RESOLUTION);
    analogReadResolution(ANALOG_READ_RESOLUTION);

    pinMode(TUNE_DAC_SELECT_PIN, OUTPUT);
    pinMode(GAIN_DAC_SELECT_PIN, OUTPUT);
    pinMode(GATE_DAC_SELECT_PIN, OUTPUT);
    pinMode(VCO_POWER_CONTROL_PIN, OUTPUT);
    pinMode(AMP_POWER_CONTROL_PIN, OUTPUT);

    //p-channel inverts!
    digitalWriteFast(VCO_POWER_CONTROL_PIN, 1);
    digitalWriteFast(AMP_POWER_CONTROL_PIN, 1);

    unselect_dacs();
    DAC_instance.begin(0x61);
    //0b1100010
    //
    DAC_instance.setVoltage(0);
}

void select_all_dacs(){
    digitalWriteFast(TUNE_DAC_SELECT_PIN, HIGH);
    digitalWriteFast(GAIN_DAC_SELECT_PIN, HIGH);
    digitalWriteFast(GATE_DAC_SELECT_PIN, HIGH);
}

void unselect_dacs(){
    digitalWriteFast(TUNE_DAC_SELECT_PIN, LOW);
    digitalWriteFast(GAIN_DAC_SELECT_PIN, LOW);
    digitalWriteFast(GATE_DAC_SELECT_PIN, LOW);
}

float get_drain_current(){
    float avg = 0;
    for(int i = 0; i < 10; i++){
        avg += (((analogRead(DRAIN_CURRENT_SENSE_PIN) / (float)ANALOG_READ_MAX_VAL)*3.3) / 0.1)/50.0;
        delayMicroseconds(500);
    }
    avg /= 10;
    return avg;
    // return (((analogRead(DRAIN_CURRENT_SENSE_PIN) / (float)ANALOG_READ_MAX_VAL)*3.3) / 0.1)/50.0;;
}

void pulse_VCO(int pulse_duration_nanoseconds){

    int pulse_cycles = (pulse_duration_nanoseconds * 1.0e-9) / (1.0 / ((float)F_CPU));
    pulse_cycles /= 10; // about 20% off.

    noInterrupts(); //sei

    volatile int i = 0;

    //p-channel inverts!
    digitalWriteFast(VCO_POWER_CONTROL_PIN, 0);
    for(i = 0; i < pulse_cycles; i++){
        asm volatile("nop");
    }
    digitalWriteFast(VCO_POWER_CONTROL_PIN, 1);
    interrupts();
    //cli
}

void set_amp_gain_voltage(float gain_voltage){
    gain_voltage = constrain(gain_voltage, 0, 4.5);
    uint16_t gain_value = ((gain_voltage/GAIN_DAC_GAIN)/AMP_DAC_SUPPLY_VOLTAGE) * DAC_MAX_VAL;

    unselect_dacs();
    digitalWriteFast(GAIN_DAC_SELECT_PIN, 1);
    DAC_instance.setVoltage(gain_value);
    unselect_dacs();
}

void set_amp_gate_voltage(float voltage){
    voltage = constrain(voltage, 0, 2.5);
    uint16_t value = ((voltage/GATE_DAC_GAIN)/AMP_DAC_SUPPLY_VOLTAGE) * DAC_MAX_VAL;

    unselect_dacs();
    digitalWriteFast(GATE_DAC_SELECT_PIN, 1);
    DAC_instance.setVoltage(value);
    unselect_dacs();
}

void set_amp_power_state(bool power_state){
    digitalWriteFast(AMP_POWER_CONTROL_PIN, !power_state);
}

void wait_for_button(){
    while(!digitalReadFast(BUTTON_PIN)){
    }
}

// #define POWER_LEVEL_SAFE
// #define POWER_LEVEL_SAFE

// #define TEMP_INTERVAL 100

void pulse_spectrum(int slide, int cuvette, bool treatment, float deadly_amplifier_gate_voltage){

    for(float j = 0; j < 12; j += 0.5){
        for(float distance = 0; distance < 12; distance += 0.5){


            digitalWrite(13, HIGH);

            debug_serial.print(j);
            debug_serial.print(",");
            quickstart_amplifier(deadly_amplifier_gate_voltage);
            set_amp_gain_voltage(4.5);
            set_VCO(j,0);
            delay(5); //wait for the tuning voltage to settle.
            if(treatment){
                pulse_VCO(400);
            }
            kill_amplifier();

            // update_temperatures();
            // get_power_levels(); // just in case something goes wrong
            // debug_serial.print(",");
            // debug_serial.print(get_drain_current());
            // print_temperatures();
            // debug_serial.print(",");
            // debug_serial.print(slide);
            // debug_serial.print(",");
            // debug_serial.print(cuvette);
            // debug_serial.print(",");
            // debug_serial.print(millis());
            // debug_serial.print(",");
            debug_serial.print(treatment);
            debug_serial.print(",");
            debug_serial.print("37373737"); //identifier for pulse line, float so numpy's happy
            debug_serial.print(",0,0,0,0,0"); //help data analysis schema

            debug_serial.println();

            digitalWrite(13, LOW);
            delay(100);

        }
        digitalWrite(13, LOW);

        delay(1000);


    }

}

bool present(const int array[], int element, int size){
    //no stdlib, drat!
    for (int i = 0; i < size; i++) {
        if (array[i] == element) {
         return true;
        }
    }
    return false;
}

void prompt_slide(int cuvette){
    debug_serial.println("========================================================");
    debug_serial.print("Please move to");
    debug_serial.print("\033[1;33m cuvette ");
    debug_serial.print(cuvette);
    debug_serial.println("\033[0m");
    wait_for_button();
    debug_serial.println("========================================================");
}

void take_one_cuvette_spectrum(int cuvette, bool treatment, int no_power_levels, int no_iterations, int num_freq_sweeps){

    float power_levels[] = {3.0};
    float max_temperature = 0;
    unsigned long last_temperature_time = millis();


    for(int iter_count = 0; iter_count < no_iterations; iter_count++){ // see if anything's changed
        for(int power_level = 0; power_level < no_power_levels; power_level++){
            set_VCO(0,0);

            set_amp_gain_voltage(power_levels[power_level]);
            delay(10);

            for(int i = 0; i < num_freq_sweeps; i++){
                for(float j = 0; j < 12; j += 0.05){
                    debug_serial.print(j);
                    debug_serial.print(",");
                    set_VCO(j,1);
                    delayMicroseconds(200);
                    get_power_levels();
                    set_VCO(j,0);
                    if(millis() - last_temperature_time > 500){
                        update_temperatures();
                        last_temperature_time = millis();
                    }
                    debug_serial.print(",");
                    debug_serial.print(get_drain_current());
                    print_temperatures();
                    debug_serial.print(",");
                    debug_serial.print(0);
                    debug_serial.print(",");
                    debug_serial.print(cuvette);
                    debug_serial.print(",");
                    debug_serial.print(power_levels[power_level]);
                    debug_serial.print(",");
                    debug_serial.print(millis());
                    debug_serial.print(",");
                    debug_serial.print(treatment);
                    debug_serial.println();
                }
                delay(400); //let everything cool a bit before the next run
            }
        }
    }
}

const float working_distance = 50.0;
const float step_distance = 0.5;


void flush(){
    debug_serial.println("========================================================");
    debug_serial.print("\033[1;33m Please present cleaning tube\033[0m");
    debug_serial.println("========================================================");
    wait_for_button();


    // move_absolute(0);
    // debug_serial.println("========================================================");
    // debug_serial.print("\033[1;33m Disconnect luer\033[0m");
    // debug_serial.println("========================================================");
    // wait_for_button();
    // move_absolute(working_distance);


    for(float cycle = 0; cycle < 3; cycle++){
        move_absolute(0);
        move_absolute(working_distance);
    }
}


void master_loop(){


    //gain varies from 2.2 to 3.4.

    //time constant of the VCO tuning is about 3 ms.

    // debug_serial.println(thermal_sensor.get_ambient_temperature()); //not accurate for some reason?

    debug_serial.println("Make sure tee is running; and set tee file to the slide #");

    const int no_slides = 2;
    const int no_cuvettes = 8;
    const int no_power_levels = 1;
    const int num_freq_sweeps = 5;
    int cuvette = 0;
    int power_level = 0;

    // move_relative(1, 10); //home
    // move_relative(0, 5);
    //position is now zero: fully retracted


    // move_relative(1, 10);
    //
    // while(true){
    //     // 0 is dispense, 1 is retract.
    //
    //     delay(1000);
    // }

    // flush();
    // move_absolute(working_distance);


    float safe_amplifier_gate_voltage = start_amplifier(0.12);
    kill_amplifier();
    float deadly_amplifier_gate_voltage = start_amplifier(0.20); // push it to the limit!
    kill_amplifier();


    // for(int cuvette = 0; cuvette < no_cuvettes; cuvette++){

        // prompt_slide(cuvette);
        // digitalWrite(13, HIGH); //watch led for blinding
        //haha blinding blinding


    //
    // debug_serial.println("========================================================");
    // debug_serial.print("\033[1;35m Please present stock tube\033[0m");
    // debug_serial.println("========================================================");
    // wait_for_button();
    // move_absolute(0);
    // debug_serial.println("========================================================");
    // debug_serial.print("\033[1;35m Please present testing tube\033[0m");
    // debug_serial.println("========================================================");
    // wait_for_button();
    //


    // bool treatment = Entropy.random(2);
    //REENABLE IN PROD
    bool treatment = 1;
    debug_serial.println("Treatment:\u001b[8m ");
    debug_serial.println(treatment);
    debug_serial.println("\e[0m");


        // quickstart_amplifier(safe_amplifier_gate_voltage);
        //
        // take_one_cuvette_spectrum(cuvette, treatment, no_power_levels, 1, num_freq_sweeps);
        //
        // kill_amplifier();
        //
        // delay(3000);



    // pulse_spectrum(0, cuvette, treatment, deadly_amplifier_gate_voltage);




    // digitalWrite(13, HIGH);

    // for(float distance = 0; distance < working_distance; distance += step_distance){
    //     for(float j = 0; j < 12; j += 0.5){
    //
    //         // debug_serial.print(j);
    //         // debug_serial.print(",");
    //         quickstart_amplifier(deadly_amplifier_gate_voltage);
    //         set_amp_gain_voltage(4.5);
    //         set_VCO(j,0);
    //         delay(5); //wait for the tuning voltage to settle.
    //         if(treatment){
    //             pulse_VCO(400);
    //         }
    //         delay(1); // wait for RF to die out.
    //         kill_amplifier();
    //
    //         // update_temperatures();
    //         // get_power_levels(); // just in case something goes wrong
    //         // debug_serial.print(",");
    //         // debug_serial.print(get_drain_current());
    //         // print_temperatures();
    //         // debug_serial.print(",");
    //         // debug_serial.print(slide);
    //         // debug_serial.print(",");
    //         // debug_serial.print(cuvette);
    //         // debug_serial.print(",");
    //         // debug_serial.print(millis());
    //         // debug_serial.print(",");
    //         // debug_serial.print(treatment);
    //         // debug_serial.print(",");
    //         // debug_serial.print("37373737"); //identifier for pulse line, float so numpy's happy
    //         // debug_serial.print(",0,0,0,0,0"); //help data analysis schema
    //         // debug_serial.println();
    //
    //         delay(100);
    //
    //         move_absolute(distance);
    //     }
    //
    //     // move_absolute(0);
    //     delay(1000);
    //
    // }
    // digitalWrite(13, LOW);






    // delay(3000);

    debug_serial.println("========================================================");
    debug_serial.print("\033[1;35m Please present phage tube\033[0m");
    debug_serial.println("========================================================");
    wait_for_button();

    // move_absolute(0);

    quickstart_amplifier(safe_amplifier_gate_voltage);

    take_one_cuvette_spectrum(cuvette, treatment, no_power_levels, 1, 1);

    kill_amplifier();


    debug_serial.println("========================================================");
    debug_serial.print("\033[1;35m Please present ontrol tube\033[0m");
    debug_serial.println("========================================================");
    wait_for_button();

    quickstart_amplifier(safe_amplifier_gate_voltage);

    take_one_cuvette_spectrum(cuvette, treatment, no_power_levels, 1, 1);

    kill_amplifier();

        //
        // delay(3000);
        //
        // quickstart_amplifier(deadly_amplifier_gate_voltage);
        // set_amp_gain_voltage(4.5);
        //
        // pulse_spectrum(0, cuvette, treatment);
        //
        // kill_amplifier();
        //
        // delay(3000);
        //
        // quickstart_amplifier(safe_amplifier_gate_voltage);
        //
        // take_one_cuvette_spectrum(cuvette, treatment, no_power_levels, 1, num_freq_sweeps);
        //
        // kill_amplifier();
        //
        // delay(3000);





    digitalWrite(13, LOW);

    for(int i = 0; i < 200; i++){ //move data offscreen to maintain blindedness
        debug_serial.println();
    }
    // }

    debug_serial.println("========================================================");
    debug_serial.print("\033[1;35m Remove tube\033[0m");
    debug_serial.println("========================================================");
    wait_for_button();
    move_absolute(0);
}

void quickstart_amplifier(float gate_voltage){
    set_amp_power_state(0);
    set_VCO(0, 0); //Make sure VCO is off
    set_amp_gain_voltage(4.5);
    set_amp_gate_voltage(1.6);
    delay(10);
    set_amp_power_state(1);
    delay(5);
    set_amp_gate_voltage(gate_voltage);
    delay(5);
}


float start_amplifier(float set_current){

    debug_serial.println("Remove cuvette, amplifier starting");
    wait_for_button();

    set_amp_power_state(0);
    set_VCO(0, 0); //Make sure VCO is off
    set_amp_gain_voltage(4.5);
    set_amp_gate_voltage(1.6);
    delay(10);
    set_amp_power_state(1);

    set_VCO(5,1);
    float i = 0;
    for(i = 1.6; i > 0.2; i-= 0.01){
        set_amp_gate_voltage(i);

        float current = get_drain_current();
        debug_serial.println(current);
        if(current > set_current){
            debug_serial.println(i);
            break;
        }
        delay(20);
    }
    set_VCO(0,0);
    set_amp_gain_voltage(1.0);

    return i;
}


void kill_amplifier(){
    set_VCO(0,0);
    set_amp_gate_voltage(1.6);
    set_amp_power_state(0);
}


void set_VCO(float varactor_voltage, bool power_state){


    // debug_serial.printf("\nVCO set to %f, %f, %f, %i\n", varactor_voltage, power_state);

    varactor_voltage = constrain(varactor_voltage, 0, 20.0);
    uint16_t varactor_value = ((varactor_voltage/VARACTOR_GAIN)/TUNE_DAC_SUPPLY_VOLTAGE) * DAC_MAX_VAL;
    // //
    // //
    unselect_dacs();
    digitalWriteFast(TUNE_DAC_SELECT_PIN, 1);
    DAC_instance.setVoltage(varactor_value);
    unselect_dacs();
    // // //p-channel inverts!
    digitalWriteFast(VCO_POWER_CONTROL_PIN, !power_state);


}


//  to test power:
// start_amplifier(0.20); // push it to the limit!
//
// set_amp_gain_voltage(4.5);
//
// for(float j = 0; j < 12; j += 0.05){
//     debug_serial.print(j);
//     debug_serial.print(",");
//     set_VCO(j,1);
//     delayMicroseconds(200);
//     get_power_levels();
//     debug_serial.println();
// }
//
// set_VCO(0,0);
//
// set_VCO(5,1);
// delay(4000);
// get_power_levels();
// set_VCO(0,0);
// delay(1000);



// void LO_power(bool power){
//     // analogWriteFrequency(LO_VARACTOR_PWM_PIN, 50000.0);
//     debug_serial.printf("LO power set to %i\n", power);
//     digitalWrite(2, power);
// }
//
// void LO_tune(float value){
//7
//     const int mosfet_threshold = 0.7;
//     int lo_val = (ANALOG_WRITE_MAX_VAL - (value*ANALOG_WRITE_MAX_VAL)) + ((mosfet_threshold / 3.3)*ANALOG_WRITE_MAX_VAL);
//     debug_serial.printf("LO tune set to %i\n", lo_val);
//     analogWrite(LO_VARACTOR_PWM_PIN, lo_val);
// }



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
