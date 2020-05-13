/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     pit.c
  * �ļ���ʶ��
  * ժ    Ҫ��     �����ж϶�ʱ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��23�� 16:45:38
  ******************************************************************************
  */
#include "pit.h"

/**
  * ���
  *     PIT0��ʼ��
  * ����
  *     pitn  ֻ��PIT0��Ч
  *     us����ʾ��ʱ�����ʼ�ݼ���ֵ
  * ע��
  *     LDVALд��ֵ =����ʱ����/ʱ�����ڣ�-1
  */
void PIT_Init(uint8 pitn, uint16 us)
{
//    get_clk();

    uint32 cnt = 0;
    cnt = us * (bus_clk_khz/1000) - 1;

	SIM->SCGC       |= SIM_SCGC_PIT_MASK;       //ʹ��PITʱ��

	PIT->MCR        &= ~PIT_MCR_MDIS_MASK;      //������ִ���κ���������֮ǰʹ�ܸ��ֶ�
	PIT->MCR        |= PIT_MCR_FRZ_MASK;	    //����ģʽ�½�ֹ����
//    PIT->MCR        &= ~PIT_MCR_FRZ_MASK;	    //����ģʽ����������
	PIT->CHANNEL[pitn].LDVAL  = cnt;            //��������ж�ʱ��
	PIT_CLEAR;								    //����жϱ�־λ
	PIT->CHANNEL[pitn].TCTRL &= ~ PIT_TCTRL_TEN_MASK;       //��ֹPITn��ʱ����������ռ���ֵ��
    PIT->CHANNEL[pitn].TCTRL  = ( 0
								| PIT_TCTRL_TEN_MASK        //ʹ�� PITn��ʱ��
								& (~PIT_TCTRL_TIE_MASK)     //��PITn�ж�
								);
}

/**
  * ���
  *     ʹ��PIT0�ж�
  */
void PIT_EnableIrq()
{
    PIT_CLEAR;   //���жϱ�־
    PIT->CHANNEL[PIT0].TCTRL |= PIT_TCTRL_TIE_MASK; //��pit�ж�
    enable_irq(PIT0_IRQ);
}

/**
  * ���
  *     ��ֹPIT0�ж�
  */
void PIT_DisableIrq()
{
    PIT->CHANNEL[PIT0].TCTRL &= (~PIT_TCTRL_TIE_MASK); //��pit�ж�
    disable_irq(PIT0_IRQ);
}


