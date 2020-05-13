#include "Speed_Control.h"

//---------------------------------速度控制-------------------------------------
float speed_measure = 0,speed_L = 0,speed_R = 0,Set_Speed = 3.0,speed_car = 0;
//float carSpeedTemp = 0;
signed int Pulse_L=0,Pulse_R=0;
float P_Speed = 15.0,I_Speed = 1;
//4,0
float E_speed = 0.0;
float Speed_I_lntegral = 7000;
float Speed_I_lntegral_Max = 15;
float Speed_Control = 0,Speed_Control_Last = 0;
float Speed_Control_Max= 15;
float Speed_Control_Output = 0;
float Speed_Control_Cha = 0;

float SpeedFilterRatio = 0.85;
float speed_set = 0;
float Speed_temp = 0;

////分段加速
//int16 spd_move = 1000,speed_add = 580,speed_start = 540;
//float P_Speed_add = 28,P_Speed_start = 28;
//char speed_end = 0,speed_num = 0,car_start = 0;
float E_speed_L,E_speed_R,
    Speed_I_lntegral_L,Speed_I_lntegral_R,
        Speed_Control_Last_L,Speed_Control_Last_R,
    Speed_Control_L,Speed_Control_R,
      Speed_Control_Cha_L,Speed_Control_Cha_R,
        Speed_Control_Output_L,Speed_Control_Output_R;
/**
  * 简介
  *     分时复用两路测速
  * 注意
  */
void Get_CarSpeed(void)
{
    static uint8 LR_Flag = 0;

    LR_Flag = !LR_Flag;//分时复用测两路

    //开通道
    if (LR_Flag)
    {
        speed_measure = FTM_SpeedGet(FTM_SPEED_L);//在开始右通道计数前，将左通道数读出
//        speed_L += speed_measure;

        speed_L += (speed_measure * (SPEED_DIR_L?-1:1));//正转
 //       Pulse_L += (speed_measure * (direction_L?0:1));		//只计正转脉冲
        Choose_R;//清零计数
    }
    else
    {
        speed_measure = FTM_SpeedGet(FTM_SPEED_R);
 //       speed_R += speed_measure;//不检测方向

        speed_R += (speed_measure * (SPEED_DIR_R?-1:1));
  //      Pulse_R += (speed_measure * (direction_R?0:1));

        Choose_L;//清零计数
    }
}

/**
  * 简介
  *     速度控制
  * 注意
  *     转换进制：脉冲数量 / (s转换 * 编码盘)
  *     1r大约0.19m
  */
void Speed_Controler(void)
{ 
//    speed_car = (speed_R speed_L) / (550);  //参数可调
    speed_car = (speed_R+speed_L) / (2);  //参数可调
        speed_R = 0;
    speed_L = 0;
    
//    carSpeedTemp = 0.19*(speed_car*1000) / (50*OPTICAL_ENCODE_CONSTANT);//转换进制,m/s
//    UART_SendFloat(carSpeedTemp, 1);
    if(RUN_flag == 1)Speed_temp = Set_Speed;
    
    //速度滤波，防止因为速度变化过大而车身晃动
    
    Speed_temp=1;//ZS
    
   
//    speed_set = Speed_temp*(1-SpeedFilterRatio)+speed_set*SpeedFilterRatio;
//   
//   speed_set=0;
//    E_speed = speed_set - speed_car;
    E_speed = speed_car - speed_set;
    
    E_speed_L = speed_L -speed_set ;
    E_speed_R = speed_R -speed_set ;
    ///起步速度与行进速度不一样
   
//    if(car_start == 1)
//    {
//    if(speed_car >= spd_move && speed_end == 0)
//    {
//      speed_num++;
//    }
//    if(speed_num >= 10)
//    {
//      speed_num = 0;
//      speed_end = 1;
//    }
//    if(speed_end == 1) {speed_set = speed_add;P_Speed = P_Speed_add;BUZZER_ON}
//    else              {speed_set = speed_start;P_Speed = P_Speed_start;}
//    }
//    else speed_set = 0;
    
    
    Speed_I_lntegral_L += I_Speed*E_speed_L;
    Speed_I_lntegral_R += I_Speed*E_speed_R;
    
    Speed_I_lntegral += I_Speed*E_speed;
    
    
    if (Speed_I_lntegral < -Speed_I_lntegral_Max)
        Speed_I_lntegral = -Speed_I_lntegral_Max;
    if (Speed_I_lntegral >  Speed_I_lntegral_Max)
        Speed_I_lntegral =  Speed_I_lntegral_Max;
    
    if (Speed_I_lntegral_L < -Speed_I_lntegral_Max)
        Speed_I_lntegral_L = -Speed_I_lntegral_Max;
    if (Speed_I_lntegral_L >  Speed_I_lntegral_Max)
        Speed_I_lntegral_L =  Speed_I_lntegral_Max;   
    
    if (Speed_I_lntegral_R < -Speed_I_lntegral_Max)
        Speed_I_lntegral_R = -Speed_I_lntegral_Max;
    if (Speed_I_lntegral_R >  Speed_I_lntegral_Max)
        Speed_I_lntegral_R =  Speed_I_lntegral_Max;   
    
    
    
    

        
        
    Speed_Control_Last = Speed_Control;
    
    Speed_Control_Last_L = Speed_Control_L;
    Speed_Control_Last_R = Speed_Control_R;
    
    
    Speed_Control = P_Speed*E_speed + Speed_I_lntegral;
    Speed_Control_L = P_Speed*E_speed_L + Speed_I_lntegral_L;
    Speed_Control_R = P_Speed*E_speed_R + Speed_I_lntegral_R;

    Speed_Control_Cha = Speed_Control - Speed_Control_Last;
    Speed_Control_Cha_L = Speed_Control_L - Speed_Control_Last_L;
    Speed_Control_Cha_R = Speed_Control_R - Speed_Control_Last_R;
    

}

/**
  * 简介
  *     速度输出平滑函数
  * 说明
  *     将速度调整分为20个周期，防止影响稳定性
  */
void Speed_Controler_Output(void)
{
  
    Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_TIME_OUT
                         + Speed_Control_Last; 
    
Speed_Control_Output_L = Speed_Control_Cha_L * (speed_control_period+1)/SPEED_TIME_OUT
                         + Speed_Control_Last_L;
Speed_Control_Output_R = Speed_Control_Cha_R * (speed_control_period+1)/SPEED_TIME_OUT
                         + Speed_Control_Last_R; 
    
    
    
}







