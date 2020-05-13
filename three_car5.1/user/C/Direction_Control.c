#include "Direction_Control.h"
#include "math.h"
/*****************************阿克曼角参数1************************************/
float k1=1,k2=1.5;//通过k1确定差值与角度的转换比例2，1.5
float Chazhi_limit=20;//60//25*1.5=37.5;30*1.5=45;30
float Chasu_Bili=1 ,Chasu_Bili_Temp=1;
double angle_limit=75;//70
int change_value=10;//值,接近反转时的速度设定
int change_factor=0; //系数,接近反转时的高速轮胎所乘系数
//速度设定达到50的时候,正常60度:低速轮胎开始变负,高速轮胎已经上100了,没必要加了
int change_variable=0;//变量,接近反转时的低速轮胎所减变量
/*****************************************************************/

/*-----------方向环1---------------------------------------------------------------*/
 float Speed_P_D=350;//方向环P选择
 float Speed_I_D=0.0;//方向环I选择
 float Speed_D_D=0;//方向环D选择80 
 float Angle_P=0,Angle_D=0,Angle_P_choose;//陀螺仪
 int   angle_P=80;//实际角度为一半
/*--------------------------------------------------------------------------*/

/*****************************阿克曼角参数2************************************/
float k=0;//k未定参数，k大能让弯道转弯差速提前，k小转弯差速靠后
float k3=0.0,k4=0.0;//差值变化率影响系数
float B=15.5,L=15;//B为后轮间距，L为前后轮间距,B/2L=4/9
float angle;//小车偏转角度2
//速度设定30：Chasu_Bili=2或3;3比2效果好一点点
//速度设定30：差值60，60度。变成70度后解决了漂移问题，75漂；
float  speed_temp2=0,speed_temp1=-20;
/********************************************************************************/

/*-----------方向环2---------------------------------------------------------------*/
//I大于1车轮会极快极快达到设定值,出现转一下停一下的现象
///速度设定30：P=240；I=0;D=0;P=280之后，解决漂移问题。
//V=30:I=1,D=0会出现轻微左右摆动;I=0,D=50会加速，但过弯甩尾后轮会轻微甩出赛道 
 float Speed_I_D_Temp=0,
        X=20;//角度积分度数
#define N 10//2.80m/s*5ms*20=28cm,2.80m/s*5ms*10=14cm,故N取10
 float Accum_Error_L[N]={0};//左轮最近20次偏差值储存
 float Accum_Error_R[N]={0};//右轮最近20次偏差值储存
 float Sum_Error_L=0,Sum_Error_R=0;//左右轮最近20次的偏差总和 
 float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;//速度环I积分累加_左轮，速度环I积分累加_右轮
 float Speed_I_lntegral_Max = 9000;//速度环积分累加最大值
 float Direction_Control_Output_L = 0.0;
 float Direction_Control_Output_R = 0.0;
 uint8 Piaoyi_L=0,Piaoyi_R=0;
/*-------------------------------------------------------------------------------------------------------------------------****/

 /*****************************************************************************/
 
/********************************************************************************/

 int t=0;
