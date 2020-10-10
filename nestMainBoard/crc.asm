_ModRTU_CRC:
;crc.c,3 :: 		unsigned int ModRTU_CRC(char buf[], int len){
; len start address is: 4 (R1)
; buf start address is: 0 (R0)
SXTH	R2, R1
MOV	R1, R0
; len end address is: 4 (R1)
; buf end address is: 0 (R0)
; buf start address is: 4 (R1)
; len start address is: 8 (R2)
;crc.c,4 :: 		char Hb = 0x00;
;crc.c,5 :: 		char Lb = 0x00;
;crc.c,6 :: 		int pos = 0;
;crc.c,7 :: 		int i = 0;
;crc.c,8 :: 		unsigned int crc = 0xFFFF;
; crc start address is: 12 (R3)
MOVW	R3, #65535
;crc.c,11 :: 		for (pos = 0; pos < len; pos++){
; pos start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; buf end address is: 4 (R1)
; len end address is: 8 (R2)
; crc end address is: 12 (R3)
; pos end address is: 0 (R0)
MOV	R4, R1
UXTH	R1, R3
SXTH	R5, R2
L_ModRTU_CRC0:
; pos start address is: 0 (R0)
; crc start address is: 4 (R1)
; len start address is: 20 (R5)
; buf start address is: 16 (R4)
CMP	R0, R5
IT	GE
BGE	L_ModRTU_CRC1
;crc.c,12 :: 		crc ^= buf[pos];               // XOR byte into least sig. byte of crc
ADDS	R2, R4, R0
LDRB	R2, [R2, #0]
EOR	R6, R1, R2, LSL #0
UXTH	R6, R6
; crc end address is: 4 (R1)
; crc start address is: 24 (R6)
;crc.c,13 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; i start address is: 4 (R1)
MOVS	R1, #8
SXTH	R1, R1
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; i end address is: 4 (R1)
; pos end address is: 0 (R0)
L_ModRTU_CRC3:
; i start address is: 4 (R1)
; crc start address is: 24 (R6)
; buf start address is: 16 (R4)
; len start address is: 20 (R5)
; pos start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_ModRTU_CRC4
;crc.c,14 :: 		if ((crc & 0x0001) != 0){    // If the LSB is set
AND	R2, R6, #1
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_ModRTU_CRC6
;crc.c,15 :: 		crc >>= 1;                 // Shift right and XOR 0xA001
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
;crc.c,16 :: 		crc ^= 0xA001;
MOVW	R2, #40961
EORS	R6, R2
UXTH	R6, R6
; crc start address is: 24 (R6)
;crc.c,17 :: 		}
IT	AL
BAL	L_ModRTU_CRC7
L_ModRTU_CRC6:
;crc.c,18 :: 		else crc >>= 1;              // Else LSB is not set  // Just shift right
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
L_ModRTU_CRC7:
;crc.c,13 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; crc start address is: 24 (R6)
SUBS	R1, R1, #1
SXTH	R1, R1
;crc.c,19 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_ModRTU_CRC3
L_ModRTU_CRC4:
;crc.c,11 :: 		for (pos = 0; pos < len; pos++){
ADDS	R0, R0, #1
SXTH	R0, R0
;crc.c,20 :: 		}
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; pos end address is: 0 (R0)
UXTH	R1, R6
IT	AL
BAL	L_ModRTU_CRC0
L_ModRTU_CRC1:
;crc.c,24 :: 		return crc;
; crc start address is: 4 (R1)
UXTH	R0, R1
; crc end address is: 4 (R1)
;crc.c,25 :: 		}
L_end_ModRTU_CRC:
BX	LR
; end of _ModRTU_CRC
_ModRTU_CRC_Hb:
;crc.c,28 :: 		unsigned short ModRTU_CRC_Hb(char buf[], int len){
; len start address is: 4 (R1)
; buf start address is: 0 (R0)
SXTH	R2, R1
MOV	R1, R0
; len end address is: 4 (R1)
; buf end address is: 0 (R0)
; buf start address is: 4 (R1)
; len start address is: 8 (R2)
;crc.c,29 :: 		char Hb = 0x00;
;crc.c,30 :: 		char Lb = 0x00;
;crc.c,31 :: 		int pos = 0;
;crc.c,32 :: 		int i = 0;
;crc.c,33 :: 		unsigned int crc = 0xFFFF;
;crc.c,35 :: 		crc = 0xFFFF;
; crc start address is: 12 (R3)
MOVW	R3, #65535
;crc.c,36 :: 		for (pos = 0; pos < len; pos++){
; pos start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; buf end address is: 4 (R1)
; len end address is: 8 (R2)
; crc end address is: 12 (R3)
; pos end address is: 0 (R0)
MOV	R4, R1
UXTH	R1, R3
SXTH	R5, R2
L_ModRTU_CRC_Hb8:
; pos start address is: 0 (R0)
; crc start address is: 4 (R1)
; len start address is: 20 (R5)
; buf start address is: 16 (R4)
CMP	R0, R5
IT	GE
BGE	L_ModRTU_CRC_Hb9
;crc.c,37 :: 		crc ^= buf[pos];               // XOR byte into least sig. byte of crc
ADDS	R2, R4, R0
LDRB	R2, [R2, #0]
EOR	R6, R1, R2, LSL #0
UXTH	R6, R6
; crc end address is: 4 (R1)
; crc start address is: 24 (R6)
;crc.c,38 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; i start address is: 4 (R1)
MOVS	R1, #8
SXTH	R1, R1
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; i end address is: 4 (R1)
; pos end address is: 0 (R0)
L_ModRTU_CRC_Hb11:
; i start address is: 4 (R1)
; crc start address is: 24 (R6)
; buf start address is: 16 (R4)
; len start address is: 20 (R5)
; pos start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_ModRTU_CRC_Hb12
;crc.c,39 :: 		if ((crc & 0x0001) != 0){    // If the LSB is set
AND	R2, R6, #1
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_ModRTU_CRC_Hb14
;crc.c,40 :: 		crc >>= 1;                 // Shift right and XOR 0xA001
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
;crc.c,41 :: 		crc ^= 0xA001;
MOVW	R2, #40961
EORS	R6, R2
UXTH	R6, R6
; crc start address is: 24 (R6)
;crc.c,42 :: 		}
IT	AL
BAL	L_ModRTU_CRC_Hb15
L_ModRTU_CRC_Hb14:
;crc.c,43 :: 		else crc >>= 1;              // Else LSB is not set  // Just shift right
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
L_ModRTU_CRC_Hb15:
;crc.c,38 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; crc start address is: 24 (R6)
SUBS	R1, R1, #1
SXTH	R1, R1
;crc.c,44 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_ModRTU_CRC_Hb11
L_ModRTU_CRC_Hb12:
;crc.c,36 :: 		for (pos = 0; pos < len; pos++){
ADDS	R0, R0, #1
SXTH	R0, R0
;crc.c,45 :: 		}
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; pos end address is: 0 (R0)
UXTH	R1, R6
IT	AL
BAL	L_ModRTU_CRC_Hb8
L_ModRTU_CRC_Hb9:
;crc.c,47 :: 		Hb =  crc >> 8;
; crc start address is: 4 (R1)
LSRS	R2, R1, #8
; crc end address is: 4 (R1)
;crc.c,49 :: 		return Hb;
UXTB	R0, R2
;crc.c,50 :: 		}
L_end_ModRTU_CRC_Hb:
BX	LR
; end of _ModRTU_CRC_Hb
_ModRTU_CRC_Lb:
;crc.c,52 :: 		unsigned short ModRTU_CRC_Lb(char buf[], int len){
; len start address is: 4 (R1)
; buf start address is: 0 (R0)
SXTH	R2, R1
MOV	R1, R0
; len end address is: 4 (R1)
; buf end address is: 0 (R0)
; buf start address is: 4 (R1)
; len start address is: 8 (R2)
;crc.c,53 :: 		char Hb = 0x00;
;crc.c,54 :: 		char Lb = 0x00;
;crc.c,55 :: 		int pos = 0;
;crc.c,56 :: 		int i = 0;
;crc.c,57 :: 		unsigned int crc = 0xFFFF;
;crc.c,59 :: 		crc = 0xFFFF;
; crc start address is: 12 (R3)
MOVW	R3, #65535
;crc.c,60 :: 		for (pos = 0; pos < len; pos++){
; pos start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; buf end address is: 4 (R1)
; len end address is: 8 (R2)
; crc end address is: 12 (R3)
; pos end address is: 0 (R0)
MOV	R4, R1
UXTH	R1, R3
SXTH	R5, R2
L_ModRTU_CRC_Lb16:
; pos start address is: 0 (R0)
; crc start address is: 4 (R1)
; len start address is: 20 (R5)
; buf start address is: 16 (R4)
CMP	R0, R5
IT	GE
BGE	L_ModRTU_CRC_Lb17
;crc.c,61 :: 		crc ^= buf[pos];               // XOR byte into least sig. byte of crc
ADDS	R2, R4, R0
LDRB	R2, [R2, #0]
EOR	R6, R1, R2, LSL #0
UXTH	R6, R6
; crc end address is: 4 (R1)
; crc start address is: 24 (R6)
;crc.c,62 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; i start address is: 4 (R1)
MOVS	R1, #8
SXTH	R1, R1
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; i end address is: 4 (R1)
; pos end address is: 0 (R0)
L_ModRTU_CRC_Lb19:
; i start address is: 4 (R1)
; crc start address is: 24 (R6)
; buf start address is: 16 (R4)
; len start address is: 20 (R5)
; pos start address is: 0 (R0)
CMP	R1, #0
IT	EQ
BEQ	L_ModRTU_CRC_Lb20
;crc.c,63 :: 		if ((crc & 0x0001) != 0){    // If the LSB is set
AND	R2, R6, #1
UXTH	R2, R2
CMP	R2, #0
IT	EQ
BEQ	L_ModRTU_CRC_Lb22
;crc.c,64 :: 		crc >>= 1;                 // Shift right and XOR 0xA001
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
;crc.c,65 :: 		crc ^= 0xA001;
MOVW	R2, #40961
EORS	R6, R2
UXTH	R6, R6
; crc start address is: 24 (R6)
;crc.c,66 :: 		}
IT	AL
BAL	L_ModRTU_CRC_Lb23
L_ModRTU_CRC_Lb22:
;crc.c,67 :: 		else crc >>= 1;              // Else LSB is not set  // Just shift right
LSRS	R6, R6, #1
UXTH	R6, R6
; crc end address is: 24 (R6)
L_ModRTU_CRC_Lb23:
;crc.c,62 :: 		for (i = 8; i != 0; i--){      // Loop over each bit
; crc start address is: 24 (R6)
SUBS	R1, R1, #1
SXTH	R1, R1
;crc.c,68 :: 		}
; i end address is: 4 (R1)
IT	AL
BAL	L_ModRTU_CRC_Lb19
L_ModRTU_CRC_Lb20:
;crc.c,60 :: 		for (pos = 0; pos < len; pos++){
ADDS	R0, R0, #1
SXTH	R0, R0
;crc.c,69 :: 		}
; buf end address is: 16 (R4)
; len end address is: 20 (R5)
; crc end address is: 24 (R6)
; pos end address is: 0 (R0)
UXTH	R1, R6
IT	AL
BAL	L_ModRTU_CRC_Lb16
L_ModRTU_CRC_Lb17:
;crc.c,73 :: 		return Lb;
; crc start address is: 4 (R1)
UXTB	R0, R1
; crc end address is: 4 (R1)
;crc.c,74 :: 		}
L_end_ModRTU_CRC_Lb:
BX	LR
; end of _ModRTU_CRC_Lb
_crc8:
;crc.c,77 :: 		unsigned short crc8(unsigned short dir, unsigned short speed){
; speed start address is: 4 (R1)
; dir start address is: 0 (R0)
SUB	SP, SP, #4
UXTB	R3, R1
; speed end address is: 4 (R1)
; dir end address is: 0 (R0)
; dir start address is: 0 (R0)
; speed start address is: 12 (R3)
;crc.c,83 :: 		speed1 = speed / 16;
LSRS	R2, R3, #4
; speed1 start address is: 4 (R1)
UXTB	R1, R2
;crc.c,84 :: 		speed0 = speed % 16;
AND	R2, R3, #15
UXTB	R2, R2
; speed end address is: 12 (R3)
; speed0 start address is: 16 (R4)
UXTB	R4, R2
;crc.c,86 :: 		if(speed0 >= 0x0C){
CMP	R2, #12
IT	CC
BCC	L_crc824
;crc.c,87 :: 		temp = 0x0B - 2*(0x0F - speed0);
RSB	R2, R4, #15
SXTH	R2, R2
LSLS	R2, R2, #1
SXTH	R2, R2
RSB	R2, R2, #11
;crc.c,88 :: 		crc = speed1 * 16 + (speed0 - temp);
LSLS	R3, R1, #4
SXTH	R3, R3
; speed1 end address is: 4 (R1)
UXTB	R2, R2
SUB	R2, R4, R2
SXTH	R2, R2
ADDS	R2, R3, R2
STRB	R2, [SP, #0]
;crc.c,89 :: 		}
IT	AL
BAL	L_crc825
L_crc824:
;crc.c,90 :: 		else if (speed0 >= 0x08){
; speed1 start address is: 4 (R1)
CMP	R4, #8
IT	CC
BCC	L_crc826
;crc.c,91 :: 		temp = 0x0B - 2*(0x0B - speed0);
RSB	R2, R4, #11
SXTH	R2, R2
LSLS	R2, R2, #1
SXTH	R2, R2
RSB	R2, R2, #11
;crc.c,92 :: 		crc = speed1 * 16 + (speed0 - temp);
LSLS	R3, R1, #4
SXTH	R3, R3
; speed1 end address is: 4 (R1)
UXTB	R2, R2
SUB	R2, R4, R2
SXTH	R2, R2
ADDS	R2, R3, R2
STRB	R2, [SP, #0]
;crc.c,93 :: 		}
IT	AL
BAL	L_crc827
L_crc826:
;crc.c,94 :: 		else if (speed0 >= 0x04){
; speed1 start address is: 4 (R1)
CMP	R4, #4
IT	CC
BCC	L_crc828
;crc.c,95 :: 		temp = 0x05 + 2*(0x07 - speed0);
RSB	R2, R4, #7
SXTH	R2, R2
LSLS	R2, R2, #1
SXTH	R2, R2
ADDS	R2, R2, #5
;crc.c,96 :: 		crc = speed1 * 16 + (speed0 + temp);
LSLS	R3, R1, #4
SXTH	R3, R3
; speed1 end address is: 4 (R1)
UXTB	R2, R2
ADDS	R2, R4, R2
SXTH	R2, R2
ADDS	R2, R3, R2
STRB	R2, [SP, #0]
;crc.c,97 :: 		}
IT	AL
BAL	L_crc829
L_crc828:
;crc.c,98 :: 		else if (speed0 >= 0x00){
; speed1 start address is: 4 (R1)
CMP	R4, #0
IT	CC
BCC	L_crc830
;crc.c,99 :: 		temp = 0x05 + 2*(0x03 - speed0);
RSB	R2, R4, #3
SXTH	R2, R2
LSLS	R2, R2, #1
SXTH	R2, R2
ADDS	R2, R2, #5
;crc.c,100 :: 		crc = speed1 * 16 + (speed0 + temp);
LSLS	R3, R1, #4
SXTH	R3, R3
; speed1 end address is: 4 (R1)
UXTB	R2, R2
ADDS	R2, R4, R2
SXTH	R2, R2
ADDS	R2, R3, R2
STRB	R2, [SP, #0]
;crc.c,101 :: 		}
L_crc830:
L_crc829:
L_crc827:
L_crc825:
;crc.c,103 :: 		if(dir == 0x01){
CMP	R0, #1
IT	NE
BNE	L_crc831
; dir end address is: 0 (R0)
;crc.c,104 :: 		if(speed0 % 2 == 0){
AND	R2, R4, #1
UXTB	R2, R2
; speed0 end address is: 16 (R4)
CMP	R2, #0
IT	NE
BNE	L_crc832
;crc.c,105 :: 		crc -= 1;
LDRB	R2, [SP, #0]
SUBS	R2, R2, #1
STRB	R2, [SP, #0]
;crc.c,106 :: 		}
IT	AL
BAL	L_crc833
L_crc832:
;crc.c,108 :: 		crc += 1;
LDRB	R2, [SP, #0]
ADDS	R2, R2, #1
STRB	R2, [SP, #0]
;crc.c,109 :: 		}
L_crc833:
;crc.c,110 :: 		}
L_crc831:
;crc.c,112 :: 		return crc;
LDRB	R0, [SP, #0]
;crc.c,113 :: 		}
L_end_crc8:
ADD	SP, SP, #4
BX	LR
; end of _crc8
