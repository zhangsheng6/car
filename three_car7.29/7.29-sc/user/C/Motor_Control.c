/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    Motor_Control.c
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月29日 21:58:02
  ******************************************************************************
  */
#include "Motor_Control.h"

extern float Direction_Control_Output_L ,Direction_Control_Output_R;
//电机
float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 8000, Motor_Min = -8000,Motor_Out_R_Temp=0;
unsigned int DEAD_L = 3000;//2290
unsigned int DEAD_R =3000;
float AD_0_Min=10,AD_0_Max=45,AD_2_Max=45,AD_2_Min=10;//7,57
float Wangdao_Speed_Output = 0;

/**
  * 简介
  *     电机控制程序
  * 备注
  *
  */
void Motor_control(void)
{
    Motor_Out_L = Direction_Control_Output_L+Control_Output_L+Speed_PWM;
    Motor_Out_R =Direction_Control_Output_R+Control_Output_R+Speed_PWM;
    

//  
   if(Motor_Out_L>0)  Motor_Out_L+=DEAD_L;
  if(Motor_Out_L<0)  Motor_Out_L-=DEAD_L;
  
  if(Motor_Out_R>0)  Motor_Out_R+=DEAD_R;
  if(Motor_Out_R<0)  Motor_Out_R-=DEAD_R;

  
 
        /* 电机启动PWM控制 ------------------------------------------------------- */
   
//        Motor_Out_L += DEAD_L; //加上启动基数
//                Motor_Out_R += DEAD_R;
        if (Motor_Out_L > Motor_Max)
            Motor_Out_L = Motor_Max;

        if (Motor_Out_R > Motor_Max)
            Motor_Out_R = Motor_Max;  
        
        if (Motor_Out_L < Motor_Min)
            Motor_Out_L = Motor_Min;

        if (Motor_Out_R <Motor_Min)
            Motor_Out_R = Motor_Min;
  
//    Motor_Out_R_Temp=Motor_Out_R;
    /* 电机启动PWM控制 -------- END ------------------------------------------ */

        /* 电机正反转控制 -------------------------------------------- */
        //左正反转控制
        if (Motor_Out_L > 0)
        {
            forward_L;//正转
        }
    
        else
        {
//          Motor_Out_L=0;
//          forward_L;//正转
            reversal_L;//反转
        }

        //右正反转控制
        if (Motor_Out_R > 0)
        {
            forward_R;
        }
    
        else
        {
//          Motor_Out_R=0;
//          forward_L;//正转
            reversal_R;
        }
    Motor_Out_L=abs_f(Motor_Out_L);
    Motor_Out_R=abs_f(Motor_Out_R);
    
    
        /* 电机正反转控制 -------- END ------------------------------- */  
        change_L((uint32)Motor_Out_L);
        change_R((uint32)Motor_Out_R);
    //DataScope_Get_Channel_Data(Motor_Out_R,3);
}


/**
  * 简介
  *     直道与弯道的处理方法  A2 57且A0<7
  * 备注
  *
  */
//void  Motor_Out_control(void)
//{
//    if( ((AD_inductor[2] >= AD_2_Max) && (AD_inductor[0] <= AD_0_Min)) ||((AD_inductor[0] >= AD_0_Max) && (AD_inductor[2] <= AD_2_Min)))//调节范围
//    {
//          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//          LED_1_ON;
//    }
//    else
//    {
//          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//    }
//    
//}

//void  Motor_Out_control(void)
//{
//    if( (AD_inductor[0] >= AD_0_Min) && (AD_inductor[0] <= AD_0_Max) && (AD_inductor[2] >= AD_2_Min) && (AD_inductor[2] <= AD_2_Max))//调节范围
//    {
//          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//    }
//    else
//    {
//          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//    }
//    
//}
/**
  * 简介
  *     电机控制程序
  * 备注
  *
  */
//void Motor_control(void)
//{
//    Motor_Out_L = Direction_Control_Output_L;
//    Motor_Out_R = Direction_Control_Output_R;
//  
////    Motor_Out_L = Speed_Control_Output +Direction_Control_Output;
////    Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
////    Motor_Out_control();
//  
//  
//    /* 电机启动PWM控制 ------------------------------------------------------- */
//    //左电机控制
//    if (Motor_Out_L > 0)
//    {
//        Motor_Out_L += DEAD_L; //加上启动基数
//        if (Motor_Out_L > Motor_Max)
//            Motor_Out_L = Motor_Max;
//    }
//    else if (Motor_Out_L < 0)
//    {
//        Motor_Out_L -= DEAD_L;
//        if (Motor_Out_L < -Motor_Max)
//            Motor_Out_L = -Motor_Max;
//    }
//
//    //右电机控制
//    if (Motor_Out_R > 0)
//    {
//        Motor_Out_R += DEAD_R;
//        if (Motor_Out_R > Motor_Max)
//            Motor_Out_R = Motor_Max;
//    }
//    else if (Motor_Out_R < 0)
//    {
//        Motor_Out_R -= DEAD_R;
//        if (Motor_Out_R < -Motor_Max)
//            Motor_Out_R = -Motor_Max;
//    }
//    /* 电机启动PWM控制 -------- END ------------------------------------------ */
//
//        /* 电机正反转控制 -------------------------------------------- */
////        //左正反转控制
////        if (Motor_Out_L > 0)
////        {
////            forward_L;//正转
////        }
////    
////        else
////        {
////            Motor_Out_L = -Motor_Out_L;
////            reversal_L;//反转
////        }
////
////        //右正反转控制
////        if (Motor_Out_R > 0)
////        {
////            forward_R;
////        }
////    
////        else
////        {
////            Motor_Out_R = -Motor_Out_R;
////            reversal_R;
////        }
//    
//    forward_L;
//    forward_R;
//    
//        /* 电机正反转控制 -------- END ------------------------------- */
//  
//        
//
//        change_L((uint32)Motor_Out_L);
//        change_R((uint32)Motor_Out_R);
//
//
//        //测试用
////        forward_L//正转
////        forward_R
////        change_L(PWM)
////        change_R(PWM)
//        
//    //DataScope_Get_Channel_Data(Motor_Out_R,3);
//}
//
//
//
//
//
//