/*******************************************
公式:V_left=V*(1+B*tanα/2L);V_right=V*(1-B*tanα/2L);
左轮速度=前轮速度*（1+后轮间距*前轮偏转角度/2倍的前后轮间距）
通过差值确定偏转角度，再利用本函数转弯
速度控制输出保证车速(前轮速度)稳定在一个值，理论上。
**********************************************/
void Direction_ChaSpeed_Control(void)//(short int angle)
{
/*
tan0度-45度-60度-70度--80度---81度--83度--85度--89度-90度-91度
  0     1  1.73   2.7  5.7   6.3   8.1  11.4   57    无  -57
  综上所述，角度angle必须小于90度，一旦大于90度，就从向左往死里转弯变到往右往死里打弯，彻底旋转
根本不行。由于角度越大，tan变得也越严重，不能大于80度。必须不能大于80度。
  所以依据舵机能转向貌似最大60度，先设定旋转角度为0度-60度。
转向60度，PWM相差？因为按现在的速度设定和30的P,转向77度有5500的PWM差。
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
//差值为正:Rate越往正方向大,Angle越大;Rate越往负方向大,Angle越小。
//差值为负:Rate越往负方向大,Angle越大;Rate越往正方向大,Angle越小。
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
   
////角度限制函数
//  if(angle<60) Chasu_Bili_Temp=Chasu_Bili+0.5;
//  else         Chasu_Bili_Temp=Chasu_Bili;
  
  if(angle>angle_limit)   angle=angle_limit;
  if(angle<-angle_limit)   angle=-angle_limit;
   
   speed_set_L=speed_set*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
   speed_set_R=speed_set*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); 
   //速度设定0-10
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
//速度设定小于0  
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
//speed_car = speed_car / (10*);//转换进制 
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
//speed_car = speed_car / (10*);//转换进制 
   Speed_Error_L = speed_set_L - speed_L;//重复
   Speed_Error_R = speed_set_R - speed_R; 
//求出最近20个偏差的总和作为积分项
   
   Sum_Error_L=0;//积分项偏差总和
   Sum_Error_R=0;
   Speed_I_lntegral_L=0;//积分项偏差总和*I=0；
   Speed_I_lntegral_R=0;
   
//积分偏差累积
   for(int i=0;i<N-1;i++)
   {
     Accum_Error_L[i]=Accum_Error_L[i+1]; //重复
     Sum_Error_L+=Accum_Error_L[i];
   }
      if(speed_L<20&&speed_R<20)
   Accum_Error_L[N-1]=Speed_Error_L/10;
      else
   Accum_Error_L[N-1]=Speed_Error_L;
   Sum_Error_L+=Accum_Error_L[N-1]; 
 
   for( int i=0;i<N-1;i++)
   {
     Accum_Error_R[i]=Accum_Error_R[i+1]; //重复
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













































//输入：无
//输出：无
//功能:小车差速调节
//原理：阿克曼角
//公式:V_left=V*(k-B*tanα/2L);V_right=V*(k+B*tanα/2L);
//α为舵机打角值，B为后轮间距，L为前后轮间距，V = Speed_Set
//a为差速系数，增加p可以增大差速,s提前
//   Direction_Control_Output_L= P_Direction * speed_set_L;  
//   Direction_Control_Output_R= P_Direction * speed_set_R;
   
// DIF_INTENSITY = 11; //差速强度    增大此数，差速越明显，当速度增大以后，此值应该减小  
//  uint32 temp1 = Speed_Set_Temp * DIF_P/100;
//  int32 temp2 = Speed_Set_Temp*angle*angle/DIF_INTENSITY;
//  if(angle<0) temp2 = -temp2;  
//  Speed_Set_L = temp1 +  temp2;
//  Speed_Set_R = temp1 -  temp2;
//  float temp=Speed_Set_Temp*DIF_INTENSITY*tan((double)(angle*0.01745))/10;
//  float temp2 = Speed_Set_Temp*DIF_P;     //提前量，越大，越提前
//  Speed_Set_L=(uint32)(temp2+temp);
//  Speed_Set_R=(uint32)(temp2-temp);

uint8 Direction_Control_Period = 0;
#define DIRECTION_CONTROL_PERIOD 50

float P_Direction1=40,D_Direction1=20.5;		//低速
float P_Direction2=40,D_Direction2=20.5;		//中速
float P_Direction3=173,D_Direction3=145.5;		//快速

float P_Direction = 100,D_Direction = 0;              
float turn_spd = 150;
float P_Direction_high = 80, P_Direction_low=80;//26
//float   K =1;
float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
float Direction_angle=0.0;
float P_Dir_agl=20.0;
float Road_Err_D=0;		//偏差的微分

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
//    double road_err_D_Tmp = 0.0;	//偏差微分中间变量
//
//    //一阶滤波
//    road_err_D_Tmp = Road_Err[9]- Road_Err[6];
//    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//
//    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//    else                         P_Direction = P_Direction_low;
//
//    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//    Direction_Control_Output = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//
//#if 0
//    //周期性控制方向
//    Direction_Control_Period++;
//    //---------------------------------------------------------------------------------------------------------------------
//    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
//    {
//        Direction_Control_Period = 0;
//        Direction_Control_Last = Direction_Control;
//        //一阶滤波
//        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
//        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//
//        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
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