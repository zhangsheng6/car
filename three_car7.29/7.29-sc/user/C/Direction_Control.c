#include "Direction_Control.h"
#include "math.h"
#include "BL.h"
/*****************************�������ǲ���2************************************/
float k=0;float k3=0.0,k4=0.0;float B=15.5,L=15;float angle,angle_2;float  speed_temp2=0,speed_temp1=-20;
/*-----------����2---------------------------------------------------------------*/
#define N 3
 float Speed_I_D_Temp=0,X=20;float Accum_Error_L[N]={0};float Accum_Error_R[N]={0};float Chazhi_Error_L[N]={0};float Chazhi_Error_R[N]={0};float Sum_Error_L=0,Sum_Error_R=0;float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;float Speed_I_lntegral_Max = 9000;float Direction_Control_Output_L = 0.0;float Direction_Control_Output_R = 0.0,Control_Output_L=0,Control_Output_R=0;uint8 Piaoyi_L=0,Piaoyi_R=0;
/*--------------------------------------------------------------------------*/
/********************************************************************************/
float Chazhi_point=45;
float  Angle_Weight=0.5,Direction_Weight=0.5;
float Chazhi_limit=75;float Chasu_Bili=1,Chasu_Bili_Temp=1, Speed_Bili=1,Chazhi_Bili=1,Chazhi_Bili_Temp=1,Speed_Bili_Temp=1,Chazhi_Temp=0;double angle_limit=60,angle_limit_2=60;float change_bili_F=1,change_bili_Z=1;float speed_dead_F=-0;int change_value=10;int change_factor=0; int change_variable=0;                                                                float Angle_P_choose;int   angle_P=60;
float Direction_P2_Temp=0,Direction_P2_Speed=0,Direction_P2_Chazhi=0;int t=0;
float Angle_P_Temp=0,Angle_D_Speed=0,Angle_D_Chazhi=0;
float speed_point=0; float Direction_P_Temp=0;  
/************************���õ��α���**************************************************/
 int Chazhi_Change=50,Chazhi_Change2=75;
   int  Direction_P2_Change=0,Angle_P_Change=0; 
float  speed_set  = 80,//��5ms 

    Direction_P=100,        Direction_D=0,          Direction_I=100,          //��������λ��ʽ����+�ٶȻ�
    Direction_P2=700,     Direction_D2=-1000,         Direction_I2=0.0,                 //��ֵλ��ʽ 
    Angle_P=100,          Angle_D=0,                  Angle_D_Temp,//������
                                                    Speed_P=0,          Speed_I=0,                 Speed_D=0.00;//�ٶȻ�����ʽ
