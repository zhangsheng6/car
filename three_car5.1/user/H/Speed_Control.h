#ifndef Speed_Control_h_
#define Speed_Control_h_
#include "allHead.h"

#define SPEED_CONTROL_PERIOD 20//75


//������
//#define  direction_R ((GPIOB_PDIR&GPIO_PIN(0 ))==0 )
//#define  direction_L ((GPIOA_PDIR&GPIO_PIN(12))!=0)
//#define  direction_R (DIR_R==0 )
//#define  direction_L (DIR_L!=0)
//ͨ��ѡ��
#define  Choose_L  {FTM_CountClean(FTM_SPEED_L);}//��
#define  Choose_R  {FTM_CountClean(FTM_SPEED_R);}//��

//void Pulse_Count(void);
void Speed_Controler(void);
void KT(void);

void Get_CarSpeed(void);
void Speed_Controler_Output(void);

#endif
