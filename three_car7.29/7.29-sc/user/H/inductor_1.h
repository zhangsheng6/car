#ifndef inductor_1_h_
#define inductor_1_h_

#include "common.h"
/*
extern int AD_Left[];
extern int AD_Mid[]; 
extern int AD_Right[];
*/
//extern unsigned int MaxNum;//,MaxNuma; 
/**************************���������ֵ*******
extern int sensor[];   //0-100�ܵ��Ҳ࣬�ܵ����������ĵ��
extern int AD_value[];  //�� �� ��
extern int AD_Max[]; //AD���ֵ���������Ƚ�ֵ
*/

/**********************************************���ߴ���.λ�Ʋ���**********************************************************
extern int RefAd, AD_Min ;                 //RefAd��ͬ���AD�ο�ֵ��AD_Min���߲ο�ADֵ  
extern int Mid_AD_value;  //�������  Mid_AD_valueaû��ֱ�ǵ�е�λ��ֵ��
extern  int Last_Posa;                   //Last_Pos��У����źű��ֵ�ֵ
*/
//void Inductor_1_Init(void);
void SC_black_Init(void);
void Read_ADC(void);
void Date_analyse();
void delayms(unsigned int time);
uint16 abs_inductor(int value);

float abs_f(float value);


#endif








