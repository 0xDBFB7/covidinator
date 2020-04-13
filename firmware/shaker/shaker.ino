int step_pin = 3;
int dir_pin = 6;

void setup() //this doesn't work! Replace with the one from the laptop.
{
  pinMode(3, OUTPUT);
  pinMode(6, OUTPUT);
    pinMode(8, OUTPUT);
  digitalWrite(8, LOW);
}
 
void loop()
{
  digitalWrite(dir_pin, HIGH);
  for(int i = 0; i < 1000; i++){
    digitalWrite(3, HIGH);
    delayMicroseconds(100);
    digitalWrite(3, LOW);
    delayMicroseconds(100);
  }
  digitalWrite(dir_pin, LOW);
  for(int i = 0; i < 1000; i++){
    digitalWrite(3, HIGH);
    delayMicroseconds(100);
    digitalWrite(3, LOW);
    delayMicroseconds(100);
  }
}

