#include "turbidimeter.hpp"



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
  digitalWriteFast(VIS_transmittance_LED_pin, 0);

  return (signed long)(light_count)-(signed long)dark_count;
}


signed long fast_light_to_freq(){
    //fast, inaccurate version of dark_corrected_sample
    signed long result = 0;
    for(int i = 0; i < 10; i++){
        digitalWriteFast(VIS_transmittance_LED_pin, 1);
        delayMicroseconds(5);
        while(!digitalReadFast(13));
        while(digitalReadFast(13)){ result++; };
        digitalWriteFast(VIS_transmittance_LED_pin, 0);
        delayMicroseconds(5);
        while(!digitalReadFast(13));
        while(digitalReadFast(13)){ result--; };
    }
    // debug_serial.println(result);

    digitalWriteFast(VIS_transmittance_LED_pin, 1);
    return result/10;
}
