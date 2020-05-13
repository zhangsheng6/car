#ifndef _Motor_Control_h
#define _Motor_Control_h

#include "allHead.h"


#define change_L(x)     FTM_PwmDuty(PWM_CH1, ch1, x);//����PWM�����
#define change_R(x)      FTM_PwmDuty(PWM_CH0, ch0, x);//�ҵ��PWM�����

//------------------------------------�����������------------------------------
#define reversal_L   	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 1);}//���� ��ʱ��
#define forward_L	{GpioSet(ENR_L, 1); GpioSet(ENR_R, 0);}//ǰ�� ˳ʱ��
#define locking_L  	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 0);}//ͣ
//#define sliding_R  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(4)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(6));change_R(0);}//����

#define forward_R	{GpioSet(ENL_R, 1); GpioSet(ENL_L, 0);}//ǰ�� ��ʱ��
#define reversal_R	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 1);}//���� ˳ʱ��
#define locking_R 	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 0);}//ͣ
//#define sliding_L  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(7)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(9));change_L(0);}


void Motor_control(void);
void Motor_Out_control(void);


#endif