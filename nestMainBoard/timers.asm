_Timer2_interrupt:
;timers.c,6 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;timers.c,7 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;timers.c,23 :: 		if((battery_chosen_old == 1 || battery_chosen_old == 2)&& ACCUMULATOR_SENSE)
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	EQ
BEQ	L__Timer2_interrupt25
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__Timer2_interrupt24
IT	AL
BAL	L_Timer2_interrupt4
L__Timer2_interrupt25:
L__Timer2_interrupt24:
MOVW	R1, #lo_addr(ACCUMULATOR_SENSE+0)
MOVT	R1, #hi_addr(ACCUMULATOR_SENSE+0)
_LX	[R1, ByteOffset(ACCUMULATOR_SENSE+0)]
CMP	R0, #0
IT	EQ
BEQ	L__Timer2_interrupt26
L__Timer2_interrupt22:
;timers.c,25 :: 		if(duzinaSignala2 > dutyy){
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_duzinaSignala2+0)
MOVT	R0, #hi_addr(_duzinaSignala2+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L_Timer2_interrupt5
;timers.c,26 :: 		duzinaSignala2--;
MOVW	R1, #lo_addr(_duzinaSignala2+0)
MOVT	R1, #hi_addr(_duzinaSignala2+0)
LDR	R0, [R1, #0]
SUBS	R0, R0, #1
STR	R0, [R1, #0]
;timers.c,27 :: 		}
IT	AL
BAL	L_Timer2_interrupt6
L_Timer2_interrupt5:
;timers.c,28 :: 		else if(duzinaSignala2 < dutyy){
MOVW	R0, #lo_addr(_dutyy+0)
MOVT	R0, #hi_addr(_dutyy+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_duzinaSignala2+0)
MOVT	R0, #hi_addr(_duzinaSignala2+0)
LDR	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_Timer2_interrupt7
;timers.c,29 :: 		duzinaSignala2++;
MOVW	R1, #lo_addr(_duzinaSignala2+0)
MOVT	R1, #hi_addr(_duzinaSignala2+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;timers.c,30 :: 		}
L_Timer2_interrupt7:
L_Timer2_interrupt6:
;timers.c,32 :: 		pwm_percent =  (double)(((double)(((double)duzinaSignala2) * ((double)100))) / ((double)2000));
MOVW	R0, #lo_addr(_duzinaSignala2+0)
MOVT	R0, #hi_addr(_duzinaSignala2+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#1, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VMUL.F32	S1, S1, S0
MOVW	R0, #0
MOVT	R0, #17658
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_pwm_percent+0)
MOVT	R0, #hi_addr(_pwm_percent+0)
VSTR	#1, S1, [R0, #0]
;timers.c,33 :: 		pwm_duty = ((unsigned int)((double)(((double)(((double)pwm_ratio) * pwm_percent)) / ((double)100))));
MOVW	R0, #lo_addr(_pwm_ratio+0)
MOVT	R0, #hi_addr(_pwm_ratio+0)
LDRH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VMUL.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
UXTH	R1, R1
MOVW	R0, #lo_addr(_pwm_duty+0)
MOVT	R0, #hi_addr(_pwm_duty+0)
STRH	R1, [R0, #0]
;timers.c,34 :: 		PWM_TIM3_Set_Duty(pwm_duty, _PWM_NON_INVERTED, _PWM_CHANNEL2);
UXTH	R0, R1
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;timers.c,35 :: 		}
L_Timer2_interrupt4:
;timers.c,23 :: 		if((battery_chosen_old == 1 || battery_chosen_old == 2)&& ACCUMULATOR_SENSE)
L__Timer2_interrupt26:
;timers.c,36 :: 		}
L_end_Timer2_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer2_interrupt
_Timer4_interrupt:
;timers.c,39 :: 		void Timer4_interrupt() iv IVT_INT_TIM4 {
;timers.c,40 :: 		TIM4_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM4_SR+0)
MOVT	R0, #hi_addr(TIM4_SR+0)
_SX	[R0, ByteOffset(TIM4_SR+0)]
;timers.c,56 :: 		if(bitBatteryChangeBlockCounter){
MOVW	R1, #lo_addr(_bitBatteryChangeBlockCounter+0)
MOVT	R1, #hi_addr(_bitBatteryChangeBlockCounter+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer4_interrupt8
;timers.c,57 :: 		batteryChangeBlockCounter++;
MOVW	R1, #lo_addr(_batteryChangeBlockCounter+0)
MOVT	R1, #hi_addr(_batteryChangeBlockCounter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,58 :: 		if(batteryChangeBlockCounter >= 60){
CMP	R0, #60
IT	CC
BCC	L_Timer4_interrupt9
;timers.c,59 :: 		bitBatteryChangeBlockCounter = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitBatteryChangeBlockCounter+0)
MOVT	R0, #hi_addr(_bitBatteryChangeBlockCounter+0)
STR	R1, [R0, #0]
;timers.c,60 :: 		batteryChangeBlockCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_batteryChangeBlockCounter+0)
MOVT	R0, #hi_addr(_batteryChangeBlockCounter+0)
STRH	R1, [R0, #0]
;timers.c,61 :: 		}
L_Timer4_interrupt9:
;timers.c,62 :: 		}
L_Timer4_interrupt8:
;timers.c,66 :: 		countedTimer = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_countedTimer+0)
MOVT	R0, #hi_addr(_countedTimer+0)
STR	R1, [R0, #0]
;timers.c,67 :: 		buzzerCounter++;
MOVW	R1, #lo_addr(_buzzerCounter+0)
MOVT	R1, #hi_addr(_buzzerCounter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;timers.c,68 :: 		battry_percentage_check_counter++;
MOVW	R1, #lo_addr(_battry_percentage_check_counter+0)
MOVT	R1, #hi_addr(_battry_percentage_check_counter+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,69 :: 		if(battry_percentage_check_counter >= 80){
CMP	R0, #80
IT	CC
BCC	L_Timer4_interrupt10
;timers.c,70 :: 		battry_percentage_check = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R1, [R0, #0]
;timers.c,71 :: 		battry_percentage_check_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_battry_percentage_check_counter+0)
MOVT	R0, #hi_addr(_battry_percentage_check_counter+0)
STRH	R1, [R0, #0]
;timers.c,72 :: 		}
L_Timer4_interrupt10:
;timers.c,74 :: 		if(buzzerCounter >= 10000){
MOVW	R0, #lo_addr(_buzzerCounter+0)
MOVT	R0, #hi_addr(_buzzerCounter+0)
LDRH	R1, [R0, #0]
MOVW	R0, #10000
CMP	R1, R0
IT	CC
BCC	L_Timer4_interrupt11
;timers.c,75 :: 		buzzerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_buzzerCounter+0)
MOVT	R0, #hi_addr(_buzzerCounter+0)
STRH	R1, [R0, #0]
;timers.c,76 :: 		}
L_Timer4_interrupt11:
;timers.c,78 :: 		if(battery_change){
MOVW	R1, #lo_addr(_battery_change+0)
MOVT	R1, #hi_addr(_battery_change+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer4_interrupt12
;timers.c,79 :: 		battery_change_count++;
MOVW	R1, #lo_addr(_battery_change_count+0)
MOVT	R1, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,80 :: 		if(battery_change_count> 100){
CMP	R0, #100
IT	LE
BLE	L_Timer4_interrupt13
;timers.c,81 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;timers.c,82 :: 		}
L_Timer4_interrupt13:
;timers.c,83 :: 		}
L_Timer4_interrupt12:
;timers.c,85 :: 		if(bitStart3SecondsCount){
MOVW	R1, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R1, #hi_addr(_bitStart3SecondsCount+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer4_interrupt14
;timers.c,86 :: 		delay3secndsCount++;
MOVW	R1, #lo_addr(_delay3secndsCount+0)
MOVT	R1, #hi_addr(_delay3secndsCount+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,87 :: 		if(delay3secndsCount >= 60){
CMP	R0, #60
IT	CC
BCC	L_Timer4_interrupt15
;timers.c,88 :: 		bitDelay3Seconds = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitDelay3Seconds+0)
MOVT	R0, #hi_addr(_bitDelay3Seconds+0)
STR	R1, [R0, #0]
;timers.c,89 :: 		bitStart3SecondsCount = 0;
MOVW	R0, #lo_addr(_bitStart3SecondsCount+0)
MOVT	R0, #hi_addr(_bitStart3SecondsCount+0)
STR	R1, [R0, #0]
;timers.c,90 :: 		delay3secndsCount = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_delay3secndsCount+0)
MOVT	R0, #hi_addr(_delay3secndsCount+0)
STRH	R1, [R0, #0]
;timers.c,91 :: 		}
L_Timer4_interrupt15:
;timers.c,92 :: 		}
L_Timer4_interrupt14:
;timers.c,94 :: 		if(bitControlTaken){
MOVW	R1, #lo_addr(_bitControlTaken+0)
MOVT	R1, #hi_addr(_bitControlTaken+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer4_interrupt16
;timers.c,95 :: 		controlTakenCount++;
MOVW	R1, #lo_addr(_controlTakenCount+0)
MOVT	R1, #hi_addr(_controlTakenCount+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,96 :: 		if(controlTakenCount>60){
CMP	R0, #60
IT	LE
BLE	L_Timer4_interrupt17
;timers.c,97 :: 		controlTakenCount = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_controlTakenCount+0)
MOVT	R0, #hi_addr(_controlTakenCount+0)
STRH	R1, [R0, #0]
;timers.c,98 :: 		bitControlTaken = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitControlTaken+0)
MOVT	R0, #hi_addr(_bitControlTaken+0)
STR	R1, [R0, #0]
;timers.c,99 :: 		control_taken = 0;
MOVW	R0, #lo_addr(_control_taken+0)
MOVT	R0, #hi_addr(_control_taken+0)
STR	R1, [R0, #0]
;timers.c,100 :: 		}
L_Timer4_interrupt17:
;timers.c,101 :: 		}
L_Timer4_interrupt16:
;timers.c,103 :: 		countJoystickConnection++;
MOVW	R1, #lo_addr(_countJoystickConnection+0)
MOVT	R1, #hi_addr(_countJoystickConnection+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,104 :: 		if(countJoystickConnection > 60){
CMP	R0, #60
IT	LS
BLS	L_Timer4_interrupt18
;timers.c,105 :: 		countJoystickConnection = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_countJoystickConnection+0)
MOVT	R0, #hi_addr(_countJoystickConnection+0)
STRH	R1, [R0, #0]
;timers.c,106 :: 		bitCheckJoystick = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckJoystick+0)
MOVT	R0, #hi_addr(_bitCheckJoystick+0)
STR	R1, [R0, #0]
;timers.c,107 :: 		}
L_Timer4_interrupt18:
;timers.c,110 :: 		couterJoystickDisplay++;
MOVW	R1, #lo_addr(_couterJoystickDisplay+0)
MOVT	R1, #hi_addr(_couterJoystickDisplay+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
UXTH	R0, R0
STRH	R0, [R1, #0]
;timers.c,111 :: 		if(couterJoystickDisplay == 1){
CMP	R0, #1
IT	NE
BNE	L_Timer4_interrupt19
;timers.c,112 :: 		bitCheckStatusDisplay = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckStatusDisplay+0)
MOVT	R0, #hi_addr(_bitCheckStatusDisplay+0)
STR	R1, [R0, #0]
;timers.c,113 :: 		}
IT	AL
BAL	L_Timer4_interrupt20
L_Timer4_interrupt19:
;timers.c,114 :: 		else if(couterJoystickDisplay >= 2){
MOVW	R0, #lo_addr(_couterJoystickDisplay+0)
MOVT	R0, #hi_addr(_couterJoystickDisplay+0)
LDRH	R0, [R0, #0]
CMP	R0, #2
IT	CC
BCC	L_Timer4_interrupt21
;timers.c,115 :: 		bitCheckStatusJoystick = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_bitCheckStatusJoystick+0)
MOVT	R0, #hi_addr(_bitCheckStatusJoystick+0)
STR	R1, [R0, #0]
;timers.c,116 :: 		couterJoystickDisplay = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_couterJoystickDisplay+0)
MOVT	R0, #hi_addr(_couterJoystickDisplay+0)
STRH	R1, [R0, #0]
;timers.c,117 :: 		}
L_Timer4_interrupt21:
L_Timer4_interrupt20:
;timers.c,125 :: 		}
L_end_Timer4_interrupt:
BX	LR
; end of _Timer4_interrupt
