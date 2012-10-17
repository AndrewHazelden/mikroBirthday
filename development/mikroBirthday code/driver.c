/*
* This is the mikromedia board TFT graphics driver
*/


#include "driver.h"
#include "built_in.h"  
//Note: MikroC's "built_in.h" provides the Hi and Lo functions


const ADC_THRESHOLD = 800;

// Set index
void Set_Index(unsigned short index) {
        TFT_RS = 0;
        Lo(LATA) = index;
        TFT_WR = 0;
        TFT_WR = 1;
}

// Write command
void Write_Command(unsigned short cmd) {
        TFT_RS = 1;
        Lo(LATA) = cmd;
        TFT_WR = 0;
        TFT_WR = 1;
}

// Write data
void Write_Data(unsigned int _data) {
        TFT_RS = 1;
        Lo(LATE) = Hi(_data);
        Lo(LATA) = Lo(_data);
        TFT_WR = 0;
        TFT_WR = 1;
}

void Init_ADC() {
  AD1PCFGL = 0xCFFF;
  AD1PCFGH = 0xCFFF;
  ADC1_Init();
}

void Init_MCU() {
  //TRISE = 0;
  TFT_DATAPORT_DIRECTION = 0;
  CLKDIVBITS.PLLPRE = 0;      // PLLPRE<4:0> = 0  ->  N1 = 2    8MHZ / 2 = 4MHZ
  							// (MUST BE WITHIN 0.8 MHZ TO 8 MHZ RANGE)
  PLLFBD =   30;              // PLLDIV<8:0> = 30 ->  M = 32    4MHZ * 32 = 128MHZ
  							// (MUST BE WITHIN 100 MHZ TO 200 MHZ RANGE)
  CLKDIVBITS.PLLPOST = 0;     // PLLPOST<1:0> = 0 ->  N2 = 2    128MHZ / 2 = 64MHZ
  							// (MUST BE WITHIN 12.5 MHZ TO 80 MHZ RANGE)
  DELAY_MS(150);
  TFT_SET_ACTIVE(SET_INDEX,WRITE_COMMAND,WRITE_DATA);

  //SET UP THE MMB FOR A NORMAL DISPLAY ORIENTATION
  //TFT_INIT(320, 240);

  //ALTERNATE MMB 'SIDEWAYS' DISPLAY ORIENTATION
  TFT_INIT(240, 320);


  Init_ADC();

  TP_TFT_Init(240, 320, 13, 12);                                  // Initialize touch panel
  TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold

  UART2_INIT(256000);               // INITIALIZE UART MODULE AT 256000 BAUD
  UART_SET_ACTIVE(UART2_READ, UART2_WRITE, UART2_DATA_READY, UART2_TX_IDLE);
  DELAY_MS(100);                  // WAIT FOR UART MODULE TO STABILIZE

  //SETUP THE DEFAULT FONT
  TFT_SET_FONT(TFT_DEFAULTFONT, CL_WHITE, FO_HORIZONTAL);
  
  TP_TFT_Set_Calibration_Consts(149, 776, 68, 765);    // Set calibration constants
  
}