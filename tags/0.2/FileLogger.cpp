//
// Title        : FileLogger library for Arduino
// Author       : Eduardo García
// Date         : April 2009
// Version      : 0.1
//
// See header for credits

#include "FileLogger.h"

byte sdBuffer[512]; // Block size for  512 bytes
bool nanofat_initialized = false;

FileLogger::FileLogger(){
}

bool initializeNanoFAT() {
  if(!nanofat_initialized) {
	if (nanofat::initialize(sdBuffer)) {
		nanofat_initialized = true;
	} else {
		return false;
	}
  }
  return true;
}

//
// This library will just append a data buffer to a file
//
int FileLogger::append(const char* filename, byte buffer[], unsigned long length) {
  if (initializeNanoFAT()) {
	if( nanofat::append(filename, buffer, length)) {
	} else return 2;
  } else return 1;
  return 0;
}


FileLogger File_logger = FileLogger();