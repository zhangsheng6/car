/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    oled.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��4�� 10:11:42
  ******************************************************************************
  */

#ifndef _OLED_H
#define _OLED_H
#include "KEA128_systick.h"

/* ���� --------------------------------------------------------------------- */
//��ʼ��
//#define DDRCS 		    { GpioInit(OLED_CS, GPO, 1);}
#define DDRDC 		    { GpioInit(OLED_DC, GPO, 1);}
#define DDRRES 	        { GpioInit(OLED_RES, GPO, 1);}
//#define DDRSDIN         { GpioInit(OLED_SDIN, GPO, 1);}
//#define DDROSCLK        { GpioInit(OLED_OSCLK, GPO, 1);}

//��ߵ�ƽ
//#define CS              { GpioSet(OLED_CS, 1);}
#define DC              { GpioSet(OLED_DC, 1);}
#define RES             { GpioSet(OLED_RES, 1);}
//#define SDIN            { GpioSet(OLED_SDIN, 1);}
//#define OSCLK           { GpioSet(OLED_OSCLK, 1);}

//��͵�ƽ
//#define CL_CS           { GpioSet(OLED_CS, 0);}
#define CL_DC           { GpioSet(OLED_DC, 0);}
#define CL_RES          { GpioSet(OLED_RES, 0);}
//#define CL_SDIN         { GpioSet(OLED_SDIN, 0);}
//#define CL_OSCLK        { GpioSet(OLED_OSCLK, 0);}
/* ���� -------- END -------------------------------------------------------- */

extern uint8 logo[][8];
extern const uint8 F6x8[][6];


void OLED_Init(void);  //OLED��ʼ��
void OLED_Clear(void); //����
void OLED_Set_Pos(unsigned char x, unsigned char y);
void OLED_DisplayStr(unsigned char x,unsigned char y,char *str);    //��ʾһ���ַ���
uint8 OLED_DisplaytinyStr(unsigned char x,unsigned char y,char *str);//
void OLED_Display_tinyFormat(unsigned char x,unsigned char y,const char* format,...);
void OLED_Str_Val(char *str,uint8 x,uint8 y, const char* format,...);
void OLED_tinyStr_Val(char *str,uint8 x,uint8 y, const char* format,...);
uint8 StrLen8X16(char *str);
void OLED_PutPixel(unsigned char x,unsigned char y);
void OLED_Draw_Point(unsigned char x,unsigned char y,unsigned char a);
void OLED_Clear_allGRAM(void);
void OLED_DisplayFloat(uint8 x, uint8 y, float data, uint8 len);//OLED��ʾ float
uint8 OLED_Uint16(uint8 x, uint8 y, uint16 num); //OLED��ʾ uint16
void OLED_Int16(uint8 x, uint8 y, int16 num);   //OLED��ʾ int16
void OLED_HEXACSII(uint16 hex, uint8* Print);   //uint16 ת char
void OLED_Display();                            //��ʾ��������
void OLED_Menu();//���Ʋ˵�
void OLED_MenuFlicker();//�˵���˸

void OLED_WrCmd(unsigned char cmd);
void OLED_WrDat(unsigned char data);

#endif
