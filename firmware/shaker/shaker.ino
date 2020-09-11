#include <AccelStepper.h>

//
//
AccelStepper rotation(1, 3, 6); // pin 3 = step, pin 6 = direction
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
  Serial.begin(115200);
  pinMode(8, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(6, OUTPUT);
  digitalWrite(8, LOW);//enable
//  

}

 //500-300 , 25 is good without the lid,
void loop()
{
  for(int z = 0; z < 3; z++){

    for(int i = 800; i > 700; i--){
      digitalWrite(6, LOW);//enable
      for(int t = 0; t < 50; t++){
        digitalWrite(3, LOW);//enable
        delayMicroseconds(i);
        digitalWrite(3, HIGH);//enable
        delayMicroseconds(i);
      }
      digitalWrite(6, HIGH);//enable
      for(int t = 0; t < 50; t++){
        digitalWrite(3, LOW);//enable
        delayMicroseconds(i);
        digitalWrite(3, HIGH);//enable
        delayMicroseconds(i);
      }
    }
    
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


    rotation.setMaxSpeed(30000);
    rotation.setAcceleration(1000);
    rotation.runToNewPosition(30000);
    rotation.runToNewPosition(0);
  }



  /////////////mixing done/////////////

  digitalWrite(6, HIGH);//enable
  for(int i = 0; i < 100; i++){
    for(int t = 0; t < 16; t++){
      digitalWrite(3, LOW);//enable
      delayMicroseconds(5000);
      digitalWrite(3, HIGH);//enable
      delayMicroseconds(5000);
      
    }
    delay(1000);
    Serial.println(i);
    delay(1500);
  }

  

//  delay(120000);
  
}
