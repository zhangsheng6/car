/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    uart.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月7日 20:49:33
  ******************************************************************************
  */

#ifndef __UART_H__
#define __UART_H__

#include "allHead.h"

void UART_Send_Byte(uint8 ch);     //发送一个 字节
void UART_Send_Enter(void);       //发送一个 回车
void UART_Send_String(char *str); //发送一个 字符串
void UART_SendArray(uint8 *array,uint32 len); //发送数组
void Enable_Uart_Re_Int(void);       //使能 串口中断
void Disable_Uart_Re_Int(void);      //禁止 串口中断
void UART_Uint16(uint16 num, uint8 enter);        //发送 uint16
void UART_Int16(int16 num, uint8 enter);          //发送 int16
void UART_SendFloat(float data, uint8 enter);     //发送 float
uint8 UART_GetData();           //获取数据

#endif