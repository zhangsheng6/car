#include "Direction_Control.h"
#include "math.h"
/*****************************�������ǲ���1************************************/
float k1=1,k2=1.5;//ͨ��k1ȷ����ֵ��Ƕȵ�ת������2��1.5
float Chazhi_limit=20;//60//25*1.5=37.5;30*1.5=45;30
float Chasu_Bili=1 ,Chasu_Bili_Temp=1;
double angle_limit=75;//70
int change_value=10;//ֵ,�ӽ���תʱ���ٶ��趨
int change_factor=0; //ϵ��,�ӽ���תʱ�ĸ�����̥����ϵ��
//�ٶ��趨�ﵽ50��ʱ��,����60��:������̥��ʼ�为,������̥�Ѿ���100��,û��Ҫ����
int change_variable=0;//����,�ӽ���תʱ�ĵ�����̥��������
/*****************************************************************/

/*-----------����1---------------------------------------------------------------*/
 float Speed_P_D=350;//����Pѡ��
 float Speed_I_D=0.0;//����Iѡ��
 float Speed_D_D=0;//����Dѡ��80 
 float Angle_P=0,Angle_D=0,Angle_P_choose;//������
 int   angle_P=80;//ʵ�ʽǶ�Ϊһ��
/*--------------------------------------------------------------------------*/

/*****************************�������ǲ���2************************************/
float k=0;//kδ��������k���������ת�������ǰ��kСת����ٿ���
float k3=0.0,k4=0.0;//��ֵ�仯��Ӱ��ϵ��
float B=15.5,L=15;//BΪ���ּ�࣬LΪǰ���ּ��,B/2L=4/9
float angle;//С��ƫת�Ƕ�2
//�ٶ��趨30��Chasu_Bili=2��3;3��2Ч����һ���
//�ٶ��趨30����ֵ60��60�ȡ����70�Ⱥ�����Ư�����⣬75Ư��
float  speed_temp2=0,speed_temp1=-20;
/********************************************************************************/

/*-----------����2---------------------------------------------------------------*/
//I����1���ֻἫ�켫��ﵽ�趨ֵ,����תһ��ͣһ�µ�����
///�ٶ��趨30��P=240��I=0;D=0;P=280֮�󣬽��Ư�����⡣
//V=30:I=1,D=0�������΢���Ұڶ�;I=0,D=50����٣�������˦β���ֻ���΢˦������ 
 float Speed_I_D_Temp=0,
        X=20;//�ǶȻ��ֶ���
#define N 10//2.80m/s*5ms*20=28cm,2.80m/s*5ms*10=14cm,��Nȡ10
 float Accum_Error_L[N]={0};//�������20��ƫ��ֵ����
 float Accum_Error_R[N]={0};//�������20��ƫ��ֵ����
 float Sum_Error_L=0,Sum_Error_R=0;//���������20�ε�ƫ���ܺ� 
 float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;//�ٶȻ�I�����ۼ�_���֣��ٶȻ�I�����ۼ�_����
 float Speed_I_lntegral_Max = 9000;//�ٶȻ������ۼ����ֵ
 float Direction_Control_Output_L = 0.0;
 float Direction_Control_Output_R = 0.0;
 uint8 Piaoyi_L=0,Piaoyi_R=0;
/*-------------------------------------------------------------------------------------------------------------------------****/

 /*****************************************************************************/
 
/********************************************************************************/

 int t=0;
