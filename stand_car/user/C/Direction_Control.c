#include "Direction_Control.h"
#include "Variable.h"
//---------------------------------方向控制-------------------------------------

//----------------------------陀螺仪--------------------------------------------
float gyr_offset_y =-4.000;//陀螺仪x,y轴偏移量

float Direction_Control_Output = 0.0;
uint8 Direction_Control_Period = 0;
//#define DIRECTION_CONTROL_PERIOD 50
char Direction_flag = 0;

//float P_Direction1=40,D_Direction1=20.5;		//低速
//float P_Direction2=40,D_Direction2=20.5;		//中速
//float P_Direction3=173,D_Direction3=145.5;		//快速

float P_Direction = 0,D_Direction = 20.5;
float turn_spd = 0.5;
float P_Direction_high = 74, P_Direction_low = 70;
//float P_Direction_temp = 140;
float K = 0.85;
//float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
float Direction_angle=0.0;
float P_Dir_agl =55;
double Road_Err_D=0;	          //偏差的微分
float P_Direction_change;


void Direction_Controler(void)
{
  float road_err_D_Tmp;
  static float Chazhi_last;
 
  road_err_D_Tmp =Chazhi_last -  Chazhi;
  Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
  
//  if(Direction_angle <= 0) Direction_angle = -Direction_angle;
//  P_Direction = 110 + speed_car*15 + Direction_angle*0.5;
  
  if( speed_car>turn_spd )     P_Direction = P_Direction_high;
  else                         P_Direction = P_Direction_low;
  
//  P_Direction = P_Direction_temp;
  Direction_angle = (gyro_y_valu - gyr_offset_y) * gyr_ratio;		//转角
  Direction_Control_Output=( -P_Direction * Chazhi)  + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
  Chazhi_last = Chazhi;
  if(Direction_flag == 0) Direction_Control_Output = 0;
//  uart_sendware_float(P_Direction,Chazhi,speed_car,0);
}


//void Direction_Controler(void)
//{
//    double road_err_D_Tmp = 0.0;	//偏差微分中间变量
//    float  Chazhi_last;
//    
//    //一阶滤波
//    road_err_D_Tmp =Chazhi - Chazh
//    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//
//    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//    else                         P_Direction = P_Direction_low;
//
////    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//    Direction_Control_Output = P_Direction * Chazhi+ D_Direction*Road_Err_D ;//+ Direction_angle*P_Dir_agl;
//    
//    Chazhi_last = Chazhi;
//    
//    
////#if 0
////    //周期性控制方向
////    Direction_Control_Period++;
////    //---------------------------------------------------------------------------------------------------------------------
////    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
////    {
////        Direction_Control_Period = 0;
////        Direction_Control_Last = Direction_Control;
////        //一阶滤波
////        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
////        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
////
////        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
////
////        Direction_Control = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
////        Direction_Control_Err = Direction_Control - Direction_Control_Last;
////    }
////    //---------------------------------------------------------------------------------------------------------------------
////
////    Direction_Control_Output = Direction_Control_Last + Direction_Control_Err*(Direction_Control_Period+1)/DIRECTION_CONTROL_PERIOD ;
////#endif
//}

