/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     adc.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��23�� 10:58:53
  ******************************************************************************
  */
#ifndef _ADC_h_
#define _ADC_h_
#include "allHead.h"

//����λ��
typedef enum
{
    adc8bit   = 0x00,
    adc10bit  = 0x01,
    adc12bit  = 0x02
} adcBit;

void ADC_Init();                            //ADC ��ʼ��
void ADC_Able(PTX_n adcn_ch);              //���� �� ADC
void ADC_Disable(PTX_n adcn_ch);           //���� �� ADC
uint16 ADC_Once(PTX_n adcn_ch, adcBit bit);//�ɼ�һ������
uint16 hw_ad_ave(PTX_n adcn_ch, adcBit bit, uint8 N); //��ֵ�˲�
uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit); //��ֵ�˲�

#endif