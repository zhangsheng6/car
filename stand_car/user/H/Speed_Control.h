/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    Speed_Control.h
  * 文件标识：
  * 摘    要：    速度控制
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年2月26日 18:43:39
  ******************************************************************************
  */

#ifndef Speed_Control_h_
#define Speed_Control_h_
#include "allHead.h"

#define SPEED_TIME_OUT          20
#define SPEED_CONTROL_PERIOD    100
#define OPTICAL_ENCODE_CONSTANT 512


//方向检测
#define  SPEED_DIR_L     (GpioGet(DIR_L) != 0)//逆时针为1
#define  SPEED_DIR_R     (GpioGet(DIR_R) == 0 ) //逆时针为0

//通道选择
#define  Choose_L  {FTM_CountClean(FTM_SPEED_L);}//左
#define  Choose_R  {FTM_CountClean(FTM_SPEED_R);}//右

void Get_CarSpeed(void);
//void Pulse_Count(void);
void Speed_Controler(void);
void Speed_Controler_Output(void);

#endif










