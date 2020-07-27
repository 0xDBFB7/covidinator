
#define COMMS_SERIAL Serial

#define LO_POWER_PIN 2
#define VARACTOR_PWM_PIN 3

#define PWM_MAX_VALUE 1024
#define ADC_MAX_VALUE 4096

#define VARACTOR_FEEDBACK_PIN A0

int value = 0;

void LO_power(bool power){
  digitalWrite(2, power);
}

float voltage_divider(float vout, float Rtop, float Rbottom){
    return ((vout/(Rbottom/(Rtop+Rbottom))));
}

void varactor_set(int target_voltage){
  
  const int mosfet_threshold = 0.7;
  const int supply = 15.0;
  analogWrite(VARACTOR_PWM_PIN, (PWM_MAX_VALUE - target_voltage) + ((mosfet_threshold / 3.3)*PWM_MAX_VALUE));
//  int tries = 0;
//  const int max_tries = PWM_MAX_VALUE;
//  float feedback_voltage = 0;
//  //only the I in PID.
//  while(fabs(target_voltage-feedback_voltage) > 0.1 || tries == 0){
//    feedback_voltage = voltage_divider((analogRead(VARACTOR_FEEDBACK_PIN)/(float)ADC_MAX_VALUE) * 3.3, 50000,850);
//    Serial.println(feedback_voltage);
//    Serial.println(value);
//    if(target_voltage > feedback_voltage){
//      value--;
//    }
//    else{
//      value++;
//    }
//
//  value = constrain(value, 0, 4096);
//    analogWrite(VARACTOR_PWM_PIN, value);
//
//    delayMicroseconds(300);
//    if(tries > max_tries){
//      COMMS_SERIAL.println("ERROR: Unable to set voltage.");
//      break;
//    }
//    tries++;
//  }
}


void setup(){
  COMMS_SERIAL.begin(115200);
  analogReadResolution(12);
  analogWriteResolution(10);
  analogWriteFrequency(VARACTOR_PWM_PIN, 46875);
  
  pinMode(LO_POWER_PIN, OUTPUT);
  pinMode(VARACTOR_PWM_PIN, OUTPUT);
}

void loop(){

  if(Serial.available() > 0){
    //protocol: 0 10.4\n
    String input = COMMS_SERIAL.readStringUntil("\n");
    Serial.println(input);
    Serial.println(input.length());
    if(input.length() > 2){
  
      bool LO_state = (input.substring(0, 1).toInt() != 0); //failure to convert yields a zero, that's fine.
      float varactor_voltage = input.substring(1).toFloat();
      
      LO_power(LO_state); 
      varactor_set(varactor_voltage);
      Serial.println("Done.");
    }
    else{
      COMMS_SERIAL.println("ERROR: serial badness");
    }
    //this should be in a loop; then we could just trip a 'continue'. However, 
    // I seem to recall that Teensy does something after the loop() function.
  }
  
}
