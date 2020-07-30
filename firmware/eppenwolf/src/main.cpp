#include "WProgram.h"
#include "host_comms.hpp"


int main(void)
{
	host_serial.begin(115200);
	debug_serial.begin(115200);

	init_VCO();

}
