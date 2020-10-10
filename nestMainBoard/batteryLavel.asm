_batteryLavelMeasure:
;batteryLavel.c,5 :: 		void batteryLavelMeasure(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;batteryLavel.c,7 :: 		if(battry_percentage_check)
MOVW	R1, #lo_addr(_battry_percentage_check+0)
MOVT	R1, #hi_addr(_battry_percentage_check+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_batteryLavelMeasure0
;batteryLavel.c,9 :: 		battry_percentage_check = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(_battry_percentage_check+0)
MOVT	R0, #hi_addr(_battry_percentage_check+0)
STR	R1, [R0, #0]
;batteryLavel.c,10 :: 		battry_percentage_check_counter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_battry_percentage_check_counter+0)
MOVT	R0, #hi_addr(_battry_percentage_check_counter+0)
STRH	R1, [R0, #0]
;batteryLavel.c,23 :: 		for(i=0; i<300; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure1:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	GE
BGE	L_batteryLavelMeasure2
;batteryLavel.c,24 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_4);
MOVW	R0, #16
BL	_ADC_Set_Input_Channel+0
;batteryLavel.c,25 :: 		adc_read2 = ADC2_Get_Sample(4);
MOVS	R0, #4
BL	_ADC2_Get_Sample+0
MOVW	R3, #lo_addr(_adc_read2+0)
MOVT	R3, #hi_addr(_adc_read2+0)
STR	R0, [R3, #0]
;batteryLavel.c,26 :: 		adc_array2[i] = adc_read2;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;batteryLavel.c,23 :: 		for(i=0; i<300; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;batteryLavel.c,27 :: 		}
IT	AL
BAL	L_batteryLavelMeasure1
L_batteryLavelMeasure2:
;batteryLavel.c,29 :: 		for(i=0; i<300; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure4:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	GE
BGE	L_batteryLavelMeasure5
;batteryLavel.c,31 :: 		for(j=i+1; j<300; j++)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure7:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	CS
BCS	L_batteryLavelMeasure8
;batteryLavel.c,33 :: 		if(adc_array2[j]<adc_array2[i])
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R0, R0, R1
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R2, R0
IT	CS
BCS	L_batteryLavelMeasure10
;batteryLavel.c,35 :: 		tmp = adc_array2[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R4, R0, R1
LDR	R0, [R4, #0]
MOVW	R3, #lo_addr(_tmp+0)
MOVT	R3, #hi_addr(_tmp+0)
STR	R0, [R3, #0]
;batteryLavel.c,36 :: 		adc_array2[i] = adc_array2[j];
MOVW	R2, #lo_addr(_j+0)
MOVT	R2, #hi_addr(_j+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;batteryLavel.c,37 :: 		adc_array2[j] = tmp;
MOV	R0, R2
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;batteryLavel.c,38 :: 		}
L_batteryLavelMeasure10:
;batteryLavel.c,31 :: 		for(j=i+1; j<300; j++)
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;batteryLavel.c,39 :: 		}
IT	AL
BAL	L_batteryLavelMeasure7
L_batteryLavelMeasure8:
;batteryLavel.c,29 :: 		for(i=0; i<300; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;batteryLavel.c,40 :: 		}
IT	AL
BAL	L_batteryLavelMeasure4
L_batteryLavelMeasure5:
;batteryLavel.c,42 :: 		for(i=100; i<200; i++){
MOVS	R1, #100
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure11:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #200
IT	GE
BGE	L_batteryLavelMeasure12
;batteryLavel.c,43 :: 		adcSum2 += adc_array2[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array2+0)
MOVT	R0, #hi_addr(_adc_array2+0)
ADDS	R0, R0, R1
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(_adcSum2+0)
MOVT	R1, #hi_addr(_adcSum2+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;batteryLavel.c,42 :: 		for(i=100; i<200; i++){
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;batteryLavel.c,44 :: 		}
IT	AL
BAL	L_batteryLavelMeasure11
L_batteryLavelMeasure12:
;batteryLavel.c,47 :: 		adc_avg2 = ((float)adcSum2)/100f;
MOVW	R2, #lo_addr(_adcSum2+0)
MOVT	R2, #hi_addr(_adcSum2+0)
VLDR	#1, S0, [R2, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R1, #lo_addr(_adc_avg2+0)
MOVT	R1, #hi_addr(_adc_avg2+0)
VSTR	#1, S1, [R1, #0]
;batteryLavel.c,48 :: 		adcSum2 = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;batteryLavel.c,57 :: 		adc_avg2 = adc_avg2 - 2860f;//adc_avg2 = adc_avg2 - 2953f;//adc_avg2 = adc_avg2 - 2910;
MOVW	R0, #49152
MOVT	R0, #17714
VMOV	S0, R0
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;batteryLavel.c,59 :: 		if(adc_avg2 < 0f){
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_batteryLavelMeasure14
;batteryLavel.c,60 :: 		adc_avg2 = 0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_adc_avg2+0)
MOVT	R0, #hi_addr(_adc_avg2+0)
VSTR	#1, S0, [R0, #0]
;batteryLavel.c,61 :: 		}
IT	AL
BAL	L_batteryLavelMeasure15
L_batteryLavelMeasure14:
;batteryLavel.c,62 :: 		else if(adc_avg2 > 340f){         //297f
MOVW	R0, #lo_addr(_adc_avg2+0)
MOVT	R0, #hi_addr(_adc_avg2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17322
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_batteryLavelMeasure16
;batteryLavel.c,63 :: 		adc_avg2 = 340f;
MOVW	R0, #0
MOVT	R0, #17322
VMOV	S0, R0
MOVW	R0, #lo_addr(_adc_avg2+0)
MOVT	R0, #hi_addr(_adc_avg2+0)
VSTR	#1, S0, [R0, #0]
;batteryLavel.c,64 :: 		}
L_batteryLavelMeasure16:
L_batteryLavelMeasure15:
;batteryLavel.c,67 :: 		battery_percentage1 = (100f/340f)*adc_avg2;
MOVW	R0, #lo_addr(_adc_avg2+0)
MOVT	R0, #hi_addr(_adc_avg2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #38551
MOVT	R0, #16022
VMOV	S0, R0
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VSTR	#1, S1, [R0, #0]
;batteryLavel.c,70 :: 		if(battery_percentage1 >= 87.5){
MOVW	R0, #0
MOVT	R0, #17071
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure17
;batteryLavel.c,78 :: 		uart4Battery1Level4();
BL	_uart4Battery1Level4+0
;batteryLavel.c,80 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #248
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,81 :: 		boatBatteriesLavel =  boatBatteriesLavel | 0x04;
ORR	R0, R0, #4
STRB	R0, [R1, #0]
;batteryLavel.c,82 :: 		}
IT	AL
BAL	L_batteryLavelMeasure18
L_batteryLavelMeasure17:
;batteryLavel.c,83 :: 		else if(battery_percentage1 >= 62.5){
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17018
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure19
;batteryLavel.c,91 :: 		uart4Battery1Level3();
BL	_uart4Battery1Level3+0
;batteryLavel.c,93 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #248
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,94 :: 		boatBatteriesLavel =  boatBatteriesLavel | 0x03;
ORR	R0, R0, #3
STRB	R0, [R1, #0]
;batteryLavel.c,95 :: 		}
IT	AL
BAL	L_batteryLavelMeasure20
L_batteryLavelMeasure19:
;batteryLavel.c,96 :: 		else if(battery_percentage1 >= 37.5){
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16918
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure21
;batteryLavel.c,104 :: 		uart4Battery1Level2();
BL	_uart4Battery1Level2+0
;batteryLavel.c,106 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #248
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,107 :: 		boatBatteriesLavel =  boatBatteriesLavel | 0x02;
ORR	R0, R0, #2
STRB	R0, [R1, #0]
;batteryLavel.c,108 :: 		}
IT	AL
BAL	L_batteryLavelMeasure22
L_batteryLavelMeasure21:
;batteryLavel.c,109 :: 		else if(battery_percentage1 >= 1.0){
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure23
;batteryLavel.c,117 :: 		uart4Battery1Level1();
BL	_uart4Battery1Level1+0
;batteryLavel.c,119 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #248
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,120 :: 		boatBatteriesLavel =  boatBatteriesLavel | 0x01;
ORR	R0, R0, #1
STRB	R0, [R1, #0]
;batteryLavel.c,121 :: 		}
IT	AL
BAL	L_batteryLavelMeasure24
L_batteryLavelMeasure23:
;batteryLavel.c,122 :: 		else if(battery_percentage1 < 1.0){
MOVW	R0, #lo_addr(_battery_percentage1+0)
MOVT	R0, #hi_addr(_battery_percentage1+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_batteryLavelMeasure25
;batteryLavel.c,130 :: 		uart4Battery1Level0();
BL	_uart4Battery1Level0+0
;batteryLavel.c,132 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xF8;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #248
STRB	R0, [R1, #0]
;batteryLavel.c,133 :: 		boatBatteriesLavel =  boatBatteriesLavel | 0x00;
STRB	R0, [R1, #0]
;batteryLavel.c,134 :: 		}
L_batteryLavelMeasure25:
L_batteryLavelMeasure24:
L_batteryLavelMeasure22:
L_batteryLavelMeasure20:
L_batteryLavelMeasure18:
;batteryLavel.c,148 :: 		for(i=0; i<300; i++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure26:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	GE
BGE	L_batteryLavelMeasure27
;batteryLavel.c,149 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_5);
MOVW	R0, #32
BL	_ADC_Set_Input_Channel+0
;batteryLavel.c,150 :: 		adc_read3 = ADC2_Get_Sample(5);
MOVS	R0, #5
BL	_ADC2_Get_Sample+0
MOVW	R3, #lo_addr(_adc_read3+0)
MOVT	R3, #hi_addr(_adc_read3+0)
STR	R0, [R3, #0]
;batteryLavel.c,151 :: 		adc_array3[i] = adc_read3;
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;batteryLavel.c,148 :: 		for(i=0; i<300; i++){
MOV	R0, R2
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R2, #0]
;batteryLavel.c,152 :: 		}
IT	AL
BAL	L_batteryLavelMeasure26
L_batteryLavelMeasure27:
;batteryLavel.c,154 :: 		for(i=0; i<300; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure29:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #300
IT	GE
BGE	L_batteryLavelMeasure30
;batteryLavel.c,156 :: 		for(j=i+1; j<300; j++)
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure32:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRH	R0, [R0, #0]
CMP	R0, #300
IT	CS
BCS	L_batteryLavelMeasure33
;batteryLavel.c,158 :: 		if(adc_array3[j]<adc_array3[i])
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R0, R0, R1
LDR	R2, [R0, #0]
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
CMP	R2, R0
IT	CS
BCS	L_batteryLavelMeasure35
;batteryLavel.c,160 :: 		tmp = adc_array3[i];
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R4, R0, R1
LDR	R0, [R4, #0]
MOVW	R3, #lo_addr(_tmp+0)
MOVT	R3, #hi_addr(_tmp+0)
STR	R0, [R3, #0]
;batteryLavel.c,161 :: 		adc_array3[i] = adc_array3[j];
MOVW	R2, #lo_addr(_j+0)
MOVT	R2, #hi_addr(_j+0)
LDRH	R0, [R2, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
STR	R0, [R4, #0]
;batteryLavel.c,162 :: 		adc_array3[j] = tmp;
MOV	R0, R2
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R1, R0, R1
MOV	R0, R3
LDR	R0, [R0, #0]
STR	R0, [R1, #0]
;batteryLavel.c,163 :: 		}
L_batteryLavelMeasure35:
;batteryLavel.c,156 :: 		for(j=i+1; j<300; j++)
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;batteryLavel.c,164 :: 		}
IT	AL
BAL	L_batteryLavelMeasure32
L_batteryLavelMeasure33:
;batteryLavel.c,154 :: 		for(i=0; i<300; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;batteryLavel.c,165 :: 		}
IT	AL
BAL	L_batteryLavelMeasure29
L_batteryLavelMeasure30:
;batteryLavel.c,167 :: 		for(i=100; i<200; i++){
MOVS	R1, #100
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_batteryLavelMeasure36:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #200
IT	GE
BGE	L_batteryLavelMeasure37
;batteryLavel.c,168 :: 		adcSum3 += adc_array3[i];
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_adc_array3+0)
MOVT	R0, #hi_addr(_adc_array3+0)
ADDS	R0, R0, R1
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(_adcSum3+0)
MOVT	R1, #hi_addr(_adcSum3+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;batteryLavel.c,167 :: 		for(i=100; i<200; i++){
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;batteryLavel.c,169 :: 		}
IT	AL
BAL	L_batteryLavelMeasure36
L_batteryLavelMeasure37:
;batteryLavel.c,172 :: 		adc_avg3 = ((float)adcSum3)/100f;
MOVW	R2, #lo_addr(_adcSum3+0)
MOVT	R2, #hi_addr(_adcSum3+0)
VLDR	#1, S0, [R2, #0]
VCVT.F32	#0, S1, S0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R1, #lo_addr(_adc_avg3+0)
MOVT	R1, #hi_addr(_adc_avg3+0)
VSTR	#1, S1, [R1, #0]
;batteryLavel.c,173 :: 		adcSum3 = 0;
MOVS	R0, #0
STR	R0, [R2, #0]
;batteryLavel.c,179 :: 		adc_avg3 = adc_avg3 - 2860f;//adc_avg3 = adc_avg3 - 2910;
MOVW	R0, #49152
MOVT	R0, #17714
VMOV	S0, R0
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;batteryLavel.c,181 :: 		if(adc_avg3 < 0f){
VCMPE.F32	S0, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_batteryLavelMeasure39
;batteryLavel.c,182 :: 		adc_avg3 = 0f;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_adc_avg3+0)
MOVT	R0, #hi_addr(_adc_avg3+0)
VSTR	#1, S0, [R0, #0]
;batteryLavel.c,183 :: 		}
IT	AL
BAL	L_batteryLavelMeasure40
L_batteryLavelMeasure39:
;batteryLavel.c,184 :: 		else if(adc_avg3 > 340f){
MOVW	R0, #lo_addr(_adc_avg3+0)
MOVT	R0, #hi_addr(_adc_avg3+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17322
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LE
BLE	L_batteryLavelMeasure41
;batteryLavel.c,185 :: 		adc_avg3 = 340f;
MOVW	R0, #0
MOVT	R0, #17322
VMOV	S0, R0
MOVW	R0, #lo_addr(_adc_avg3+0)
MOVT	R0, #hi_addr(_adc_avg3+0)
VSTR	#1, S0, [R0, #0]
;batteryLavel.c,186 :: 		}
L_batteryLavelMeasure41:
L_batteryLavelMeasure40:
;batteryLavel.c,188 :: 		battery_percentage2 = (100f/340f)*adc_avg3;
MOVW	R0, #lo_addr(_adc_avg3+0)
MOVT	R0, #hi_addr(_adc_avg3+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #38551
MOVT	R0, #16022
VMOV	S0, R0
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VSTR	#1, S1, [R0, #0]
;batteryLavel.c,192 :: 		if(battery_percentage2 >= 87.5){
MOVW	R0, #0
MOVT	R0, #17071
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure42
;batteryLavel.c,200 :: 		uart4Battery2Level4();
BL	_uart4Battery2Level4+0
;batteryLavel.c,202 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #199
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,203 :: 		boatBatteriesLavel =  boatBatteriesLavel | (0x04 << 3);
ORR	R0, R0, #32
STRB	R0, [R1, #0]
;batteryLavel.c,205 :: 		}
IT	AL
BAL	L_batteryLavelMeasure43
L_batteryLavelMeasure42:
;batteryLavel.c,206 :: 		else if(battery_percentage2 >= 62.5){
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17018
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure44
;batteryLavel.c,214 :: 		uart4Battery2Level3();
BL	_uart4Battery2Level3+0
;batteryLavel.c,216 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #199
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,217 :: 		boatBatteriesLavel =  boatBatteriesLavel | (0x03 << 3);
ORR	R0, R0, #24
STRB	R0, [R1, #0]
;batteryLavel.c,218 :: 		}
IT	AL
BAL	L_batteryLavelMeasure45
L_batteryLavelMeasure44:
;batteryLavel.c,219 :: 		else if(battery_percentage2 >= 37.5){
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #16918
VMOV	S0, R0
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure46
;batteryLavel.c,227 :: 		uart4Battery2Level2();
BL	_uart4Battery2Level2+0
;batteryLavel.c,229 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #199
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,230 :: 		boatBatteriesLavel =  boatBatteriesLavel | (0x02 << 3);
ORR	R0, R0, #16
STRB	R0, [R1, #0]
;batteryLavel.c,231 :: 		}
IT	AL
BAL	L_batteryLavelMeasure47
L_batteryLavelMeasure46:
;batteryLavel.c,232 :: 		else if(battery_percentage2 >= 1.0){
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	LT
BLT	L_batteryLavelMeasure48
;batteryLavel.c,240 :: 		uart4Battery2Level1();
BL	_uart4Battery2Level1+0
;batteryLavel.c,242 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #199
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,243 :: 		boatBatteriesLavel =  boatBatteriesLavel | (0x01 << 3);
ORR	R0, R0, #8
STRB	R0, [R1, #0]
;batteryLavel.c,244 :: 		}
IT	AL
BAL	L_batteryLavelMeasure49
L_batteryLavelMeasure48:
;batteryLavel.c,245 :: 		else if(battery_percentage2 < 1.0){
MOVW	R0, #lo_addr(_battery_percentage2+0)
MOVT	R0, #hi_addr(_battery_percentage2+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	GE
BGE	L_batteryLavelMeasure50
;batteryLavel.c,253 :: 		uart4Battery2Level0();
BL	_uart4Battery2Level0+0
;batteryLavel.c,255 :: 		boatBatteriesLavel =  boatBatteriesLavel & 0xC7;
MOVW	R1, #lo_addr(_boatBatteriesLavel+0)
MOVT	R1, #hi_addr(_boatBatteriesLavel+0)
LDRB	R0, [R1, #0]
AND	R0, R0, #199
UXTB	R0, R0
STRB	R0, [R1, #0]
;batteryLavel.c,256 :: 		boatBatteriesLavel =  boatBatteriesLavel | (0x00 << 3);
STRB	R0, [R1, #0]
;batteryLavel.c,257 :: 		}
L_batteryLavelMeasure50:
L_batteryLavelMeasure49:
L_batteryLavelMeasure47:
L_batteryLavelMeasure45:
L_batteryLavelMeasure43:
;batteryLavel.c,258 :: 		}
L_batteryLavelMeasure0:
;batteryLavel.c,259 :: 		}
L_end_batteryLavelMeasure:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _batteryLavelMeasure
