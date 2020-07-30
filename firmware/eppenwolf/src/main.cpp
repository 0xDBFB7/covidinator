#include "WProgram.h"
#include "host_comms.hpp"
#include "VCO_driver.hpp"

FILE serial_stdout;
// Function that printf and related will use to print
int serial_putchar(char c, FILE* f) {
   if (c == '\n') serial_putchar('\r', f);
   return debug_serial.write(c) == 1? 0 : 1;
}


int main(void)
{

	fdev_setup_stream(&serial_stdout, serial_putchar, NULL, _FDEV_SETUP_WRITE);
	stdout = &serial_stdout;

	host_serial.begin(115200);
	debug_serial.begin(115200);
	host_transfer.begin(host_serial);
	init_VCO();

	while(1){
		dispatch();
	}
}
