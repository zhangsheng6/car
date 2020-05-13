#ifndef inductor_1_h_
#define inductor_1_h_

#include "common.h"
/*
extern int AD_Left[];
extern int AD_Mid[]; 
extern int AD_Right[];
*/
//extern unsigned int MaxNum;//,MaxNuma; 
/**************************标量化电感值*******
extern int sensor[];   //0-100总的右侧，总得左侧标量化的电感
extern int AD_value[];  //右 中 左
extern int AD_Max[]; //AD最大值，标量化比较值
*/

/**********************************************丢线处理.位移参数**********************************************************
extern int RefAd, AD_Min ;                 //RefAd不同情况AD参考值，AD_Min丢线参考AD值  
extern int Mid_AD_value;  //三种情况  Mid_AD_valuea没加直角电感的位移值，
extern  int Last_Posa;                   //Last_Pos电感，丢信号保持的值
*/
//void Inductor_1_Init(void);
void SC_black_Init(void);
void Read_ADC(void);
void Date_analyse();
void delayms(unsigned int time);
uint16 abs_inductor(int value);

float abs_f(float value);


#endif








