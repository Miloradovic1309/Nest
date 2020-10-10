_interruptLora:
;interruptUart6.c,9 :: 		void interruptLora() iv IVT_INT_USART6 ics ICS_AUTO {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;interruptUart6.c,10 :: 		receive6 = UART6_Read();
BL	_UART6_Read+0
MOVW	R1, #lo_addr(_receive6+0)
MOVT	R1, #hi_addr(_receive6+0)
STRB	R0, [R1, #0]
;interruptUart6.c,12 :: 		if((receive6 == 0x21)&&(!startReceivingData6)){
UXTB	R0, R0
CMP	R0, #33
IT	NE
BNE	L__interruptLora64
MOVW	R1, #lo_addr(_startReceivingData6+0)
MOVT	R1, #hi_addr(_startReceivingData6+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptLora63
L__interruptLora62:
;interruptUart6.c,13 :: 		uart_count6=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count6+0)
MOVT	R0, #hi_addr(_uart_count6+0)
STRH	R1, [R0, #0]
;interruptUart6.c,14 :: 		startReceivingData6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData6+0)
MOVT	R0, #hi_addr(_startReceivingData6+0)
STR	R1, [R0, #0]
;interruptUart6.c,15 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptLora3:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptLora4
;interruptUart6.c,16 :: 		uart_receive6[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart6.c,15 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart6.c,17 :: 		}
IT	AL
BAL	L_interruptLora3
L_interruptLora4:
;interruptUart6.c,18 :: 		}
IT	AL
BAL	L_interruptLora6
;interruptUart6.c,12 :: 		if((receive6 == 0x21)&&(!startReceivingData6)){
L__interruptLora64:
L__interruptLora63:
;interruptUart6.c,22 :: 		else if((receive6 == 0x3B)&&(startReceivingData6)&&(uart_count6 + 1 == uartLength6)){
MOVW	R0, #lo_addr(_receive6+0)
MOVT	R0, #hi_addr(_receive6+0)
LDRB	R0, [R0, #0]
CMP	R0, #59
IT	NE
BNE	L__interruptLora70
MOVW	R1, #lo_addr(_startReceivingData6+0)
MOVT	R1, #hi_addr(_startReceivingData6+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptLora69
MOVW	R0, #lo_addr(_uart_count6+0)
MOVT	R0, #hi_addr(_uart_count6+0)
LDRH	R0, [R0, #0]
ADDS	R1, R0, #1
UXTH	R1, R1
MOVW	R0, #lo_addr(_uartLength6+0)
MOVT	R0, #hi_addr(_uartLength6+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	NE
BNE	L__interruptLora68
L__interruptLora61:
;interruptUart6.c,23 :: 		uart_receive6[uart_count6] = receive6;
MOVW	R2, #lo_addr(_uart_count6+0)
MOVT	R2, #hi_addr(_uart_count6+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive6+0)
MOVT	R0, #hi_addr(_receive6+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart6.c,24 :: 		uart_count6 = 0;
MOVS	R0, #0
STRH	R0, [R2, #0]
;interruptUart6.c,25 :: 		startReceivingData6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData6+0)
MOVT	R0, #hi_addr(_startReceivingData6+0)
STR	R1, [R0, #0]
;interruptUart6.c,26 :: 		uartLength6 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength6+0)
MOVT	R0, #hi_addr(_uartLength6+0)
STRH	R1, [R0, #0]
;interruptUart6.c,34 :: 		if((uart_receive6[0]==0x21)&&(uart_receive6[1]==0xC0)&&(uart_receive6[6] = 0x3B)){
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
LDRB	R0, [R0, #0]
CMP	R0, #33
IT	NE
BNE	L__interruptLora67
MOVW	R0, #lo_addr(_uart_receive6+1)
MOVT	R0, #hi_addr(_uart_receive6+1)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	NE
BNE	L__interruptLora66
MOVS	R1, #59
MOVW	R0, #lo_addr(_uart_receive6+6)
MOVT	R0, #hi_addr(_uart_receive6+6)
STRB	R1, [R0, #0]
L__interruptLora60:
;interruptUart6.c,36 :: 		receivedCheckStatus = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_receivedCheckStatus+0)
MOVT	R0, #hi_addr(_receivedCheckStatus+0)
STR	R1, [R0, #0]
;interruptUart6.c,39 :: 		if(uart_receive6[4] & 0x02){
MOVW	R0, #lo_addr(_uart_receive6+4)
MOVT	R0, #hi_addr(_uart_receive6+4)
LDRB	R0, [R0, #0]
AND	R0, R0, #2
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora13
;interruptUart6.c,42 :: 		if(interiorLightState_old == 0){
MOVW	R0, #lo_addr(_interiorLightState_old+0)
MOVT	R0, #hi_addr(_interiorLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptLora14
;interruptUart6.c,43 :: 		interiorLightState = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
STRH	R1, [R0, #0]
;interruptUart6.c,44 :: 		uart4InteriorLightTurnedOn();
BL	_uart4InteriorLightTurnedOn+0
;interruptUart6.c,45 :: 		}
IT	AL
BAL	L_interruptLora15
L_interruptLora14:
;interruptUart6.c,46 :: 		else if(interiorLightState_old == 1){
MOVW	R0, #lo_addr(_interiorLightState_old+0)
MOVT	R0, #hi_addr(_interiorLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptLora16
;interruptUart6.c,47 :: 		interiorLightState = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
STRH	R1, [R0, #0]
;interruptUart6.c,48 :: 		uart4InteriorLightTurnedOff();
BL	_uart4InteriorLightTurnedOff+0
;interruptUart6.c,49 :: 		}
L_interruptLora16:
L_interruptLora15:
;interruptUart6.c,50 :: 		}
L_interruptLora13:
;interruptUart6.c,51 :: 		if(uart_receive6[4] & 0x04){
MOVW	R0, #lo_addr(_uart_receive6+4)
MOVT	R0, #hi_addr(_uart_receive6+4)
LDRB	R0, [R0, #0]
AND	R0, R0, #4
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora17
;interruptUart6.c,54 :: 		if(navigationLightState_old == 0){
MOVW	R0, #lo_addr(_navigationLightState_old+0)
MOVT	R0, #hi_addr(_navigationLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptLora18
;interruptUart6.c,55 :: 		navigationLightState = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
STRH	R1, [R0, #0]
;interruptUart6.c,56 :: 		uart4NavigationLightTurnedOn();
BL	_uart4NavigationLightTurnedOn+0
;interruptUart6.c,57 :: 		}
IT	AL
BAL	L_interruptLora19
L_interruptLora18:
;interruptUart6.c,58 :: 		else if(navigationLightState_old == 1){
MOVW	R0, #lo_addr(_navigationLightState_old+0)
MOVT	R0, #hi_addr(_navigationLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptLora20
;interruptUart6.c,59 :: 		navigationLightState = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
STRH	R1, [R0, #0]
;interruptUart6.c,60 :: 		uart4NavigationLightTurnedOff();
BL	_uart4NavigationLightTurnedOff+0
;interruptUart6.c,61 :: 		}
L_interruptLora20:
L_interruptLora19:
;interruptUart6.c,62 :: 		}
L_interruptLora17:
;interruptUart6.c,64 :: 		if(uart_receive6[4] & 0x08){
MOVW	R0, #lo_addr(_uart_receive6+4)
MOVT	R0, #hi_addr(_uart_receive6+4)
LDRB	R0, [R0, #0]
AND	R0, R0, #8
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora21
;interruptUart6.c,65 :: 		if(wannaBeActiveBattery1_old==0){
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptLora22
;interruptUart6.c,66 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart6.c,67 :: 		wannaBeActiveBattery2_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,68 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart6.c,70 :: 		uart4Battery1TurnedOn();
BL	_uart4Battery1TurnedOn+0
;interruptUart6.c,71 :: 		wannaBeActiveBattery1_old = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,72 :: 		wannaBeActiveBattery1 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart6.c,74 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart6.c,75 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart6.c,76 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart6.c,77 :: 		battery_chosen = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart6.c,79 :: 		}
IT	AL
BAL	L_interruptLora23
L_interruptLora22:
;interruptUart6.c,81 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart6.c,82 :: 		wannaBeActiveBattery1_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,83 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart6.c,85 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart6.c,86 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart6.c,87 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart6.c,88 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart6.c,89 :: 		}
L_interruptLora23:
;interruptUart6.c,91 :: 		}
L_interruptLora21:
;interruptUart6.c,94 :: 		if(uart_receive6[4] & 0x10){
MOVW	R0, #lo_addr(_uart_receive6+4)
MOVT	R0, #hi_addr(_uart_receive6+4)
LDRB	R0, [R0, #0]
AND	R0, R0, #16
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora24
;interruptUart6.c,95 :: 		if(wannaBeActiveBattery2_old==0){
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptLora25
;interruptUart6.c,96 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart6.c,97 :: 		wannaBeActiveBattery1_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,98 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart6.c,100 :: 		uart4Battery2TurnedOn();
BL	_uart4Battery2TurnedOn+0
;interruptUart6.c,101 :: 		wannaBeActiveBattery2_old = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,102 :: 		wannaBeActiveBattery2 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart6.c,104 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart6.c,105 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart6.c,106 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart6.c,107 :: 		battery_chosen = 2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart6.c,109 :: 		}
IT	AL
BAL	L_interruptLora26
L_interruptLora25:
;interruptUart6.c,111 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart6.c,112 :: 		wannaBeActiveBattery2_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart6.c,113 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart6.c,115 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart6.c,116 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart6.c,117 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart6.c,118 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart6.c,119 :: 		}
L_interruptLora26:
;interruptUart6.c,121 :: 		}
L_interruptLora24:
;interruptUart6.c,125 :: 		if(uart_receive6[4] & 0x01 == 0x01){
MOVW	R0, #lo_addr(_uart_receive6+4)
MOVT	R0, #hi_addr(_uart_receive6+4)
LDRB	R0, [R0, #0]
AND	R0, R0, #1
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora27
;interruptUart6.c,126 :: 		control_taken = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R1, [R0, #0]
;interruptUart6.c,127 :: 		bitControlTaken = 1;
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;interruptUart6.c,128 :: 		controlTakenCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_controlTakenCount+0)
MOVT	R0, #hi_addr(_controlTakenCount+0)
STRH	R1, [R0, #0]
;interruptUart6.c,129 :: 		countJoystickConnection = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_countJoystickConnection+0)
MOVT	R0, #hi_addr(_countJoystickConnection+0)
STRH	R1, [R0, #0]
;interruptUart6.c,130 :: 		bitCheckJoystick = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckJoystick+0)
MOVT	R0, #hi_addr(_bitCheckJoystick+0)
STR	R1, [R0, #0]
;interruptUart6.c,131 :: 		}
IT	AL
BAL	L_interruptLora28
L_interruptLora27:
;interruptUart6.c,133 :: 		control_taken = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R1, [R0, #0]
;interruptUart6.c,134 :: 		bitControlTaken = 0;
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;interruptUart6.c,135 :: 		controlTakenCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_controlTakenCount+0)
MOVT	R0, #hi_addr(_controlTakenCount+0)
STRH	R1, [R0, #0]
;interruptUart6.c,136 :: 		}
L_interruptLora28:
;interruptUart6.c,138 :: 		switch(uart_receive6[3] & 0x07){
MOVW	R0, #lo_addr(_uart_receive6+3)
MOVT	R0, #hi_addr(_uart_receive6+3)
LDRB	R0, [R0, #0]
AND	R2, R0, #7
UXTB	R2, R2
IT	AL
BAL	L_interruptLora29
;interruptUart6.c,139 :: 		case 1:
L_interruptLora31:
;interruptUart6.c,144 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora32
;interruptUart6.c,145 :: 		gear_status = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart6.c,146 :: 		}
L_interruptLora32:
;interruptUart6.c,148 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,149 :: 		case 2:
L_interruptLora33:
;interruptUart6.c,154 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora34
;interruptUart6.c,155 :: 		gear_status = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart6.c,156 :: 		}
L_interruptLora34:
;interruptUart6.c,158 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,159 :: 		case 3:
L_interruptLora35:
;interruptUart6.c,164 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora36
;interruptUart6.c,165 :: 		gear_status = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart6.c,166 :: 		}
L_interruptLora36:
;interruptUart6.c,168 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,169 :: 		case 4:
L_interruptLora37:
;interruptUart6.c,174 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora38
;interruptUart6.c,175 :: 		gear_status = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart6.c,176 :: 		}
L_interruptLora38:
;interruptUart6.c,177 :: 		stopGearBit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_stopGearBit+0)
MOVT	R0, #hi_addr(_stopGearBit+0)
STR	R1, [R0, #0]
;interruptUart6.c,179 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,180 :: 		case 5:
L_interruptLora39:
;interruptUart6.c,185 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora40
;interruptUart6.c,186 :: 		gear_status = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
STRH	R1, [R0, #0]
;interruptUart6.c,187 :: 		}
L_interruptLora40:
;interruptUart6.c,189 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,190 :: 		default:
L_interruptLora41:
;interruptUart6.c,191 :: 		gear_status = gear_status;
;interruptUart6.c,192 :: 		break;
IT	AL
BAL	L_interruptLora30
;interruptUart6.c,193 :: 		}
L_interruptLora29:
CMP	R2, #1
IT	EQ
BEQ	L_interruptLora31
CMP	R2, #2
IT	EQ
BEQ	L_interruptLora33
CMP	R2, #3
IT	EQ
BEQ	L_interruptLora35
CMP	R2, #4
IT	EQ
BEQ	L_interruptLora37
CMP	R2, #5
IT	EQ
BEQ	L_interruptLora39
IT	AL
BAL	L_interruptLora41
L_interruptLora30:
;interruptUart6.c,195 :: 		switch(uart_receive6[3] & 0x38){
MOVW	R0, #lo_addr(_uart_receive6+3)
MOVT	R0, #hi_addr(_uart_receive6+3)
LDRB	R0, [R0, #0]
AND	R0, R0, #56
STRB	R0, [SP, #4]
IT	AL
BAL	L_interruptLora42
;interruptUart6.c,197 :: 		case 0x08:
L_interruptLora44:
;interruptUart6.c,198 :: 		velocity_mode_save = VELOCITY_TURTLE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_velocity_mode_save+0)
MOVT	R0, #hi_addr(_velocity_mode_save+0)
STRH	R1, [R0, #0]
;interruptUart6.c,199 :: 		velocity_mode = VELOCITY_TURTLE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart6.c,200 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #0
BL	_change_velocity_mode+0
;interruptUart6.c,201 :: 		break;
IT	AL
BAL	L_interruptLora43
;interruptUart6.c,203 :: 		case 0x10:
L_interruptLora45:
;interruptUart6.c,204 :: 		velocity_mode_save = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode_save+0)
MOVT	R0, #hi_addr(_velocity_mode_save+0)
STRH	R1, [R0, #0]
;interruptUart6.c,205 :: 		velocity_mode = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart6.c,206 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #1
BL	_change_velocity_mode+0
;interruptUart6.c,207 :: 		break;
IT	AL
BAL	L_interruptLora43
;interruptUart6.c,209 :: 		case 0x20:
L_interruptLora46:
;interruptUart6.c,210 :: 		velocity_mode_save = VELOCITY_LEOPARD;
MOVS	R1, #2
MOVW	R0, #lo_addr(_velocity_mode_save+0)
MOVT	R0, #hi_addr(_velocity_mode_save+0)
STRH	R1, [R0, #0]
;interruptUart6.c,211 :: 		velocity_mode = VELOCITY_LEOPARD;
MOVS	R1, #2
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart6.c,212 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #2
BL	_change_velocity_mode+0
;interruptUart6.c,213 :: 		break;
IT	AL
BAL	L_interruptLora43
;interruptUart6.c,215 :: 		default:
L_interruptLora47:
;interruptUart6.c,216 :: 		break;
IT	AL
BAL	L_interruptLora43
;interruptUart6.c,218 :: 		}
L_interruptLora42:
LDRB	R0, [SP, #4]
CMP	R0, #8
IT	EQ
BEQ	L_interruptLora44
CMP	R0, #16
IT	EQ
BEQ	L_interruptLora45
CMP	R0, #32
IT	EQ
BEQ	L_interruptLora46
IT	AL
BAL	L_interruptLora47
L_interruptLora43:
;interruptUart6.c,220 :: 		boatWheelDir = uart_receive6[2];
MOVW	R0, #lo_addr(_uart_receive6+2)
MOVT	R0, #hi_addr(_uart_receive6+2)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatWheelDir+0)
MOVT	R0, #hi_addr(_boatWheelDir+0)
STRB	R1, [R0, #0]
;interruptUart6.c,34 :: 		if((uart_receive6[0]==0x21)&&(uart_receive6[1]==0xC0)&&(uart_receive6[6] = 0x3B)){
L__interruptLora67:
L__interruptLora66:
;interruptUart6.c,227 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptLora48:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptLora49
;interruptUart6.c,228 :: 		uart_receive6[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart6.c,227 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart6.c,229 :: 		}
IT	AL
BAL	L_interruptLora48
L_interruptLora49:
;interruptUart6.c,22 :: 		else if((receive6 == 0x3B)&&(startReceivingData6)&&(uart_count6 + 1 == uartLength6)){
L__interruptLora70:
L__interruptLora69:
L__interruptLora68:
;interruptUart6.c,234 :: 		}
L_interruptLora6:
;interruptUart6.c,237 :: 		if(startReceivingData6 == 1){
MOVW	R1, #lo_addr(_startReceivingData6+0)
MOVT	R1, #hi_addr(_startReceivingData6+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptLora51
;interruptUart6.c,238 :: 		uart_receive6[uart_count6] = receive6;
MOVW	R2, #lo_addr(_uart_count6+0)
MOVT	R2, #hi_addr(_uart_count6+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive6+0)
MOVT	R0, #hi_addr(_receive6+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart6.c,239 :: 		uart_count6++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R2, #0]
;interruptUart6.c,241 :: 		if(uart_count6 == 2)
CMP	R0, #2
IT	NE
BNE	L_interruptLora52
;interruptUart6.c,243 :: 		switch (uart_receive6[1])
IT	AL
BAL	L_interruptLora53
;interruptUart6.c,245 :: 		case 0xC0:
L_interruptLora55:
;interruptUart6.c,246 :: 		uartLength6 = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_uartLength6+0)
MOVT	R0, #hi_addr(_uartLength6+0)
STRH	R1, [R0, #0]
;interruptUart6.c,247 :: 		break;
IT	AL
BAL	L_interruptLora54
;interruptUart6.c,248 :: 		}
L_interruptLora53:
MOVW	R0, #lo_addr(_uart_receive6+1)
MOVT	R0, #hi_addr(_uart_receive6+1)
LDRB	R0, [R0, #0]
CMP	R0, #192
IT	EQ
BEQ	L_interruptLora55
L_interruptLora54:
;interruptUart6.c,249 :: 		}
L_interruptLora52:
;interruptUart6.c,251 :: 		if(uart_count6 > 11){
MOVW	R0, #lo_addr(_uart_count6+0)
MOVT	R0, #hi_addr(_uart_count6+0)
LDRH	R0, [R0, #0]
CMP	R0, #11
IT	LS
BLS	L_interruptLora56
;interruptUart6.c,252 :: 		uart_count6 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count6+0)
MOVT	R0, #hi_addr(_uart_count6+0)
STRH	R1, [R0, #0]
;interruptUart6.c,253 :: 		uartLength6 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uartLength6+0)
MOVT	R0, #hi_addr(_uartLength6+0)
STRH	R1, [R0, #0]
;interruptUart6.c,254 :: 		startReceivingData6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData6+0)
MOVT	R0, #hi_addr(_startReceivingData6+0)
STR	R1, [R0, #0]
;interruptUart6.c,255 :: 		for(i=0; i<12; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptLora57:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #12
IT	GE
BGE	L_interruptLora58
;interruptUart6.c,256 :: 		uart_receive6[i] = 0;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive6+0)
MOVT	R0, #hi_addr(_uart_receive6+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart6.c,255 :: 		for(i=0; i<12; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart6.c,257 :: 		}
IT	AL
BAL	L_interruptLora57
L_interruptLora58:
;interruptUart6.c,258 :: 		}
L_interruptLora56:
;interruptUart6.c,259 :: 		}
L_interruptLora51:
;interruptUart6.c,262 :: 		}
L_end_interruptLora:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _interruptLora
