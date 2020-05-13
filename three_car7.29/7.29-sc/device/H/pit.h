/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     pit.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��23�� 16:46:36
  ******************************************************************************
  */
#ifndef _PIT_H
#define _PIT_H
#include "allHead.h"


#define PIT_CLEAR    PIT->CHANNEL[0].TFLG |= PIT_TFLG_TIF_MASK;



void PIT_Init(uint8 pitn, uint16 us);      //��ʼ��
void PIT_EnableIrq();   //��PIT��Ӧ�����ж�
void PIT_DisableIrq();  //��PIT��Ӧ�����ж�

#endif