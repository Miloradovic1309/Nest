_interruptDisplay:
;interruptUart4.c,8 :: 		void interruptDisplay() iv IVT_INT_UART4 ics ICS_AUTO {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;interruptUart4.c,9 :: 		receive4 = UART4_Read();
BL	_UART4_Read+0
MOVW	R1, #lo_addr(_receive4+0)
MOVT	R1, #hi_addr(_receive4+0)
STRB	R0, [R1, #0]
;interruptUart4.c,11 :: 		if (receive4 == 0x5A && rcv_count_helper4 == 0 && startReceivingData4 == 0x00) {
UXTB	R0, R0
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay121
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay120
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay119
L__interruptDisplay118:
;interruptUart4.c,12 :: 		rcv_helper4[0] = receive4;
MOVW	R0, #lo_addr(_receive4+0)
MOVT	R0, #hi_addr(_receive4+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_rcv_helper4+0)
MOVT	R0, #hi_addr(_rcv_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,13 :: 		rcv_count_helper4 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,14 :: 		}
IT	AL
BAL	L_interruptDisplay3
;interruptUart4.c,11 :: 		if (receive4 == 0x5A && rcv_count_helper4 == 0 && startReceivingData4 == 0x00) {
L__interruptDisplay121:
L__interruptDisplay120:
L__interruptDisplay119:
;interruptUart4.c,15 :: 		else if (receive4 == 0xA5 && rcv_count_helper4 == 1 && startReceivingData4 == 0x00) {
MOVW	R0, #lo_addr(_receive4+0)
MOVT	R0, #hi_addr(_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay124
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay123
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay122
L__interruptDisplay117:
;interruptUart4.c,16 :: 		rcv_helper4[1] = receive4;
MOVW	R0, #lo_addr(_receive4+0)
MOVT	R0, #hi_addr(_receive4+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_rcv_helper4+1)
MOVT	R0, #hi_addr(_rcv_helper4+1)
STRB	R1, [R0, #0]
;interruptUart4.c,17 :: 		rcv_count_helper4 = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,18 :: 		startReceivingData4 = 0x01;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData4+0)
MOVT	R0, #hi_addr(_startReceivingData4+0)
STR	R1, [R0, #0]
;interruptUart4.c,19 :: 		}
IT	AL
BAL	L_interruptDisplay7
;interruptUart4.c,15 :: 		else if (receive4 == 0xA5 && rcv_count_helper4 == 1 && startReceivingData4 == 0x00) {
L__interruptDisplay124:
L__interruptDisplay123:
L__interruptDisplay122:
;interruptUart4.c,20 :: 		else if (rcv_count_helper4 != 2 && startReceivingData4 == 0x00) {
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__interruptDisplay126
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay125
L__interruptDisplay116:
;interruptUart4.c,21 :: 		rcv_helper4[0] = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_helper4+0)
MOVT	R0, #hi_addr(_rcv_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,22 :: 		rcv_helper4[1] = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_helper4+1)
MOVT	R0, #hi_addr(_rcv_helper4+1)
STRB	R1, [R0, #0]
;interruptUart4.c,23 :: 		rcv_count_helper4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,24 :: 		uart_count4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
STRH	R1, [R0, #0]
;interruptUart4.c,25 :: 		}
IT	AL
BAL	L_interruptDisplay11
;interruptUart4.c,20 :: 		else if (rcv_count_helper4 != 2 && startReceivingData4 == 0x00) {
L__interruptDisplay126:
L__interruptDisplay125:
;interruptUart4.c,26 :: 		else if (rcv_count_helper4 == 2 && startReceivingData4 == 0x01) {
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__interruptDisplay128
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptDisplay127
L__interruptDisplay115:
;interruptUart4.c,27 :: 		uart_receive4[0] = rcv_helper4[0];
MOVW	R3, #lo_addr(_rcv_helper4+0)
MOVT	R3, #hi_addr(_rcv_helper4+0)
LDRB	R1, [R3, #0]
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,28 :: 		uart_receive4[1] = rcv_helper4[1];
MOVW	R2, #lo_addr(_rcv_helper4+1)
MOVT	R2, #hi_addr(_rcv_helper4+1)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
STRB	R1, [R0, #0]
;interruptUart4.c,29 :: 		rcv_count_helper4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,30 :: 		rcv_helper4[0] = 0x00;
MOVS	R0, #0
STRB	R0, [R3, #0]
;interruptUart4.c,31 :: 		rcv_helper4[1] = 0x00;
MOVS	R0, #0
STRB	R0, [R2, #0]
;interruptUart4.c,32 :: 		uart_receive4[2] = receive4;
MOVW	R2, #lo_addr(_receive4+0)
MOVT	R2, #hi_addr(_receive4+0)
LDRB	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
STRB	R1, [R0, #0]
;interruptUart4.c,33 :: 		uart_count4 = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
STRH	R1, [R0, #0]
;interruptUart4.c,34 :: 		if (uart_receive4[2] > 6) {
MOV	R0, R2
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	LS
BLS	L_interruptDisplay15
;interruptUart4.c,35 :: 		rcv_helper4[0] = 0x00;
MOVS	R0, #0
MOVW	R3, #lo_addr(_rcv_helper4+0)
MOVT	R3, #hi_addr(_rcv_helper4+0)
STRB	R0, [R3, #0]
;interruptUart4.c,36 :: 		rcv_helper4[1] = 0x00;
MOVS	R0, #0
MOVW	R2, #lo_addr(_rcv_helper4+1)
MOVT	R2, #hi_addr(_rcv_helper4+1)
STRB	R0, [R2, #0]
;interruptUart4.c,37 :: 		uart_count4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
STRH	R1, [R0, #0]
;interruptUart4.c,38 :: 		startReceivingData4 = 0x00;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData4+0)
MOVT	R0, #hi_addr(_startReceivingData4+0)
STR	R1, [R0, #0]
;interruptUart4.c,39 :: 		rcv_count_helper4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,40 :: 		rcv_helper4[0] = 0x00;
MOVS	R0, #0
STRB	R0, [R3, #0]
;interruptUart4.c,41 :: 		rcv_helper4[1] = 0x00;
MOVS	R0, #0
STRB	R0, [R2, #0]
;interruptUart4.c,43 :: 		for (i = 0; i < 10; i++) {
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptDisplay16:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_interruptDisplay17
;interruptUart4.c,44 :: 		uart_receive4[i] = 0x00;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart4.c,43 :: 		for (i = 0; i < 10; i++) {
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart4.c,45 :: 		}
IT	AL
BAL	L_interruptDisplay16
L_interruptDisplay17:
;interruptUart4.c,46 :: 		}
L_interruptDisplay15:
;interruptUart4.c,47 :: 		}
IT	AL
BAL	L_interruptDisplay19
;interruptUart4.c,26 :: 		else if (rcv_count_helper4 == 2 && startReceivingData4 == 0x01) {
L__interruptDisplay128:
L__interruptDisplay127:
;interruptUart4.c,48 :: 		else if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 < uart_receive4[2] + 3) {
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay131
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptDisplay130
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CS
BCS	L__interruptDisplay129
L__interruptDisplay114:
;interruptUart4.c,49 :: 		uart_receive4[uart_count4] = receive4;
MOVW	R2, #lo_addr(_uart_count4+0)
MOVT	R2, #hi_addr(_uart_count4+0)
LDRH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
ADDS	R1, R0, R1
MOVW	R0, #lo_addr(_receive4+0)
MOVT	R0, #hi_addr(_receive4+0)
LDRB	R0, [R0, #0]
STRB	R0, [R1, #0]
;interruptUart4.c,50 :: 		uart_count4++;
MOV	R0, R2
LDRH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart4.c,48 :: 		else if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 < uart_receive4[2] + 3) {
L__interruptDisplay131:
L__interruptDisplay130:
L__interruptDisplay129:
;interruptUart4.c,51 :: 		}
L_interruptDisplay19:
L_interruptDisplay11:
L_interruptDisplay7:
L_interruptDisplay3:
;interruptUart4.c,53 :: 		if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 >= uart_receive4[2] + 3) {
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay190
MOVW	R1, #lo_addr(_startReceivingData4+0)
MOVT	R1, #hi_addr(_startReceivingData4+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__interruptDisplay189
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__interruptDisplay188
L__interruptDisplay113:
;interruptUart4.c,54 :: 		if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay139
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay138
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay137
;interruptUart4.c,55 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay136
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #22
IT	NE
BNE	L__interruptDisplay135
;interruptUart4.c,56 :: 		&& uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay134
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay133
;interruptUart4.c,57 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay132
L__interruptDisplay112:
;interruptUart4.c,59 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay29
;interruptUart4.c,60 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay30
;interruptUart4.c,62 :: 		navigationLightState = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
STRH	R1, [R0, #0]
;interruptUart4.c,63 :: 		}
IT	AL
BAL	L_interruptDisplay31
L_interruptDisplay30:
;interruptUart4.c,66 :: 		navigationLightState = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_navigationLightState+0)
MOVT	R0, #hi_addr(_navigationLightState+0)
STRH	R1, [R0, #0]
;interruptUart4.c,67 :: 		}
L_interruptDisplay31:
;interruptUart4.c,68 :: 		}
IT	AL
BAL	L_interruptDisplay32
L_interruptDisplay29:
;interruptUart4.c,70 :: 		if(navigationLightState_old == 1){
MOVW	R0, #lo_addr(_navigationLightState_old+0)
MOVT	R0, #hi_addr(_navigationLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay33
;interruptUart4.c,72 :: 		navLightOn = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_navLightOn+0)
MOVT	R0, #hi_addr(_navLightOn+0)
STR	R1, [R0, #0]
;interruptUart4.c,75 :: 		}
IT	AL
BAL	L_interruptDisplay34
L_interruptDisplay33:
;interruptUart4.c,78 :: 		navLightOff = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_navLightOff+0)
MOVT	R0, #hi_addr(_navLightOff+0)
STR	R1, [R0, #0]
;interruptUart4.c,80 :: 		}
L_interruptDisplay34:
;interruptUart4.c,81 :: 		}
L_interruptDisplay32:
;interruptUart4.c,82 :: 		}
IT	AL
BAL	L_interruptDisplay35
;interruptUart4.c,54 :: 		if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay139:
L__interruptDisplay138:
L__interruptDisplay137:
;interruptUart4.c,55 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
L__interruptDisplay136:
L__interruptDisplay135:
;interruptUart4.c,56 :: 		&& uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
L__interruptDisplay134:
L__interruptDisplay133:
;interruptUart4.c,57 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay132:
;interruptUart4.c,83 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay147
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay146
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay145
;interruptUart4.c,84 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay144
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #22
IT	NE
BNE	L__interruptDisplay143
;interruptUart4.c,85 :: 		&& uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__interruptDisplay142
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay141
;interruptUart4.c,86 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay140
L__interruptDisplay111:
;interruptUart4.c,88 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay39
;interruptUart4.c,89 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay40
;interruptUart4.c,91 :: 		interiorLightState = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
STRH	R1, [R0, #0]
;interruptUart4.c,92 :: 		}
IT	AL
BAL	L_interruptDisplay41
L_interruptDisplay40:
;interruptUart4.c,95 :: 		interiorLightState = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_interiorLightState+0)
MOVT	R0, #hi_addr(_interiorLightState+0)
STRH	R1, [R0, #0]
;interruptUart4.c,96 :: 		}
L_interruptDisplay41:
;interruptUart4.c,97 :: 		}
IT	AL
BAL	L_interruptDisplay42
L_interruptDisplay39:
;interruptUart4.c,99 :: 		if(interiorLightState_old == 1){
MOVW	R0, #lo_addr(_interiorLightState_old+0)
MOVT	R0, #hi_addr(_interiorLightState_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay43
;interruptUart4.c,101 :: 		intLightOn = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_intLightOn+0)
MOVT	R0, #hi_addr(_intLightOn+0)
STR	R1, [R0, #0]
;interruptUart4.c,102 :: 		}
IT	AL
BAL	L_interruptDisplay44
L_interruptDisplay43:
;interruptUart4.c,105 :: 		intLightOff = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_intLightOff+0)
MOVT	R0, #hi_addr(_intLightOff+0)
STR	R1, [R0, #0]
;interruptUart4.c,106 :: 		}
L_interruptDisplay44:
;interruptUart4.c,107 :: 		}
L_interruptDisplay42:
;interruptUart4.c,108 :: 		}
IT	AL
BAL	L_interruptDisplay45
;interruptUart4.c,83 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay147:
L__interruptDisplay146:
L__interruptDisplay145:
;interruptUart4.c,84 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
L__interruptDisplay144:
L__interruptDisplay143:
;interruptUart4.c,85 :: 		&& uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
L__interruptDisplay142:
L__interruptDisplay141:
;interruptUart4.c,86 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay140:
;interruptUart4.c,109 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay155
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay154
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay153
;interruptUart4.c,110 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay152
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #22
IT	NE
BNE	L__interruptDisplay151
;interruptUart4.c,111 :: 		&& uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L__interruptDisplay150
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay149
;interruptUart4.c,112 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay148
L__interruptDisplay110:
;interruptUart4.c,114 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay49
;interruptUart4.c,115 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay50
;interruptUart4.c,118 :: 		wannaBeActiveBattery1 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart4.c,119 :: 		if(wannaBeActiveBattery1 != wannaBeActiveBattery1_old){
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_interruptDisplay51
;interruptUart4.c,120 :: 		wannaBeActiveBattery1_old = wannaBeActiveBattery1;
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,122 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart4.c,123 :: 		wannaBeActiveBattery2_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,124 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart4.c,126 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart4.c,127 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart4.c,128 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart4.c,129 :: 		battery_chosen = 1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart4.c,130 :: 		}
L_interruptDisplay51:
;interruptUart4.c,131 :: 		}
IT	AL
BAL	L_interruptDisplay52
L_interruptDisplay50:
;interruptUart4.c,136 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart4.c,137 :: 		if(wannaBeActiveBattery1 != wannaBeActiveBattery1_old){
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptDisplay53
;interruptUart4.c,138 :: 		wannaBeActiveBattery1_old = wannaBeActiveBattery1;
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,140 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart4.c,141 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart4.c,142 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart4.c,143 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart4.c,144 :: 		}
L_interruptDisplay53:
;interruptUart4.c,145 :: 		}
L_interruptDisplay52:
;interruptUart4.c,146 :: 		}
IT	AL
BAL	L_interruptDisplay54
L_interruptDisplay49:
;interruptUart4.c,148 :: 		if(wannaBeActiveBattery1_old == 1){
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay55
;interruptUart4.c,149 :: 		uart4Battery1TurnedOn();
BL	_uart4Battery1TurnedOn+0
;interruptUart4.c,150 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart4.c,151 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;interruptUart4.c,152 :: 		}
IT	AL
BAL	L_interruptDisplay56
L_interruptDisplay55:
;interruptUart4.c,154 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart4.c,155 :: 		if(wannaBeActiveBattery2_old == 1){
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay57
;interruptUart4.c,156 :: 		uart4Battery2TurnedOn();
BL	_uart4Battery2TurnedOn+0
;interruptUart4.c,157 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;interruptUart4.c,158 :: 		}
IT	AL
BAL	L_interruptDisplay58
L_interruptDisplay57:
;interruptUart4.c,160 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart4.c,161 :: 		uart4LightingTurnedOff();
BL	_uart4LightingTurnedOff+0
;interruptUart4.c,162 :: 		}
L_interruptDisplay58:
;interruptUart4.c,163 :: 		}
L_interruptDisplay56:
;interruptUart4.c,164 :: 		}
L_interruptDisplay54:
;interruptUart4.c,168 :: 		}
IT	AL
BAL	L_interruptDisplay59
;interruptUart4.c,109 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay155:
L__interruptDisplay154:
L__interruptDisplay153:
;interruptUart4.c,110 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
L__interruptDisplay152:
L__interruptDisplay151:
;interruptUart4.c,111 :: 		&& uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
L__interruptDisplay150:
L__interruptDisplay149:
;interruptUart4.c,112 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay148:
;interruptUart4.c,169 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay163
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay162
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay161
;interruptUart4.c,170 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay160
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #22
IT	NE
BNE	L__interruptDisplay159
;interruptUart4.c,171 :: 		&& uart_receive4[5] == 0x60 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #96
IT	NE
BNE	L__interruptDisplay158
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay157
;interruptUart4.c,172 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay156
L__interruptDisplay109:
;interruptUart4.c,174 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay63
;interruptUart4.c,175 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay64
;interruptUart4.c,177 :: 		wannaBeActiveBattery2 = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart4.c,178 :: 		if(wannaBeActiveBattery2 != wannaBeActiveBattery2_old){
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_interruptDisplay65
;interruptUart4.c,179 :: 		wannaBeActiveBattery2_old = wannaBeActiveBattery2;
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,181 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart4.c,182 :: 		wannaBeActiveBattery1_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,183 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;interruptUart4.c,186 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart4.c,187 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart4.c,188 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart4.c,189 :: 		battery_chosen = 2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart4.c,190 :: 		}
L_interruptDisplay65:
;interruptUart4.c,191 :: 		}
IT	AL
BAL	L_interruptDisplay66
L_interruptDisplay64:
;interruptUart4.c,193 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;interruptUart4.c,194 :: 		if(wannaBeActiveBattery2 != wannaBeActiveBattery2_old){
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptDisplay67
;interruptUart4.c,195 :: 		wannaBeActiveBattery2_old = wannaBeActiveBattery2;
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;interruptUart4.c,197 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;interruptUart4.c,198 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;interruptUart4.c,199 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;interruptUart4.c,200 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;interruptUart4.c,201 :: 		}
L_interruptDisplay67:
;interruptUart4.c,202 :: 		}
L_interruptDisplay66:
;interruptUart4.c,204 :: 		}
IT	AL
BAL	L_interruptDisplay68
L_interruptDisplay63:
;interruptUart4.c,206 :: 		if(wannaBeActiveBattery2_old == 1){
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay69
;interruptUart4.c,207 :: 		uart4Battery2TurnedOn();
BL	_uart4Battery2TurnedOn+0
;interruptUart4.c,208 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart4.c,209 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;interruptUart4.c,210 :: 		}
IT	AL
BAL	L_interruptDisplay70
L_interruptDisplay69:
;interruptUart4.c,212 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;interruptUart4.c,213 :: 		if(wannaBeActiveBattery1_old == 1){
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay71
;interruptUart4.c,214 :: 		uart4Battery1TurnedOn();
BL	_uart4Battery1TurnedOn+0
;interruptUart4.c,215 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;interruptUart4.c,216 :: 		}
IT	AL
BAL	L_interruptDisplay72
L_interruptDisplay71:
;interruptUart4.c,218 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;interruptUart4.c,219 :: 		uart4LightingTurnedOff();
BL	_uart4LightingTurnedOff+0
;interruptUart4.c,220 :: 		}
L_interruptDisplay72:
;interruptUart4.c,221 :: 		}
L_interruptDisplay70:
;interruptUart4.c,222 :: 		}
L_interruptDisplay68:
;interruptUart4.c,224 :: 		}
IT	AL
BAL	L_interruptDisplay73
;interruptUart4.c,169 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay163:
L__interruptDisplay162:
L__interruptDisplay161:
;interruptUart4.c,170 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x16
L__interruptDisplay160:
L__interruptDisplay159:
;interruptUart4.c,171 :: 		&& uart_receive4[5] == 0x60 && uart_receive4[6] == 0x01
L__interruptDisplay158:
L__interruptDisplay157:
;interruptUart4.c,172 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay156:
;interruptUart4.c,227 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay171
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay170
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay169
;interruptUart4.c,228 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay168
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #24
IT	NE
BNE	L__interruptDisplay167
;interruptUart4.c,229 :: 		&& uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay166
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay165
;interruptUart4.c,230 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay164
L__interruptDisplay108:
;interruptUart4.c,232 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay77
;interruptUart4.c,234 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay78
;interruptUart4.c,235 :: 		if(velocity_mode != VELOCITY_TURTLE){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_interruptDisplay79
;interruptUart4.c,236 :: 		velocity_mode_new = VELOCITY_TURTLE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_velocity_mode_new+0)
MOVT	R0, #hi_addr(_velocity_mode_new+0)
STRH	R1, [R0, #0]
;interruptUart4.c,237 :: 		velocity_mode = VELOCITY_TURTLE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart4.c,238 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #0
BL	_change_velocity_mode+0
;interruptUart4.c,239 :: 		}
L_interruptDisplay79:
;interruptUart4.c,240 :: 		}
IT	AL
BAL	L_interruptDisplay80
L_interruptDisplay78:
;interruptUart4.c,242 :: 		if(velocity_mode == VELOCITY_TURTLE){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay81
;interruptUart4.c,243 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,244 :: 		}
L_interruptDisplay81:
;interruptUart4.c,245 :: 		}
L_interruptDisplay80:
;interruptUart4.c,246 :: 		}
IT	AL
BAL	L_interruptDisplay82
L_interruptDisplay77:
;interruptUart4.c,248 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,255 :: 		}
L_interruptDisplay82:
;interruptUart4.c,257 :: 		}
IT	AL
BAL	L_interruptDisplay83
;interruptUart4.c,227 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay171:
L__interruptDisplay170:
L__interruptDisplay169:
;interruptUart4.c,228 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
L__interruptDisplay168:
L__interruptDisplay167:
;interruptUart4.c,229 :: 		&& uart_receive4[5] == 0x00 && uart_receive4[6] == 0x01
L__interruptDisplay166:
L__interruptDisplay165:
;interruptUart4.c,230 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay164:
;interruptUart4.c,261 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay179
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay178
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay177
;interruptUart4.c,262 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay176
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #24
IT	NE
BNE	L__interruptDisplay175
;interruptUart4.c,263 :: 		&& uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #32
IT	NE
BNE	L__interruptDisplay174
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay173
;interruptUart4.c,264 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay172
L__interruptDisplay107:
;interruptUart4.c,266 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay87
;interruptUart4.c,268 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay88
;interruptUart4.c,269 :: 		if(velocity_mode != VELOCITY_RABBIT){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_interruptDisplay89
;interruptUart4.c,270 :: 		velocity_mode_new = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode_new+0)
MOVT	R0, #hi_addr(_velocity_mode_new+0)
STRH	R1, [R0, #0]
;interruptUart4.c,271 :: 		velocity_mode = VELOCITY_RABBIT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart4.c,272 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #1
BL	_change_velocity_mode+0
;interruptUart4.c,273 :: 		}
L_interruptDisplay89:
;interruptUart4.c,274 :: 		}
IT	AL
BAL	L_interruptDisplay90
L_interruptDisplay88:
;interruptUart4.c,276 :: 		if(velocity_mode == VELOCITY_RABBIT){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_interruptDisplay91
;interruptUart4.c,277 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,278 :: 		}
L_interruptDisplay91:
;interruptUart4.c,279 :: 		}
L_interruptDisplay90:
;interruptUart4.c,280 :: 		}
IT	AL
BAL	L_interruptDisplay92
L_interruptDisplay87:
;interruptUart4.c,282 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,290 :: 		}
L_interruptDisplay92:
;interruptUart4.c,292 :: 		}
IT	AL
BAL	L_interruptDisplay93
;interruptUart4.c,261 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay179:
L__interruptDisplay178:
L__interruptDisplay177:
;interruptUart4.c,262 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
L__interruptDisplay176:
L__interruptDisplay175:
;interruptUart4.c,263 :: 		&& uart_receive4[5] == 0x20 && uart_receive4[6] == 0x01
L__interruptDisplay174:
L__interruptDisplay173:
;interruptUart4.c,264 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay172:
;interruptUart4.c,297 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
LDRB	R0, [R0, #0]
CMP	R0, #90
IT	NE
BNE	L__interruptDisplay187
MOVW	R0, #lo_addr(_uart_receive4+1)
MOVT	R0, #hi_addr(_uart_receive4+1)
LDRB	R0, [R0, #0]
CMP	R0, #165
IT	NE
BNE	L__interruptDisplay186
MOVW	R0, #lo_addr(_uart_receive4+2)
MOVT	R0, #hi_addr(_uart_receive4+2)
LDRB	R0, [R0, #0]
CMP	R0, #6
IT	NE
BNE	L__interruptDisplay185
;interruptUart4.c,298 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
MOVW	R0, #lo_addr(_uart_receive4+3)
MOVT	R0, #hi_addr(_uart_receive4+3)
LDRB	R0, [R0, #0]
CMP	R0, #131
IT	NE
BNE	L__interruptDisplay184
MOVW	R0, #lo_addr(_uart_receive4+4)
MOVT	R0, #hi_addr(_uart_receive4+4)
LDRB	R0, [R0, #0]
CMP	R0, #24
IT	NE
BNE	L__interruptDisplay183
;interruptUart4.c,299 :: 		&& uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
MOVW	R0, #lo_addr(_uart_receive4+5)
MOVT	R0, #hi_addr(_uart_receive4+5)
LDRB	R0, [R0, #0]
CMP	R0, #64
IT	NE
BNE	L__interruptDisplay182
MOVW	R0, #lo_addr(_uart_receive4+6)
MOVT	R0, #hi_addr(_uart_receive4+6)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__interruptDisplay181
;interruptUart4.c,300 :: 		&& uart_receive4[7] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+7)
MOVT	R0, #hi_addr(_uart_receive4+7)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__interruptDisplay180
L__interruptDisplay106:
;interruptUart4.c,302 :: 		if(!control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay97
;interruptUart4.c,304 :: 		if (uart_receive4[8] == 0x00) {
MOVW	R0, #lo_addr(_uart_receive4+8)
MOVT	R0, #hi_addr(_uart_receive4+8)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_interruptDisplay98
;interruptUart4.c,305 :: 		if(velocity_mode != VELOCITY_LEOPARD){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_interruptDisplay99
;interruptUart4.c,306 :: 		velocity_mode_new = VELOCITY_LEOPARD;
MOVS	R1, #2
MOVW	R0, #lo_addr(_velocity_mode_new+0)
MOVT	R0, #hi_addr(_velocity_mode_new+0)
STRH	R1, [R0, #0]
;interruptUart4.c,307 :: 		velocity_mode = VELOCITY_LEOPARD;
MOVS	R1, #2
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
STRH	R1, [R0, #0]
;interruptUart4.c,308 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #2
BL	_change_velocity_mode+0
;interruptUart4.c,309 :: 		}
L_interruptDisplay99:
;interruptUart4.c,310 :: 		}
IT	AL
BAL	L_interruptDisplay100
L_interruptDisplay98:
;interruptUart4.c,312 :: 		if(velocity_mode == VELOCITY_LEOPARD){
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_interruptDisplay101
;interruptUart4.c,313 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,314 :: 		}
L_interruptDisplay101:
;interruptUart4.c,315 :: 		}
L_interruptDisplay100:
;interruptUart4.c,316 :: 		}
IT	AL
BAL	L_interruptDisplay102
L_interruptDisplay97:
;interruptUart4.c,318 :: 		change_velocity_mode(velocity_mode);
MOVW	R0, #lo_addr(_velocity_mode+0)
MOVT	R0, #hi_addr(_velocity_mode+0)
LDRH	R0, [R0, #0]
BL	_change_velocity_mode+0
;interruptUart4.c,325 :: 		}
L_interruptDisplay102:
;interruptUart4.c,297 :: 		else if (uart_receive4[0] == 0x5A && uart_receive4[1] == 0xA5 && uart_receive4[2] == 0x06
L__interruptDisplay187:
L__interruptDisplay186:
L__interruptDisplay185:
;interruptUart4.c,298 :: 		&& uart_receive4[3] == 0x83 && uart_receive4[4] == 0x18
L__interruptDisplay184:
L__interruptDisplay183:
;interruptUart4.c,299 :: 		&& uart_receive4[5] == 0x40 && uart_receive4[6] == 0x01
L__interruptDisplay182:
L__interruptDisplay181:
;interruptUart4.c,300 :: 		&& uart_receive4[7] == 0x00) {
L__interruptDisplay180:
;interruptUart4.c,327 :: 		}
L_interruptDisplay93:
L_interruptDisplay83:
L_interruptDisplay73:
L_interruptDisplay59:
L_interruptDisplay45:
L_interruptDisplay35:
;interruptUart4.c,330 :: 		uart_count4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_uart_count4+0)
MOVT	R0, #hi_addr(_uart_count4+0)
STRH	R1, [R0, #0]
;interruptUart4.c,331 :: 		startReceivingData4 = 0x00;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_startReceivingData4+0)
MOVT	R0, #hi_addr(_startReceivingData4+0)
STR	R1, [R0, #0]
;interruptUart4.c,332 :: 		rcv_count_helper4 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_count_helper4+0)
MOVT	R0, #hi_addr(_rcv_count_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,333 :: 		rcv_helper4[0] = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_helper4+0)
MOVT	R0, #hi_addr(_rcv_helper4+0)
STRB	R1, [R0, #0]
;interruptUart4.c,334 :: 		rcv_helper4[1] = 0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rcv_helper4+1)
MOVT	R0, #hi_addr(_rcv_helper4+1)
STRB	R1, [R0, #0]
;interruptUart4.c,336 :: 		for (i = 0; i < 10; i++) {
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_interruptDisplay103:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GE
BGE	L_interruptDisplay104
;interruptUart4.c,337 :: 		uart_receive4[i] = 0x00;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(_uart_receive4+0)
MOVT	R0, #hi_addr(_uart_receive4+0)
ADDS	R1, R0, R1
MOVS	R0, #0
STRB	R0, [R1, #0]
;interruptUart4.c,336 :: 		for (i = 0; i < 10; i++) {
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;interruptUart4.c,338 :: 		}
IT	AL
BAL	L_interruptDisplay103
L_interruptDisplay104:
;interruptUart4.c,53 :: 		if (rcv_count_helper4 == 0 && startReceivingData4 == 0x01 && uart_count4 >= uart_receive4[2] + 3) {
L__interruptDisplay190:
L__interruptDisplay189:
L__interruptDisplay188:
;interruptUart4.c,340 :: 		}
L_end_interruptDisplay:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _interruptDisplay
