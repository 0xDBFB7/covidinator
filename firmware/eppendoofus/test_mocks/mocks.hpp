#define HIGH 1
#define LOW 0

#define OUTPUT 1
#define INPUT 0


void pinMode(int pin, bool mode);
void digitalWriteFast(int pin, bool state);

void delay(int ms);
