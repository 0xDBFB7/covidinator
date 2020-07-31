#include "WProgram.h"
#include "host_comms.hpp"
#include "VCO_driver.hpp"
#include "turbidimeter.hpp"
#include "stepper.hpp"

int main(void)
{

	host_serial.begin(115200);
	debug_serial.begin(115200);
	host_transfer.begin(host_serial);
	turbidimeter_instance.init();
	init_VCO();
	init_stepper();

	while(1){
		dispatch();
	}
}
