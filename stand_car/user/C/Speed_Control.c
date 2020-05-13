#include "Speed_Control.h"

//---------------------------------�ٶȿ���-------------------------------------
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

////�ֶμ���
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
  * ���
  *     ��ʱ������·����
  * ע��
  */
void Get_CarSpeed(void)
{
    static uint8 LR_Flag = 0;

    LR_Flag = !LR_Flag;//��ʱ���ò���·

    //��ͨ��
    if (LR_Flag)
    {
        speed_measure = FTM_SpeedGet(FTM_SPEED_L);//�ڿ�ʼ��ͨ������ǰ������ͨ��������
//        speed_L += speed_measure;

        speed_L += (speed_measure * (SPEED_DIR_L?-1:1));//��ת
 //       Pulse_L += (speed_measure * (direction_L?0:1));		//ֻ����ת����
        Choose_R;//�������
    }
    else
    {
        speed_measure = FTM_SpeedGet(FTM_SPEED_R);
 //       speed_R += speed_measure;//����ⷽ��

        speed_R += (speed_measure * (SPEED_DIR_R?-1:1));
  //      Pulse_R += (speed_measure * (direction_R?0:1));

        Choose_L;//�������
    }
}

/**
  * ���
  *     �ٶȿ���
  * ע��
  *     ת�����ƣ��������� / (sת�� * ������)
  *     1r��Լ0.19m
  */
void Speed_Controler(void)
{ 
//    speed_car = (speed_R speed_L) / (550);  //�����ɵ�
    speed_car = (speed_R+speed_L) / (2);  //�����ɵ�
        speed_R = 0;
    speed_L = 0;
    
//    carSpeedTemp = 0.19*(speed_car*1000) / (50*OPTICAL_ENCODE_CONSTANT);//ת������,m/s
//    UART_SendFloat(carSpeedTemp, 1);
    if(RUN_flag == 1)Speed_temp = Set_Speed;
    
    //�ٶ��˲�����ֹ��Ϊ�ٶȱ仯���������ζ�
    
    Speed_temp=1;//ZS
    
   
//    speed_set = Speed_temp*(1-SpeedFilterRatio)+speed_set*SpeedFilterRatio;
//   
//   speed_set=0;
//    E_speed = speed_set - speed_car;
    E_speed = speed_car - speed_set;
    
    E_speed_L = speed_L -speed_set ;
    E_speed_R = speed_R -speed_set ;
    ///���ٶ����н��ٶȲ�һ��
   
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
  * ���
  *     �ٶ����ƽ������
  * ˵��
  *     ���ٶȵ�����Ϊ20�����ڣ���ֹӰ���ȶ���
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







