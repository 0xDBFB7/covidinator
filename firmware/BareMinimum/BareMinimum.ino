#define VARACTOR_PWM_PIN 3


void setup() {
  // put your setup code here, to run once:
  analogWriteResolution(12);
  analogWriteFrequency(VARACTOR_PWM_PIN, 11718.75);
    pinMode(VARACTOR_PWM_PIN, OUTPUT);
  pinMode(2, OUTPUT);
digitalWrite(2, 1);
}

void loop() {
  for(int i = 1500; i < 2500; i++){
    analogWrite(VARACTOR_PWM_PIN, i);
    delayMicroseconds(20000);
  }
   for(int i = 2500; i > 1500; i--){
    analogWrite(VARACTOR_PWM_PIN, i);
    delayMicroseconds(20000);
  }
}
