#line 1 "C:/Documents and Settings/PC/Desktop/MikroBirthday/Development/mikroBirthday code/main.c"
#line 29 "C:/Documents and Settings/PC/Desktop/MikroBirthday/Development/mikroBirthday code/main.c"
extern void Set_Index(unsigned short index);
extern void Write_Command(unsigned short cmd);
extern void Write_Data(unsigned int _data);
extern void Init_MCU();

void UART2_Write_Line(char *uart_text);
void DrawFlames(int frame);
#line 1 "c:/documents and settings/pc/desktop/mikrobirthday/development/mikrobirthday code/resources.h"
const code far char cupcake_bmp[54278];

const code far char flames_1_bmp[4650];
const code far char flames_2_bmp[4650];
const code far char flames_3_bmp[4650];
const code far char flames_4_bmp[4650];
const code far char flames_5_bmp[4650];
const code far char flames_6_bmp[4650];
const code far char flames_7_bmp[4650];
const code far char flames_8_bmp[4650];
const code far char flames_7_bmp[4650];
const code far char flames_8_bmp[4650];
#line 1 "c:/documents and settings/pc/desktop/mikrobirthday/development/mikrobirthday code/driver.h"
#line 1 "c:/documents and settings/pc/desktop/mikrobirthday/development/mikrobirthday code/resources.h"
const code far char cupcake_bmp[54278];

const code far char flames_1_bmp[4650];
const code far char flames_2_bmp[4650];
const code far char flames_3_bmp[4650];
const code far char flames_4_bmp[4650];
const code far char flames_5_bmp[4650];
const code far char flames_6_bmp[4650];
const code far char flames_7_bmp[4650];
const code far char flames_8_bmp[4650];
const code far char flames_7_bmp[4650];
const code far char flames_8_bmp[4650];
#line 1 "c:/program files/mikroelektronika/mikroc pro for dspic/include/built_in.h"
#line 11 "c:/documents and settings/pc/desktop/mikrobirthday/development/mikrobirthday code/driver.h"
char TFT_DataPort at LATA;
sbit TFT_RST at LATC1_bit;
sbit TFT_BLED at LATC2_bit;
sbit TFT_RS at LATB15_bit;
sbit TFT_CS at LATC3_bit;
sbit TFT_RD at LATD12_bit;
sbit TFT_WR at LATD13_bit;
char TFT_DataPort_Direction at TRISA;
sbit TFT_RST_Direction at TRISC1_bit;
sbit TFT_BLED_Direction at TRISC2_bit;
sbit TFT_RS_Direction at TRISB15_bit;
sbit TFT_CS_Direction at TRISC3_bit;
sbit TFT_RD_Direction at TRISD12_bit;
sbit TFT_WR_Direction at TRISD13_bit;



sbit DriveX_Left at LATB13_bit;
sbit DriveX_Right at LATB11_bit;
sbit DriveY_Up at LATB12_bit;
sbit DriveY_Down at LATB10_bit;
sbit DriveX_Left_Direction at TRISB13_bit;
sbit DriveX_Right_Direction at TRISB11_bit;
sbit DriveY_Up_Direction at TRISB12_bit;
sbit DriveY_Down_Direction at TRISB10_bit;
#line 40 "C:/Documents and Settings/PC/Desktop/MikroBirthday/Development/mikroBirthday code/main.c"
void main() {

 int frame = 0;

 TRISA = 0x0FFF;
 TRISD = 0xFFFF;
 TRISB = 0x0000;
 TRISE = 0x000;


 Init_MCU();


 TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);


 UART2_Write_Line("Starting mikroBirthday.");


 TFT_Fill_Screen(CL_BLACK);


 TFT_Write_Text("Tap   to   blow   out   the   candle.", 25, 20);


 TFT_Image(0, 96, cupcake_bmp, 1);

 while (1) {

 if(TP_TFT_Press_Detect()){


 TFT_Set_Pen(CL_BLACK, 1);


 TFT_Set_Brush(1, CL_BLACK, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);


 TFT_Rectangle(107, 69, 103+43, 69+54);


 TFT_Image(0, 96, cupcake_bmp, 1);
 UART2_Write_Line("You blew out the candle!");

 Delay_ms(2000);
 }


 DrawFlames(frame);


 frame++;

 if(frame > 14){
 frame = 0;
 }

 }

}



void DrawFlames(int frame){

 switch (frame) {
 case 0:
 TFT_Image(107, 69, flames_1_bmp, 1);
 Delay_ms(50);
 break;

 case 1:
 TFT_Image(107, 69, flames_1_bmp, 1);
 Delay_ms(50);
 break;

 case 2:
 TFT_Image(107, 69, flames_2_bmp, 1);
 Delay_ms(50);
 break;

 case 3:
 TFT_Image(107, 69, flames_3_bmp, 1);
 Delay_ms(50);
 break;

 case 4:
 TFT_Image(107, 69, flames_4_bmp, 1);
 Delay_ms(50);
 break;

 case 5:
 TFT_Image(107, 69, flames_5_bmp, 1);
 Delay_ms(50);
 break;

 case 6:
 TFT_Image(107, 69, flames_6_bmp, 1);
 Delay_ms(50);
 break;

 case 7:
 TFT_Image(107, 69, flames_7_bmp, 1);
 Delay_ms(50);
 break;

 case 8:
 TFT_Image(107, 69, flames_8_bmp, 1);
 Delay_ms(50);
 break;

 case 9:
 TFT_Image(107, 69, flames_7_bmp, 1);
 Delay_ms(50);
 break;

 case 10:
 TFT_Image(107, 69, flames_6_bmp, 1);
 Delay_ms(50);
 break;

 case 11:
 TFT_Image(107, 69, flames_5_bmp, 1);
 Delay_ms(50);
 break;

 case 12:
 TFT_Image(107, 69, flames_4_bmp, 1);
 Delay_ms(50);
 break;

 case 13:
 TFT_Image(107, 69, flames_3_bmp, 1);
 Delay_ms(50);
 break;

 case 14:
 TFT_Image(107, 69, flames_2_bmp, 1);
 Delay_ms(50);
 break;

 default:
 TFT_Image(107, 69, flames_1_bmp, 1);
 Delay_ms(50);
 }

}



void UART2_Write_Line(char *uart_text) {
UART2_Write_Text(uart_text);
UART2_Write(13);
UART2_Write(10);
}
