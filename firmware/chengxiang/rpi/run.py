
from functions import *
import numpy as np

code.interact(local=locals())

exposure = bool(input("Exposure? (1/0) > ")) # NOT FOR PRODUCTION USE!

home()

working_distance = 50.0 #autosampler length



working_volume = 0.05 * 0.1 * 4

step_distance = working_volume

#250 steps.

pulses_per_volume = 20

move_absolute(working_distance)


input("Supply PG1 > ")

move_absolute(0, (4000 * 1e-6))

input("Supply test tube > ")

input("Turn on supplies")

print("Running")


for distance in np.arange(0, working_distance, step_distance):
    move_absolute(distance)
    for i in range(pulses_per_volume):
        pulse(exposure)
        sleep(0.005)

print("Done")


#     for(float j = 0; j < 12; j += 0.5){

#
# digitalWrite(13, HIGH);
#
# for(float distance = 0; distance < working_distance; distance += step_distance){
#     for(float j = 0; j < 12; j += 0.5){
#
#         // debug_serial.print(j);
#         // debug_serial.print(",");
#         quickstart_amplifier(deadly_amplifier_gate_voltage);
#         set_amp_gain_voltage(4.5);
#         set_VCO(j,0);
#         delay(5); //wait for the tuning voltage to settle.
#         if(treatment){
#             pulse_VCO(10000);
#             // pulse_VCO(10000000);
#         }
#         delay(1); // wait for RF to die out.
#         kill_amplifier();
#
#         // update_temperatures();
#         // get_power_levels(); // just in case something goes wrong
#         // debug_serial.print(",");
#         // debug_serial.print(get_drain_current());
#         // print_temperatures();
#         // debug_serial.print(",");
#         // debug_serial.print(slide);
#         // debug_serial.print(",");
#         // debug_serial.print(cuvette);
#         // debug_serial.print(",");
#         // debug_serial.print(millis());
#         // debug_serial.print(",");
#         // debug_serial.print(treatment);
#         // debug_serial.print(",");
#         // debug_serial.print("37373737"); //identifier for pulse line, float so numpy's happy
#         // debug_serial.print(",0,0,0,0,0"); //help data analysis schema
#         // debug_serial.println();
#
#         delay(100);
#
#         move_absolute(distance);
#     }
#
#     // move_absolute(0);
#     delay(1000);
#
# }
# digitalWrite(13, LOW);


GPIO.cleanup()
