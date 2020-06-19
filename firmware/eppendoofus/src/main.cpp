#include "WProgram.h"



int main(void)
{
	Serial1.begin(115200);
	while(1){
		Serial1.println("Test");
	}
	// pinMode(13, OUTPUT);
	// while (1) {
	// 	digitalWriteFast(13, HIGH);
	// 	delay(100);
	// 	digitalWriteFast(13, LOW);
	// 	delay(100);
	// }
}
