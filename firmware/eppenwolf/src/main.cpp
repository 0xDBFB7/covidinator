#include "WProgram.h"
#include "host_comms.hpp"
#include "VCO_driver.hpp"

int main(void)
{
	host_serial.begin(115200);
	debug_serial.begin(115200);
	host_transfer.begin(host_serial);
	init_VCO();

	while(1){
		dispatch();
	}
}
