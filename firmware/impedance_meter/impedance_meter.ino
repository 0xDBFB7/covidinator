
const long frequencies[] = {2500,5000,10000,20000,40000};

const int num_freqs = 5;
const int num_wells = 8;
const int analog_input = A0;

int output_pins[8] = {2,3,4,5,6,7,8,9};

//cat /dev/ttyUSB7 | ts '%.s,'

void setup() {
  Serial.begin(115200);
  for(int i = 0; i < num_wells; i++){
    pinMode(output_pins[i], INPUT); //easier if on the same port
  }
}


void loop() {
  for(int f = 0; f < num_freqs; f++){
    for(int i = 0; i < num_wells; i++){
      pinMode(output_pins[i], OUTPUT);
      tone(output_pins[i], frequencies[f]);
      delay(50);
      long value = 0;
      for(int j = 0; j < 100; j++){
        value += analogRead(analog_input);
        delayMicroseconds(100);
      }
      value /= 100;
      noTone(output_pins[i]);
      pinMode(output_pins[i], INPUT);
      delay(50);
      Serial.print(i);
      Serial.print(',');
      Serial.print(frequencies[f]);
      Serial.print(',');
      Serial.println(value);
    }
  }
  delay(100);
}
