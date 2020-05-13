/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     adc.c
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月23日 10:55:52
  ******************************************************************************
  */

#include "adc.h"


uint16 adcHold = 0;

/**
  * 简介
  *     对adc引脚进行编码
  */
uint8 Change(PTX_n adcn_ch)
{
    uint8 shift = 0;
    switch (adcn_ch)
    {
      case A0:
        shift = 0;
        break;
      case A1:
        shift = 1;
        break;
      case A6:
        shift = 2;
        break;
      case A7:
        shift = 3;
        break;
      case B0:
        shift = 4;
        break;
      case B1:
        shift = 5;
        break;
      case B2:
        shift = 6;
        break;
      case B3:
        shift = 7;
        break;

      case C0:
        shift = 8;
        break;
      case C1:
        shift = 9;
        break;
      case C2:
        shift = 10;
        break;
      case C3:
        shift = 11;
        break;

      case F4:
        shift = 12;
        break;
      case F5:
        shift = 13;
        break;
      case F6:
        shift = 14;
        break;
      case F7:
        shift = 15;
        break;

      default:
        shift = 0;
        break;
    }

    return shift;
}

/**
  * 简介
  *     ADC 初始化
  */
void ADC_Init()
{

    SIM->SCGC |= SIM_SCGC_ADC_MASK;       //开启ADC时钟

    ADC->APCTL1 &= 0; //所有引脚 禁用ADC功能

    ADC->SC3 = ( 0
                 | ADC_SC3_ADIV(1)           //分频系数，=输入时钟
               //| ADC_SC3_MODE(bit)         //分辨率
                 | ADC_SC3_ADICLK(0)         //使用总线时钟最为ADC得时钟源
                 | ADC_SC3_ADLSMP(1)         //长采样
                 | ADC_SC3_ADLPC(0)     //高速模式
                );
    ADC->SC2 = ( 0
                 | ADC_SC2_REFSEL(0)       //基准电压选择
                 | ADC_SC2_ADTRG(0)        //软件触发
                 | ADC_SC2_ACFE(0)         //比较功能禁用
                );
}

/**
  * 简介
  *     ADC 引脚使能
  * 参数
  *     adcn_ch
  *       通道号(variable.h中编辑)
  */
void ADC_Able(PTX_n adcn_ch)
{
    uint8 shift = 0;

    shift = Change(adcn_ch);

    ADC->APCTL1 |= 1<<shift;              //使能ADC引脚
}

/**
  * 简介
  *     关掉 ADC
  * 参数
  *     adcn_ch
  *       通道号(variable.h中编辑)
  */
void ADC_Disable(PTX_n adcn_ch)
{
    uint8  shift = 0;
    uint16 mon = 0;

    shift = Change(adcn_ch);
    mon = (uint16)(1 << shift);

    ADC->APCTL1 &= ~mon;              //禁止ADC引脚
}


/**
  * 简介
  *     采集一次ADC数据
  * 参数
  *     adcn_ch
  *       通道号
  *     bit
  *       adc8bit
  *       adc10bit
  *       adc12bit
  * 返回值
  *     无符号结果值(范围:0-4095)
  * 备注
  *     进入之后会开启对应引脚的 ADC功能 但 出去时候 没有关闭
  *     没有使能连续转换功能，所以对 ADC_SC1 执行一次写操作将启动一次转换
  *
  */
uint16 ADC_Once(PTX_n adcn_ch, adcBit bit)
{
      uint16 result;
      uint8  shift = 0;

    shift = Change(adcn_ch);

    ADC_Able(adcn_ch);

    ADC->SC3 |=  ADC_SC3_MODE(bit);  //分辨率
    ADC->SC1  = ADC_SC1_ADCH(shift);       //启动转换

    //对 ADC_SC1 执行一次写操作将启动转换
    while(!(ADC->SC1 & ADC_SC1_COCO_MASK)); //等待转换完成
    result = ADC->R;

    return (result & ADC_R_ADR_MASK);       //返回结果
}

/**
  * 简介
  *     ADC 停止采集
  * 参数

  * 备注
  */
void ADC_Stop(void)
{
    ADC->SC1 = ADC_SC1_ADCH(0xFF);
}


/**
  * 简介
  *     中值滤波后的结果(范围:0-4095)
  * 参数
  *     MoudelNumber：模块号
  *     Channel：通道号
  *     accuracy：精度
  *     N:均值滤波次数
  * 返回值
  *     无符号结果值(范围:0-4095)
  */
uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit)
{
    uint16 i, j, k, tmp;

    //取3次A/D转换结果
    i = ADC_Once(adcn_ch, bit);
    j = ADC_Once(adcn_ch, bit);
    k = ADC_Once(adcn_ch, bit);

    //取中值 冒泡排序 中间为中值
    if (i > j)
    {
        tmp = i; i = j; j = tmp;
    }
    if (j > k)
    {
        tmp = j; j = k; k = tmp;
    }
    if (i > j)
    {
        tmp = i; i = j; j = tmp;
    }

    return      j;
}

/**
  * 简介
  *     均值滤波后的结果(范围:0-4095)
  * 参数
  *     MoudelNumber：模块号
  *     Channel：通道号
  *     accuracy：精度
  *     N:均值滤波次数
  * 返回值
  *     无符号结果值(范围:0-4095)
  */
uint16 hw_ad_ave(PTX_n adcn_ch, adcBit bit, uint8 N)
{
    uint32 tmp = 0;
    uint8  i;

    for (i=0; i<N; i++)
        tmp += hw_ad_mid(adcn_ch, bit);
    tmp = tmp / N;

    return (uint16)tmp;
}



