/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    lcd.h
  * �ļ���ʶ��
  * ժ    Ҫ��    LCD��ʾ
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��5��4�� 20:54:40
  ******************************************************************************
  */
#ifndef _LCD_H
#define _LCD_H
#include "common.h"

#define TFT_Y_MAX   160
#define TFT_X_MAX   128

//-------������ɫ----------
#define RED     	0XF800    //��ɫ
#define GREEN   	0X07E0    //��ɫ
#define BLUE    	0X001F    //��ɫ
#define BRED    	0XF81F    //��ɫ
#define GRED    	0XFFE0    //��ɫ
#define GBLUE   	0X07FF    //����
#define BLACK   	0X0000    //��ɫ
#define WHITE   	0XFFFF    //��ɫ
#define YELLOW  	0xFFE0    //��ɫ



extern uint16 LCD_pen;//����ɫ
extern uint16 LCD_backGround;//������ɫ


void LCD_Init(void);
void dsp_single_colour(int color);
void LCD_showChar0608(uint16 x,uint16 y,uint8 dat);
void LCD_showStr0608(uint16 x,uint16 y, uint8 *dat);
void LCD_showLogo();
void LCD_Uint16(uint8 x, uint8 y, uint16 num);
void LCD_Int16(uint8 x, uint8 y, int16 num);
void LCD_DisplayFloat(uint8 x, uint8 y, float data, uint8 len);

#endif

