//From https://github.com/teemuatlut/TMCStepper
#include "stepper.hpp"

#define EN_PIN           5 // Enable
#define DIR_PIN          11 // Direction
#define STEP_PIN         12 // Step
#define CS_PIN           42 // Chip select
#define SW_MOSI          23 // Software Master Out Slave In (MOSI)
#define SW_MISO          4 // Software Master In Slave Out (MISO)
#define SW_SCK           22 // Software Slave Clock (SCK)

#define R_SENSE 0.075f // Match to your driver
                     // SilentStepStick series use 0.11
                     // UltiMachine Einsy and Archim2 boards use 0.2
                     // Panucatt BSD2660 uses 0.1
                     // Watterott TMC5160 uses 0.075

// https://www.trinamic.com/support/eval-kits/details/tmc5160-bob/
//  (STEP = REFL, DIR = REFR)

TMC5160Stepper driver = TMC5160Stepper(CS_PIN, R_SENSE, SW_MOSI, SW_MISO, SW_SCK);

void init_stepper(){
    driver.begin();
	driver.rms_current(200);
	driver.en_pwm_mode(1);

	pinMode(EN_PIN, OUTPUT);
	pinMode(STEP_PIN, OUTPUT);
	// digitalWrite(EN_PIN, LOW); 	// Enable
}

void step(direction, number){
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
