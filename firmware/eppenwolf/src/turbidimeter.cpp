#include "turbidimeter.hpp"

const int VIS_transmittance_LED_pin = 23;


turbidimeter turbidimeter_instance;

void turbidimeter::init() {
  pinMode(VIS_transmittance_LED_pin, OUTPUT);

  FreqCount.begin(100);
}


signed long turbidimeter::dark_corrected_sample(){
  while (!FreqCount.available()); //wait until the next sample
  FreqCount.read(); //discard
  digitalWriteFast(VIS_transmittance_LED_pin, 0);
  while (!FreqCount.available());
  unsigned long dark_count = FreqCount.read();
  digitalWriteFast(VIS_transmittance_LED_pin, 1);
  while (!FreqCount.available());
  unsigned long light_count = FreqCount.read();

  return (signed long)(light_count)-(signed long)dark_count;
}
