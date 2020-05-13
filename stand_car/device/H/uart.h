/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    uart.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��7�� 20:49:33
  ******************************************************************************
  */

#ifndef __UART_H__
#define __UART_H__

#include "allHead.h"

void UART_Send_Byte(uint8 ch);     //����һ�� �ֽ�
void UART_Send_Enter(void);       //����һ�� �س�
void UART_Send_String(char *str); //����һ�� �ַ���
void UART_SendArray(uint8 *array,uint32 len); //��������
void Enable_Uart_Re_Int(void);       //ʹ�� �����ж�
void Disable_Uart_Re_Int(void);      //��ֹ �����ж�
void UART_Uint16(uint16 num, uint8 enter);        //���� uint16
void UART_Int16(int16 num, uint8 enter);          //���� int16
void UART_SendFloat(float data, uint8 enter);     //���� float
uint8 UART_GetData();           //��ȡ����

#endif