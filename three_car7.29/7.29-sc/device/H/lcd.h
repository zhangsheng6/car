/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    lcd.h
  * 文件标识：
  * 摘    要：    LCD显示
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年5月4日 20:54:40
  ******************************************************************************
  */
#ifndef _LCD_H
#define _LCD_H
#include "common.h"

#define TFT_Y_MAX   160
#define TFT_X_MAX   128

//-------常用颜色----------
#define RED     	0XF800    //红色
#define GREEN   	0X07E0    //绿色
#define BLUE    	0X001F    //蓝色
#define BRED    	0XF81F    //紫色
#define GRED    	0XFFE0    //灰色
#define GBLUE   	0X07FF    //青蓝
#define BLACK   	0X0000    //黑色
#define WHITE   	0XFFFF    //白色
#define YELLOW  	0xFFE0    //黄色



extern uint16 LCD_pen;//笔颜色
extern uint16 LCD_backGround;//背景颜色


void LCD_Init(void);
void dsp_single_colour(int color);
void LCD_showChar0608(uint16 x,uint16 y,uint8 dat);
void LCD_showStr0608(uint16 x,uint16 y, uint8 *dat);
void LCD_showLogo();
void LCD_Uint16(uint8 x, uint8 y, uint16 num);
void LCD_Int16(uint8 x, uint8 y, int16 num);
void LCD_DisplayFloat(uint8 x, uint8 y, float data, uint8 len);

#endif

