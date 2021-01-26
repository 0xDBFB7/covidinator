import RPi.GPIO as GPIO
from time import sleep

STEP_PIN = 7
DIR_PIN = 21
LIMIT_PIN = 22
TRIGGER_PIN = 11
ENABLE_PIN = 19 #might be 16

GPIO.setmode(GPIO.BOARD)

DEG_PER_STEP = 18.0
SCREW_PITCH = 0.5 # //mm
MICROSTEPS = 4
distance_per_step = ((DEG_PER_STEP / 360.0) * SCREW_PITCH);
#
GPIO.setup(STEP_PIN, GPIO.OUT)
GPIO.setup(DIR_PIN, GPIO.OUT)
GPIO.setup(TRIGGER_PIN, GPIO.OUT)
GPIO.setup(ENABLE_PIN, GPIO.OUT)

GPIO.setup(LIMIT_PIN, GPIO.IN)



position = 0.0

def move_absolute(new_position):
    print("Moving to {} from {}\n".format(new_position, position))
    delta = new_position - position
    move_relative((delta < 0), abs(delta))
    position = new_position



def move_relative(direction, distance):
    GPIO.output(DIR_PIN, direction)
    GPIO.output(ENABLE_PIN, 0)

    num_steps = distance/distance_per_step * MICROSTEPS;

    for i in range(int(num_steps)):
    	GPIO.output(STEP_PIN, 1)
    	sleep(600 * 1e-6) #microseconds

    	GPIO.output(STEP_PIN, 0)
    	sleep(600 * 1e-6) #microseconds

    GPIO.output(ENABLE_PIN, 1)


def home():
    while(GPIO.input(LIMIT_PIN)):
        move_relative(1,1)

    GPIO.output(DIR_PIN, 0)
    GPIO.output(ENABLE_PIN, 0)

    while(not GPIO.input(LIMIT_PIN)):
    	GPIO.output(STEP_PIN, 1)
    	sleep(1500 * 1e-6) #microseconds

    	GPIO.output(STEP_PIN, 0)
    	sleep(1500 * 1e-6) #microseconds

    GPIO.output(ENABLE_PIN, 1)
    position = 0

while True:
    home()
    sleep(1)






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
