
const int VIS_transmittance_out = 0;
const int VIS_reflectance_out = 1;
const int IR_transmittance_out = 2;
const int IR_reflectance_out = 3;

void setup() {
  Serial.begin(115200);
  pinMode(VIS_transmittance_out, OUTPUT);
  pinMode(VIS_reflectance_out, OUTPUT);
  pinMode(IR_transmittance_out, OUTPUT);
  pinMode(IR_reflectance_out, OUTPUT);
  FreqCount.begin(100);
  delay(1000);
}

void all_off(){
  digitalWrite(VIS_transmittance_out, 0);
  digitalWrite(VIS_reflectance_out, 0);
  digitalWrite(IR_transmittance_out, 0);
  digitalWrite(IR_reflectance_out, 0);
}

signed long dark_corrected_sample(int pin){
  while (!FreqCount.available()); //wait until the next sample
  FreqCount.read(); //discard
  all_off();
  while (!FreqCount.available());
  unsigned long dark_count = FreqCount.read();
  digitalWrite(pin, 1);
  while (!FreqCount.available());
  unsigned long light_count = FreqCount.read();
)

  return (signed long)(light_count)-(signed long)dark_count;
}

void loop() {
  signed long VIS_reflectance = dark_corrected_sample(VIS_reflectance_out);
  signed long VIS_transmittance = dark_corrected_sample(VIS_transmittance_out);

  signed long IR_reflectance = dark_corrected_sample(IR_reflectance_out);
  signed long IR_transmittance = dark_corrected_sample(IR_transmittance_out);

  Serial.print(VIS_reflectance);
  Serial.print(", ");
  Serial.print(VIS_transmittance);
  Serial.print(", ");
  Serial.print(IR_reflectance);
  Serial.print(", ");
  Serial.println(IR_transmittance);
//  Serial.print(",");
//  Serial.println(VIS_ratio,5);

}
