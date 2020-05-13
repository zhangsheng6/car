/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    Motor_Control.c
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��29�� 21:58:02
  ******************************************************************************
  */
#include "Motor_Control.h"

extern float Direction_Control_Output_L ,Direction_Control_Output_R;
//���
float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 8000, Motor_Min = -8000,Motor_Out_R_Temp=0;
unsigned int DEAD_L = 3000;//2290
unsigned int DEAD_R =3000;
float AD_0_Min=10,AD_0_Max=45,AD_2_Max=45,AD_2_Min=10;//7,57
float Wangdao_Speed_Output = 0;

/**
  * ���
  *     ������Ƴ���
  * ��ע
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

  
 
        /* �������PWM���� ------------------------------------------------------- */
   
//        Motor_Out_L += DEAD_L; //������������
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
    /* �������PWM���� -------- END ------------------------------------------ */

        /* �������ת���� -------------------------------------------- */
        //������ת����
        if (Motor_Out_L > 0)
        {
            forward_L;//��ת
        }
    
        else
        {
//          Motor_Out_L=0;
//          forward_L;//��ת
            reversal_L;//��ת
        }

        //������ת����
        if (Motor_Out_R > 0)
        {
            forward_R;
        }
    
        else
        {
//          Motor_Out_R=0;
//          forward_L;//��ת
            reversal_R;
        }
    Motor_Out_L=abs_f(Motor_Out_L);
    Motor_Out_R=abs_f(Motor_Out_R);
    
    
        /* �������ת���� -------- END ------------------------------- */  
        change_L((uint32)Motor_Out_L);
        change_R((uint32)Motor_Out_R);
    //DataScope_Get_Channel_Data(Motor_Out_R,3);
}


/**
  * ���
  *     ֱ��������Ĵ�����  A2 57��A0<7
  * ��ע
  *
  */
//void  Motor_Out_control(void)
//{
//    if( ((AD_inductor[2] >= AD_2_Max) && (AD_inductor[0] <= AD_0_Min)) ||((AD_inductor[0] >= AD_0_Max) && (AD_inductor[2] <= AD_2_Min)))//���ڷ�Χ
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
//    if( (AD_inductor[0] >= AD_0_Min) && (AD_inductor[0] <= AD_0_Max) && (AD_inductor[2] >= AD_2_Min) && (AD_inductor[2] <= AD_2_Max))//���ڷ�Χ
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
  * ���
  *     ������Ƴ���
  * ��ע
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
//    /* �������PWM���� ------------------------------------------------------- */
//    //��������
//    if (Motor_Out_L > 0)
//    {
//        Motor_Out_L += DEAD_L; //������������
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
//    //�ҵ������
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
//    /* �������PWM���� -------- END ------------------------------------------ */
//
//        /* �������ת���� -------------------------------------------- */
////        //������ת����
////        if (Motor_Out_L > 0)
////        {
////            forward_L;//��ת
////        }
////    
////        else
////        {
////            Motor_Out_L = -Motor_Out_L;
////            reversal_L;//��ת
////        }
////
////        //������ת����
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
//        /* �������ת���� -------- END ------------------------------- */
//  
//        
//
//        change_L((uint32)Motor_Out_L);
//        change_R((uint32)Motor_Out_R);
//
//
//        //������
////        forward_L//��ת
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



