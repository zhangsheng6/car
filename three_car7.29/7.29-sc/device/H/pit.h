/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     pit.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月23日 16:46:36
  ******************************************************************************
  */
#ifndef _PIT_H
#define _PIT_H
#include "allHead.h"


#define PIT_CLEAR    PIT->CHANNEL[0].TFLG |= PIT_TFLG_TIF_MASK;



void PIT_Init(uint8 pitn, uint16 us);      //初始化
void PIT_EnableIrq();   //开PIT对应引脚中断
void PIT_DisableIrq();  //关PIT对应引脚中断

#endif