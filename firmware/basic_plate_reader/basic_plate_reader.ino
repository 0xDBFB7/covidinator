#include <Wire.h>

// I2C address of the TSL2571 0x39(57)
#define Addr 0x39

void setup()
{
    // Initialise I2C communication as MASTER
    Wire.begin();
    // Initialise serial communication, set baud rate = 9600
    Serial.begin(115200);

    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select enable register
    Wire.write(0x00 | 0x80);
    // Set power on, ALS enabled
    Wire.write(0x01);
    // Stop I2C Transmission
    Wire.endTransmission();
    delay(500);

    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select enable register
    Wire.write(0x00 | 0x80);
    // Set power on, ALS enabled
    Wire.write(0x0B);
    // Stop I2C Transmission
    Wire.endTransmission();

    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select ALS time register
    Wire.write(0x01 | 0x80);
    Wire.write(0x00);
    // Stop I2C Transmission
    Wire.endTransmission();

    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    Wire.write(0x03 | 0x80);
    Wire.write(0xFF);
    // Stop I2C Transmission
    Wire.endTransmission();

    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select control register
    Wire.write(0x0F | 0x80);
    // Gain = 1x
    Wire.write(0x20);
    // Stop I2C Transmission
    Wire.endTransmission();
    delay(300);



    pinMode(2, OUTPUT);
}


void reset_integration_counter(){
   Wire.beginTransmission(Addr);
  // Select data register
  Wire.write(0b11100110);
  // Stop I2C Transmission
  Wire.endTransmission();
}

unsigned int integration_complete(){
    unsigned int data;
    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select data register
    Wire.write(0x13 | 0x80);
    // Stop I2C Transmission
    Wire.endTransmission();
    Wire.requestFrom(Addr, 1);
    
    if(Wire.available()){
      data = Wire.read();
    }
    return data;
}

long get_sample(){
      unsigned int data[4];
    // Start I2C Transmission
    Wire.beginTransmission(Addr);
    // Select data register
    Wire.write(0x14 | 0x80);
    // Stop I2C Transmission
    Wire.endTransmission();
    
    // Request 4 bytes of data
    Wire.requestFrom(Addr, 4);
    
    // Read 4 bytes of data
    // c0Data lsb, c0Data msb, c1Data lsb, c1Data msb
    if(Wire.available() == 4)
    {
      data[0] = Wire.read();
      data[1] = Wire.read();
      data[2] = Wire.read();
      data[3] = Wire.read();
    }

    // Convert the data
    long c0Data = (data[1] * 256) + data[0];
    long c1Data = (data[3] * 256) + data[2];

    return c1Data;

    //C1 is the infrared channel.
    //The sensor should actually be at the top,
    // with the LED shining directly through the 
    //channel. However, design flaw, 
    // it's the other way around, and so
    //using the IR channel gets us better data.
    
}

void wait_for_new_reading(){
    reset_integration_counter();
    while(integration_complete() != 17);
}

void loop()
{

    
    digitalWrite(2, LOW);
    wait_for_new_reading();
    wait_for_new_reading();
    long background = get_sample();
    digitalWrite(2, HIGH);
    wait_for_new_reading();
    wait_for_new_reading();
    long sample = get_sample();
    sample = sample-background;
    Serial.println(sample);
    delay(500);
}
