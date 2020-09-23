_batteryControlSwitches:
;batteryControl.c,5 :: 		void batteryControlSwitches(){
;batteryControl.c,73 :: 		if(((battery_percentage1 < 1.0f && battery_chosen == 1)
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__batteryControlSwitches26
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__batteryControlSwitches25
IT	AL
BAL	L__batteryControlSwitches18
L__batteryControlSwitches26:
L__batteryControlSwitches25:
;batteryControl.c,74 :: 		|| (battery_percentage2 < 1.0f && battery_chosen == 2))
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L__batteryControlSwitches28
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__batteryControlSwitches27
IT	AL
BAL	L__batteryControlSwitches18
L__batteryControlSwitches28:
L__batteryControlSwitches27:
;batteryControl.c,75 :: 		|| ((battery_chosen == 1 && !ACCUMULATOR_SENSE && !battery_change) || (battery_chosen == 2 && !ACCUMULATOR_SENSE && !battery_change)))
L__batteryControlSwitches22:
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__batteryControlSwitches31
MOVW	R1, #lo_addr(ACCUMULATOR_SENSE+0)
MOVT	R1, #hi_addr(ACCUMULATOR_SENSE+0)
_LX	[R1, ByteOffset(ACCUMULATOR_SENSE+0)]
CMP	R0, #0
IT	NE
BNE	L__batteryControlSwitches30
MOVW	R1, #lo_addr(_battery_change+0)
MOVT	R1, #hi_addr(_battery_change+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__batteryControlSwitches29
IT	AL
BAL	L__batteryControlSwitches18
L__batteryControlSwitches31:
L__batteryControlSwitches30:
L__batteryControlSwitches29:
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L__batteryControlSwitches34
MOVW	R1, #lo_addr(ACCUMULATOR_SENSE+0)
MOVT	R1, #hi_addr(ACCUMULATOR_SENSE+0)
_LX	[R1, ByteOffset(ACCUMULATOR_SENSE+0)]
CMP	R0, #0
IT	NE
BNE	L__batteryControlSwitches33
MOVW	R1, #lo_addr(_battery_change+0)
MOVT	R1, #hi_addr(_battery_change+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__batteryControlSwitches32
IT	AL
BAL	L__batteryControlSwitches18
L__batteryControlSwitches34:
L__batteryControlSwitches33:
L__batteryControlSwitches32:
L__batteryControlSwitches19:
IT	AL
BAL	L_batteryControlSwitches14
L__batteryControlSwitches18:
;batteryControl.c,78 :: 		if(buzzerCounter % 25 == 0){
MOVW	R0, #lo_addr(_buzzerCounter+0)
MOVT	R0, #hi_addr(_buzzerCounter+0)
LDRH	R2, [R0, #0]
MOVS	R1, #25
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
UXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_batteryControlSwitches15
;batteryControl.c,79 :: 		BUZZER_ALARM = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(BUZZER_ALARM+0)
MOVT	R0, #hi_addr(BUZZER_ALARM+0)
_SX	[R0, ByteOffset(BUZZER_ALARM+0)]
;batteryControl.c,80 :: 		}
IT	AL
BAL	L_batteryControlSwitches16
L_batteryControlSwitches15:
;batteryControl.c,82 :: 		BUZZER_ALARM = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(BUZZER_ALARM+0)
MOVT	R0, #hi_addr(BUZZER_ALARM+0)
_SX	[R0, ByteOffset(BUZZER_ALARM+0)]
;batteryControl.c,83 :: 		}
L_batteryControlSwitches16:
;batteryControl.c,85 :: 		}
IT	AL
BAL	L_batteryControlSwitches17
L_batteryControlSwitches14:
;batteryControl.c,87 :: 		BUZZER_ALARM = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(BUZZER_ALARM+0)
MOVT	R0, #hi_addr(BUZZER_ALARM+0)
_SX	[R0, ByteOffset(BUZZER_ALARM+0)]
;batteryControl.c,88 :: 		}
L_batteryControlSwitches17:
;batteryControl.c,89 :: 		}
L_end_batteryControlSwitches:
BX	LR
; end of _batteryControlSwitches
