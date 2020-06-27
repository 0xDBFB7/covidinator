#include <cmath>
#include <iostream>
#include <fstream>


#define HIGH 1
#define LOW 0

#define OUTPUT 1
#define INPUT 0


void pinMode(int pin, bool mode);
void digitalWriteFast(int pin, bool state);
bool digitalWriteFast(int pin);
void analogWrite(int pin, int value);
void delay(int ms);
void analogWriteResolution(int res);
