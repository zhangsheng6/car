/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    Speed_Control.h
  * �ļ���ʶ��
  * ժ    Ҫ��    �ٶȿ���
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��2��26�� 18:43:39
  ******************************************************************************
  */

#ifndef Speed_Control_h_
#define Speed_Control_h_
#include "allHead.h"

#define SPEED_TIME_OUT          20
#define SPEED_CONTROL_PERIOD    100
#define OPTICAL_ENCODE_CONSTANT 512


//������
#define  SPEED_DIR_L     (GpioGet(DIR_L) != 0)//��ʱ��Ϊ1
#define  SPEED_DIR_R     (GpioGet(DIR_R) == 0 ) //��ʱ��Ϊ0

//ͨ��ѡ��
#define  Choose_L  {FTM_CountClean(FTM_SPEED_L);}//��
#define  Choose_R  {FTM_CountClean(FTM_SPEED_R);}//��

void Get_CarSpeed(void);
//void Pulse_Count(void);
void Speed_Controler(void);
void Speed_Controler_Output(void);

#endif










