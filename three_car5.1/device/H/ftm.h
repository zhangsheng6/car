/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     ftm.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月8日 16:43:57
  ******************************************************************************
  */

#ifndef _FTM_H
#define _FTM_H
#include "allHead.h"

typedef enum
{
    ftm0,
    ftm1,
    ftm2
} ftmX;

typedef enum
{
    ch0,
    ch1,
    ch2,
    ch3,
    ch4,
    ch5
} ftmCh;

//占空比精度
#define FTM0_PRECISON   8000u
#define FTM1_PRECISON   8000u
#define FTM2_PRECISON   8000u

static FTM_Type * const FTMX[] = FTM_BASES;

void FTM_PwmMux(ftmX ftmn, ftmCh ch); //FTM 引脚复用
void FTM_PwmInit(ftmX ftmn, ftmCh ch, uint8 freqKhz, uint32 duty);
void FTM_PwmDuty(ftmX ftmn, ftmCh ch, uint32 duty);     //占空比修改
void FTM_SpeedInit(ftmX ftmn);  //测速初始化
uint16 FTM_SpeedGet(ftmX ftmn); //获取速度值
void FTM_CountClean(ftmX ftmn);//计数清零


#endif