/************************���õ��α���**************************************************/
void Direction_Controler(void)//2.71828
{
 float speed_error2=0;
  float K1=0,K2=0,K3=0,K4=10;
  float Son_DP=0,Son_AP=0,Son_AD=0,Son_AD_Max=100,jsd=0;
  float Son_DP2=0,Son_AP2=0;
  float Chazhi_Mid=50,Chazhi_Error=0,Chazhi_Error2=0;
//����С�� ��ֵ�����ٴ󣬸�ֵ 
speed_error2=speed_buzzer-speed_car;

//��ֵP�ı�--------------------------------------------
  if(abs_f(Chazhi)>Chazhi_Change)
    Chazhi_Error=(abs_f(Chazhi)-50)/50;
else
    Chazhi_Error=0;
  Son_DP=Direction_P2_Change*Chazhi_Error;
  
//������P--------------------------------------------
if(abs_f(Chazhi)>Chazhi_Change2)
    Chazhi_Error2=(abs_f(Chazhi)-75)/25;
else
    Chazhi_Error2=0;
    Son_AP=Angle_P_Change*Chazhi_Error2; 

Direction_P2_Temp=Direction_P2+Son_DP;

//--------------------------------------------
if(abs_f(Chazhi)<20)
{ 
Angle_P_Temp=0+Son_AP;
}
else if(abs_f(Chazhi)<40)//20-40
{ 
Angle_P_Temp=Angle_P/4+Son_AP;
}else if(abs_f(Chazhi)<50)//40-50
{ 
Angle_P_Temp=Angle_P/2+Son_AP;
}
else 
{
Angle_P_Temp=Angle_P+Son_AP;
}   
//--------------------------------------------
if(gyr_angle_speed>200)
     gyr_angle_speed=200;
if(gyr_angle_speed<-200)
     gyr_angle_speed=-200;
if(Chazhi>0)//��ת���ٶȸ���
   jsd=-1*abs_f(gyr_angle_speed);
else//��ת�����ٶ���
   jsd=abs_f(gyr_angle_speed);
//--------------------------------------------
Direction_Control_Output_L = 
                             -Direction_P2_Temp*Chazhi-Direction_D2*Chazhi_Rate 
                               +Angle_P_Temp*jsd-Angle_D_Temp*jsd ;//gyr_angle_speed:ֵ��ת����ת��
Direction_Control_Output_R = 
                             Direction_P2_Temp*Chazhi+Direction_D2*Chazhi_Rate
                             -Angle_P_Temp*jsd+Angle_D_Temp*jsd;
}

 int akmj_z=0,akmj_w=20;//w20
/*���򰢿����ǲ��ٿ���***************************************************************/
void Direction_ChaSpeed_Control(void)//(short int angle)
{   
 int k1=1;
 angle_limit=80;
 angle=Chazhi*1;
 
   if(StraightRoad_Flag==1)
    {
       speed_set_temp_L=speed_set+akmj_z;
       speed_set_temp_R=speed_set+akmj_z;
       Direction_P_Temp=Direction_P;
    } 
    if(WindingRoad_Flag==1)
    {
       speed_set_temp_L=speed_set+akmj_w;
       speed_set_temp_R=speed_set+akmj_w;
       Direction_P_Temp=Direction_P-0;
    }
  
   
  if(angle>angle_limit)   angle=angle_limit;
  if(angle<-angle_limit)   angle=-angle_limit;//0.5  1.5    k=1  1.5   2.5
   
   speed_set_L=speed_set_temp_L*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
   speed_set_R=speed_set_temp_R*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); //b/2L=0.517

}
float Speed_PWM=0;
int BB_Z=0,BB_W=0,BB_H=-0;
int BB_P_Z=50,BB_P_W=50,BB_P_F=200;
/**�ٶȰ�������********************************************************************/
void BangBang(void)
{
 int sele=1;
float Speed_PWM_Max=8000,Speed_PWM_Min=-8000,speed_error=0,K4=0,Son_SP,Speed_Error=0,Speed_PWM_L=0,Speed_PWM_R=0,Error_L=0,Error_R=0; 

if(StraightRoad_Flag==1)
{
   speed_set_temp=speed_set+BB_Z;//10
   sele=1;
}
else
{
    speed_set_temp=speed_set+BB_W;//10
       sele=2;
}
if(Circle_Flag>1&&Circle_Flag<4)//���ڼ��Բ��˫��״̬
{
   speed_set_temp=speed_set+BB_H;//10
      sele=2;
}
/*��ֹ����������*/
//if(speed_set>84)
//{
//if(abs_f(Chazhi)>75)
//  speed_set_temp-=10;
//}

Speed_Error=speed_set_temp-speed_car;
switch(sele)
{
case 1:

    if(Speed_Error>30)//���ٴ�,>30
   {
     Speed_PWM =BB_P_Z*30;//1500
   }
    else if(Speed_Error>0)//����С0-30
   {
    Speed_PWM = Speed_Error*BB_P_Z;
   }
   else if(Speed_Error>-20)//���ٴ�0->-20
   {
        Speed_PWM = Speed_Error*BB_P_F;
   }
   else if(Speed_Error>-30)//���ٴ�-20>-30
   {
       Speed_PWM =-6000;
   }
   else if(Speed_Error>-40)//���ٴ�-30>-40
   {
       Speed_PWM =-7000;
   }    
   else //���ٴ�<-40
   {
       Speed_PWM =-8000;
   }
break;

case 2:
 
    
     if(Speed_Error>20)//����С,20-30
   {
     Speed_PWM =BB_P_W*20;//1500
   }
    else if(Speed_Error>0)//����С0-20
   {
    Speed_PWM = Speed_Error*BB_P_W;

   }
   else if(Speed_Error>-20)//���ٴ�0->-20
   {
        Speed_PWM = Speed_Error*BB_P_F;
   }
   else if(Speed_Error>-30)//���ٴ�-20>-30
   {
       Speed_PWM =-6000;
   }
   else if(Speed_Error>-40)//���ٴ�-30>-40
   {
       Speed_PWM =-7000;
   }    
   else //���ٴ�<-40
   {
       Speed_PWM =-8000;
   }
break;
  
    default :
        break;
}   
      
   if(Speed_PWM>Speed_PWM_Max)  Speed_PWM=Speed_PWM_Max;
   if(Speed_PWM<Speed_PWM_Min)  Speed_PWM=Speed_PWM_Min;  
//  if(Stop_Flag==1)
//  Speed_PWM=0;
}
/*�ٶȻ�����******************************************************************/
void Controler()
{
float Speed_Error_L_Old=0,Speed_Error_R_Old=0;

   Speed_Error_L = speed_set_L - speed_L;//�ظ�
   Speed_Error_R = speed_set_R - speed_R; 

   Direction_P_Temp=Direction_P;
Control_Output_L=Direction_P_Temp*Speed_Error_L +Speed_I_lntegral_L+Direction_D*(Speed_Error_L-Speed_Error_L_Old)
                 ;
//
Control_Output_R=Direction_P_Temp*Speed_Error_R +Speed_I_lntegral_R+Direction_D*(Speed_Error_R-Speed_Error_R_Old)
                   ;


}














