/*
�ܶ����鶼��ֵ���㶯�ݡ���Ҫ���û����������㡣
ֻ���Լ�����ס����Ҫ�����������ˡ�
*/
#include "allHead.h"
#include "lcd.h"
#include "flash.h"
#include "BL.h"
extern uint8  KEY_sta ;//����״̬��1-����
extern char position; 
extern float Stop_Plan_Flag;
uint32 ijk = 123, kez;
float spee[3000]={0};
float zhan[3000]={0};
int flash_time=0;
uint16 PIT_times = 0;           //��ʱ����
uint8 KEY_textSelect = TEXT_DEFAULT;  //���Բ˵� ʹ��
uint8 carStatus = 0;     //�ٶȷ���ʹ��
uint8 menuSelect = MENU;//�˵�ѡ��
int z=0,zz=0,man=0;
  int x=0;
  int zs_car=0;
int   speed_control_counter = 0,direction_control_counter=0;
int  iic_error=0,iic_error_counter=0;
int  Chazhi_Class=0;
int ms=0,s=0;
int delay_stop=0;
extern int Boma_num;
extern int Boma_Change;

 extern float speed_set_old,//�ٶ��趨 

      Direction_P_old,//��������P                     
      Direction_P2_old,Direction_D2_old,//��ֵPD                        
      Angle_P_old;
extern int  akmj_z_old,akmj_w_old;//w20
  
     
extern float     BB_Z_old,BB_W_old,BB_H_old;
extern int      BB_P_Z_old,BB_P_F_old;

 extern int    Circle_Count6_Max_old,//�´�Բ�����ʱ��1S1000
        Circle_Inductor_M1_old,//��Բ��˫��ֵ
         Circle_Inductor_M2_old,//��ת��ֵ
         Circle_Inductor_M3_old,//ת��ֵ
         Circle_Inductor_LR1_old; 
 int jiemian_flag=0;
/*****************************************************************************************/
// ----------------------------------- MAIN -------------------------------------------- //
/*****************************************************************************************/
void main()
{
    get_clk();  //��Ϊ�������ԭ�򣬱������main���棬���ܼ���ʱ����
    DISABLE_INTERRUPTS;  //�����ж�

    ADC_Init();//һ��Ҫ������ǰ�棬���濪��ADCʱ��
    UART_Init(UART_PART, UART_BAUD);
    L3G4200_Init();//˳�����
    FTM_PwmInit(PWM_CH0, ch0, 10, 0); //PWM ��ʼ��
    FTM_PwmInit(PWM_CH1, ch1, 10, 0); //PWM ��ʼ��
    FTM_SpeedInit(FTM_SPEED_L);       //���� ��ʼ��
    FTM_SpeedInit(FTM_SPEED_R);       //���� ��ʼ��
    //���ں���
    OLED_Init();

    KEY_Init();
    IoInit();
    PIT_Init(PIT0, 1000);             //PIT0 ��ʱ 5ms
  //����ʱ�ж�֮ǰҪ��ɵ�
   OLED_Biaoge_ZS(); 
    PIT_EnableIrq();                  //��PIT0 �ж�
    ENABLE_INTERRUPTS;   //�����ж�   
 
    while (1)
    {
      
      

    }
}
/********PIT0 �ж�:�Զ��庯�������ж��������н������滻*****************************************/
void PIT_CH0_IRQHandler(void)
{
  PIT_CLEAR;    
  if ((++PIT_times) >= 500)//ÿ 500ms LED0��תһ��
  {
      PIT_times = 0;
      LED_0_TURN;
  }  
  
//���Ե�л���
  Inductor_analyse();//�����ж� 
  Test_Huandao();    
  
/*����--------------------------------------------------------------------------*/
if(zs_car==1)
{  
  
//����ͣ��
   Hall(); 
   
//�����Ǽ��   
   Gyro_ZS(); 
//��ʱ����   
//  if(delay_stop<3)
//  {
//     delay_stop++;
//      LED_1_ON;
//   }150,1600,1000��100,50��-3040
//   else
//  {
     LED_1_OFF;
  //�ٶȻ�     
     z++;
     if(z>4)//5ms,4
     {
        z=0;
        Get_CarSpeed();//��ȡ����  
        BangBang();   
     }
    Test_RoadInfo();
  Direction_ChaSpeed_Control();
  Controler();
  
  
  Direction_Controler();
 

  Motor_control();//����������PWM 

//}
  if(Stop_Flag==1)
  {
    speed_set=0;
    if(speed_car<20)
    {
       change_L(0);
       change_R(0);
    }
    
  }
  

//  if(Stop_Plan_Flag==1)
//  {
//  ms++; 
//      if(ms>999)
//      {
//        ms=0;
//        s++;
//      }
//  }    
  
}
/*ͣ��--------------------------------------------------------------------------*/
else
{
  change_L(0);
  change_R(0); 
  if(Boma_Change)
  {
     OLED_Int16(110, 7, Boma_num);
  }
  
  if(jiemian==2)
  {
    Data_Old2();
    Boma_Gear_ZS();
   Oled_Data_ZS_All2();
  }
  else
  {
      OLED_Inductor_Dynamic();//�����������ݱ仯��
      Data_Old();
      Boma_Gear_ZS();
      Oled_Data_ZS_All();
  }
  

}
//����2����
  if(jiemian==2)

{
  if(jiemian_flag!=2)
     {
     OLED_Clear();
     OLED_Biaoge_Par_ZS();//��񣬾�̬��ĸ
     jiemian_flag=2;
     }
  
     OLED_Key_Par_ZS();//�����Ĳ���//?
  
    if (KEY_sta)
    {
        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
        {
            OLED_Select_Par_ZS();//������
            KEY_menuChange = !KEY_menuChange;
        }
        Oled_Data_Par_ZS();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
        KEY_sta = !KEY_sta;             
    }
}
//����1����
else 
{
    if(jiemian_flag!=1)
     {
     OLED_Clear();
     OLED_Biaoge_ZS();//��񣬾�̬
     jiemian_flag=1;
     }
      
  OLED_Key_ZS();
  
    if (KEY_sta)
    {
        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
        {
            OLED_Select_ZS();
            KEY_menuChange = !KEY_menuChange;
        }
        Oled_Data_ZS();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
        KEY_sta = !KEY_sta;             
    }
}    





}

