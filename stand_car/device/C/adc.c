/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     adc.c
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��23�� 10:55:52
  ******************************************************************************
  */

#include "adc.h"


uint16 adcHold = 0;

/**
  * ���
  *     ��adc���Ž��б���
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
  * ���
  *     ADC ��ʼ��
  */
void ADC_Init()
{

    SIM->SCGC |= SIM_SCGC_ADC_MASK;       //����ADCʱ��

    ADC->APCTL1 &= 0; //�������� ����ADC����

    ADC->SC3 = ( 0
                 | ADC_SC3_ADIV(1)           //��Ƶϵ����=����ʱ��
               //| ADC_SC3_MODE(bit)         //�ֱ���
                 | ADC_SC3_ADICLK(0)         //ʹ������ʱ����ΪADC��ʱ��Դ
                 | ADC_SC3_ADLSMP(1)         //������
                 | ADC_SC3_ADLPC(0)     //����ģʽ
                );
    ADC->SC2 = ( 0
                 | ADC_SC2_REFSEL(0)       //��׼��ѹѡ��
                 | ADC_SC2_ADTRG(0)        //�������
                 | ADC_SC2_ACFE(0)         //�ȽϹ��ܽ���
                );
}

/**
  * ���
  *     ADC ����ʹ��
  * ����
  *     adcn_ch
  *       ͨ����(variable.h�б༭)
  */
void ADC_Able(PTX_n adcn_ch)
{
    uint8 shift = 0;

    shift = Change(adcn_ch);

    ADC->APCTL1 |= 1<<shift;              //ʹ��ADC����
}

/**
  * ���
  *     �ص� ADC
  * ����
  *     adcn_ch
  *       ͨ����(variable.h�б༭)
  */
void ADC_Disable(PTX_n adcn_ch)
{
    uint8  shift = 0;
    uint16 mon = 0;

    shift = Change(adcn_ch);
    mon = (uint16)(1 << shift);

    ADC->APCTL1 &= ~mon;              //��ֹADC����
}


/**
  * ���
  *     �ɼ�һ��ADC����
  * ����
  *     adcn_ch
  *       ͨ����
  *     bit
  *       adc8bit
  *       adc10bit
  *       adc12bit
  * ����ֵ
  *     �޷��Ž��ֵ(��Χ:0-4095)
  * ��ע
  *     ����֮��Ὺ����Ӧ���ŵ� ADC���� �� ��ȥʱ�� û�йر�
  *     û��ʹ������ת�����ܣ����Զ� ADC_SC1 ִ��һ��д����������һ��ת��
  *
  */
uint16 ADC_Once(PTX_n adcn_ch, adcBit bit)
{
      uint16 result;
      uint8  shift = 0;

    shift = Change(adcn_ch);

    ADC_Able(adcn_ch);

    ADC->SC3 |=  ADC_SC3_MODE(bit);  //�ֱ���
    ADC->SC1  = ADC_SC1_ADCH(shift);       //����ת��

    //�� ADC_SC1 ִ��һ��д����������ת��
    while(!(ADC->SC1 & ADC_SC1_COCO_MASK)); //�ȴ�ת�����
    result = ADC->R;

    return (result & ADC_R_ADR_MASK);       //���ؽ��
}

/**
  * ���
  *     ADC ֹͣ�ɼ�
  * ����

  * ��ע
  */
void ADC_Stop(void)
{
    ADC->SC1 = ADC_SC1_ADCH(0xFF);
}


/**
  * ���
  *     ��ֵ�˲���Ľ��(��Χ:0-4095)
  * ����
  *     MoudelNumber��ģ���
  *     Channel��ͨ����
  *     accuracy������
  *     N:��ֵ�˲�����
  * ����ֵ
  *     �޷��Ž��ֵ(��Χ:0-4095)
  */
uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit)
{
    uint16 i, j, k, tmp;

    //ȡ3��A/Dת�����
    i = ADC_Once(adcn_ch, bit);
    j = ADC_Once(adcn_ch, bit);
    k = ADC_Once(adcn_ch, bit);

    //ȡ��ֵ ð������ �м�Ϊ��ֵ
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
  * ���
  *     ��ֵ�˲���Ľ��(��Χ:0-4095)
  * ����
  *     MoudelNumber��ģ���
  *     Channel��ͨ����
  *     accuracy������
  *     N:��ֵ�˲�����
  * ����ֵ
  *     �޷��Ž��ֵ(��Χ:0-4095)
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



