/*
 * Project name:
     mikroBirthday
     
 * Description:
    Celebrate a birthday by blowing out a virtual candle.
     
 * Created By:
 Andrew Hazelden
 
 * Email:
 andrewhazelden@gmail.com
 * Blog:
 http://www.andrewhazelden.com

 * Version 1 Released
 12/12/2011
 
 * Test configuration:
     MCU:             P33FJ256GP710A
     Dev.Board:       MikroMMB_for_dsPIC33_hw_rev_1.05
                      http://www.mikroe.com/eng/products/view/586/mikrommb-for-dspic33-board/
     Oscillator:      64000000 Hz
     SW:              mikroC PRO for dsPIC
                      http://www.mikroe.com/eng/products/view/231/mikroc-pro-for-dspic30-33-and-pic24/
 */


extern void Set_Index(unsigned short index);
extern void Write_Command(unsigned short cmd);
extern void Write_Data(unsigned int _data);
extern void Init_MCU();

void UART2_Write_Line(char *uart_text);
void DrawFlames(int frame);

#include "resources.h"
#include "driver.h"

void main() {

  int frame = 0;

  TRISA = 0x0FFF;        // Bits 13-15 are outputs
  TRISD = 0xFFFF;        // Initialize PORTD as input
  TRISB = 0x0000;        // Initialize PORTB as output
  TRISE = 0x000;

  //Set up the microcontroller
  Init_MCU();
  
  //Set the font color to white
  TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);

  //Write out startup text on the USB serial port.
  UART2_Write_Line("Starting mikroBirthday.");
  
  //Clear the screen
  TFT_Fill_Screen(CL_BLACK);
  
  //Write the instructions
  TFT_Write_Text("Tap   to   blow   out   the   candle.", 25, 20);
  
  //Draw the cupcake
  TFT_Image(0, 96, cupcake_bmp, 1);

  while (1) {
    //Blow out the flame for 2 seconds if you tap the screen
    if(TP_TFT_Press_Detect()){

        //Set the pen to 1px and black
        TFT_Set_Pen(CL_BLACK, 1);
        
        //Set the fill brush to a black color
        TFT_Set_Brush(1, CL_BLACK, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
          
        //Clear the old flame image
        TFT_Rectangle(107, 69, 103+43, 69+54);

        //Draw the cupcake without the flames
        TFT_Image(0, 96, cupcake_bmp, 1);
        UART2_Write_Line("You blew out the candle!");
                
        Delay_ms(2000);
    }

    //Draw the animated candle flames
    DrawFlames(frame);
    
    //Increment the frame counter
    frame++;
        
    if(frame > 14){
    frame = 0;
    }
    
  }

}


//Draw the flames over the cupcake background
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


//UART2 write text and new line (carriage return + line feed)
void UART2_Write_Line(char *uart_text) {
UART2_Write_Text(uart_text);
UART2_Write(13);
UART2_Write(10);
}