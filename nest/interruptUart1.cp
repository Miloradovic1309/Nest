#line 1 "C:/Users/Dan/Desktop/New folder (2)/Nest4/nest/interruptUart1.c"

char receiveUart1;
void interruptMotor() iv IVT_INT_USART1 ics ICS_AUTO {

 receiveUart1 = UART1_Read();

}
