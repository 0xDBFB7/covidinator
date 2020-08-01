//From https://github.com/teemuatlut/TMCStepper
#include "stepper.hpp"

#define EN_PIN           5 // Enable
#define DIR_PIN          12 // Direction
#define STEP_PIN         11 // Step
#define CS_PIN           4 // Chip select
#define SW_MOSI          23 // Software Master Out Slave In (MOSI)
#define SW_MISO          13 // Software Master In Slave Out (MISO)
#define SW_SCK           22 // Software Slave Clock (SCK)

#define R_SENSE 0.075f // Match to your driver
                     // SilentStepStick series use 0.11
                     // UltiMachine Einsy and Archim2 boards use 0.2
                     // Panucatt BSD2660 uses 0.1
                     // Watterott TMC5160 uses 0.075

#define DEG_PER_STEP 18.0
#define SCREW_PITCH 0.5 //mm
#define MICROSTEPS 16
const float distance_per_step = ((DEG_PER_STEP / 360.0) * SCREW_PITCH);

// https://www.trinamic.com/support/eval-kits/details/tmc5160-bob/
//  (STEP = REFL, DIR = REFR)

TMC5160Stepper driver = TMC5160Stepper(CS_PIN, R_SENSE, SW_MOSI, SW_MISO, SW_SCK);

//Direction "0" moves toward the motor end, +x, greater channel index
//1 moves toward the far end, lower channel index

// 0 ---->
// <---- 1

float position = 0;

#define CUVETTE_SPACING 5.0
#define HOME_OFFSET -53.2 //distance from home point to first cuvette

#define STALL_THRESH 30



#define function_microstrip 0
#define function_turbidimeter 1

const float function_offsets[] = {0.0, 3.0};


void init_stepper(){
    // driver.begin();
	// driver.rms_current(500);
	// driver.en_pwm_mode(1);
    // driver.en_pwm_mode(1);      // Enable extremely quiet stepping
    // driver.pwm_autoscale(1);
    // driver.microsteps(16);

    driver.begin();                 //  SPI: Init CS pins and possible SW SPI pins
    driver.toff(0);                 // Enables driver in software
    driver.pwm_autoscale(1);
    driver.rms_current(400);        // Set motor RMS current
    driver.microsteps(MICROSTEPS);          // Set microsteps to 1/16th
    driver.en_pwm_mode(1);
    // driver.shaft(1);

    // driver.blank_time(24);
    // driver.TCOOLTHRS(0xFFFFF); // 20bit max
    // driver.THIGH(0);
    // driver.semin(5);
    // driver.semax(2);
    // driver.sedn(0b01);
    // driver.sg_stop(0b01000000);
    // driver.SW_MODE(0b00000010);
    // driver.sg_stop(1);
    // driver.sgt(-63);
    // driver.push();

	// pinMode(EN_PIN, OUTPUT);
    // digitalWrite(EN_PIN, 0);

    // digitalWrite(EN_PIN, 1);
	pinMode(STEP_PIN, OUTPUT);
    pinMode(DIR_PIN, OUTPUT);
}

void move_to_cuvette(int index, int function){
    move_absolute(HOME_OFFSET + index*CUVETTE_SPACING + function_offsets[function]);
}

void move_absolute(float new_position){
    debug_serial.printf("Moving to %f from %f\n", new_position, position);
    float delta = new_position - position;

    move_relative((delta < 0), fabs(delta));

    position = new_position;
}

void move_relative(bool direction, float distance){
    //ignores all 'position' info.

    digitalWrite(DIR_PIN, direction);

    int num_steps = distance/distance_per_step * MICROSTEPS;

    driver.toff(5);
    for(int i = 0; i < num_steps; i++){
    	digitalWriteFast(STEP_PIN, HIGH);
    	delayMicroseconds(30);
    	digitalWriteFast(STEP_PIN, LOW);
    	delayMicroseconds(30);
    }
    driver.toff(0);

}



void home(){
    while(!digitalReadFast(7)){
        move_relative(0,1);
    }
    move_relative(0,1);
    driver.toff(5);

    digitalWrite(DIR_PIN, 1);
    while(digitalReadFast(7)){
        digitalWriteFast(STEP_PIN, HIGH);
        delayMicroseconds(50);
        digitalWriteFast(STEP_PIN, LOW);
        delayMicroseconds(50);
    }

    driver.toff(0);
    position = 0;
    move_to_cuvette(0, 0);
}

// void setup() {
// 	Serial.begin(9600);
// 	while(!Serial);
// 	Serial.println("Start...");
// 	driver.begin(); 			// Initiate pins and registeries
// 	driver.rms_current(600); 	// Set stepper current to 600mA. The command is the same as command TMC2130.setCurrent(600, 0.11, 0.5);
// 	driver.en_pwm_mode(1);  	// Enable extremely quiet stepping
//
// 	pinMode(EN_PIN, OUTPUT);
// 	pinMode(STEP_PIN, OUTPUT);
// 	digitalWrite(EN_PIN, LOW); 	// Enable driver in hardware
//
// 	Serial.print("DRV_STATUS=0b");
// 	Serial.println(driver.DRV_STATUS(), BIN);
// }
//
// void loop() {
// 	digitalWrite(STEP_PIN, HIGH);
// 	delayMicroseconds(10);
// 	digitalWrite(STEP_PIN, LOW);
// 	delayMicroseconds(10);
// 	uint32_t ms = millis();
// 	static uint32_t last_time = 0;
// 	if ((ms - last_time) > 2000) {
// 		if (dir) {
// 			Serial.println("Dir -> 0");
// 			driver.shaft(0);
// 		} else {
// 			Serial.println("Dir -> 1");
// 			driver.shaft(1);
// 		}
// 		dir = !dir;
// 		last_time = ms;
// 	}
// }
