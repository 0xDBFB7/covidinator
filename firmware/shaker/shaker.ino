#include <AccelStepper.h>

//
//
//AccelStepper rotation(1, 3, 6); // pin 3 = step, pin 6 = direction
//
//
//void setup() //this doesn't work! Replace with the one from the laptop.
//{
//  pinMode(8, OUTPUT);
//  digitalWrite(8, LOW);//enable
//  rotation.setMaxSpeed(1500);
//  rotation.setAcceleration(600);
//}
// 
//void loop()
//{
//  rotation.runToNewPosition(5000);
//  rotation.runToNewPosition(0);
//
//}


void setup() //this doesn't work! Replace with the one from the laptop.
{
  pinMode(8, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(6, OUTPUT);
  digitalWrite(8, LOW);//enable
//  
//  rotation.setMaxSpeed(1500);
//  rotation.setAcceleration(600);
}

 //500-300 , 25 is good without the lid,
void loop()
{
  for(int i = 450; i > 200; i--){
    digitalWrite(6, LOW);//enable
    for(int t = 0; t < 30; t++){
      digitalWrite(3, LOW);//enable
      delayMicroseconds(i);
      digitalWrite(3, HIGH);//enable
      delayMicroseconds(i);
    }
    digitalWrite(6, HIGH);//enable
    for(int t = 0; t < 30; t++){
      digitalWrite(3, LOW);//enable
      delayMicroseconds(i);
      digitalWrite(3, HIGH);//enable
      delayMicroseconds(i);
    }
  }
  delay(120000);
}

