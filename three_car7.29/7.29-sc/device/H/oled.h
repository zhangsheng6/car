/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    oled.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月4日 10:11:42
  ******************************************************************************
  */

#ifndef _OLED_H
#define _OLED_H
#include "KEA128_systick.h"

/* 引脚 --------------------------------------------------------------------- */
//初始化
//#define DDRCS 		    { GpioInit(OLED_CS, GPO, 1);}
#define DDRDC 		    { GpioInit(OLED_DC, GPO, 1);}
#define DDRRES 	        { GpioInit(OLED_RES, GPO, 1);}
//#define DDRSDIN         { GpioInit(OLED_SDIN, GPO, 1);}
//#define DDROSCLK        { GpioInit(OLED_OSCLK, GPO, 1);}

//变高电平
//#define CS              { GpioSet(OLED_CS, 1);}
#define DC              { GpioSet(OLED_DC, 1);}
#define RES             { GpioSet(OLED_RES, 1);}
//#define SDIN            { GpioSet(OLED_SDIN, 1);}
//#define OSCLK           { GpioSet(OLED_OSCLK, 1);}

//变低电平
//#define CL_CS           { GpioSet(OLED_CS, 0);}
#define CL_DC           { GpioSet(OLED_DC, 0);}
#define CL_RES          { GpioSet(OLED_RES, 0);}
//#define CL_SDIN         { GpioSet(OLED_SDIN, 0);}
//#define CL_OSCLK        { GpioSet(OLED_OSCLK, 0);}
/* 引脚 -------- END -------------------------------------------------------- */

extern uint8 logo[][8];
extern const uint8 F6x8[][6];


void OLED_Init(void);  //OLED初始化
void OLED_Clear(void); //清屏
void OLED_Set_Pos(unsigned char x, unsigned char y);
void OLED_DisplayStr(unsigned char x,unsigned char y,char *str);    //显示一个字符串
uint8 OLED_DisplaytinyStr(unsigned char x,unsigned char y,char *str);//
void OLED_Display_tinyFormat(unsigned char x,unsigned char y,const char* format,...);
void OLED_Str_Val(char *str,uint8 x,uint8 y, const char* format,...);
void OLED_tinyStr_Val(char *str,uint8 x,uint8 y, const char* format,...);
uint8 StrLen8X16(char *str);
void OLED_PutPixel(unsigned char x,unsigned char y);
void OLED_Draw_Point(unsigned char x,unsigned char y,unsigned char a);
void OLED_Clear_allGRAM(void);
void OLED_DisplayFloat(uint8 x, uint8 y, float data, uint8 len);//OLED显示 float
uint8 OLED_Uint16(uint8 x, uint8 y, uint16 num); //OLED显示 uint16
void OLED_Int16(uint8 x, uint8 y, int16 num);   //OLED显示 int16
void OLED_HEXACSII(uint16 hex, uint8* Print);   //uint16 转 char
void OLED_Display();                            //显示按键功能
void OLED_Menu();//绘制菜单
void OLED_MenuFlicker();//菜单闪烁

void OLED_WrCmd(unsigned char cmd);
void OLED_WrDat(unsigned char data);

#endif
