#include "Speed_Control.h"
//30,1m//40 1.5m
//50:1.6,55
//60 1.9m//65��2.15m//70,2.3m
/***************�ٶȱ���*********************************************************************/
//����������ٶȺ��Լ��趨���ٶ�Сд
//float speed_set_Z=60,speed_set_W=50;
/****************�ٶȻ�*************************************************************************/
//V=30,P=80;I=10;D=0;
//float Speed_P=130,Speed_I=30,Speed_D=0.00;
/****************KT*************************************************************************/
float Angle_Kt_P=100,Speed_Kt_P=0,Speed_Kt_I=0;
//float gyr_angle_speed_up_kt=2*
//int   KT_Flag=0;
/***************�ٶȱ���2*********************************************************************/  
float speed_buzzer=0;

float speed_set_L=0,speed_set_R=0,speed_set_L_2=0,speed_set_R_2=0;
float speed_set_W=60, speed_set_Z=60,speed_set_temp = 0,speed_set_temp_L = 0,speed_set_temp_R=0;//�ٶ��趨ֵ����ʱ�ٶ��趨ֵ
float speed_set_max=80, speed_set_min=20;//�ٶ��趨�����Сֵ
float Motor_Out_Old_L=0,Motor_Out_Old_R=0;//��һ�ε�����PWMֵ
float Motor_Out_Max=8500,Motor_Out_Min=2500;//�����������Сֵ
/****************�ٶȻ�2*************************************************************************/
float Speed_Error_L = 0, Speed_Error_Last_L = 0, Speed_Error_Last_Last_L = 0,  //L�ٶ�ƫ��ֵ   
      Speed_Error_R = 0, Speed_Error_Last_R = 0, Speed_Error_Last_Last_R = 0;  //R�ٶ�ƫ��ֵ 

float Speed_Error_L1 = 0,Speed_Error_R1 = 0,Error_Weight,
       Speed_Error_L2 = 0,Speed_Error_R2 = 0;

float Speed_Control_Output_L=0,//�����ֵ��ٶȿ������
      Speed_Control_Output_R=0,//        ���PWM��� 
      Speed_Control_Output2_L=0,
      Speed_Control_Output2_R=0,
      Speed_Control_Output_Last_L=0,
      Speed_Control_Output_Last_R=0,
      Speed_Control_Output_Cha_L=0,
      Speed_Control_Output_Cha_R=0,
      Speed_Control_Output_L_Old=0,
      Speed_Control_Output_R_Old=0;
/******************���ٱ���***********************************************************************/
float speed_measure_L,speed_measure_R,//������,�������ٶ�
      speed_L = 0,speed_R = 0,speed_car = 0,speed_car_L = 0,speed_car_R = 0;
float speed_old_L=0,speed_old_R=0;//��һ�β���

