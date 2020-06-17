#include "WProgram.h"

int main(void)
{

	// To use Teensy 3.0 without Arduino, simply put your code here.
	// For example:

	pinMode(13, OUTPUT);
	while (1) {
		digitalWriteFast(13, HIGH);
		delay(500);
		digitalWriteFast(13, LOW);
		delay(500);
	}

	setup();
	while (1) {
		loop();
		yield();
	}
}
