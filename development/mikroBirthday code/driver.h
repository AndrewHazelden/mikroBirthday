/*
* This is the mikromedia board TFT graphics driver
*/


#include "resources.h"
#include "built_in.h"


// TFT module connections
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
// End TFT module connections

// Touch Panel module connections
sbit DriveX_Left at LATB13_bit;
sbit DriveX_Right at LATB11_bit;
sbit DriveY_Up at LATB12_bit;
sbit DriveY_Down at LATB10_bit;
sbit DriveX_Left_Direction at TRISB13_bit;
sbit DriveX_Right_Direction at TRISB11_bit;
sbit DriveY_Up_Direction at TRISB12_bit;
sbit DriveY_Down_Direction at TRISB10_bit;
// End Touch Panel module connections