/*******************************************
��ʽ:V_left=V*(1+B*tan��/2L);V_right=V*(1-B*tan��/2L);
�����ٶ�=ǰ���ٶ�*��1+���ּ��*ǰ��ƫת�Ƕ�/2����ǰ���ּ�ࣩ
ͨ����ֵȷ��ƫת�Ƕȣ������ñ�����ת��
�ٶȿ��������֤����(ǰ���ٶ�)�ȶ���һ��ֵ�������ϡ�
**********************************************/
void Direction_ChaSpeed_Control(void)//(short int angle)
{
/*
tan0��-45��-60��-70��--80��---81��--83��--85��--89��-90��-91��
  0     1  1.73   2.7  5.7   6.3   8.1  11.4   57    ��  -57
  �����������Ƕ�angle����С��90�ȣ�һ������90�ȣ��ʹ�����������ת��䵽������������䣬������ת
�������С����ڽǶ�Խ��tan���ҲԽ���أ����ܴ���80�ȡ����벻�ܴ���80�ȡ�
  �������ݶ����ת��ò�����60�ȣ����趨��ת�Ƕ�Ϊ0��-60�ȡ�
ת��60�ȣ�PWM����Ϊ�����ڵ��ٶ��趨��30��P,ת��77����5500��PWM�
*/
  if(Chazhi<-Chazhi_limit||Chazhi>Chazhi_limit)
  {     
    angle=Chazhi*k2;
  if(angle>0&&angle<Chazhi_limit*k1)
    {
      angle=Chazhi_limit*k1;
    }
     if(angle<0&&angle>-Chazhi_limit*k1)
    {
      angle=-Chazhi_limit*k1;
    }
//    if(Chazhi>0)
//    {
//      if(Chazhi_Rate<0&&Chazhi_Rate>-10)
//      {
//         angle+=k3*Chazhi_Rate;
//      }
//     if(Chazhi_Rate<-10||Chazhi_Rate==-10)
//      {
//         angle+=k4*Chazhi_Rate;
//      }
//    }    
//    if(Chazhi<0)
//    {
//      if(Chazhi_Rate>0&&Chazhi_Rate<10)
//      {
//         angle+=k3*Chazhi_Rate;
//      }
//     if(Chazhi_Rate>10||Chazhi_Rate==-10)
//      {
//         angle+=k4*Chazhi_Rate;
//      }
//    }
      
  }
  else
  {
//��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
//��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
//  {    
    angle=Chazhi*k1;
//    if(Chazhi_Rate>35)
//    {
//    angle=Chazhi*k1+Chazhi_Rate*k3;
//    }
   }


////angle=Fuzzy_Control_Direction();
  

   
   if(StraightRoad_Flag==1)
   {
       speed_set=speed_set_Z;
       Piaoyi_L=0;
       Piaoyi_R=0; 
//       BUZZER_OFF;

   }
   
    if(WindingRoad_Left_Flag==1)
    {
       speed_set=speed_set_W;
//       LED_3_ON;
       if(angle>angle_limit-10)
          Piaoyi_L=1;
    }
  
     if(WindingRoad_Right_Flag==1)
    {
       speed_set=speed_set_W;
//       LED_3_ON;
       if(angle<-angle_limit+10)
          Piaoyi_R=1;
    }
   
   if(Piaoyi_L==1)
   {
      if(angle<-30)
        Piaoyi_L=2;     
   }
   
   if(Piaoyi_R==1)
   {
      if(angle>30)
        Piaoyi_R=2;     
   }
   
   if(Piaoyi_L==2)
   {
      if(angle<-40)
      {
//         speed_set-=20;
//       angle=angle*2;
//         BUZZER_ON;
      }
   }
   
     if(Piaoyi_R==2)
   {
      if(angle>40)
      {
//          speed_set-=20;
//        angle=angle*2;
//          BUZZER_ON;
      }
   }
   
////�Ƕ����ƺ���
//  if(angle<60) Chasu_Bili_Temp=Chasu_Bili+0.5;
//  else         Chasu_Bili_Temp=Chasu_Bili;
  
  if(angle>angle_limit)   angle=angle_limit;
  if(angle<-angle_limit)   angle=-angle_limit;
   
   speed_set_L=speed_set*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
   speed_set_R=speed_set*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); 
   //�ٶ��趨0-10
      if(speed_set_L>0&&speed_set_L<change_value)
   {
//      speed_set_L=0;
      speed_set_L-=change_variable;
      speed_set_R+=change_factor*speed_set_L;
   }
   
   if(speed_set_R>0&&speed_set_R<change_value)
   {
//      speed_set_R=0;
           speed_set_R-=change_variable;
      speed_set_L+=change_factor*speed_set_R;
   }
