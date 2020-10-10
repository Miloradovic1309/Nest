_uartSendCommandMotor:
;uartSend.c,4 :: 		void uartSendCommandMotor(unsigned short motorDirection, unsigned short motorSpeed){
; motorSpeed start address is: 4 (R1)
; motorDirection start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; motorSpeed end address is: 4 (R1)
; motorDirection end address is: 0 (R0)
; motorDirection start address is: 0 (R0)
; motorSpeed start address is: 4 (R1)
;uartSend.c,9 :: 		forSend[0] = 0xCA;
ADD	R4, SP, #4
MOVS	R2, #202
STRB	R2, [R4, #0]
;uartSend.c,10 :: 		forSend[1] = 0x41;
ADDS	R3, R4, #1
MOVS	R2, #65
STRB	R2, [R3, #0]
;uartSend.c,11 :: 		forSend[2] = (char)motorDirection;
ADDS	R2, R4, #2
STRB	R0, [R2, #0]
; motorDirection end address is: 0 (R0)
;uartSend.c,12 :: 		forSend[3] = (char)motorSpeed;
ADDS	R2, R4, #3
STRB	R1, [R2, #0]
; motorSpeed end address is: 4 (R1)
;uartSend.c,14 :: 		UART1_RXTX =1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(UART1_RXTX+0)
MOVT	R2, #hi_addr(UART1_RXTX+0)
_SX	[R2, ByteOffset(UART1_RXTX+0)]
;uartSend.c,16 :: 		UART1_Write(forSend[0]);
LDRB	R2, [R4, #0]
UXTH	R0, R2
BL	_UART1_Write+0
;uartSend.c,17 :: 		UART1_Write(forSend[1]);
ADD	R2, SP, #4
ADDS	R2, R2, #1
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_UART1_Write+0
;uartSend.c,18 :: 		UART1_Write(forSend[2]);
ADD	R2, SP, #4
ADDS	R2, R2, #2
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_UART1_Write+0
;uartSend.c,19 :: 		UART1_Write(forSend[3]);
ADD	R2, SP, #4
ADDS	R2, R2, #3
LDRB	R2, [R2, #0]
UXTH	R0, R2
BL	_UART1_Write+0
;uartSend.c,20 :: 		UART1_Write(crc8(forSend[2], forSend[3]));
ADD	R4, SP, #4
ADDS	R2, R4, #3
LDRB	R2, [R2, #0]
UXTB	R3, R2
ADDS	R2, R4, #2
LDRB	R2, [R2, #0]
UXTB	R1, R3
UXTB	R0, R2
BL	_crc8+0
BL	_UART1_Write+0
;uartSend.c,21 :: 		Delay_ms(5);
MOVW	R7, #17854
MOVT	R7, #4
NOP
NOP
L_uartSendCommandMotor0:
SUBS	R7, R7, #1
BNE	L_uartSendCommandMotor0
NOP
NOP
NOP
;uartSend.c,22 :: 		UART1_RXTX =0;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(UART1_RXTX+0)
MOVT	R2, #hi_addr(UART1_RXTX+0)
_SX	[R2, ByteOffset(UART1_RXTX+0)]
;uartSend.c,23 :: 		}
L_end_uartSendCommandMotor:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _uartSendCommandMotor
_uartSendStatusToStation:
;uartSend.c,28 :: 		void uartSendStatusToStation(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,29 :: 		UART6_Write(0x00);
MOVS	R0, #0
BL	_UART6_Write+0
;uartSend.c,30 :: 		UART6_Write(ADDRESS_STATION);
MOVS	R0, #48
BL	_UART6_Write+0
;uartSend.c,31 :: 		UART6_Write(FREQUENCY);
MOVS	R0, #23
BL	_UART6_Write+0
;uartSend.c,33 :: 		UART6_Write(0x21);
MOVS	R0, #33
BL	_UART6_Write+0
;uartSend.c,34 :: 		UART6_Write(0xC0);
MOVS	R0, #192
BL	_UART6_Write+0
;uartSend.c,35 :: 		UART6_Write(duzinaSignala2);
MOVW	R0, #lo_addr(_duzinaSignala2+0)
MOVT	R0, #hi_addr(_duzinaSignala2+0)
LDR	R0, [R0, #0]
BL	_UART6_Write+0
;uartSend.c,36 :: 		UART6_Write((gear_status & 0x07) | (velocity_mode_send << 3));
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
AND	R1, R0, #7
UXTH	R1, R1
MOVW	R0, #lo_addr(_velocity_mode_send+0)
MOVT	R0, #hi_addr(_velocity_mode_send+0)
LDRH	R0, [R0, #0]
LSLS	R0, R0, #3
UXTH	R0, R0
ORR	R0, R1, R0, LSL #0
BL	_UART6_Write+0
;uartSend.c,37 :: 		UART6_Write((boatBattery2 | boatBattery1 | boatNavigationLight | boatInteriorLight | boatControlTaken) & 0x1F);
MOVW	R0, #lo_addr(_boatBattery1+0)
MOVT	R0, #hi_addr(_boatBattery1+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_boatBattery2+0)
MOVT	R0, #hi_addr(_boatBattery2+0)
LDRB	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatNavigationLight+0)
MOVT	R0, #hi_addr(_boatNavigationLight+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatInteriorLight+0)
MOVT	R0, #hi_addr(_boatInteriorLight+0)
LDRB	R0, [R0, #0]
ORRS	R1, R0
UXTB	R1, R1
MOVW	R0, #lo_addr(_boatControlTaken+0)
MOVT	R0, #hi_addr(_boatControlTaken+0)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
UXTB	R0, R0
AND	R0, R0, #31
UXTB	R0, R0
BL	_UART6_Write+0
;uartSend.c,38 :: 		UART6_Write(boatBatteriesLavel);
MOVW	R0, #lo_addr(_boatBatteriesLavel+0)
MOVT	R0, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R0, #0]
BL	_UART6_Write+0
;uartSend.c,39 :: 		UART6_Write(0x3B);
MOVS	R0, #59
BL	_UART6_Write+0
;uartSend.c,40 :: 		}
L_end_uartSendStatusToStation:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uartSendStatusToStation
_uart4CheckNavigationLightStatus:
;uartSend.c,45 :: 		void uart4CheckNavigationLightStatus(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,47 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,48 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,49 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,50 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,51 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,52 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,53 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,54 :: 		}
L_end_uart4CheckNavigationLightStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4CheckNavigationLightStatus
_uart4CheckInteriorLightStatus:
;uartSend.c,56 :: 		void uart4CheckInteriorLightStatus(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,58 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,59 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,60 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,61 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,62 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,63 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,64 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,65 :: 		}
L_end_uart4CheckInteriorLightStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4CheckInteriorLightStatus
_uart4CheckBattery1Status:
;uartSend.c,67 :: 		void uart4CheckBattery1Status(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,69 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,70 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,71 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,72 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,73 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,74 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,75 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,76 :: 		}
L_end_uart4CheckBattery1Status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4CheckBattery1Status
_uart4CheckBattery2Status:
;uartSend.c,78 :: 		void uart4CheckBattery2Status(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,80 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,81 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,82 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,83 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,84 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,85 :: 		UART4_Write(0x60);
MOVS	R0, #96
BL	_UART4_Write+0
;uartSend.c,86 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,87 :: 		}
L_end_uart4CheckBattery2Status:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4CheckBattery2Status
_uart4NavigationLightTurnedOn:
;uartSend.c,90 :: 		void uart4NavigationLightTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,92 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,93 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,94 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,95 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,96 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,97 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,98 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,99 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,100 :: 		}
L_end_uart4NavigationLightTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4NavigationLightTurnedOn
_uart4NavigationLightTurnedOff:
;uartSend.c,102 :: 		void uart4NavigationLightTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,104 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,105 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,106 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,107 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,108 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,109 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,110 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,111 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,112 :: 		}
L_end_uart4NavigationLightTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4NavigationLightTurnedOff
_uart4InteriorLightTurnedOn:
;uartSend.c,114 :: 		void uart4InteriorLightTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,116 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,117 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,118 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,119 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,120 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,121 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,122 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,123 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,124 :: 		}
L_end_uart4InteriorLightTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4InteriorLightTurnedOn
_uart4InteriorLightTurnedOff:
;uartSend.c,126 :: 		void uart4InteriorLightTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,128 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,129 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,130 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,131 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,132 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,133 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,134 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,135 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,136 :: 		}
L_end_uart4InteriorLightTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4InteriorLightTurnedOff
_uart4Battery1TurnedOn:
;uartSend.c,139 :: 		void uart4Battery1TurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,141 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,142 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,143 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,144 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,145 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,146 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,147 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,148 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,149 :: 		}
L_end_uart4Battery1TurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1TurnedOn
_uart4Battery1TurnedOff:
;uartSend.c,151 :: 		void uart4Battery1TurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,153 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,154 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,155 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,156 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,157 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,158 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,159 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,160 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,161 :: 		}
L_end_uart4Battery1TurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1TurnedOff
_uart4Battery2TurnedOn:
;uartSend.c,163 :: 		void uart4Battery2TurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,165 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,166 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,167 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,168 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,169 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,170 :: 		UART4_Write(0x60);
MOVS	R0, #96
BL	_UART4_Write+0
;uartSend.c,171 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,172 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,173 :: 		}
L_end_uart4Battery2TurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2TurnedOn
_uart4Battery2TurnedOff:
;uartSend.c,175 :: 		void uart4Battery2TurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,177 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,178 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,179 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,180 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,181 :: 		UART4_Write(0x16);
MOVS	R0, #22
BL	_UART4_Write+0
;uartSend.c,182 :: 		UART4_Write(0x60);
MOVS	R0, #96
BL	_UART4_Write+0
;uartSend.c,183 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,184 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,185 :: 		}
L_end_uart4Battery2TurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2TurnedOff
_uart4LightingTurnedOn:
;uartSend.c,188 :: 		void uart4LightingTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,200 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,201 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,202 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,203 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,204 :: 		UART4_Write(0x13);
MOVS	R0, #19
BL	_UART4_Write+0
;uartSend.c,205 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,206 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,207 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,208 :: 		}
L_end_uart4LightingTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4LightingTurnedOn
_uart4LightingTurnedOff:
;uartSend.c,210 :: 		void uart4LightingTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,222 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,223 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,224 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,225 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,226 :: 		UART4_Write(0x13);
MOVS	R0, #19
BL	_UART4_Write+0
;uartSend.c,227 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,228 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,229 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,230 :: 		}
L_end_uart4LightingTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4LightingTurnedOff
_uart4Battery1Level4:
;uartSend.c,237 :: 		void uart4Battery1Level4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,239 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,240 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,241 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,242 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,243 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,244 :: 		UART4_Write(0x25);
MOVS	R0, #37
BL	_UART4_Write+0
;uartSend.c,245 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,246 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,248 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,249 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,250 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,251 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,252 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,253 :: 		UART4_Write(0x45);
MOVS	R0, #69
BL	_UART4_Write+0
;uartSend.c,254 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,255 :: 		UART4_Write(0x03);
MOVS	R0, #3
BL	_UART4_Write+0
;uartSend.c,257 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,258 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,259 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,260 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,261 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,262 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,263 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,264 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,266 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,267 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,268 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,269 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,270 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,271 :: 		UART4_Write(0x85);
MOVS	R0, #133
BL	_UART4_Write+0
;uartSend.c,272 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,273 :: 		UART4_Write(0x07);
MOVS	R0, #7
BL	_UART4_Write+0
;uartSend.c,274 :: 		}
L_end_uart4Battery1Level4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1Level4
_uart4Battery1Level3:
;uartSend.c,275 :: 		void uart4Battery1Level3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,277 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,278 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,279 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,280 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,281 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,282 :: 		UART4_Write(0x25);
MOVS	R0, #37
BL	_UART4_Write+0
;uartSend.c,283 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,284 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,286 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,287 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,288 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,289 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,290 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,291 :: 		UART4_Write(0x45);
MOVS	R0, #69
BL	_UART4_Write+0
;uartSend.c,292 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,293 :: 		UART4_Write(0x03);
MOVS	R0, #3
BL	_UART4_Write+0
;uartSend.c,295 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,296 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,297 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,298 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,299 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,300 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,301 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,302 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,304 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,305 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,306 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,307 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,308 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,309 :: 		UART4_Write(0x85);
MOVS	R0, #133
BL	_UART4_Write+0
;uartSend.c,310 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,311 :: 		UART4_Write(0x07);
MOVS	R0, #7
BL	_UART4_Write+0
;uartSend.c,312 :: 		}
L_end_uart4Battery1Level3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1Level3
_uart4Battery1Level2:
;uartSend.c,313 :: 		void uart4Battery1Level2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,315 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,316 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,317 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,318 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,319 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,320 :: 		UART4_Write(0x25);
MOVS	R0, #37
BL	_UART4_Write+0
;uartSend.c,321 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,322 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,324 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,325 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,326 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,327 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,328 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,329 :: 		UART4_Write(0x45);
MOVS	R0, #69
BL	_UART4_Write+0
;uartSend.c,330 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,331 :: 		UART4_Write(0x02);
MOVS	R0, #2
BL	_UART4_Write+0
;uartSend.c,333 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,334 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,335 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,336 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,337 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,338 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,339 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,340 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,342 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,343 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,344 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,345 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,346 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,347 :: 		UART4_Write(0x85);
MOVS	R0, #133
BL	_UART4_Write+0
;uartSend.c,348 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,349 :: 		UART4_Write(0x07);
MOVS	R0, #7
BL	_UART4_Write+0
;uartSend.c,350 :: 		}
L_end_uart4Battery1Level2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1Level2
_uart4Battery1Level1:
;uartSend.c,351 :: 		void uart4Battery1Level1(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,353 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,354 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,355 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,356 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,357 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,358 :: 		UART4_Write(0x25);
MOVS	R0, #37
BL	_UART4_Write+0
;uartSend.c,359 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,360 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,362 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,363 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,364 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,365 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,366 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,367 :: 		UART4_Write(0x45);
MOVS	R0, #69
BL	_UART4_Write+0
;uartSend.c,368 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,369 :: 		UART4_Write(0x02);
MOVS	R0, #2
BL	_UART4_Write+0
;uartSend.c,371 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,372 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,373 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,374 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,375 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,376 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,377 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,378 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,380 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,381 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,382 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,383 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,384 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,385 :: 		UART4_Write(0x85);
MOVS	R0, #133
BL	_UART4_Write+0
;uartSend.c,386 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,387 :: 		UART4_Write(0x10);
MOVS	R0, #16
BL	_UART4_Write+0
;uartSend.c,388 :: 		}
L_end_uart4Battery1Level1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1Level1
_uart4Battery1Level0:
;uartSend.c,389 :: 		void uart4Battery1Level0(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,391 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,392 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,393 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,394 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,395 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,396 :: 		UART4_Write(0x25);
MOVS	R0, #37
BL	_UART4_Write+0
;uartSend.c,397 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,398 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,400 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,401 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,402 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,403 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,404 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,405 :: 		UART4_Write(0x45);
MOVS	R0, #69
BL	_UART4_Write+0
;uartSend.c,406 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,407 :: 		UART4_Write(0x02);
MOVS	R0, #2
BL	_UART4_Write+0
;uartSend.c,409 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,410 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,411 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,412 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,413 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,414 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,415 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,416 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,418 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,419 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,420 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,421 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,422 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,423 :: 		UART4_Write(0x85);
MOVS	R0, #133
BL	_UART4_Write+0
;uartSend.c,424 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,425 :: 		UART4_Write(0x06);
MOVS	R0, #6
BL	_UART4_Write+0
;uartSend.c,426 :: 		}
L_end_uart4Battery1Level0:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery1Level0
_uart4Battery2Level4:
;uartSend.c,434 :: 		void uart4Battery2Level4(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,436 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,437 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,438 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,439 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,440 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,441 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,442 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,443 :: 		UART4_Write(0x09);
MOVS	R0, #9
BL	_UART4_Write+0
;uartSend.c,445 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,446 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,447 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,448 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,449 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,450 :: 		UART4_Write(0xC5);
MOVS	R0, #197
BL	_UART4_Write+0
;uartSend.c,451 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,452 :: 		UART4_Write(0x0B);
MOVS	R0, #11
BL	_UART4_Write+0
;uartSend.c,454 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,455 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,456 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,457 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,458 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,459 :: 		UART4_Write(0xE5);
MOVS	R0, #229
BL	_UART4_Write+0
;uartSend.c,460 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,461 :: 		UART4_Write(0x0D);
MOVS	R0, #13
BL	_UART4_Write+0
;uartSend.c,463 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,464 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,465 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,466 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,467 :: 		UART4_Write(0x52);
MOVS	R0, #82
BL	_UART4_Write+0
;uartSend.c,468 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,469 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,470 :: 		UART4_Write(0x0F);
MOVS	R0, #15
BL	_UART4_Write+0
;uartSend.c,471 :: 		}
L_end_uart4Battery2Level4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2Level4
_uart4Battery2Level3:
;uartSend.c,472 :: 		void uart4Battery2Level3(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,474 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,475 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,476 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,477 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,478 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,479 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,480 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,481 :: 		UART4_Write(0x08);
MOVS	R0, #8
BL	_UART4_Write+0
;uartSend.c,483 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,484 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,485 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,486 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,487 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,488 :: 		UART4_Write(0xC5);
MOVS	R0, #197
BL	_UART4_Write+0
;uartSend.c,489 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,490 :: 		UART4_Write(0x0B);
MOVS	R0, #11
BL	_UART4_Write+0
;uartSend.c,492 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,493 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,494 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,495 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,496 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,497 :: 		UART4_Write(0xE5);
MOVS	R0, #229
BL	_UART4_Write+0
;uartSend.c,498 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,499 :: 		UART4_Write(0x0D);
MOVS	R0, #13
BL	_UART4_Write+0
;uartSend.c,501 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,502 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,503 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,504 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,505 :: 		UART4_Write(0x52);
MOVS	R0, #82
BL	_UART4_Write+0
;uartSend.c,506 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,507 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,508 :: 		UART4_Write(0x0F);
MOVS	R0, #15
BL	_UART4_Write+0
;uartSend.c,509 :: 		}
L_end_uart4Battery2Level3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2Level3
_uart4Battery2Level2:
;uartSend.c,510 :: 		void uart4Battery2Level2(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,512 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,513 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,514 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,515 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,516 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,517 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,518 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,519 :: 		UART4_Write(0x08);
MOVS	R0, #8
BL	_UART4_Write+0
;uartSend.c,521 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,522 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,523 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,524 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,525 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,526 :: 		UART4_Write(0xC5);
MOVS	R0, #197
BL	_UART4_Write+0
;uartSend.c,527 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,528 :: 		UART4_Write(0x0A);
MOVS	R0, #10
BL	_UART4_Write+0
;uartSend.c,530 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,531 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,532 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,533 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,534 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,535 :: 		UART4_Write(0xE5);
MOVS	R0, #229
BL	_UART4_Write+0
;uartSend.c,536 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,537 :: 		UART4_Write(0x0D);
MOVS	R0, #13
BL	_UART4_Write+0
;uartSend.c,539 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,540 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,541 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,542 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,543 :: 		UART4_Write(0x52);
MOVS	R0, #82
BL	_UART4_Write+0
;uartSend.c,544 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,545 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,546 :: 		UART4_Write(0x0F);
MOVS	R0, #15
BL	_UART4_Write+0
;uartSend.c,547 :: 		}
L_end_uart4Battery2Level2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2Level2
_uart4Battery2Level1:
;uartSend.c,548 :: 		void uart4Battery2Level1(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,550 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,551 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,552 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,553 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,554 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,555 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,556 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,557 :: 		UART4_Write(0x08);
MOVS	R0, #8
BL	_UART4_Write+0
;uartSend.c,559 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,560 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,561 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,562 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,563 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,564 :: 		UART4_Write(0xC5);
MOVS	R0, #197
BL	_UART4_Write+0
;uartSend.c,565 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,566 :: 		UART4_Write(0x0A);
MOVS	R0, #10
BL	_UART4_Write+0
;uartSend.c,568 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,569 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,570 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,571 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,572 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,573 :: 		UART4_Write(0xE5);
MOVS	R0, #229
BL	_UART4_Write+0
;uartSend.c,574 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,575 :: 		UART4_Write(0x0C);
MOVS	R0, #12
BL	_UART4_Write+0
;uartSend.c,577 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,578 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,579 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,580 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,581 :: 		UART4_Write(0x52);
MOVS	R0, #82
BL	_UART4_Write+0
;uartSend.c,582 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,583 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,584 :: 		UART4_Write(0x11);
MOVS	R0, #17
BL	_UART4_Write+0
;uartSend.c,585 :: 		}
L_end_uart4Battery2Level1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2Level1
_uart4Battery2Level0:
;uartSend.c,586 :: 		void uart4Battery2Level0(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,588 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,589 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,590 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,591 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,592 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,593 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,594 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,595 :: 		UART4_Write(0x08);
MOVS	R0, #8
BL	_UART4_Write+0
;uartSend.c,597 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,598 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,599 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,600 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,601 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,602 :: 		UART4_Write(0xC5);
MOVS	R0, #197
BL	_UART4_Write+0
;uartSend.c,603 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,604 :: 		UART4_Write(0x0A);
MOVS	R0, #10
BL	_UART4_Write+0
;uartSend.c,606 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,607 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,608 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,609 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,610 :: 		UART4_Write(0x51);
MOVS	R0, #81
BL	_UART4_Write+0
;uartSend.c,611 :: 		UART4_Write(0xE5);
MOVS	R0, #229
BL	_UART4_Write+0
;uartSend.c,612 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,613 :: 		UART4_Write(0x0C);
MOVS	R0, #12
BL	_UART4_Write+0
;uartSend.c,615 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,616 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,617 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,618 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,619 :: 		UART4_Write(0x52);
MOVS	R0, #82
BL	_UART4_Write+0
;uartSend.c,620 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,621 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,622 :: 		UART4_Write(0x0E);
MOVS	R0, #14
BL	_UART4_Write+0
;uartSend.c,623 :: 		}
L_end_uart4Battery2Level0:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4Battery2Level0
_uart4TurtleCheckStatus:
;uartSend.c,625 :: 		void uart4TurtleCheckStatus(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,627 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,628 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,629 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,630 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,631 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,632 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,633 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,634 :: 		}
L_end_uart4TurtleCheckStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4TurtleCheckStatus
_uart4RabbitCheckStatus:
;uartSend.c,636 :: 		void uart4RabbitCheckStatus(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,638 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,639 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,640 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,641 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,642 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,643 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,644 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,645 :: 		}
L_end_uart4RabbitCheckStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4RabbitCheckStatus
_uart4LeopardCheckStatus:
;uartSend.c,647 :: 		void uart4LeopardCheckStatus(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,649 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,650 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,651 :: 		UART4_Write(0x04);
MOVS	R0, #4
BL	_UART4_Write+0
;uartSend.c,652 :: 		UART4_Write(0x83);
MOVS	R0, #131
BL	_UART4_Write+0
;uartSend.c,653 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,654 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,655 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,656 :: 		}
L_end_uart4LeopardCheckStatus:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4LeopardCheckStatus
_uart4TurtleTurnedOn:
;uartSend.c,658 :: 		void uart4TurtleTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,659 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,660 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,661 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,662 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,663 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,664 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,665 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,666 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,667 :: 		}
L_end_uart4TurtleTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4TurtleTurnedOn
_uart4TurtleTurnedOff:
;uartSend.c,669 :: 		void uart4TurtleTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,670 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,671 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,672 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,673 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,674 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,675 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,676 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,677 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,678 :: 		}
L_end_uart4TurtleTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4TurtleTurnedOff
_uart4RabbitTurnedOn:
;uartSend.c,680 :: 		void uart4RabbitTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,681 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,682 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,683 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,684 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,685 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,686 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,687 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,688 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,689 :: 		}
L_end_uart4RabbitTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4RabbitTurnedOn
_uart4RabbitTurnedOff:
;uartSend.c,691 :: 		void uart4RabbitTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,692 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,693 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,694 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,695 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,696 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,697 :: 		UART4_Write(0x20);
MOVS	R0, #32
BL	_UART4_Write+0
;uartSend.c,698 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,699 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,700 :: 		}
L_end_uart4RabbitTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4RabbitTurnedOff
_uart4LeopardTurnedOn:
;uartSend.c,702 :: 		void uart4LeopardTurnedOn(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,703 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,704 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,705 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,706 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,707 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,708 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,709 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,710 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,711 :: 		}
L_end_uart4LeopardTurnedOn:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4LeopardTurnedOn
_uart4LeopardTurnedOff:
;uartSend.c,713 :: 		void uart4LeopardTurnedOff(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,714 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,715 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,716 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,717 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,718 :: 		UART4_Write(0x18);
MOVS	R0, #24
BL	_UART4_Write+0
;uartSend.c,719 :: 		UART4_Write(0x40);
MOVS	R0, #64
BL	_UART4_Write+0
;uartSend.c,720 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,721 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,722 :: 		}
L_end_uart4LeopardTurnedOff:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4LeopardTurnedOff
_uart4SpeedModeTurtle:
;uartSend.c,724 :: 		void uart4SpeedModeTurtle(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,725 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,726 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,727 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,728 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,729 :: 		UART4_Write(0x54);
MOVS	R0, #84
BL	_UART4_Write+0
;uartSend.c,730 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,731 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,732 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,733 :: 		}
L_end_uart4SpeedModeTurtle:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4SpeedModeTurtle
_uart4SpeedModeRabbit:
;uartSend.c,735 :: 		void uart4SpeedModeRabbit(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,736 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,737 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,738 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,739 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,740 :: 		UART4_Write(0x54);
MOVS	R0, #84
BL	_UART4_Write+0
;uartSend.c,741 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,742 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,743 :: 		UART4_Write(0x01);
MOVS	R0, #1
BL	_UART4_Write+0
;uartSend.c,744 :: 		}
L_end_uart4SpeedModeRabbit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4SpeedModeRabbit
_uart4SpeedModeLeopard:
;uartSend.c,746 :: 		void uart4SpeedModeLeopard(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,747 :: 		UART4_Write(0x5A);
MOVS	R0, #90
BL	_UART4_Write+0
;uartSend.c,748 :: 		UART4_Write(0xA5);
MOVS	R0, #165
BL	_UART4_Write+0
;uartSend.c,749 :: 		UART4_Write(0x05);
MOVS	R0, #5
BL	_UART4_Write+0
;uartSend.c,750 :: 		UART4_Write(0x82);
MOVS	R0, #130
BL	_UART4_Write+0
;uartSend.c,751 :: 		UART4_Write(0x54);
MOVS	R0, #84
BL	_UART4_Write+0
;uartSend.c,752 :: 		UART4_Write(0x65);
MOVS	R0, #101
BL	_UART4_Write+0
;uartSend.c,753 :: 		UART4_Write(0x00);
MOVS	R0, #0
BL	_UART4_Write+0
;uartSend.c,754 :: 		UART4_Write(0x02);
MOVS	R0, #2
BL	_UART4_Write+0
;uartSend.c,755 :: 		}
L_end_uart4SpeedModeLeopard:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart4SpeedModeLeopard
_uart3SendJoystick:
;uartSend.c,761 :: 		void uart3SendJoystick(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,763 :: 		UART3_Write(0x21);
MOVS	R0, #33
BL	_UART3_Write+0
;uartSend.c,764 :: 		UART3_Write(0x40);
MOVS	R0, #64
BL	_UART3_Write+0
;uartSend.c,765 :: 		UART3_Write((char)gear_status);
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
BL	_UART3_Write+0
;uartSend.c,766 :: 		UART3_Write((char)dutyy);
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
BL	_UART3_Write+0
;uartSend.c,767 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_uart3SendJoystick2
;uartSend.c,768 :: 		UART3_Write(0x01);
MOVS	R0, #1
BL	_UART3_Write+0
;uartSend.c,769 :: 		}
IT	AL
BAL	L_uart3SendJoystick3
L_uart3SendJoystick2:
;uartSend.c,771 :: 		UART3_Write(0x00);
MOVS	R0, #0
BL	_UART3_Write+0
;uartSend.c,772 :: 		}
L_uart3SendJoystick3:
;uartSend.c,773 :: 		UART3_Write(0x3B);
MOVS	R0, #59
BL	_UART3_Write+0
;uartSend.c,774 :: 		}
L_end_uart3SendJoystick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart3SendJoystick
_uart3SendJoystickForced:
;uartSend.c,776 :: 		void uart3SendJoystickForced(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,778 :: 		UART3_Write(0x21);
MOVS	R0, #33
BL	_UART3_Write+0
;uartSend.c,779 :: 		UART3_Write(0x40);
MOVS	R0, #64
BL	_UART3_Write+0
;uartSend.c,780 :: 		UART3_Write((char)gear_status);
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
BL	_UART3_Write+0
;uartSend.c,781 :: 		UART3_Write((char)dutyy);
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
BL	_UART3_Write+0
;uartSend.c,782 :: 		UART3_Write(0x01);
MOVS	R0, #1
BL	_UART3_Write+0
;uartSend.c,783 :: 		UART3_Write(0x3B);
MOVS	R0, #59
BL	_UART3_Write+0
;uartSend.c,784 :: 		}
L_end_uart3SendJoystickForced:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart3SendJoystickForced
_uart3ResetSensorTouch:
;uartSend.c,786 :: 		void uart3ResetSensorTouch(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;uartSend.c,787 :: 		UART3_Write(0x21);
MOVS	R0, #33
BL	_UART3_Write+0
;uartSend.c,788 :: 		UART3_Write(0x45);
MOVS	R0, #69
BL	_UART3_Write+0
;uartSend.c,789 :: 		UART3_Write(0x01);
MOVS	R0, #1
BL	_UART3_Write+0
;uartSend.c,790 :: 		UART3_Write(0x01);
MOVS	R0, #1
BL	_UART3_Write+0
;uartSend.c,791 :: 		UART3_Write(0x01);
MOVS	R0, #1
BL	_UART3_Write+0
;uartSend.c,792 :: 		UART3_Write(0x3B);
MOVS	R0, #59
BL	_UART3_Write+0
;uartSend.c,793 :: 		}
L_end_uart3ResetSensorTouch:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _uart3ResetSensorTouch
