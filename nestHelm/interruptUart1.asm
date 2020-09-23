_interruptJoystick:
;interruptUart1.c,5 :: 		void interruptJoystick() iv IVT_INT_USART1 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart1.c,6 :: 		receive1 = UART1_Read();
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_receive1+0)
MOVT	R1, #hi_addr(_receive1+0)
STRB	R0, [R1, #0]
;interruptUart1.c,10 :: 		if((receive1 == 0x21)&&(!startReceivingData1)){
UXTB	R0, R0
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick74
MOVW	R1, #lo_addr(_startReceivingData1+0)
MOVT	R1, #hi_addr(_startReceivingData1+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptJoystick73
L__interruptJoystick72:
;interruptUart1.c,11 :: 		uart_count1=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count1+0)
MOVT	R0, #hi_addr(_uart_count1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,12 :: 		startReceivingData1 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData1+0)
MOVT	R0, #hi_addr(_startReceivingData1+0)
STR	R1, [R0, #0]
;interruptUart1.c,13 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick3:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #10
IT	CS
BCS	L_interruptJoystick4
;interruptUart1.c,14 :: 		uart_receive1[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart1.c,13 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart1.c,15 :: 		}
IT	AL
BAL	L_interruptJoystick3
L_interruptJoystick4:
;interruptUart1.c,16 :: 		}
IT	AL
BAL	L_interruptJoystick6
;interruptUart1.c,10 :: 		if((receive1 == 0x21)&&(!startReceivingData1)){
L__interruptJoystick74:
L__interruptJoystick73:
;interruptUart1.c,18 :: 		else if((receive1 == 0x3B)&&(startReceivingData1)&&(uart_count1 + 1 == uartLength1)){
MOVW	R0, #lo_addr(_receive1+0)
MOVT	R0, #hi_addr(_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #59
IT	NE
BNE	L__interruptJoystick95
MOVW	R1, #lo_addr(_startReceivingData1+0)
MOVT	R1, #hi_addr(_startReceivingData1+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptJoystick94
MOVW	R0, #lo_addr(_uart_count1+0)
MOVT	R0, #hi_addr(_uart_count1+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L__interruptJoystick93
L__interruptJoystick71:
;interruptUart1.c,19 :: 		uart_receive1[uart_count1] = receive1;
MOVW	R2, #lo_addr(_uart_count1+0)
MOVT	R2, #hi_addr(_uart_count1+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive1+0)
MOVT	R0, #hi_addr(_receive1+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart1.c,20 :: 		uart_count1 = 0;
MOVS	R0, #0
STRH	R0, [R2, #0]
;interruptUart1.c,21 :: 		startReceivingData1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData1+0)
MOVT	R0, #hi_addr(_startReceivingData1+0)
STR	R1, [R0, #0]
;interruptUart1.c,22 :: 		uartLength1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,28 :: 		if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x40)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick77
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L__interruptJoystick76
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick70:
;interruptUart1.c,30 :: 		bitRespond = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitRespond+0)
MOVT	R0, #hi_addr(_bitRespond+0)
STR	R1, [R0, #0]
;interruptUart1.c,32 :: 		if(uart_receive1[4]&=0x01){
MOVW	R1, #lo_addr(_uart_receive1+4)
MOVT	R1, #hi_addr(_uart_receive1+4)
LDRB	R0, [R1, #0]
AND	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptJoystick13
;interruptUart1.c,33 :: 		bitControlTaken = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;interruptUart1.c,34 :: 		gear_status = (unsigned int)uart_receive1[2];
MOVW	R0, #lo_addr(_uart_receive1+2)
MOVT	R0, #hi_addr(_uart_receive1+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart1.c,35 :: 		dir_status = (unsigned int)uart_receive1[3];
MOVW	R0, #lo_addr(_uart_receive1+3)
MOVT	R0, #hi_addr(_uart_receive1+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_dir_status+0)
MOVT	R0, #hi_addr(_dir_status+0)
STRH	R1, [R0, #0]
;interruptUart1.c,36 :: 		switch(gear_status){
IT	AL
BAL	L_interruptJoystick14
;interruptUart1.c,37 :: 		case 0x01:
L_interruptJoystick16:
;interruptUart1.c,38 :: 		ONE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ONE_LIGHT+0)
MOVT	R0, #hi_addr(ONE_LIGHT+0)
_SX	[R0, ByteOffset(ONE_LIGHT+0)]
;interruptUart1.c,39 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(R_LIGHT+0)
MOVT	R0, #hi_addr(R_LIGHT+0)
_SX	[R0, ByteOffset(R_LIGHT+0)]
_LX	[R0, ByteOffset(R_LIGHT+0)]
MOVW	R0, #lo_addr(N_LIGHT+0)
MOVT	R0, #hi_addr(N_LIGHT+0)
_SX	[R0, ByteOffset(N_LIGHT+0)]
_LX	[R0, ByteOffset(N_LIGHT+0)]
MOVW	R0, #lo_addr(THREE_LIGHT+0)
MOVT	R0, #hi_addr(THREE_LIGHT+0)
_SX	[R0, ByteOffset(THREE_LIGHT+0)]
_LX	[R0, ByteOffset(THREE_LIGHT+0)]
MOVW	R0, #lo_addr(TWO_LIGHT+0)
MOVT	R0, #hi_addr(TWO_LIGHT+0)
_SX	[R0, ByteOffset(TWO_LIGHT+0)]
;interruptUart1.c,40 :: 		break;
IT	AL
BAL	L_interruptJoystick15
;interruptUart1.c,41 :: 		case 0x02:
L_interruptJoystick17:
;interruptUart1.c,42 :: 		TWO_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TWO_LIGHT+0)
MOVT	R0, #hi_addr(TWO_LIGHT+0)
_SX	[R0, ByteOffset(TWO_LIGHT+0)]
;interruptUart1.c,43 :: 		ONE_LIGHT = THREE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(R_LIGHT+0)
MOVT	R0, #hi_addr(R_LIGHT+0)
_SX	[R0, ByteOffset(R_LIGHT+0)]
_LX	[R0, ByteOffset(R_LIGHT+0)]
MOVW	R0, #lo_addr(N_LIGHT+0)
MOVT	R0, #hi_addr(N_LIGHT+0)
_SX	[R0, ByteOffset(N_LIGHT+0)]
_LX	[R0, ByteOffset(N_LIGHT+0)]
MOVW	R0, #lo_addr(THREE_LIGHT+0)
MOVT	R0, #hi_addr(THREE_LIGHT+0)
_SX	[R0, ByteOffset(THREE_LIGHT+0)]
_LX	[R0, ByteOffset(THREE_LIGHT+0)]
MOVW	R0, #lo_addr(ONE_LIGHT+0)
MOVT	R0, #hi_addr(ONE_LIGHT+0)
_SX	[R0, ByteOffset(ONE_LIGHT+0)]
;interruptUart1.c,44 :: 		break;
IT	AL
BAL	L_interruptJoystick15
;interruptUart1.c,45 :: 		case 0x03:
L_interruptJoystick18:
;interruptUart1.c,46 :: 		THREE_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(THREE_LIGHT+0)
MOVT	R0, #hi_addr(THREE_LIGHT+0)
_SX	[R0, ByteOffset(THREE_LIGHT+0)]
;interruptUart1.c,47 :: 		TWO_LIGHT = ONE_LIGHT = N_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(R_LIGHT+0)
MOVT	R0, #hi_addr(R_LIGHT+0)
_SX	[R0, ByteOffset(R_LIGHT+0)]
_LX	[R0, ByteOffset(R_LIGHT+0)]
MOVW	R0, #lo_addr(N_LIGHT+0)
MOVT	R0, #hi_addr(N_LIGHT+0)
_SX	[R0, ByteOffset(N_LIGHT+0)]
_LX	[R0, ByteOffset(N_LIGHT+0)]
MOVW	R0, #lo_addr(ONE_LIGHT+0)
MOVT	R0, #hi_addr(ONE_LIGHT+0)
_SX	[R0, ByteOffset(ONE_LIGHT+0)]
_LX	[R0, ByteOffset(ONE_LIGHT+0)]
MOVW	R0, #lo_addr(TWO_LIGHT+0)
MOVT	R0, #hi_addr(TWO_LIGHT+0)
_SX	[R0, ByteOffset(TWO_LIGHT+0)]
;interruptUart1.c,48 :: 		break;
IT	AL
BAL	L_interruptJoystick15
;interruptUart1.c,49 :: 		case 0x04:
L_interruptJoystick19:
;interruptUart1.c,50 :: 		N_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(N_LIGHT+0)
MOVT	R0, #hi_addr(N_LIGHT+0)
_SX	[R0, ByteOffset(N_LIGHT+0)]
;interruptUart1.c,51 :: 		TWO_LIGHT = THREE_LIGHT = ONE_LIGHT = R_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(R_LIGHT+0)
MOVT	R0, #hi_addr(R_LIGHT+0)
_SX	[R0, ByteOffset(R_LIGHT+0)]
_LX	[R0, ByteOffset(R_LIGHT+0)]
MOVW	R0, #lo_addr(ONE_LIGHT+0)
MOVT	R0, #hi_addr(ONE_LIGHT+0)
_SX	[R0, ByteOffset(ONE_LIGHT+0)]
_LX	[R0, ByteOffset(ONE_LIGHT+0)]
MOVW	R0, #lo_addr(THREE_LIGHT+0)
MOVT	R0, #hi_addr(THREE_LIGHT+0)
_SX	[R0, ByteOffset(THREE_LIGHT+0)]
_LX	[R0, ByteOffset(THREE_LIGHT+0)]
MOVW	R0, #lo_addr(TWO_LIGHT+0)
MOVT	R0, #hi_addr(TWO_LIGHT+0)
_SX	[R0, ByteOffset(TWO_LIGHT+0)]
;interruptUart1.c,52 :: 		break;
IT	AL
BAL	L_interruptJoystick15
;interruptUart1.c,53 :: 		case 0x05:
L_interruptJoystick20:
;interruptUart1.c,54 :: 		R_LIGHT = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(R_LIGHT+0)
MOVT	R0, #hi_addr(R_LIGHT+0)
_SX	[R0, ByteOffset(R_LIGHT+0)]
;interruptUart1.c,55 :: 		TWO_LIGHT = THREE_LIGHT = N_LIGHT = ONE_LIGHT = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ONE_LIGHT+0)
MOVT	R0, #hi_addr(ONE_LIGHT+0)
_SX	[R0, ByteOffset(ONE_LIGHT+0)]
_LX	[R0, ByteOffset(ONE_LIGHT+0)]
MOVW	R0, #lo_addr(N_LIGHT+0)
MOVT	R0, #hi_addr(N_LIGHT+0)
_SX	[R0, ByteOffset(N_LIGHT+0)]
_LX	[R0, ByteOffset(N_LIGHT+0)]
MOVW	R0, #lo_addr(THREE_LIGHT+0)
MOVT	R0, #hi_addr(THREE_LIGHT+0)
_SX	[R0, ByteOffset(THREE_LIGHT+0)]
_LX	[R0, ByteOffset(THREE_LIGHT+0)]
MOVW	R0, #lo_addr(TWO_LIGHT+0)
MOVT	R0, #hi_addr(TWO_LIGHT+0)
_SX	[R0, ByteOffset(TWO_LIGHT+0)]
;interruptUart1.c,56 :: 		break;
IT	AL
BAL	L_interruptJoystick15
;interruptUart1.c,57 :: 		}
L_interruptJoystick14:
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_interruptJoystick16
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_interruptJoystick17
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_interruptJoystick18
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_interruptJoystick19
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_interruptJoystick20
L_interruptJoystick15:
;interruptUart1.c,58 :: 		}
IT	AL
BAL	L_interruptJoystick21
L_interruptJoystick13:
;interruptUart1.c,60 :: 		bitControlTaken = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;interruptUart1.c,61 :: 		}
L_interruptJoystick21:
;interruptUart1.c,64 :: 		}
IT	AL
BAL	L_interruptJoystick22
;interruptUart1.c,28 :: 		if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x40)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick77:
L__interruptJoystick76:
;interruptUart1.c,66 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x41)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick80
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #65
IT	NE
BNE	L__interruptJoystick79
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick69:
;interruptUart1.c,68 :: 		bitCalSend = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCalSend+0)
MOVT	R0, #hi_addr(_bitCalSend+0)
STR	R1, [R0, #0]
;interruptUart1.c,70 :: 		}
IT	AL
BAL	L_interruptJoystick26
;interruptUart1.c,66 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x41)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick80:
L__interruptJoystick79:
;interruptUart1.c,72 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x42)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick83
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #66
IT	NE
BNE	L__interruptJoystick82
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick68:
;interruptUart1.c,74 :: 		leftLimit = (uart_receive1[2] << 8) + uart_receive1[3];
MOVW	R0, #lo_addr(_uart_receive1+2)
MOVT	R0, #hi_addr(_uart_receive1+2)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(_uart_receive1+3)
MOVT	R0, #hi_addr(_uart_receive1+3)
LDRB	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
STRH	R1, [R0, #0]
;interruptUart1.c,75 :: 		eepromSaveLeft();
BL	_eepromSaveLeft+0
;interruptUart1.c,77 :: 		if(leftLimit >= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_interruptJoystick30
;interruptUart1.c,78 :: 		sideDifference = leftLimit - rightLimit;
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,79 :: 		}
IT	AL
BAL	L_interruptJoystick31
L_interruptJoystick30:
;interruptUart1.c,81 :: 		sideDifference = rightLimit - leftLimit;
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,82 :: 		}
L_interruptJoystick31:
;interruptUart1.c,84 :: 		if(sideDifference == 0){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptJoystick32
;interruptUart1.c,85 :: 		sideDifference = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,86 :: 		}
L_interruptJoystick32:
;interruptUart1.c,88 :: 		}
IT	AL
BAL	L_interruptJoystick33
;interruptUart1.c,72 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x42)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick83:
L__interruptJoystick82:
;interruptUart1.c,90 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x43)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick86
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #67
IT	NE
BNE	L__interruptJoystick85
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick67:
;interruptUart1.c,92 :: 		rightLimit = (uart_receive1[2] << 8) + uart_receive1[3];
MOVW	R0, #lo_addr(_uart_receive1+2)
MOVT	R0, #hi_addr(_uart_receive1+2)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
MOVW	R0, #lo_addr(_uart_receive1+3)
MOVT	R0, #hi_addr(_uart_receive1+3)
LDRB	R0, [R0, #0]
ADDS	R1, R1, R0
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
STRH	R1, [R0, #0]
;interruptUart1.c,93 :: 		eepromSaveRight();
BL	_eepromSaveRight+0
;interruptUart1.c,95 :: 		if(leftLimit >= rightLimit){
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_interruptJoystick37
;interruptUart1.c,96 :: 		sideDifference = leftLimit - rightLimit;
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,97 :: 		}
IT	AL
BAL	L_interruptJoystick38
L_interruptJoystick37:
;interruptUart1.c,99 :: 		sideDifference = rightLimit - leftLimit;
MOVW	R0, #lo_addr(_leftLimit+0)
MOVT	R0, #hi_addr(_leftLimit+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_rightLimit+0)
MOVT	R0, #hi_addr(_rightLimit+0)
LDRH	R0, [R0, #0]
SUB	R1, R0, R1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,100 :: 		}
L_interruptJoystick38:
;interruptUart1.c,102 :: 		if(sideDifference == 0){
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptJoystick39
;interruptUart1.c,103 :: 		sideDifference = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_sideDifference+0)
MOVT	R0, #hi_addr(_sideDifference+0)
STRH	R1, [R0, #0]
;interruptUart1.c,104 :: 		}
L_interruptJoystick39:
;interruptUart1.c,106 :: 		}
IT	AL
BAL	L_interruptJoystick40
;interruptUart1.c,90 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x43)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick86:
L__interruptJoystick85:
;interruptUart1.c,108 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x44)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick89
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #68
IT	NE
BNE	L__interruptJoystick88
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick66:
;interruptUart1.c,110 :: 		dir = uart_receive1[2];
MOVW	R0, #lo_addr(_uart_receive1+2)
MOVT	R0, #hi_addr(_uart_receive1+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_dir+0)
MOVT	R0, #hi_addr(_dir+0)
STRB	R1, [R0, #0]
;interruptUart1.c,111 :: 		eepromDir();
BL	_eepromDir+0
;interruptUart1.c,113 :: 		}
IT	AL
BAL	L_interruptJoystick44
;interruptUart1.c,108 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x44)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick89:
L__interruptJoystick88:
;interruptUart1.c,116 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x45)&&(uart_receive1[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick92
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	NE
BNE	L__interruptJoystick91
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive1+5)
MOVT	R0, #hi_addr(_uart_receive1+5)
STRB	R1, [R0, #0]
L__interruptJoystick65:
;interruptUart1.c,118 :: 		bitResetTouchSensor = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitResetTouchSensor+0)
MOVT	R0, #hi_addr(_bitResetTouchSensor+0)
STR	R1, [R0, #0]
;interruptUart1.c,116 :: 		else if((uart_receive1[0]==0x21)&&(uart_receive1[1]==0x45)&&(uart_receive1[5] = 0x3B)){
L__interruptJoystick92:
L__interruptJoystick91:
;interruptUart1.c,119 :: 		}
L_interruptJoystick44:
L_interruptJoystick40:
L_interruptJoystick33:
L_interruptJoystick26:
L_interruptJoystick22:
;interruptUart1.c,121 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick48:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #10
IT	CS
BCS	L_interruptJoystick49
;interruptUart1.c,122 :: 		uart_receive1[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart1.c,121 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart1.c,123 :: 		}
IT	AL
BAL	L_interruptJoystick48
L_interruptJoystick49:
;interruptUart1.c,18 :: 		else if((receive1 == 0x3B)&&(startReceivingData1)&&(uart_count1 + 1 == uartLength1)){
L__interruptJoystick95:
L__interruptJoystick94:
L__interruptJoystick93:
;interruptUart1.c,125 :: 		}
L_interruptJoystick6:
;interruptUart1.c,128 :: 		if(startReceivingData1 == 1){
MOVW	R1, #lo_addr(_startReceivingData1+0)
MOVT	R1, #hi_addr(_startReceivingData1+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptJoystick51
;interruptUart1.c,129 :: 		uart_receive1[uart_count1] = receive1;
MOVW	R2, #lo_addr(_uart_count1+0)
MOVT	R2, #hi_addr(_uart_count1+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive1+0)
MOVT	R0, #hi_addr(_receive1+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart1.c,130 :: 		uart_count1++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R2, #0]
;interruptUart1.c,132 :: 		if(uart_count1 == 2)
CMP	R0, #2
IT	NE
BNE	L_interruptJoystick52
;interruptUart1.c,134 :: 		switch (uart_receive1[1])
IT	AL
BAL	L_interruptJoystick53
;interruptUart1.c,136 :: 		case 0x40:
L_interruptJoystick55:
;interruptUart1.c,137 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,138 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,139 :: 		case 0x41:
L_interruptJoystick56:
;interruptUart1.c,140 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,141 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,142 :: 		case 0x42:
L_interruptJoystick57:
;interruptUart1.c,143 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,144 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,145 :: 		case 0x43:
L_interruptJoystick58:
;interruptUart1.c,146 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,147 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,148 :: 		case 0x44:
L_interruptJoystick59:
;interruptUart1.c,149 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,150 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,151 :: 		case 0x45:
L_interruptJoystick60:
;interruptUart1.c,152 :: 		uartLength1 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,153 :: 		break;
IT	AL
BAL	L_interruptJoystick54
;interruptUart1.c,155 :: 		}
L_interruptJoystick53:
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	EQ
BEQ	L_interruptJoystick55
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #65
IT	EQ
BEQ	L_interruptJoystick56
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #66
IT	EQ
BEQ	L_interruptJoystick57
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #67
IT	EQ
BEQ	L_interruptJoystick58
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #68
IT	EQ
BEQ	L_interruptJoystick59
MOVW	R0, #lo_addr(_uart_receive1+1)
MOVT	R0, #hi_addr(_uart_receive1+1)
LDRB	R0, [R0, #0]
CMP	R0, #69
IT	EQ
BEQ	L_interruptJoystick60
L_interruptJoystick54:
;interruptUart1.c,156 :: 		}
L_interruptJoystick52:
;interruptUart1.c,158 :: 		if(uart_count1 > 9){
MOVW	R0, #lo_addr(_uart_count1+0)
MOVT	R0, #hi_addr(_uart_count1+0)
LDRH	R0, [R0, #0]
CMP	R0, #9
IT	LS
BLS	L_interruptJoystick61
;interruptUart1.c,159 :: 		uart_count1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count1+0)
MOVT	R0, #hi_addr(_uart_count1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,160 :: 		uartLength1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength1+0)
MOVT	R0, #hi_addr(_uartLength1+0)
STRH	R1, [R0, #0]
;interruptUart1.c,161 :: 		startReceivingData1 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData1+0)
MOVT	R0, #hi_addr(_startReceivingData1+0)
STR	R1, [R0, #0]
;interruptUart1.c,162 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick62:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRH	R0, [R0, #0]
CMP	R0, #10
IT	CS
BCS	L_interruptJoystick63
;interruptUart1.c,163 :: 		uart_receive1[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive1+0)
MOVT	R0, #hi_addr(_uart_receive1+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart1.c,162 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart1.c,164 :: 		}
IT	AL
BAL	L_interruptJoystick62
L_interruptJoystick63:
;interruptUart1.c,165 :: 		}
L_interruptJoystick61:
;interruptUart1.c,166 :: 		}
L_interruptJoystick51:
;interruptUart1.c,168 :: 		}
L_end_interruptJoystick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptJoystick
