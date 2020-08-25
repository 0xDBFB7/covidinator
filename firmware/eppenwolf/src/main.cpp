#include "WProgram.h"
#include "host_comms.hpp"
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

	// // turbidimeter_instance.init();
	init_VCO();
	// init_thermal();
	// home();
	while(1){

		digitalWrite(13, LOW);
		delay(1000);
		digitalWrite(13, HIGH);
		delay(1000);

		dispatch();
	}
}