//�ٶ��趨С��0  
   if(speed_set_L<0)
   {
           speed_set_L-=change_variable;
//                 speed_set_L=0;

      speed_set_R+=-change_factor*speed_set_L;
   }
   
   if(speed_set_R<0)
   {
           speed_set_R-=change_variable;
//                 speed_set_R=0;

      speed_set_L+=-change_factor*speed_set_R;
   }
//   if(speed_set_L<5)
//      speed_set_L-=20;
//   if(speed_set_R<5)
//      speed_set_R-=20;
   
//   if(speed_set_L<=speed_temp2&&speed_set_L>speed_temp1)
//      speed_set_L=speed_temp1;
//   if(speed_set_R<=speed_temp2&&speed_set_R>speed_temp1)
//      speed_set_R=speed_temp1;
   
  }

void Direction_Controler_I(void)
{
//speed_car = speed_car / (10*);//ת������ 
   Speed_Error_L = speed_set_L - speed_L; 
   Speed_Error_R = speed_set_R - speed_R; 
    
    for(int i=0;i<N-1;i++)
   {
     Accum_Error_L[i]=Accum_Error_L[i+1]; 
   }
   Accum_Error_L[N-1]=Speed_Error_L;
 
   for( int i=0;i<N-1;i++)
   {
     Accum_Error_R[i]=Accum_Error_R[i+1]; 
   }
   Accum_Error_R[N-1]=Speed_Error_R;
    
}




void Direction_Controler(void)
{
//speed_car = speed_car / (10*);//ת������ 
   Speed_Error_L = speed_set_L - speed_L;//�ظ�
   Speed_Error_R = speed_set_R - speed_R; 
//������20��ƫ����ܺ���Ϊ������
   
   Sum_Error_L=0;//������ƫ���ܺ�
   Sum_Error_R=0;
   Speed_I_lntegral_L=0;//������ƫ���ܺ�*I=0��
   Speed_I_lntegral_R=0;
   
//����ƫ���ۻ�
   for(int i=0;i<N-1;i++)
   {
     Accum_Error_L[i]=Accum_Error_L[i+1]; //�ظ�
     Sum_Error_L+=Accum_Error_L[i];
   }
      if(speed_L<20&&speed_R<20)
   Accum_Error_L[N-1]=Speed_Error_L/10;
      else
   Accum_Error_L[N-1]=Speed_Error_L;
   Sum_Error_L+=Accum_Error_L[N-1]; 
 
   for( int i=0;i<N-1;i++)
   {
     Accum_Error_R[i]=Accum_Error_R[i+1]; //�ظ�
     Sum_Error_R+=Accum_Error_R[i];
   }
         if(speed_L<20&&speed_R<20)
   Accum_Error_R[N-1]=Speed_Error_R/10;
         else
   Accum_Error_R[N-1]=Speed_Error_R;
   Sum_Error_R+=Accum_Error_R[N-1];
//   if(angle>X)
     Speed_I_D_Temp=Speed_I_D;
//   else
//     Speed_I_D_Temp=Speed_I_D/100;
   Speed_I_lntegral_L = Speed_I_D_Temp*Sum_Error_L;
   Speed_I_lntegral_R = Speed_I_D_Temp*Sum_Error_R;
          
   if (Speed_I_lntegral_L< -Speed_I_lntegral_Max)
       Speed_I_lntegral_L= -Speed_I_lntegral_Max;
   if (Speed_I_lntegral_L>  Speed_I_lntegral_Max)
       Speed_I_lntegral_L=  Speed_I_lntegral_Max;
   if (Speed_I_lntegral_R< -Speed_I_lntegral_Max)
       Speed_I_lntegral_R= -Speed_I_lntegral_Max;
   if (Speed_I_lntegral_R>  Speed_I_lntegral_Max)
       Speed_I_lntegral_R=  Speed_I_lntegral_Max;

   if(angle>angle_P)
    Angle_P_choose=1;
 else
    Angle_P_choose=0;
 
 
 Direction_Control_Output_L = Speed_P_D*Speed_Error_L + Speed_I_lntegral_L+Speed_D_D*(Speed_Error_L-Speed_Error_Last_L)
                            +Speed_Error_L*Angle_P_choose*Angle_P*abs_f(gyr_angle_speed)-Angle_D*gyr_angle_speed;   
Direction_Control_Output_R = Speed_P_D*Speed_Error_R + Speed_I_lntegral_R+Speed_D_D*(Speed_Error_R-Speed_Error_Last_R)
                            +Speed_Error_R*Angle_P_choose*Angle_P*abs_f(gyr_angle_speed)+Angle_D*gyr_angle_speed;   
 
   
 
 
//Direction_Control_Output_L = Speed_P_D*Speed_Error_L + Speed_I_lntegral_L+Speed_D_D*(Speed_Error_L-Speed_Error_Last_L)
//                            +Angle_P_choose*Angle_P*gyr_angle_speed-Angle_D*gyr_angle_speed;   
//Direction_Control_Output_R = Speed_P_D*Speed_Error_R + Speed_I_lntegral_R+Speed_D_D*(Speed_Error_R-Speed_Error_Last_R)
//                             -Angle_P_choose*Angle_P*gyr_angle_speed+Angle_D*gyr_angle_speed;   
// 
   
}













































