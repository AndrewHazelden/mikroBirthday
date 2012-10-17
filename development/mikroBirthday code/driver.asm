
_Set_Index:

;driver.c,14 :: 		void Set_Index(unsigned short index) {
;driver.c,15 :: 		TFT_RS = 0;
	BCLR	LATB15_bit, #15
;driver.c,16 :: 		Lo(LATA) = index;
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;driver.c,17 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, #13
;driver.c,18 :: 		TFT_WR = 1;
	BSET	LATD13_bit, #13
;driver.c,19 :: 		}
L_end_Set_Index:
	RETURN
; end of _Set_Index

_Write_Command:

;driver.c,22 :: 		void Write_Command(unsigned short cmd) {
;driver.c,23 :: 		TFT_RS = 1;
	BSET	LATB15_bit, #15
;driver.c,24 :: 		Lo(LATA) = cmd;
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;driver.c,25 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, #13
;driver.c,26 :: 		TFT_WR = 1;
	BSET	LATD13_bit, #13
;driver.c,27 :: 		}
L_end_Write_Command:
	RETURN
; end of _Write_Command

_Write_Data:

;driver.c,30 :: 		void Write_Data(unsigned int _data) {
;driver.c,31 :: 		TFT_RS = 1;
	BSET	LATB15_bit, #15
;driver.c,32 :: 		Lo(LATE) = Hi(_data);
	MOV	#lo_addr(W10), W0
	INC	W0
	MOV.B	[W0], W1
	MOV	#lo_addr(LATE), W0
	MOV.B	W1, [W0]
;driver.c,33 :: 		Lo(LATA) = Lo(_data);
	MOV	#lo_addr(LATA), W0
	MOV.B	W10, [W0]
;driver.c,34 :: 		TFT_WR = 0;
	BCLR	LATD13_bit, #13
;driver.c,35 :: 		TFT_WR = 1;
	BSET	LATD13_bit, #13
;driver.c,36 :: 		}
L_end_Write_Data:
	RETURN
; end of _Write_Data

_Init_ADC:

;driver.c,38 :: 		void Init_ADC() {
;driver.c,39 :: 		AD1PCFGL = 0xCFFF;
	MOV	#53247, W0
	MOV	WREG, AD1PCFGL
;driver.c,40 :: 		AD1PCFGH = 0xCFFF;
	MOV	#53247, W0
	MOV	WREG, AD1PCFGH
;driver.c,41 :: 		ADC1_Init();
	CALL	_ADC1_Init
;driver.c,42 :: 		}
L_end_Init_ADC:
	RETURN
; end of _Init_ADC

_Init_MCU:

;driver.c,44 :: 		void Init_MCU() {
;driver.c,46 :: 		TFT_DATAPORT_DIRECTION = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	CLR.B	TRISA
;driver.c,47 :: 		CLKDIVBITS.PLLPRE = 0;      // PLLPRE<4:0> = 0  ->  N1 = 2    8MHZ / 2 = 4MHZ
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#224, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;driver.c,49 :: 		PLLFBD =   30;              // PLLDIV<8:0> = 30 ->  M = 32    4MHZ * 32 = 128MHZ
	MOV	#30, W0
	MOV	WREG, PLLFBD
;driver.c,51 :: 		CLKDIVBITS.PLLPOST = 0;     // PLLPOST<1:0> = 0 ->  N2 = 2    128MHZ / 2 = 64MHZ
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	[W0], W1
	MOV.B	#63, W0
	AND.B	W1, W0, W1
	MOV	#lo_addr(CLKDIVbits), W0
	MOV.B	W1, [W0]
;driver.c,53 :: 		DELAY_MS(150);
	MOV	#25, W8
	MOV	#27143, W7
L_Init_MCU0:
	DEC	W7
	BRA NZ	L_Init_MCU0
	DEC	W8
	BRA NZ	L_Init_MCU0
;driver.c,54 :: 		TFT_SET_ACTIVE(SET_INDEX,WRITE_COMMAND,WRITE_DATA);
	MOV	#lo_addr(_Write_Data), W12
	MOV	#lo_addr(_Write_Command), W11
	MOV	#lo_addr(_Set_Index), W10
	CALL	_TFT_Set_Active
;driver.c,60 :: 		TFT_INIT(240, 320);
	MOV	#320, W11
	MOV	#240, W10
	CALL	_TFT_Init
;driver.c,63 :: 		Init_ADC();
	CALL	_Init_ADC
;driver.c,65 :: 		TP_TFT_Init(240, 320, 13, 12);                                  // Initialize touch panel
	MOV.B	#12, W13
	MOV.B	#13, W12
	MOV	#320, W11
	MOV	#240, W10
	CALL	_TP_TFT_Init
;driver.c,66 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
	MOV	#800, W10
	CALL	_TP_TFT_Set_ADC_Threshold
;driver.c,68 :: 		UART2_INIT(256000);               // INITIALIZE UART MODULE AT 256000 BAUD
	MOV	#59392, W10
	MOV	#3, W11
	CALL	_UART2_Init
;driver.c,69 :: 		UART_SET_ACTIVE(UART2_READ, UART2_WRITE, UART2_DATA_READY, UART2_TX_IDLE);
	MOV	#lo_addr(_UART2_Tx_Idle), W13
	MOV	#lo_addr(_UART2_Data_Ready), W12
	MOV	#lo_addr(_UART2_Write), W11
	MOV	#lo_addr(_UART2_Read), W10
	CALL	_UART_Set_Active
;driver.c,70 :: 		DELAY_MS(100);                  // WAIT FOR UART MODULE TO STABILIZE
	MOV	#17, W8
	MOV	#18095, W7
L_Init_MCU2:
	DEC	W7
	BRA NZ	L_Init_MCU2
	DEC	W8
	BRA NZ	L_Init_MCU2
;driver.c,73 :: 		TFT_SET_FONT(TFT_DEFAULTFONT, CL_WHITE, FO_HORIZONTAL);
	CLR	W13
	MOV	#65535, W12
	MOV	#lo_addr(_TFT_defaultFont), W10
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, W11
	CALL	_TFT_Set_Font
;driver.c,75 :: 		TP_TFT_Set_Calibration_Consts(149, 776, 68, 765);    // Set calibration constants
	MOV	#765, W13
	MOV	#68, W12
	MOV	#776, W11
	MOV	#149, W10
	CALL	_TP_TFT_Set_Calibration_Consts
;driver.c,77 :: 		}
L_end_Init_MCU:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Init_MCU
