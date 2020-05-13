#ifndef _Motor_Control_h
#define _Motor_Control_h

#include "allHead.h"


#define change_L(x)     FTM_PwmDuty(PWM_CH1, ch1, x);//左电机PWM波输出
#define change_R(x)      FTM_PwmDuty(PWM_CH0, ch0, x);//右电机PWM波输出

//------------------------------------电机正反控制------------------------------
#define reversal_L   	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 1);}//后退 逆时针
#define forward_L	{GpioSet(ENR_L, 1); GpioSet(ENR_R, 0);}//前进 顺时针
#define locking_L  	{GpioSet(ENR_L, 0); GpioSet(ENR_R, 0);}//停
//#define sliding_R  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(4)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(6));change_R(0);}//滑行

#define forward_R	{GpioSet(ENL_R, 1); GpioSet(ENL_L, 0);}//前进 逆时针
#define reversal_R	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 1);}//后退 顺时针
#define locking_R 	{GpioSet(ENL_R, 0); GpioSet(ENL_L, 0);}//停
//#define sliding_L  	{GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(7)); GPIOC_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(9));change_L(0);}


void Motor_control(void);
void Motor_Out_control(void);


#endif