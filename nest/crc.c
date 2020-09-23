

unsigned int ModRTU_CRC(char buf[], int len){
  char Hb = 0x00;
  char Lb = 0x00;
  int pos = 0;
  int i = 0;
  unsigned int crc = 0xFFFF;


  for (pos = 0; pos < len; pos++){
    crc ^= buf[pos];               // XOR byte into least sig. byte of crc
    for (i = 8; i != 0; i--){      // Loop over each bit
      if ((crc & 0x0001) != 0){    // If the LSB is set
        crc >>= 1;                 // Shift right and XOR 0xA001
        crc ^= 0xA001;
      }
      else crc >>= 1;              // Else LSB is not set  // Just shift right
    }
  }
   // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
  Hb =  crc >> 8;
  Lb = crc;
  return crc;
}


unsigned short ModRTU_CRC_Hb(char buf[], int len){
  char Hb = 0x00;
  char Lb = 0x00;
  int pos = 0;
  int i = 0;
  unsigned int crc = 0xFFFF;

  crc = 0xFFFF;
  for (pos = 0; pos < len; pos++){
    crc ^= buf[pos];               // XOR byte into least sig. byte of crc
    for (i = 8; i != 0; i--){      // Loop over each bit
      if ((crc & 0x0001) != 0){    // If the LSB is set
        crc >>= 1;                 // Shift right and XOR 0xA001
        crc ^= 0xA001;
      }
      else crc >>= 1;              // Else LSB is not set  // Just shift right
    }
  }
  // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
  Hb =  crc >> 8;
  Lb = crc;
  return Hb;
}

unsigned short ModRTU_CRC_Lb(char buf[], int len){
  char Hb = 0x00;
  char Lb = 0x00;
  int pos = 0;
  int i = 0;
  unsigned int crc = 0xFFFF;

  crc = 0xFFFF;
  for (pos = 0; pos < len; pos++){
    crc ^= buf[pos];               // XOR byte into least sig. byte of crc
    for (i = 8; i != 0; i--){      // Loop over each bit
      if ((crc & 0x0001) != 0){    // If the LSB is set
        crc >>= 1;                 // Shift right and XOR 0xA001
        crc ^= 0xA001;
      }
      else crc >>= 1;              // Else LSB is not set  // Just shift right
    }
  }
  // Note, this number has low and high bytes swapped, so use it accordingly (or swap bytes)
  Hb =  crc >> 8;
  Lb = crc;
  return Lb;
}


unsigned short crc8(unsigned short dir, unsigned short speed){
  unsigned short crc;
  unsigned short speed1;
  unsigned short speed0;
  unsigned short temp;

  speed1 = speed / 16;
  speed0 = speed % 16;

  if(speed0 >= 0x0C){
    temp = 0x0B - 2*(0x0F - speed0);
    crc = speed1 * 16 + (speed0 - temp);
  }
  else if (speed0 >= 0x08){
    temp = 0x0B - 2*(0x0B - speed0);
    crc = speed1 * 16 + (speed0 - temp);
  }
  else if (speed0 >= 0x04){
    temp = 0x05 + 2*(0x07 - speed0);
    crc = speed1 * 16 + (speed0 + temp);
  }
  else if (speed0 >= 0x00){
    temp = 0x05 + 2*(0x03 - speed0);
    crc = speed1 * 16 + (speed0 + temp);
  }

  if(dir == 0x01){
    if(speed0 % 2 == 0){
      crc -= 1;
    }
    else{
      crc += 1;
    }
  }

  return crc;
}