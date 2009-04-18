//
// Title        : FileLogger library for Arduino, example code
// Author       : Eduardo García
// Date         : April 2009
// Version      : 0.1
//
// DISCLAIMER:
// The author is in no way responsible for any problems or damage caused by
// using this code. Use at your own risk.
//
// LICENSE:
// This code is distributed under the GNU Public License
// which can be found at http://www.gnu.org/licenses/gpl.txt
//


#include "FileLogger.h"

// define the pin that powers up the SD card
#define MEM_PW 8

// variable used when reading from serial
byte inSerByte = 0;

#define MESSAGE "Hello, this is my message\r\n"
unsigned long length = sizeof(MESSAGE)-1;
byte buffer[] = MESSAGE;

void setup(void) {
  pinMode(MEM_PW, OUTPUT);
  digitalWrite(MEM_PW, HIGH);
  Serial.begin(9600);
}

void loop(void) {
  char command = '0';
  unsigned long t1, t2;

  // Arduino expects one of a series of one-byte commands
  if (Serial.available() > 0) {
    int result;
    inSerByte = Serial.read();
    switch (inSerByte) {
      case 'W':
        result = File_logger.append("data.log", buffer, length);
        Serial.print("Result: ");
        Serial.println(result);
      break;
    case 'T':
	  for(int i=0; i<10; i++) {
              t1 = millis();
	      File_logger.append("data.log", buffer, length);
              t2 = millis();
              Serial.println(t2-t1);
	  }
          Serial.print("Done");
      break;
    }
  }
}