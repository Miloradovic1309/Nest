_interruptJoystick:
;interruptUart3.c,4 :: 		void interruptJoystick() iv IVT_INT_USART3 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart3.c,5 :: 		receive3 = UART3_Read();
BL	_UART3_Read+0
MOVW	R1, #lo_addr(_receive3+0)
MOVT	R1, #hi_addr(_receive3+0)
STRB	R0, [R1, #0]
;interruptUart3.c,7 :: 		if((receive3 == 0x21)&&(!startReceivingData3)){
UXTB	R0, R0
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick38
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptJoystick37
L__interruptJoystick36:
;interruptUart3.c,8 :: 		uart_count3=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,9 :: 		startReceivingData3 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,10 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick3:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_interruptJoystick4
;interruptUart3.c,11 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,10 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,12 :: 		}
IT	AL
BAL	L_interruptJoystick3
L_interruptJoystick4:
;interruptUart3.c,13 :: 		}
IT	AL
BAL	L_interruptJoystick6
;interruptUart3.c,7 :: 		if((receive3 == 0x21)&&(!startReceivingData3)){
L__interruptJoystick38:
L__interruptJoystick37:
;interruptUart3.c,15 :: 		else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
CMP	R0, #59
IT	NE
BNE	L__interruptJoystick46
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptJoystick45
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L__interruptJoystick44
L__interruptJoystick35:
;interruptUart3.c,16 :: 		uart_receive3[uart_count3] = receive3;
MOVW	R2, #lo_addr(_uart_count3+0)
MOVT	R2, #hi_addr(_uart_count3+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart3.c,17 :: 		uart_count3 = 0;
MOVS	R0, #0
STRH	R0, [R2, #0]
;interruptUart3.c,18 :: 		startReceivingData3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,19 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,24 :: 		if((uart_receive3[0]==0x21)&&(uart_receive3[1]==0x50)&&(uart_receive3[5] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptJoystick43
MOVW	R0, #lo_addr(_uart_receive3+1)
MOVT	R0, #hi_addr(_uart_receive3+1)
LDRB	R0, [R0, #0]
CMP	R0, #80
IT	NE
BNE	L__interruptJoystick42
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive3+5)
MOVT	R0, #hi_addr(_uart_receive3+5)
STRB	R1, [R0, #0]
L__interruptJoystick34:
;interruptUart3.c,26 :: 		countJoystickConnection = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_countJoystickConnection+0)
MOVT	R0, #hi_addr(_countJoystickConnection+0)
STRH	R1, [R0, #0]
;interruptUart3.c,27 :: 		bitCheckJoystick = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckJoystick+0)
MOVT	R0, #hi_addr(_bitCheckJoystick+0)
STR	R1, [R0, #0]
;interruptUart3.c,30 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptJoystick13
;interruptUart3.c,31 :: 		gear_status = uart_receive3[2];
MOVW	R0, #lo_addr(_uart_receive3+2)
MOVT	R0, #hi_addr(_uart_receive3+2)
LDRB	R0, [R0, #0]
MOVW	R2, #lo_addr(_gear_status+0)
MOVT	R2, #hi_addr(_gear_status+0)
STRH	R0, [R2, #0]
;interruptUart3.c,32 :: 		dutyy = uart_receive3[3];
MOVW	R0, #lo_addr(_uart_receive3+3)
MOVT	R0, #hi_addr(_uart_receive3+3)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;interruptUart3.c,34 :: 		if((gear_status == 4) && (!resetedTouchSensor)){
MOV	R0, R2
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	NE
BNE	L__interruptJoystick40
MOVW	R1, #lo_addr(_resetedTouchSensor+0)
MOVT	R1, #hi_addr(_resetedTouchSensor+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptJoystick39
L__interruptJoystick33:
;interruptUart3.c,35 :: 		resetedTouchSensor = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_resetedTouchSensor+0)
MOVT	R0, #hi_addr(_resetedTouchSensor+0)
STR	R1, [R0, #0]
;interruptUart3.c,36 :: 		resetTouchSensor = 1;
MOVW	R0, #lo_addr(_resetTouchSensor+0)
MOVT	R0, #hi_addr(_resetTouchSensor+0)
STR	R1, [R0, #0]
;interruptUart3.c,37 :: 		}
IT	AL
BAL	L_interruptJoystick17
;interruptUart3.c,34 :: 		if((gear_status == 4) && (!resetedTouchSensor)){
L__interruptJoystick40:
L__interruptJoystick39:
;interruptUart3.c,38 :: 		else if(gear_status != 4){
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_interruptJoystick18
;interruptUart3.c,39 :: 		resetedTouchSensor = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_resetedTouchSensor+0)
MOVT	R0, #hi_addr(_resetedTouchSensor+0)
STR	R1, [R0, #0]
;interruptUart3.c,40 :: 		}
L_interruptJoystick18:
L_interruptJoystick17:
;interruptUart3.c,43 :: 		}
L_interruptJoystick13:
;interruptUart3.c,45 :: 		if(bitCheckIsItStoppedGear){
MOVW	R1, #lo_addr(_bitCheckIsItStoppedGear+0)
MOVT	R1, #hi_addr(_bitCheckIsItStoppedGear+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptJoystick19
;interruptUart3.c,46 :: 		bitCheckIsItStoppedGear = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckIsItStoppedGear+0)
MOVT	R0, #hi_addr(_bitCheckIsItStoppedGear+0)
STR	R1, [R0, #0]
;interruptUart3.c,47 :: 		if(gear_status != 4){
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_interruptJoystick20
;interruptUart3.c,48 :: 		stopGearBit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_stopGearBit+0)
MOVT	R0, #hi_addr(_stopGearBit+0)
STR	R1, [R0, #0]
;interruptUart3.c,49 :: 		}
L_interruptJoystick20:
;interruptUart3.c,50 :: 		}
L_interruptJoystick19:
;interruptUart3.c,24 :: 		if((uart_receive3[0]==0x21)&&(uart_receive3[1]==0x50)&&(uart_receive3[5] = 0x3B)){
L__interruptJoystick43:
L__interruptJoystick42:
;interruptUart3.c,54 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick21:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_interruptJoystick22
;interruptUart3.c,55 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,54 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,56 :: 		}
IT	AL
BAL	L_interruptJoystick21
L_interruptJoystick22:
;interruptUart3.c,15 :: 		else if((receive3 == 0x3B)&&(startReceivingData3)&&(uart_count3 + 1 == uartLength3)){
L__interruptJoystick46:
L__interruptJoystick45:
L__interruptJoystick44:
;interruptUart3.c,58 :: 		}
L_interruptJoystick6:
;interruptUart3.c,61 :: 		if(startReceivingData3 == 1){
MOVW	R1, #lo_addr(_startReceivingData3+0)
MOVT	R1, #hi_addr(_startReceivingData3+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptJoystick24
;interruptUart3.c,62 :: 		uart_receive3[uart_count3] = receive3;
MOVW	R2, #lo_addr(_uart_count3+0)
MOVT	R2, #hi_addr(_uart_count3+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive3+0)
MOVT	R0, #hi_addr(_receive3+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart3.c,63 :: 		uart_count3++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R2, #0]
;interruptUart3.c,65 :: 		if(uart_count3 == 2)
CMP	R0, #2
IT	NE
BNE	L_interruptJoystick25
;interruptUart3.c,67 :: 		switch (uart_receive3[1])
IT	AL
BAL	L_interruptJoystick26
;interruptUart3.c,69 :: 		case 0x50:
L_interruptJoystick28:
;interruptUart3.c,70 :: 		uartLength3 = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,71 :: 		break;
IT	AL
BAL	L_interruptJoystick27
;interruptUart3.c,72 :: 		}
L_interruptJoystick26:
MOVW	R0, #lo_addr(_uart_receive3+1)
MOVT	R0, #hi_addr(_uart_receive3+1)
LDRB	R0, [R0, #0]
CMP	R0, #80
IT	EQ
BEQ	L_interruptJoystick28
L_interruptJoystick27:
;interruptUart3.c,73 :: 		}
L_interruptJoystick25:
;interruptUart3.c,75 :: 		if(uart_count3 > 9){
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
LDRH	R0, [R0, #0]
CMP	R0, #9
IT	LS
BLS	L_interruptJoystick29
;interruptUart3.c,76 :: 		uart_count3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count3+0)
MOVT	R0, #hi_addr(_uart_count3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,77 :: 		uartLength3 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength3+0)
MOVT	R0, #hi_addr(_uartLength3+0)
STRH	R1, [R0, #0]
;interruptUart3.c,78 :: 		startReceivingData3 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData3+0)
MOVT	R0, #hi_addr(_startReceivingData3+0)
STR	R1, [R0, #0]
;interruptUart3.c,79 :: 		for(i=0; i<10; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptJoystick30:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_interruptJoystick31
;interruptUart3.c,80 :: 		uart_receive3[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive3+0)
MOVT	R0, #hi_addr(_uart_receive3+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart3.c,79 :: 		for(i=0; i<10; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart3.c,81 :: 		}
IT	AL
BAL	L_interruptJoystick30
L_interruptJoystick31:
;interruptUart3.c,82 :: 		}
L_interruptJoystick29:
;interruptUart3.c,83 :: 		}
L_interruptJoystick24:
;interruptUart3.c,85 :: 		}
L_end_interruptJoystick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptJoystick
