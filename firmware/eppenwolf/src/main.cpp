#include "WProgram.h"
#include "host_comms.hpp"
#include "power_sensor.hpp"
#include "thermal.hpp"
#include "Entropy.h"
// #include "VCO_driver.hpp"
// #include "turbidimeter.hpp"
// #include "stepper.hpp"
// #include "thermal.hpp"


int main(void)
{
	pinMode(13, OUTPUT);
	host_serial.begin(115200);
	debug_serial.begin(115200);
	host_transfer.begin(host_serial);
	debug_serial.println("\nRESET\n");

	pinMode(BUTTON_PIN, INPUT);
	digitalWrite(BUTTON_PIN, HIGH); //button pulldown

  	Entropy.Initialize(); //timer-based

	// // turbidimeter_instance.init();
	init_VCO();
	init_ADCs();
	get_power_levels();
	init_thermal();
	// home();
	while(1){
		digitalWrite(13, LOW);
		delay(100);
		digitalWrite(13, HIGH);
		delay(100);

		dispatch();

	}
}
