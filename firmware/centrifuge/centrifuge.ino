#include <Servo.h>
 
Servo myservo; 
 
int pos = 0;
 
void setup() //this doesn't work! Replace with the one from the laptop.
{
  myservo.attach(3);  // attaches the servo on pin 9 to the servo object
  myservo.write(50);
  delay(5000);
  for(pos = 0; pos < 179; pos += 1)  // goes from 0 degrees to 180 degrees
  {                                  // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  for(pos = 179; pos>=1; pos-=1)     // goes from 180 degrees to 0 degrees
  {                               
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
  delay(5000);
    for(pos = 0; pos < 179; pos += 1)  // goes from 0 degrees to 180 degrees
  {                                  // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15ms for the servo to reach the position
  }
//  for(pos = 179; pos>=1; pos-=1)     // goes from 180 degrees to 0 degrees
//  {                               
//    myservo.write(pos);              // tell servo to go to position in variable 'pos'
//    delay(15);                       // waits 15ms for the servo to reach the position
//  }
//  delay(5000);
//  for(pos = 0; pos < 179; pos += 1){ 
//    myservo.write(pos);
//    delay(60);
//  }
}
 
void loop()
{
  
}

