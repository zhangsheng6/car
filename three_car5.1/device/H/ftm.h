/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     ftm.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��8�� 16:43:57
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

//ռ�ձȾ���
#define FTM0_PRECISON   8000u
#define FTM1_PRECISON   8000u
#define FTM2_PRECISON   8000u

static FTM_Type * const FTMX[] = FTM_BASES;

void FTM_PwmMux(ftmX ftmn, ftmCh ch); //FTM ���Ÿ���
void FTM_PwmInit(ftmX ftmn, ftmCh ch, uint8 freqKhz, uint32 duty);
void FTM_PwmDuty(ftmX ftmn, ftmCh ch, uint32 duty);     //ռ�ձ��޸�
void FTM_SpeedInit(ftmX ftmn);  //���ٳ�ʼ��
uint16 FTM_SpeedGet(ftmX ftmn); //��ȡ�ٶ�ֵ
void FTM_CountClean(ftmX ftmn);//��������


#endif