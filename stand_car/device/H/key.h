/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    key.h
  * �ļ���ʶ��
  * ժ    Ҫ��    ��������
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��4�� 09:43:37
  ******************************************************************************
  */

#ifndef _KEY_H
#define _KEY_H
#include "variable.h"

void  KEY_Init();      //������ʼ��
uint8 KEY_Scan(void); //�������
void KEY_TestMenu(void); //����ר�ò˵�
void KEY_ParaMenu(void);//�༶�˵� �����ٿ�
void KEY_ParaMenuDisplay(void);//�༶�˵� ��ʾ
void KEY_balance(void);
void  KEY_balance_Display(void);


#endif

