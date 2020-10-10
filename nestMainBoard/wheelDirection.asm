_directionWheelADC:
;wheelDirection.c,6 :: 		void directionWheelADC(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;wheelDirection.c,8 :: 		if(dutyy > 150){
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
CMP	R0, #150
IT	LE
BLE	L_directionWheelADC0
;wheelDirection.c,9 :: 		wheel_position_angle_double = (((double)dutyy - 150) * (double)45) / (double)100;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17174
VMOV	S0, R0
VSUB.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #16948
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_wheel_position_angle_double+0)
MOVT	R0, #hi_addr(_wheel_position_angle_double+0)
VSTR	#1, S0, [R0, #0]
;wheelDirection.c,10 :: 		wheel_position_angle = (unsigned int)wheel_position_angle_double;
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
MOVW	R0, #lo_addr(_wheel_position_angle+0)
MOVT	R0, #hi_addr(_wheel_position_angle+0)
STRH	R1, [R0, #0]
;wheelDirection.c,12 :: 		wheel_position_direction = WHEEL_DIRECTION_LEFT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_wheel_position_direction+0)
MOVT	R0, #hi_addr(_wheel_position_direction+0)
STRH	R1, [R0, #0]
;wheelDirection.c,13 :: 		}
IT	AL
BAL	L_directionWheelADC1
L_directionWheelADC0:
;wheelDirection.c,14 :: 		else if(dutyy < 150){
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
CMP	R0, #150
IT	GE
BGE	L_directionWheelADC2
;wheelDirection.c,15 :: 		wheel_position_angle_double = (((double)150 - (double)dutyy) * (double)45) / (double)100;
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17174
VMOV	S0, R0
VSUB.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #16948
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_wheel_position_angle_double+0)
MOVT	R0, #hi_addr(_wheel_position_angle_double+0)
VSTR	#1, S0, [R0, #0]
;wheelDirection.c,16 :: 		wheel_position_angle = (unsigned int)wheel_position_angle_double;
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
MOVW	R0, #lo_addr(_wheel_position_angle+0)
MOVT	R0, #hi_addr(_wheel_position_angle+0)
STRH	R1, [R0, #0]
;wheelDirection.c,18 :: 		wheel_position_direction = WHEEL_DIRECTION_RIGHT;
MOVS	R1, #2
MOVW	R0, #lo_addr(_wheel_position_direction+0)
MOVT	R0, #hi_addr(_wheel_position_direction+0)
STRH	R1, [R0, #0]
;wheelDirection.c,19 :: 		}
IT	AL
BAL	L_directionWheelADC3
L_directionWheelADC2:
;wheelDirection.c,21 :: 		wheel_position_angle = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wheel_position_angle+0)
MOVT	R0, #hi_addr(_wheel_position_angle+0)
STRH	R1, [R0, #0]
;wheelDirection.c,22 :: 		wheel_position_direction = WHEEL_DIRECTION_STREIGHT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wheel_position_direction+0)
MOVT	R0, #hi_addr(_wheel_position_direction+0)
STRH	R1, [R0, #0]
;wheelDirection.c,23 :: 		}
L_directionWheelADC3:
L_directionWheelADC1:
;wheelDirection.c,31 :: 		if(countedTimer){
MOVW	R1, #lo_addr(_countedTimer+0)
MOVT	R1, #hi_addr(_countedTimer+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_directionWheelADC4
;wheelDirection.c,32 :: 		countedTimer = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;wheelDirection.c,35 :: 		if(activeBattery != 0){
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_directionWheelADC5
;wheelDirection.c,36 :: 		uartSendCommandMotor(motorDirection, motorSpeed);
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
LDRB	R0, [R0, #0]
BL	_uartSendCommandMotor+0
;wheelDirection.c,37 :: 		}
L_directionWheelADC5:
;wheelDirection.c,38 :: 		if(control_taken){
MOVW	R1, #lo_addr(_control_taken+0)
MOVT	R1, #hi_addr(_control_taken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_directionWheelADC6
;wheelDirection.c,39 :: 		dutyy = boatWheelDir;
MOVW	R0, #lo_addr(_boatWheelDir+0)
MOVT	R0, #hi_addr(_boatWheelDir+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
STRH	R1, [R0, #0]
;wheelDirection.c,40 :: 		}
L_directionWheelADC6:
;wheelDirection.c,42 :: 		uart3SendJoystick();
BL	_uart3SendJoystick+0
;wheelDirection.c,83 :: 		}
L_directionWheelADC4:
;wheelDirection.c,85 :: 		}
L_end_directionWheelADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _directionWheelADC
