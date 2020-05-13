/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     iicAnalo.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月28日 16:33:57
  ******************************************************************************
  */

#ifndef _IIC_ANALOG_h
#define _IIC_ANALOG_h
#include "allHead.h"

typedef enum IIC       //DAC模块
{
    IIC,
    SCCB
} IIC_type;



void  IIC_start(void);
void  IIC_stop(void);
void  IIC_ack_main(uint8 ack_main);
void  send_ch(uint8 c);
uint8 read_ch(void);
void  IIC_writeReg(uint8 dev_add, uint8 reg, uint8 dat);
uint8 IIC_readReg(uint8 dev_add, uint8 reg, IIC_type type);
void  IIC_Init(void);


#endif

