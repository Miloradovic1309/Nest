_batteryChangeState:
;batteryChange.c,5 :: 		void batteryChangeState(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;batteryChange.c,6 :: 		if((battery_chosen != battery_chosen_old) || (battery_change)){
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__batteryChangeState37
MOVW	R1, #lo_addr(_battery_change+0)
MOVT	R1, #hi_addr(_battery_change+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__batteryChangeState36
IT	AL
BAL	L_batteryChangeState2
L__batteryChangeState37:
L__batteryChangeState36:
;batteryChange.c,7 :: 		BUZZER_ALARM = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(BUZZER_ALARM+0)
MOVT	R0, #hi_addr(BUZZER_ALARM+0)
_SX	[R0, ByteOffset(BUZZER_ALARM+0)]
;batteryChange.c,8 :: 		battery_change = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;batteryChange.c,9 :: 		battery_chosen_old = 3;
MOVS	R1, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,10 :: 		if(battery_change_count <=  10){
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	GT
BGT	L_batteryChangeState3
;batteryChange.c,11 :: 		ACCUMULATOR1_ON = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,12 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,13 :: 		ACCUMULATORS_OFF = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,14 :: 		BUZZER_ALARM = 0;
MOVW	R0, #lo_addr(BUZZER_ALARM+0)
MOVT	R0, #hi_addr(BUZZER_ALARM+0)
_SX	[R0, ByteOffset(BUZZER_ALARM+0)]
;batteryChange.c,15 :: 		if(battery_chosen == 1){
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_batteryChangeState4
;batteryChange.c,16 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;batteryChange.c,17 :: 		wannaBeActiveBattery2_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,18 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;batteryChange.c,19 :: 		}
IT	AL
BAL	L_batteryChangeState5
L_batteryChangeState4:
;batteryChange.c,20 :: 		else if(battery_chosen == 2){
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_batteryChangeState6
;batteryChange.c,21 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;batteryChange.c,22 :: 		wannaBeActiveBattery1_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,23 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;batteryChange.c,24 :: 		}
IT	AL
BAL	L_batteryChangeState7
L_batteryChangeState6:
;batteryChange.c,26 :: 		wannaBeActiveBattery1 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1+0)
STRH	R1, [R0, #0]
;batteryChange.c,27 :: 		wannaBeActiveBattery1_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery1_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery1_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,28 :: 		wannaBeActiveBattery2 = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2+0)
STRH	R1, [R0, #0]
;batteryChange.c,29 :: 		wannaBeActiveBattery2_old = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_wannaBeActiveBattery2_old+0)
MOVT	R0, #hi_addr(_wannaBeActiveBattery2_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,30 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;batteryChange.c,31 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;batteryChange.c,32 :: 		uart4LightingTurnedOff();
BL	_uart4LightingTurnedOff+0
;batteryChange.c,33 :: 		activeBattery = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
STRH	R1, [R0, #0]
;batteryChange.c,34 :: 		}
L_batteryChangeState7:
L_batteryChangeState5:
;batteryChange.c,36 :: 		}
IT	AL
BAL	L_batteryChangeState8
L_batteryChangeState3:
;batteryChange.c,37 :: 		else if((battery_change_count > 10) && (battery_change_count <= 20)){
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #10
IT	LE
BLE	L__batteryChangeState39
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	GT
BGT	L__batteryChangeState38
L__batteryChangeState34:
;batteryChange.c,38 :: 		ACCUMULATOR1_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,39 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,40 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,42 :: 		}
IT	AL
BAL	L_batteryChangeState12
;batteryChange.c,37 :: 		else if((battery_change_count > 10) && (battery_change_count <= 20)){
L__batteryChangeState39:
L__batteryChangeState38:
;batteryChange.c,43 :: 		else if((battery_change_count > 20) && (battery_change_count <= 30)){
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #20
IT	LE
BLE	L__batteryChangeState41
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	GT
BGT	L__batteryChangeState40
L__batteryChangeState33:
;batteryChange.c,44 :: 		if(!ACCUMULATOR_SENSE){
MOVW	R1, #lo_addr(ACCUMULATOR_SENSE+0)
MOVT	R1, #hi_addr(ACCUMULATOR_SENSE+0)
_LX	[R1, ByteOffset(ACCUMULATOR_SENSE+0)]
CMP	R0, #0
IT	NE
BNE	L_batteryChangeState16
;batteryChange.c,45 :: 		battery_change_continue = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;batteryChange.c,46 :: 		}
IT	AL
BAL	L_batteryChangeState17
L_batteryChangeState16:
;batteryChange.c,48 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;batteryChange.c,49 :: 		}
L_batteryChangeState17:
;batteryChange.c,50 :: 		}
IT	AL
BAL	L_batteryChangeState18
;batteryChange.c,43 :: 		else if((battery_change_count > 20) && (battery_change_count <= 30)){
L__batteryChangeState41:
L__batteryChangeState40:
;batteryChange.c,51 :: 		else if((battery_change_count > 30) && (battery_change_count <= 80)){
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #30
IT	LE
BLE	L__batteryChangeState43
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #80
IT	GT
BGT	L__batteryChangeState42
L__batteryChangeState32:
;batteryChange.c,52 :: 		if(battery_change_count <= 60){
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
LDRSH	R0, [R0, #0]
CMP	R0, #60
IT	GT
BGT	L_batteryChangeState22
;batteryChange.c,54 :: 		if(battery_change_continue){
MOVW	R1, #lo_addr(_battery_change_continue+0)
MOVT	R1, #hi_addr(_battery_change_continue+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_batteryChangeState23
;batteryChange.c,55 :: 		if(battery_chosen == 1){
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_batteryChangeState24
;batteryChange.c,56 :: 		ACCUMULATOR1_ON = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,57 :: 		ACCUMULATOR2_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,58 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,62 :: 		uart4Battery1TurnedOn();
BL	_uart4Battery1TurnedOn+0
;batteryChange.c,63 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;batteryChange.c,64 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;batteryChange.c,65 :: 		activeBattery = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
STRH	R1, [R0, #0]
;batteryChange.c,66 :: 		}
IT	AL
BAL	L_batteryChangeState25
L_batteryChangeState24:
;batteryChange.c,67 :: 		else if(battery_chosen == 2){
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_batteryChangeState26
;batteryChange.c,68 :: 		ACCUMULATOR1_ON = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,69 :: 		ACCUMULATOR2_ON = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,70 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,74 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;batteryChange.c,75 :: 		uart4Battery2TurnedOn();
BL	_uart4Battery2TurnedOn+0
;batteryChange.c,76 :: 		uart4LightingTurnedOn();
BL	_uart4LightingTurnedOn+0
;batteryChange.c,77 :: 		activeBattery = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
STRH	R1, [R0, #0]
;batteryChange.c,78 :: 		}
IT	AL
BAL	L_batteryChangeState27
L_batteryChangeState26:
;batteryChange.c,80 :: 		ACCUMULATOR1_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,81 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,82 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,83 :: 		activeBattery = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
STRH	R1, [R0, #0]
;batteryChange.c,85 :: 		}
L_batteryChangeState27:
L_batteryChangeState25:
;batteryChange.c,86 :: 		}
IT	AL
BAL	L_batteryChangeState28
L_batteryChangeState23:
;batteryChange.c,88 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;batteryChange.c,89 :: 		ACCUMULATOR1_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,90 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,91 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,95 :: 		uart4Battery1TurnedOff();
BL	_uart4Battery1TurnedOff+0
;batteryChange.c,96 :: 		uart4Battery2TurnedOff();
BL	_uart4Battery2TurnedOff+0
;batteryChange.c,97 :: 		uart4LightingTurnedOff();
BL	_uart4LightingTurnedOff+0
;batteryChange.c,98 :: 		activeBattery = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_activeBattery+0)
MOVT	R0, #hi_addr(_activeBattery+0)
STRH	R1, [R0, #0]
;batteryChange.c,100 :: 		battery_change_continue = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;batteryChange.c,101 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;batteryChange.c,102 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;batteryChange.c,104 :: 		battery_chosen = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
STRH	R1, [R0, #0]
;batteryChange.c,105 :: 		battery_chosen_old = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,107 :: 		}
L_batteryChangeState28:
;batteryChange.c,108 :: 		}
IT	AL
BAL	L_batteryChangeState29
L_batteryChangeState22:
;batteryChange.c,110 :: 		ACCUMULATOR1_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,111 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,112 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,114 :: 		battry_percentage_check = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R1, [R0, #0]
;batteryChange.c,115 :: 		battry_percentage_check_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_battry_percentage_check_counter+0)
MOVT	R0, #hi_addr(_battry_percentage_check_counter+0)
STRH	R1, [R0, #0]
;batteryChange.c,118 :: 		}
L_batteryChangeState29:
;batteryChange.c,119 :: 		}
IT	AL
BAL	L_batteryChangeState30
;batteryChange.c,51 :: 		else if((battery_change_count > 30) && (battery_change_count <= 80)){
L__batteryChangeState43:
L__batteryChangeState42:
;batteryChange.c,121 :: 		ACCUMULATOR1_ON = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,122 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,123 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,125 :: 		battery_chosen_old = battery_chosen;
MOVW	R0, #lo_addr(_battery_chosen+0)
MOVT	R0, #hi_addr(_battery_chosen+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(_battery_chosen_old+0)
MOVT	R0, #hi_addr(_battery_chosen_old+0)
STRH	R1, [R0, #0]
;batteryChange.c,126 :: 		battery_change_continue = 0;
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R2, [R0, #0]
;batteryChange.c,127 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R2, [R0, #0]
;batteryChange.c,128 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;batteryChange.c,130 :: 		battry_percentage_check = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R1, [R0, #0]
;batteryChange.c,131 :: 		battry_percentage_check_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_battry_percentage_check_counter+0)
MOVT	R0, #hi_addr(_battry_percentage_check_counter+0)
STRH	R1, [R0, #0]
;batteryChange.c,132 :: 		}
L_batteryChangeState30:
L_batteryChangeState18:
L_batteryChangeState12:
L_batteryChangeState8:
;batteryChange.c,133 :: 		}
IT	AL
BAL	L_batteryChangeState31
L_batteryChangeState2:
;batteryChange.c,135 :: 		ACCUMULATOR1_ON = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ACCUMULATOR1_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR1_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR1_ON+0)]
;batteryChange.c,136 :: 		ACCUMULATOR2_ON = 0;
MOVW	R0, #lo_addr(ACCUMULATOR2_ON+0)
MOVT	R0, #hi_addr(ACCUMULATOR2_ON+0)
_SX	[R0, ByteOffset(ACCUMULATOR2_ON+0)]
;batteryChange.c,137 :: 		ACCUMULATORS_OFF = 0;
MOVW	R0, #lo_addr(ACCUMULATORS_OFF+0)
MOVT	R0, #hi_addr(ACCUMULATORS_OFF+0)
_SX	[R0, ByteOffset(ACCUMULATORS_OFF+0)]
;batteryChange.c,139 :: 		battery_change_continue = 0;
MOVW	R0, #lo_addr(_battery_change_continue+0)
MOVT	R0, #hi_addr(_battery_change_continue+0)
STR	R1, [R0, #0]
;batteryChange.c,140 :: 		battery_change = 0;
MOVW	R0, #lo_addr(_battery_change+0)
MOVT	R0, #hi_addr(_battery_change+0)
STR	R1, [R0, #0]
;batteryChange.c,141 :: 		battery_change_count = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_battery_change_count+0)
MOVT	R0, #hi_addr(_battery_change_count+0)
STRH	R1, [R0, #0]
;batteryChange.c,143 :: 		}
L_batteryChangeState31:
;batteryChange.c,144 :: 		}
L_end_batteryChangeState:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _batteryChangeState
