
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68
	LNK	#2

;main.c,40 :: 		void main() {
;main.c,42 :: 		int frame = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	MOV	#0, W0
	MOV	W0, [W14+0]
;main.c,44 :: 		TRISA = 0x0FFF;        // Bits 13-15 are outputs
	MOV	#4095, W0
	MOV	WREG, TRISA
;main.c,45 :: 		TRISD = 0xFFFF;        // Initialize PORTD as input
	MOV	#65535, W0
	MOV	WREG, TRISD
;main.c,46 :: 		TRISB = 0x0000;        // Initialize PORTB as output
	CLR	TRISB
;main.c,47 :: 		TRISE = 0x000;
	CLR	TRISE
;main.c,50 :: 		Init_MCU();
	CALL	_Init_MCU
;main.c,53 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
	CLR	W13
	MOV	#65535, W12
	MOV	#lo_addr(_TFT_defaultFont), W10
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, W11
	CALL	_TFT_Set_Font
;main.c,56 :: 		UART2_Write_Line("Starting mikroBirthday.");
	MOV	#lo_addr(?lstr1_main), W10
	CALL	_UART2_Write_Line
;main.c,59 :: 		TFT_Fill_Screen(CL_BLACK);
	CLR	W10
	CALL	_TFT_Fill_Screen
;main.c,62 :: 		TFT_Write_Text("Tap   to   blow   out   the   candle.", 25, 20);
	MOV	#20, W12
	MOV	#25, W11
	MOV	#lo_addr(?lstr2_main), W10
	CALL	_TFT_Write_Text
;main.c,65 :: 		TFT_Image(0, 96, cupcake_bmp, 1);
	MOV	#lo_addr(_cupcake_bmp), W0
	MOV	#higher_addr(_cupcake_bmp), W1
	MOV.D	W0, W12
	MOV	#96, W11
	CLR	W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,67 :: 		while (1) {
L_main0:
;main.c,69 :: 		if(TP_TFT_Press_Detect()){
	CALL	_TP_TFT_Press_Detect
	CP0.B	W0
	BRA NZ	L__main57
	GOTO	L_main2
L__main57:
;main.c,72 :: 		TFT_Set_Pen(CL_BLACK, 1);
	MOV	#1, W11
	CLR	W10
	CALL	_TFT_Set_Pen
;main.c,75 :: 		TFT_Set_Brush(1, CL_BLACK, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
	CLR	W13
	CLR	W12
	CLR	W11
	MOV	#1, W10
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_TFT_Set_Brush
	SUB	#4, W15
;main.c,78 :: 		TFT_Rectangle(107, 69, 103+43, 69+54);
	MOV	#123, W13
	MOV	#146, W12
	MOV	#69, W11
	MOV	#107, W10
	CALL	_TFT_Rectangle
;main.c,81 :: 		TFT_Image(0, 96, cupcake_bmp, 1);
	MOV	#lo_addr(_cupcake_bmp), W0
	MOV	#higher_addr(_cupcake_bmp), W1
	MOV.D	W0, W12
	MOV	#96, W11
	CLR	W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,82 :: 		UART2_Write_Line("You blew out the candle!");
	MOV	#lo_addr(?lstr3_main), W10
	CALL	_UART2_Write_Line
;main.c,84 :: 		Delay_ms(2000);
	MOV	#326, W8
	MOV	#34240, W7
L_main3:
	DEC	W7
	BRA NZ	L_main3
	DEC	W8
	BRA NZ	L_main3
	NOP
	NOP
;main.c,85 :: 		}
L_main2:
;main.c,88 :: 		DrawFlames(frame);
	MOV	[W14+0], W10
	CALL	_DrawFlames
;main.c,91 :: 		frame++;
	MOV	[W14+0], W0
	INC	W0
	MOV	W0, [W14+0]
;main.c,93 :: 		if(frame > 14){
	CP	W0, #14
	BRA GT	L__main58
	GOTO	L_main5
L__main58:
;main.c,94 :: 		frame = 0;
	CLR	W0
	MOV	W0, [W14+0]
;main.c,95 :: 		}
L_main5:
;main.c,97 :: 		}
	GOTO	L_main0
;main.c,99 :: 		}
L_end_main:
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_DrawFlames:

;main.c,103 :: 		void DrawFlames(int frame){
;main.c,105 :: 		switch (frame) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	GOTO	L_DrawFlames6
;main.c,106 :: 		case 0:
L_DrawFlames8:
;main.c,107 :: 		TFT_Image(107, 69, flames_1_bmp, 1);
	MOV	#lo_addr(_flames_1_bmp), W0
	MOV	#higher_addr(_flames_1_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,108 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames9:
	DEC	W7
	BRA NZ	L_DrawFlames9
	DEC	W8
	BRA NZ	L_DrawFlames9
;main.c,109 :: 		break;
	GOTO	L_DrawFlames7
;main.c,111 :: 		case 1:
L_DrawFlames11:
;main.c,112 :: 		TFT_Image(107, 69, flames_1_bmp, 1);
	MOV	#lo_addr(_flames_1_bmp), W0
	MOV	#higher_addr(_flames_1_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,113 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames12:
	DEC	W7
	BRA NZ	L_DrawFlames12
	DEC	W8
	BRA NZ	L_DrawFlames12
;main.c,114 :: 		break;
	GOTO	L_DrawFlames7
;main.c,116 :: 		case 2:
L_DrawFlames14:
;main.c,117 :: 		TFT_Image(107, 69, flames_2_bmp, 1);
	MOV	#lo_addr(_flames_2_bmp), W0
	MOV	#higher_addr(_flames_2_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,118 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames15:
	DEC	W7
	BRA NZ	L_DrawFlames15
	DEC	W8
	BRA NZ	L_DrawFlames15
;main.c,119 :: 		break;
	GOTO	L_DrawFlames7
;main.c,121 :: 		case 3:
L_DrawFlames17:
;main.c,122 :: 		TFT_Image(107, 69, flames_3_bmp, 1);
	MOV	#lo_addr(_flames_3_bmp), W0
	MOV	#higher_addr(_flames_3_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,123 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames18:
	DEC	W7
	BRA NZ	L_DrawFlames18
	DEC	W8
	BRA NZ	L_DrawFlames18
;main.c,124 :: 		break;
	GOTO	L_DrawFlames7
;main.c,126 :: 		case 4:
L_DrawFlames20:
;main.c,127 :: 		TFT_Image(107, 69, flames_4_bmp, 1);
	MOV	#lo_addr(_flames_4_bmp), W0
	MOV	#higher_addr(_flames_4_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,128 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames21:
	DEC	W7
	BRA NZ	L_DrawFlames21
	DEC	W8
	BRA NZ	L_DrawFlames21
;main.c,129 :: 		break;
	GOTO	L_DrawFlames7
;main.c,131 :: 		case 5:
L_DrawFlames23:
;main.c,132 :: 		TFT_Image(107, 69, flames_5_bmp, 1);
	MOV	#lo_addr(_flames_5_bmp), W0
	MOV	#higher_addr(_flames_5_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,133 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames24:
	DEC	W7
	BRA NZ	L_DrawFlames24
	DEC	W8
	BRA NZ	L_DrawFlames24
;main.c,134 :: 		break;
	GOTO	L_DrawFlames7
;main.c,136 :: 		case 6:
L_DrawFlames26:
;main.c,137 :: 		TFT_Image(107, 69, flames_6_bmp, 1);
	MOV	#lo_addr(_flames_6_bmp), W0
	MOV	#higher_addr(_flames_6_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,138 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames27:
	DEC	W7
	BRA NZ	L_DrawFlames27
	DEC	W8
	BRA NZ	L_DrawFlames27
;main.c,139 :: 		break;
	GOTO	L_DrawFlames7
;main.c,141 :: 		case 7:
L_DrawFlames29:
;main.c,142 :: 		TFT_Image(107, 69, flames_7_bmp, 1);
	MOV	#lo_addr(_flames_7_bmp), W0
	MOV	#higher_addr(_flames_7_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,143 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames30:
	DEC	W7
	BRA NZ	L_DrawFlames30
	DEC	W8
	BRA NZ	L_DrawFlames30
;main.c,144 :: 		break;
	GOTO	L_DrawFlames7
;main.c,146 :: 		case 8:
L_DrawFlames32:
;main.c,147 :: 		TFT_Image(107, 69, flames_8_bmp, 1);
	MOV	#lo_addr(_flames_8_bmp), W0
	MOV	#higher_addr(_flames_8_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,148 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames33:
	DEC	W7
	BRA NZ	L_DrawFlames33
	DEC	W8
	BRA NZ	L_DrawFlames33
;main.c,149 :: 		break;
	GOTO	L_DrawFlames7
;main.c,151 :: 		case 9:
L_DrawFlames35:
;main.c,152 :: 		TFT_Image(107, 69, flames_7_bmp, 1);
	MOV	#lo_addr(_flames_7_bmp), W0
	MOV	#higher_addr(_flames_7_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,153 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames36:
	DEC	W7
	BRA NZ	L_DrawFlames36
	DEC	W8
	BRA NZ	L_DrawFlames36
;main.c,154 :: 		break;
	GOTO	L_DrawFlames7
;main.c,156 :: 		case 10:
L_DrawFlames38:
;main.c,157 :: 		TFT_Image(107, 69, flames_6_bmp, 1);
	MOV	#lo_addr(_flames_6_bmp), W0
	MOV	#higher_addr(_flames_6_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,158 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames39:
	DEC	W7
	BRA NZ	L_DrawFlames39
	DEC	W8
	BRA NZ	L_DrawFlames39
;main.c,159 :: 		break;
	GOTO	L_DrawFlames7
;main.c,161 :: 		case 11:
L_DrawFlames41:
;main.c,162 :: 		TFT_Image(107, 69, flames_5_bmp, 1);
	MOV	#lo_addr(_flames_5_bmp), W0
	MOV	#higher_addr(_flames_5_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,163 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames42:
	DEC	W7
	BRA NZ	L_DrawFlames42
	DEC	W8
	BRA NZ	L_DrawFlames42
;main.c,164 :: 		break;
	GOTO	L_DrawFlames7
;main.c,166 :: 		case 12:
L_DrawFlames44:
;main.c,167 :: 		TFT_Image(107, 69, flames_4_bmp, 1);
	MOV	#lo_addr(_flames_4_bmp), W0
	MOV	#higher_addr(_flames_4_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,168 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames45:
	DEC	W7
	BRA NZ	L_DrawFlames45
	DEC	W8
	BRA NZ	L_DrawFlames45
;main.c,169 :: 		break;
	GOTO	L_DrawFlames7
;main.c,171 :: 		case 13:
L_DrawFlames47:
;main.c,172 :: 		TFT_Image(107, 69, flames_3_bmp, 1);
	MOV	#lo_addr(_flames_3_bmp), W0
	MOV	#higher_addr(_flames_3_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,173 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames48:
	DEC	W7
	BRA NZ	L_DrawFlames48
	DEC	W8
	BRA NZ	L_DrawFlames48
;main.c,174 :: 		break;
	GOTO	L_DrawFlames7
;main.c,176 :: 		case 14:
L_DrawFlames50:
;main.c,177 :: 		TFT_Image(107, 69, flames_2_bmp, 1);
	MOV	#lo_addr(_flames_2_bmp), W0
	MOV	#higher_addr(_flames_2_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,178 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames51:
	DEC	W7
	BRA NZ	L_DrawFlames51
	DEC	W8
	BRA NZ	L_DrawFlames51
;main.c,179 :: 		break;
	GOTO	L_DrawFlames7
;main.c,181 :: 		default:
L_DrawFlames53:
;main.c,182 :: 		TFT_Image(107, 69, flames_1_bmp, 1);
	MOV	#lo_addr(_flames_1_bmp), W0
	MOV	#higher_addr(_flames_1_bmp), W1
	MOV.D	W0, W12
	MOV	#69, W11
	MOV	#107, W10
	MOV	#1, W0
	PUSH	W0
	CALL	_TFT_Image
	SUB	#2, W15
;main.c,183 :: 		Delay_ms(50);
	MOV	#9, W8
	MOV	#9047, W7
L_DrawFlames54:
	DEC	W7
	BRA NZ	L_DrawFlames54
	DEC	W8
	BRA NZ	L_DrawFlames54
;main.c,184 :: 		}
	GOTO	L_DrawFlames7
L_DrawFlames6:
	CP	W10, #0
	BRA NZ	L__DrawFlames61
	GOTO	L_DrawFlames8
L__DrawFlames61:
	CP	W10, #1
	BRA NZ	L__DrawFlames62
	GOTO	L_DrawFlames11
L__DrawFlames62:
	CP	W10, #2
	BRA NZ	L__DrawFlames63
	GOTO	L_DrawFlames14
L__DrawFlames63:
	CP	W10, #3
	BRA NZ	L__DrawFlames64
	GOTO	L_DrawFlames17
L__DrawFlames64:
	CP	W10, #4
	BRA NZ	L__DrawFlames65
	GOTO	L_DrawFlames20
L__DrawFlames65:
	CP	W10, #5
	BRA NZ	L__DrawFlames66
	GOTO	L_DrawFlames23
L__DrawFlames66:
	CP	W10, #6
	BRA NZ	L__DrawFlames67
	GOTO	L_DrawFlames26
L__DrawFlames67:
	CP	W10, #7
	BRA NZ	L__DrawFlames68
	GOTO	L_DrawFlames29
L__DrawFlames68:
	CP	W10, #8
	BRA NZ	L__DrawFlames69
	GOTO	L_DrawFlames32
L__DrawFlames69:
	CP	W10, #9
	BRA NZ	L__DrawFlames70
	GOTO	L_DrawFlames35
L__DrawFlames70:
	CP	W10, #10
	BRA NZ	L__DrawFlames71
	GOTO	L_DrawFlames38
L__DrawFlames71:
	CP	W10, #11
	BRA NZ	L__DrawFlames72
	GOTO	L_DrawFlames41
L__DrawFlames72:
	CP	W10, #12
	BRA NZ	L__DrawFlames73
	GOTO	L_DrawFlames44
L__DrawFlames73:
	CP	W10, #13
	BRA NZ	L__DrawFlames74
	GOTO	L_DrawFlames47
L__DrawFlames74:
	CP	W10, #14
	BRA NZ	L__DrawFlames75
	GOTO	L_DrawFlames50
L__DrawFlames75:
	GOTO	L_DrawFlames53
L_DrawFlames7:
;main.c,186 :: 		}
L_end_DrawFlames:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _DrawFlames

_UART2_Write_Line:

;main.c,190 :: 		void UART2_Write_Line(char *uart_text) {
;main.c,191 :: 		UART2_Write_Text(uart_text);
	PUSH	W10
	CALL	_UART2_Write_Text
;main.c,192 :: 		UART2_Write(13);
	MOV	#13, W10
	CALL	_UART2_Write
;main.c,193 :: 		UART2_Write(10);
	MOV	#10, W10
	CALL	_UART2_Write
;main.c,194 :: 		}
L_end_UART2_Write_Line:
	POP	W10
	RETURN
; end of _UART2_Write_Line
