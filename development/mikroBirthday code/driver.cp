#line 1 "C:/Documents and Settings/PC/Desktop/MikroBirthday/Development/mikroBirthday code/driver.c"
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
#line 1 "c:/program files/mikroelektronika/mikroc pro for dspic/include/built_in.h"
#line 11 "C:/Documents and Settings/PC/Desktop/MikroBirthday/Development/mikroBirthday code/driver.c"
const ADC_THRESHOLD = 800;


void Set_Index(unsigned short index) {
 TFT_RS = 0;
  ((char *)&LATA)[0]  = index;
 TFT_WR = 0;
 TFT_WR = 1;
}


void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
  ((char *)&LATA)[0]  = cmd;
 TFT_WR = 0;
 TFT_WR = 1;
}


void Write_Data(unsigned int _data) {
 TFT_RS = 1;
  ((char *)&LATE)[0]  =  ((char *)&_data)[1] ;
  ((char *)&LATA)[0]  =  ((char *)&_data)[0] ;
 TFT_WR = 0;
 TFT_WR = 1;
}

void Init_ADC() {
 AD1PCFGL = 0xCFFF;
 AD1PCFGH = 0xCFFF;
 ADC1_Init();
}

void Init_MCU() {

 TFT_DATAPORT_DIRECTION = 0;
 CLKDIVBITS.PLLPRE = 0;

 PLLFBD = 30;

 CLKDIVBITS.PLLPOST = 0;

 DELAY_MS(150);
 TFT_SET_ACTIVE(SET_INDEX,WRITE_COMMAND,WRITE_DATA);





 TFT_INIT(240, 320);


 Init_ADC();

 TP_TFT_Init(240, 320, 13, 12);
 TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);

 UART2_INIT(256000);
 UART_SET_ACTIVE(UART2_READ, UART2_WRITE, UART2_DATA_READY, UART2_TX_IDLE);
 DELAY_MS(100);


 TFT_SET_FONT(TFT_DEFAULTFONT, CL_WHITE, FO_HORIZONTAL);

 TP_TFT_Set_Calibration_Consts(149, 776, 68, 765);

}
