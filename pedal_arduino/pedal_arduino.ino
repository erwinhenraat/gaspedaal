/*
  potmeter pedal attached to analog input 0
*/

int pedalIn = A0;     //  analog input pin
int pedalOut;         //  analog read
int pedalOutR;        // reversed output
int Led1 = 13;        // onboard Led
int flasher = 0;          // Led flash  counter

void setup() {
  Serial.begin(9600);
  Serial.println("device on");


  pinMode(Led1, OUTPUT);
}

void loop() {
  // read the value from the pedal
  pedalOut = analogRead(pedalIn);//range 0 - 1023
  pedalOutR = map(pedalOut, 0, 1023, 1023, 0);
  delay(100);
  Serial.print(pedalOut);
  Serial.print(";");
  Serial.print(pedalOutR);
  Serial.print(";");//Processing needs an extra string probably bug
  Serial.println();
  flasher++;//up the flash counter
  if (flasher < 5) {
    LedOn();
  }
  if (flasher > 5) {
    LedOff();
  }
  if (flasher > 15) {
    flasher = 0;
  }
}

void LedOn() {
  digitalWrite(Led1, HIGH);
}

void LedOff() {
  digitalWrite(Led1, LOW);
}