//                               Speed_Error_L_Old    -  Speed_Error_L��ΪP������
//�ٶ��趨100 ��ʼ�ٶ�0 �����ٶ�50       100-0=100     -  100-50=50    =50*D������
//                    �����ٶ�100             100     -   100-100=0    =100*D,����

//                                  Speed_Error_L -  Speed_Error_L_Old��ΪD������
//�ٶ��趨100 ��ʼ�ٶ�0 �����ٶ�50      100-50=50  -   100-0=100       =-50*D,����
//�ٶ��趨0 ��ʼ�ٶ�100 �����ٶ�50      0-50=-50   -   0-100=-100       =50*D,����
//ֱ���ٶ�=�ٶ��趨-10   
//һ������ٶ�=�ٶ��趨-40   
//������ٶ�=�ٶ��趨-60       �ٶ��趨-30
//����С�� ��ֵ�����ٴ󣬸�ֵ 
//   speed_error=speed_buzzer-speed_car;
//   K4=50;
//   Son_SP=speed_error*K4;
//      if(Son_SP>500)   Son_SP=500;
//      if(Son_SP<300)   Son_SP=300;
//   Son_SP=0;
//Direction_P_Temp=Direction_P+Son_SP;
uint8 Direction_Control_Period = 0;
#define DIRECTION_CONTROL_PERIOD 50

float P_Direction1=40,D_Direction1=20.5;		//����
float P_Direction2=40,D_Direction2=20.5;		//����
float P_Direction3=173,D_Direction3=145.5;		//����

float P_Direction = 100,D_Direction = 0;              
float turn_spd = 150;
float P_Direction_high = 80, P_Direction_low=80;//26
//float   K =1;
float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
float Direction_angle=0.0;
float P_Dir_agl=20.0;
float Road_Err_D=0;		//ƫ���΢��