/******************���ٱ���***********************************************************************
��飺�ٶȿ��ƣ�
���룺�ٶ��趨ֵ
���ܣ�����ʵ���ٶȴﵽ�趨ֵ
�����PWMֵ
*********************************************************************************************************/
void Speed_Controler()
{  

  
  Speed_Error_L = speed_set_L- speed_L; 
  Speed_Error_R = speed_set_R - speed_R;


Speed_Control_Output_L=Speed_Control_Output_L_Old - Speed_P*(Speed_Error_L-Speed_Error_Last_L) + Speed_I*Speed_Error_L + Speed_D*(Speed_Error_L+Speed_Error_Last_Last_L-2*Speed_Error_Last_L);
Speed_Control_Output_R=Speed_Control_Output_R_Old - Speed_P*(Speed_Error_R-Speed_Error_Last_R) + Speed_I*Speed_Error_R + Speed_D*(Speed_Error_R+Speed_Error_Last_Last_R-2*Speed_Error_Last_R);  
  
  if(Speed_Control_Output_L > Motor_Out_Max)
    Speed_Control_Output_L = Motor_Out_Max; 
  if(Speed_Control_Output_L < 0)
    Speed_Control_Output_L = 0; 
  
  if(Speed_Control_Output_R > Motor_Out_Max)
    Speed_Control_Output_R = Motor_Out_Max; 
  if(Speed_Control_Output_R < 0)
    Speed_Control_Output_R = 0;   
  
  Speed_Control_Output_L_Old= Speed_Control_Output_L;
  Speed_Error_Last_Last_L = Speed_Error_Last_L;
  Speed_Error_Last_L = Speed_Error_L;
  speed_old_L = speed_L;
  
  Speed_Control_Output_R_Old= Speed_Control_Output_R;
  Speed_Error_Last_Last_R = Speed_Error_Last_R;
  Speed_Error_Last_R = Speed_Error_R;
  speed_old_R = speed_R;  
 
}
/*************************************************************************

*****************************************************************************/
void Get_CarSpeed(void)
{
  static uint8 LR_Flag = 0;
  LR_Flag = !LR_Flag;//��ʱ���ò���·
  //��ͨ��
  if (LR_Flag)
  {
     speed_measure_L= FTM_SpeedGet(FTM_SPEED_L);//�ڿ�ʼ��ͨ������ǰ������ͨ��������
     
     if(Direction_L==1)
     {
        speed_L=speed_measure_L;//�ĳ�2msһ�εĲ���,�ٶ�Ƶ��̫�죬���ص�����,�������࣬��4ms
//        speed_L=speed_L*2;//4msһ�εĲ���,
     }
     else
     {
        speed_L=-1*speed_measure_L;
     }
     
     Choose_R;//�������
  }   
  else
  {
     speed_measure_R= FTM_SpeedGet(FTM_SPEED_R);//�ڿ�ʼ��ͨ������ǰ������ͨ��������
     if(Direction_R==1)
     {
       speed_R=-1*speed_measure_R;
//       speed_R=speed_R*2;
     }
     else
     {
      speed_R=speed_measure_R;
     }
  Choose_L;//�������
  }

    if ((speed_L > 150) && (speed_R > 150)&&(speed_L < -150) && (speed_R < -150))
    {
        carStatus = STOP;
    }
  if(speed_L<-20)
    
    LED_2_ON;
    
   speed_car=(speed_L+speed_R)/2;    
   speed_buzzer=speed_set-20;
   
  
  if(speed_car<speed_buzzer)   BUZZER_ON;
  if(speed_car>speed_buzzer)  BUZZER_OFF;
  if(speed_L<10&&speed_R<10&&speed_L>-10&&speed_R>-10)
      BUZZER_OFF;
}

void Stop_zs(void)
{
  int Stop_Flag=0;
  
  if(speed_L>30&&speed_R>30)
    Stop_Flag=1;
  
  if(Stop_Flag==1)
  { 
     if(speed_L>200||speed_R>200||(speed_L>150&&speed_R>150))
        {
          locking_L;
          locking_R;
          PIT_DisableIrq();//�� PIT �ж�
        }
 
    if(AD_inductor[0]<1&&AD_inductor[1]<1&&AD_inductor[2]<1)
       {
          locking_L;
          locking_R;
          PIT_DisableIrq();//�� PIT �ж�
       }
  }

}

/**
  * ���
  *     �ٶ����ƽ������
  * ˵��
  *     ���ٶȵ�����Ϊ20�����ڣ���ֹӰ���ȶ���
  */
void Speed_Controler_Output(void)
{
  Speed_Control_Output2_L = Speed_Control_Output_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD
                         + Speed_Control_Output_Last_L; 
 
  Speed_Control_Output2_R = Speed_Control_Output_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD
                         + Speed_Control_Output_Last_R;  
 
}


////////////////////////////////////
void KT()
{

}

/*---------------------NO------------�ٶȿ��Ʋο�ֱ��-------------------------------------*/
 float Speed_P_Up=130,Speed_P_Down=130;//�ٶȻ�Pѡ��
 float Speed_P_L=0,Speed_P_R=0;//�ٶȻ�P_���֣��ٶȻ�P_����  
 float Speed_I_Up=0, Speed_I_Down=0;//�ٶȻ�Iѡ��
 float Speed_Control_L=0,Speed_Control_Last_L=0;//���κ��ϴε���/�����ٶȿ���
 float Speed_Control_R=0,Speed_Control_Last_R=0;//Ŀǰ��P,I�����ۼ���ɡ�
 float Speed_Control_Cha_L=0;//��/���ֵ��ٶȿ��Ʋ�ֵ�����κ��ϴεĿ��Ʋ�
 float Speed_Control_Cha_R=0;
uint8 add_speed_flag=1;	//�𲽼��ٹ���
signed int Pulse_L=0,Pulse_R=0;
float P_Speed = 0,I_Speed = 0; 
float P_Speed_D =10,P_Speed_G = 10;// 100;
float I_Speed_D =2,I_Speed_G=2;//2;
float E_speed = 0.0;//E_speed_Last = 0.0,E_speed_Last_Last = 0.0;
float Speed_I_lntegral = 0;
float Speed_Control = 0,Speed_Control_Last = 0;
float Speed_Control_Output = 0;
float Speed_Control_Cha = 0;
int   speed_control_period = 0;
signed int podao_spd=164,podao_spd2=100;
signed int podao_pulse_L=0, podao_pulse_R =0;


