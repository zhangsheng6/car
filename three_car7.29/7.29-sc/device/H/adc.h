/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     adc.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月23日 10:58:53
  ******************************************************************************
  */
#ifndef _ADC_h_
#define _ADC_h_
#include "allHead.h"

//精度位数
typedef enum
{
    adc8bit   = 0x00,
    adc10bit  = 0x01,
    adc12bit  = 0x02
} adcBit;

void ADC_Init();                            //ADC 初始化
void ADC_Able(PTX_n adcn_ch);              //引脚 开 ADC
void ADC_Disable(PTX_n adcn_ch);           //引脚 关 ADC
uint16 ADC_Once(PTX_n adcn_ch, adcBit bit);//采集一次数据
uint16 hw_ad_ave(PTX_n adcn_ch, adcBit bit, uint8 N); //均值滤波
uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit); //中值滤波

#endif