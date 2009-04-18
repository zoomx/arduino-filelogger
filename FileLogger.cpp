//
// Title        : FileLogger library for Arduino
// Author       : Eduardo García
// Date         : April 2009
// Version      : 0.1
//
// See header for credits

#include "FileLogger.h"

byte sdBuffer[512]; // Block size for  512 bytes

FileLogger::FileLogger(){
}


//
// This library will just append a data buffer to a file
//
int FileLogger::append(const char* filename, byte buffer[], unsigned long length) {
  if (nanofat::initialize(sdBuffer)) {
	if( nanofat::append(filename, buffer, length)) {
	} else return 2;
  } else return 1;
  return 0;
}

FileLogger File_logger = FileLogger();