//���룺��
//�������
//����:С�����ٵ���
//ԭ����������
//��ʽ:V_left=V*(k-B*tan��/2L);V_right=V*(k+B*tan��/2L);
//��Ϊ������ֵ��BΪ���ּ�࣬LΪǰ���ּ�࣬V = Speed_Set
//aΪ����ϵ��������p�����������,s��ǰ
//   Direction_Control_Output_L= P_Direction * speed_set_L;  
//   Direction_Control_Output_R= P_Direction * speed_set_R;
   
// DIF_INTENSITY = 11; //����ǿ��    �������������Խ���ԣ����ٶ������Ժ󣬴�ֵӦ�ü�С  
//  uint32 temp1 = Speed_Set_Temp * DIF_P/100;
//  int32 temp2 = Speed_Set_Temp*angle*angle/DIF_INTENSITY;
//  if(angle<0) temp2 = -temp2;  
//  Speed_Set_L = temp1 +  temp2;
//  Speed_Set_R = temp1 -  temp2;
//  float temp=Speed_Set_Temp*DIF_INTENSITY*tan((double)(angle*0.01745))/10;
//  float temp2 = Speed_Set_Temp*DIF_P;     //��ǰ����Խ��Խ��ǰ
//  Speed_Set_L=(uint32)(temp2+temp);
//  Speed_Set_R=(uint32)(temp2-temp);

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

//void Direction_Controler(void)
//{
//  float road_err_D_Tmp;
//  static float Chazhi_last;
//  
//  road_err_D_Tmp = Chazhi - Chazhi_last;
//  Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  
//  if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//  else                         P_Direction = P_Direction_low;
//  
//  Direction_Control_Output=( P_Direction * Chazhi)  + D_Direction*Road_Err_D;
//  Chazhi_last = Chazhi;
//
//
//}

//void Direction_Controler(void)
//{
//    double road_err_D_Tmp = 0.0;	//ƫ��΢���м����
//
//    //һ���˲�
//    road_err_D_Tmp = Road_Err[9]- Road_Err[6];
//    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//
//    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//    else                         P_Direction = P_Direction_low;
//
//    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//ת��
//    Direction_Control_Output = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//
//#if 0
//    //�����Կ��Ʒ���
//    Direction_Control_Period++;
//    //---------------------------------------------------------------------------------------------------------------------
//    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
//    {
//        Direction_Control_Period = 0;
//        Direction_Control_Last = Direction_Control;
//        //һ���˲�
//        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
//        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//
//        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//ת��
//
//        Direction_Control = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//        Direction_Control_Err = Direction_Control - Direction_Control_Last;
//    }
//    //---------------------------------------------------------------------------------------------------------------------
//
//    Direction_Control_Output = Direction_Control_Last + Direction_Control_Err*(Direction_Control_Period+1)/DIRECTION_CONTROL_PERIOD ;
//#endif
//}
//
//*/