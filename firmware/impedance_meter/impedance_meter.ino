
const int frequency = 20000;

const int num_wells = 8;
const int analog_input = A0;

int output_pins[8] = {2,3,4,5,6,7,8};

void setup() {
  Serial.begin(115200);
  for(int i = 0; i < num_wells; i++){
    pinMode(output_pins[i], INPUT); //easier if on the same port
  }
}


void loop() {
  for(int i = 0; i < num_wells; i++){
    pinMode(output_pins[i], OUTPUT);
    tone(output_pins[i], frequency);
    delay(50);
    int value = analogRead(analog_input);
    noTone(output_pins[i]);
    pinMode(output_pins[i], INPUT);

    Serial.print(i);
    Serial.print(',');
    Serial.println(value);

  }
}
