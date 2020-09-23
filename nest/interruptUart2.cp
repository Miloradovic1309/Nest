#line 1 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nest/interruptUart2.c"


char receiveUart2;
void interruptGps() iv IVT_INT_USART2 ics ICS_AUTO {

 receiveUart2 = UART2_Read();
}
