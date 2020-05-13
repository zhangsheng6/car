/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    Motor_Control.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��29�� 21:58:21
  ******************************************************************************
  */
#ifndef _Motor_Control_h
#define _Motor_Control_h

#include "allHead.h"


#define change_L(x)     FTM_PwmDuty(PWM_CH0, ch0, x);//����PWM�����
#define change_R(x)     FTM_PwmDuty(PWM_CH1, ch1, x);//�ҵ��PWM�����

//------------------------------------�����������------------------------------
#define reversal_R 	{GpioSet(ENR_L, 1); GpioSet(ENR_R, 0);}//ǰ�� ��ʱ��
#define forward_R 	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 1);}//���� ˳ʱ��
#define locking_R  	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 0);}//ͣ
//#define sliding_R  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(4)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(6));change_R(0);}//����

#define reversal_L	{GpioSet(ENL_R, 1); GpioSet(ENL_L, 0);}//ǰ�� ��ʱ��
#define forward_L	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 1);}//���� ˳ʱ��
#define locking_L  	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 0);}//ͣ
//#define sliding_L  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(7)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(9));change_L(0);}

void Motor_control(void);


#endif