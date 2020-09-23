

char receiveUart2;
void interruptGps() iv IVT_INT_USART2 ics ICS_AUTO {

  receiveUart2 = UART2_Read();
}