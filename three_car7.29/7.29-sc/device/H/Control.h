/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    Control.h
  * �ļ���ʶ��
  * ժ    Ҫ��    �˵�����
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��4��17�� 13:12:30
  ******************************************************************************
  */
#ifndef _CONTROL_H
#define _CONTROL_H

#include "allHead.h"


enum//�����
{
  CAR_STOP = 1, P_ANGLE, D_ANGLE
};
extern uint8 g_5msFlag;




void ReadDataControl(void);

#endif


