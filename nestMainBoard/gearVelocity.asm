_change_velocity_mode:
;gearVelocity.c,6 :: 		void change_velocity_mode(unsigned int mode){
; mode start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; mode end address is: 0 (R0)
; mode start address is: 0 (R0)
;gearVelocity.c,7 :: 		switch(mode){
IT	AL
BAL	L_change_velocity_mode0
; mode end address is: 0 (R0)
;gearVelocity.c,8 :: 		case 0:
L_change_velocity_mode2:
;gearVelocity.c,9 :: 		velocity_gear1 = GEAR_VELOCITY_1_TURTLE;
MOVS	R2, #27
MOVW	R1, #lo_addr(_velocity_gear1+0)
MOVT	R1, #hi_addr(_velocity_gear1+0)
STRH	R2, [R1, #0]
;gearVelocity.c,10 :: 		velocity_gear2 = GEAR_VELOCITY_2_TURTLE;
MOVS	R2, #38
MOVW	R1, #lo_addr(_velocity_gear2+0)
MOVT	R1, #hi_addr(_velocity_gear2+0)
STRH	R2, [R1, #0]
;gearVelocity.c,11 :: 		velocity_gear3 = GEAR_VELOCITY_3_TURTLE;
MOVS	R2, #59
MOVW	R1, #lo_addr(_velocity_gear3+0)
MOVT	R1, #hi_addr(_velocity_gear3+0)
STRH	R2, [R1, #0]
;gearVelocity.c,12 :: 		velocity_gearR = GEAR_VELOCITY_R_TURTLE;
MOVS	R2, #53
MOVW	R1, #lo_addr(_velocity_gearR+0)
MOVT	R1, #hi_addr(_velocity_gearR+0)
STRH	R2, [R1, #0]
;gearVelocity.c,13 :: 		velocity_gearS = GEAR_VELOCITY_S;
MOVS	R2, #0
MOVW	R1, #lo_addr(_velocity_gearS+0)
MOVT	R1, #hi_addr(_velocity_gearS+0)
STRH	R2, [R1, #0]
;gearVelocity.c,15 :: 		velocity_mode_send = 0x01;
MOVS	R2, #1
MOVW	R1, #lo_addr(_velocity_mode_send+0)
MOVT	R1, #hi_addr(_velocity_mode_send+0)
STRH	R2, [R1, #0]
;gearVelocity.c,17 :: 		uart4TurtleTurnedOn();
BL	_uart4TurtleTurnedOn+0
;gearVelocity.c,18 :: 		uart4RabbitTurnedOff();
BL	_uart4RabbitTurnedOff+0
;gearVelocity.c,19 :: 		uart4LeopardTurnedOff();
BL	_uart4LeopardTurnedOff+0
;gearVelocity.c,20 :: 		uart4SpeedModeTurtle();
BL	_uart4SpeedModeTurtle+0
;gearVelocity.c,22 :: 		velocity_mode = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_velocity_mode+0)
MOVT	R1, #hi_addr(_velocity_mode+0)
STRH	R2, [R1, #0]
;gearVelocity.c,23 :: 		break;
IT	AL
BAL	L_change_velocity_mode1
;gearVelocity.c,24 :: 		case 1:
L_change_velocity_mode3:
;gearVelocity.c,25 :: 		velocity_gear1 = GEAR_VELOCITY_1_RABBIT;
MOVS	R2, #32
MOVW	R1, #lo_addr(_velocity_gear1+0)
MOVT	R1, #hi_addr(_velocity_gear1+0)
STRH	R2, [R1, #0]
;gearVelocity.c,26 :: 		velocity_gear2 = GEAR_VELOCITY_2_RABBIT;
MOVS	R2, #48
MOVW	R1, #lo_addr(_velocity_gear2+0)
MOVT	R1, #hi_addr(_velocity_gear2+0)
STRH	R2, [R1, #0]
;gearVelocity.c,27 :: 		velocity_gear3 = GEAR_VELOCITY_3_RABBIT;
MOVS	R2, #74
MOVW	R1, #lo_addr(_velocity_gear3+0)
MOVT	R1, #hi_addr(_velocity_gear3+0)
STRH	R2, [R1, #0]
;gearVelocity.c,28 :: 		velocity_gearR = GEAR_VELOCITY_R_RABBIT;
MOVS	R2, #53
MOVW	R1, #lo_addr(_velocity_gearR+0)
MOVT	R1, #hi_addr(_velocity_gearR+0)
STRH	R2, [R1, #0]
;gearVelocity.c,29 :: 		velocity_gearS = GEAR_VELOCITY_S;
MOVS	R2, #0
MOVW	R1, #lo_addr(_velocity_gearS+0)
MOVT	R1, #hi_addr(_velocity_gearS+0)
STRH	R2, [R1, #0]
;gearVelocity.c,31 :: 		velocity_mode_send = 0x02;
MOVS	R2, #2
MOVW	R1, #lo_addr(_velocity_mode_send+0)
MOVT	R1, #hi_addr(_velocity_mode_send+0)
STRH	R2, [R1, #0]
;gearVelocity.c,33 :: 		uart4TurtleTurnedOff();
BL	_uart4TurtleTurnedOff+0
;gearVelocity.c,34 :: 		uart4RabbitTurnedOn();
BL	_uart4RabbitTurnedOn+0
;gearVelocity.c,35 :: 		uart4LeopardTurnedOff();
BL	_uart4LeopardTurnedOff+0
;gearVelocity.c,36 :: 		uart4SpeedModeRabbit();
BL	_uart4SpeedModeRabbit+0
;gearVelocity.c,38 :: 		velocity_mode = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_velocity_mode+0)
MOVT	R1, #hi_addr(_velocity_mode+0)
STRH	R2, [R1, #0]
;gearVelocity.c,40 :: 		break;
IT	AL
BAL	L_change_velocity_mode1
;gearVelocity.c,41 :: 		case 2:
L_change_velocity_mode4:
;gearVelocity.c,42 :: 		velocity_gear1 = GEAR_VELOCITY_1_LEOPARD;
MOVS	R2, #53
MOVW	R1, #lo_addr(_velocity_gear1+0)
MOVT	R1, #hi_addr(_velocity_gear1+0)
STRH	R2, [R1, #0]
;gearVelocity.c,43 :: 		velocity_gear2 = GEAR_VELOCITY_2_LEOPARD;
MOVS	R2, #80
MOVW	R1, #lo_addr(_velocity_gear2+0)
MOVT	R1, #hi_addr(_velocity_gear2+0)
STRH	R2, [R1, #0]
;gearVelocity.c,44 :: 		velocity_gear3 = GEAR_VELOCITY_3_LEOPARD;
MOVS	R2, #101
MOVW	R1, #lo_addr(_velocity_gear3+0)
MOVT	R1, #hi_addr(_velocity_gear3+0)
STRH	R2, [R1, #0]
;gearVelocity.c,45 :: 		velocity_gearR = GEAR_VELOCITY_R_LEOPARD;
MOVS	R2, #53
MOVW	R1, #lo_addr(_velocity_gearR+0)
MOVT	R1, #hi_addr(_velocity_gearR+0)
STRH	R2, [R1, #0]
;gearVelocity.c,46 :: 		velocity_gearS = GEAR_VELOCITY_S;
MOVS	R2, #0
MOVW	R1, #lo_addr(_velocity_gearS+0)
MOVT	R1, #hi_addr(_velocity_gearS+0)
STRH	R2, [R1, #0]
;gearVelocity.c,48 :: 		velocity_mode_send = 0x04;
MOVS	R2, #4
MOVW	R1, #lo_addr(_velocity_mode_send+0)
MOVT	R1, #hi_addr(_velocity_mode_send+0)
STRH	R2, [R1, #0]
;gearVelocity.c,50 :: 		uart4TurtleTurnedOff();
BL	_uart4TurtleTurnedOff+0
;gearVelocity.c,51 :: 		uart4RabbitTurnedOff();
BL	_uart4RabbitTurnedOff+0
;gearVelocity.c,52 :: 		uart4LeopardTurnedOn();
BL	_uart4LeopardTurnedOn+0
;gearVelocity.c,53 :: 		uart4SpeedModeLeopard();
BL	_uart4SpeedModeLeopard+0
;gearVelocity.c,54 :: 		velocity_mode = 2;
MOVS	R2, #2
MOVW	R1, #lo_addr(_velocity_mode+0)
MOVT	R1, #hi_addr(_velocity_mode+0)
STRH	R2, [R1, #0]
;gearVelocity.c,55 :: 		break;
IT	AL
BAL	L_change_velocity_mode1
;gearVelocity.c,56 :: 		default:
L_change_velocity_mode5:
;gearVelocity.c,57 :: 		velocity_gear1 = GEAR_VELOCITY_1_RABBIT;
MOVS	R2, #32
MOVW	R1, #lo_addr(_velocity_gear1+0)
MOVT	R1, #hi_addr(_velocity_gear1+0)
STRH	R2, [R1, #0]
;gearVelocity.c,58 :: 		velocity_gear2 = GEAR_VELOCITY_2_RABBIT;
MOVS	R2, #48
MOVW	R1, #lo_addr(_velocity_gear2+0)
MOVT	R1, #hi_addr(_velocity_gear2+0)
STRH	R2, [R1, #0]
;gearVelocity.c,59 :: 		velocity_gear3 = GEAR_VELOCITY_3_RABBIT;
MOVS	R2, #74
MOVW	R1, #lo_addr(_velocity_gear3+0)
MOVT	R1, #hi_addr(_velocity_gear3+0)
STRH	R2, [R1, #0]
;gearVelocity.c,60 :: 		velocity_gearR = GEAR_VELOCITY_R_RABBIT;
MOVS	R2, #53
MOVW	R1, #lo_addr(_velocity_gearR+0)
MOVT	R1, #hi_addr(_velocity_gearR+0)
STRH	R2, [R1, #0]
;gearVelocity.c,61 :: 		velocity_gearS = GEAR_VELOCITY_S;
MOVS	R2, #0
MOVW	R1, #lo_addr(_velocity_gearS+0)
MOVT	R1, #hi_addr(_velocity_gearS+0)
STRH	R2, [R1, #0]
;gearVelocity.c,63 :: 		velocity_mode_send = 0x02;
MOVS	R2, #2
MOVW	R1, #lo_addr(_velocity_mode_send+0)
MOVT	R1, #hi_addr(_velocity_mode_send+0)
STRH	R2, [R1, #0]
;gearVelocity.c,65 :: 		uart4TurtleTurnedOff();
BL	_uart4TurtleTurnedOff+0
;gearVelocity.c,66 :: 		uart4RabbitTurnedOn();
BL	_uart4RabbitTurnedOn+0
;gearVelocity.c,67 :: 		uart4LeopardTurnedOff();
BL	_uart4LeopardTurnedOff+0
;gearVelocity.c,68 :: 		uart4SpeedModeRabbit();
BL	_uart4SpeedModeRabbit+0
;gearVelocity.c,70 :: 		velocity_mode = 1;
MOVS	R2, #1
MOVW	R1, #lo_addr(_velocity_mode+0)
MOVT	R1, #hi_addr(_velocity_mode+0)
STRH	R2, [R1, #0]
;gearVelocity.c,72 :: 		break;
IT	AL
BAL	L_change_velocity_mode1
;gearVelocity.c,73 :: 		}
L_change_velocity_mode0:
; mode start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_change_velocity_mode2
CMP	R0, #1
IT	EQ
BEQ	L_change_velocity_mode3
CMP	R0, #2
IT	EQ
BEQ	L_change_velocity_mode4
; mode end address is: 0 (R0)
IT	AL
BAL	L_change_velocity_mode5
L_change_velocity_mode1:
;gearVelocity.c,74 :: 		}
L_end_change_velocity_mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _change_velocity_mode
_gearVelocityMotorSpeedControl:
;gearVelocity.c,77 :: 		void gearVelocityMotorSpeedControl(){
;gearVelocity.c,186 :: 		switch(gear_status){
IT	AL
BAL	L_gearVelocityMotorSpeedControl6
;gearVelocity.c,187 :: 		case 1:
L_gearVelocityMotorSpeedControl8:
;gearVelocity.c,188 :: 		motorSpeed = velocity_gear1;
MOVW	R0, #lo_addr(_velocity_gear1+0)
MOVT	R0, #hi_addr(_velocity_gear1+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,189 :: 		motorDirection = GEAR_DIRECTION_STREIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,190 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,192 :: 		case 2:
L_gearVelocityMotorSpeedControl9:
;gearVelocity.c,193 :: 		motorSpeed = velocity_gear2;
MOVW	R0, #lo_addr(_velocity_gear2+0)
MOVT	R0, #hi_addr(_velocity_gear2+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,194 :: 		motorDirection = GEAR_DIRECTION_STREIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,195 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,197 :: 		case 3:
L_gearVelocityMotorSpeedControl10:
;gearVelocity.c,198 :: 		motorSpeed = velocity_gear3;
MOVW	R0, #lo_addr(_velocity_gear3+0)
MOVT	R0, #hi_addr(_velocity_gear3+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,199 :: 		motorDirection = GEAR_DIRECTION_STREIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,200 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,202 :: 		case 4:
L_gearVelocityMotorSpeedControl11:
;gearVelocity.c,203 :: 		motorSpeed = GEAR_VELOCITY_S;
MOVS	R1, #0
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,204 :: 		motorDirection = GEAR_DIRECTION_STREIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,205 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,207 :: 		case 5:
L_gearVelocityMotorSpeedControl12:
;gearVelocity.c,208 :: 		motorSpeed = velocity_gearR;
MOVW	R0, #lo_addr(_velocity_gearR+0)
MOVT	R0, #hi_addr(_velocity_gearR+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,209 :: 		motorDirection = GEAR_DIRECTION_BACK;
MOVS	R1, #0
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,210 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,212 :: 		default:
L_gearVelocityMotorSpeedControl13:
;gearVelocity.c,213 :: 		motorSpeed = GEAR_VELOCITY_S;
MOVS	R1, #0
MOVW	R0, #lo_addr(_motorSpeed+0)
MOVT	R0, #hi_addr(_motorSpeed+0)
STRB	R1, [R0, #0]
;gearVelocity.c,214 :: 		motorDirection = GEAR_DIRECTION_STREIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_motorDirection+0)
MOVT	R0, #hi_addr(_motorDirection+0)
STRB	R1, [R0, #0]
;gearVelocity.c,215 :: 		break;
IT	AL
BAL	L_gearVelocityMotorSpeedControl7
;gearVelocity.c,216 :: 		}
L_gearVelocityMotorSpeedControl6:
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L_gearVelocityMotorSpeedControl8
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L_gearVelocityMotorSpeedControl9
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #3
IT	EQ
BEQ	L_gearVelocityMotorSpeedControl10
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #4
IT	EQ
BEQ	L_gearVelocityMotorSpeedControl11
MOVW	R0, #lo_addr(_gear_status+0)
MOVT	R0, #hi_addr(_gear_status+0)
LDRH	R0, [R0, #0]
CMP	R0, #5
IT	EQ
BEQ	L_gearVelocityMotorSpeedControl12
IT	AL
BAL	L_gearVelocityMotorSpeedControl13
L_gearVelocityMotorSpeedControl7:
;gearVelocity.c,218 :: 		}
L_end_gearVelocityMotorSpeedControl:
BX	LR
; end of _gearVelocityMotorSpeedControl
