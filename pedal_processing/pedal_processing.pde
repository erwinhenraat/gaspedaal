 //<>//
import processing.serial.*; //import the Serial library
int end = 10;  // the number 10 is ASCII for linefeed (end of serial.println), later we will look for this to break up individual messages
String serial; // declare a new string called 'serial' . A string is a sequence of characters (data type know as "char")
Serial port;   // The serial port, this is a new instance of the Serial class (an Object)
String[] a ;
float[] b = new float[4];
void setup() {
  port = new Serial(this, Serial.list()[0], 9600); // initializing the object by assigning a port and baud rate (must match that of Arduino)
  port.clear();  // function from serial library that throws out the first reading, in case we started reading in the middle of a string from Arduino
  serial = port.readStringUntil(end); // function that reads the string from serial port until a println and then assigns string to our string variable (called 'serial')
  serial = null; // initially, the string will be null (empty)

  size(640, 360);// window

  b[0] = 0;
  b[1] = 0;
}

void draw() {
  while (port.available() > 0) { //as long as there is data coming from serial port, read it and store it 
    serial = port.readStringUntil(end);
  }
  if (serial != null) {  //if the string is not empty
    a = split(serial, ';'); // arduino program uses ',' as separator
    b[0] = float(a[0]);//sensor value 1
    b[0] = map(b[0], 0, 1023, 255, 0);
  }
  clear();
  background(0);// color black

  b[1] = b[0];
  fill(255-b[0], b[0]/2, 255-b[0]);

  rect(400, 310-b[0], 50+b[0]/2, b[0]);
  textSize(32);
  fill(0, 255, 0);
  text("pedal position  " + int(b[0]), 20, 100);
}