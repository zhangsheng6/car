/*
�ܶ����鶼��ֵ���㶯�ݡ���Ҫ���û����������㡣
*/
#include "allHead.h"
extern uint8  KEY_sta ;//����״̬��1-����
extern char position; 

uint16 PIT_times = 0;           //��ʱ����
uint8 KEY_textSelect = TEXT_DEFAULT;  //���Բ˵� ʹ��
uint8 carStatus = 0;     //�ٶȷ���ʹ��
uint8 menuSelect = MENU;//�˵�ѡ��
uint8 z=1;
  int x=0;
int   speed_control_counter = 0;

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
    PIT_Init(PIT0, 2500);             //PIT0 ��ʱ 5ms

    //����ʱ�ж�֮ǰҪ��ɵ�
    
  OLED_MenuFlicker();//�ٶȿ��ƸĲ�����ʾ�˵�
  
//OLED_Inductor_Static();//���������ʾ
//  OLED_Speed_Static();//�ٶ�������ʾ

    PIT_EnableIrq();                  //��PIT0 �ж�
    ENABLE_INTERRUPTS;   //�����ж�
    
    while (1)
    {
//       KEY();//zs������������  
//       ReadDataControl();
       KEY_ParaMenu();//�����ı�����1
       //void OLED_Menu();//oled��ʾ��������3
       //void OLED_MenuFlicker();//oled�˵���˸4
       //KEY_ParaMenuDisplay();//oled��ʾʵʱ����2
        
//         PlanSet();
        //ReadDataControl();//���ڿ���   
    }
}
/********PIT0 �ж�:�Զ��庯�������ж��������н������滻*****************************************/
void PIT_CH0_IRQHandler(void)
{
//                LED_1_OFF;//1.212MS������
//                                LED_0_OFF;

    PIT_CLEAR;    
    g_5msFlag=1;


    //����жϱ�־   
    if ((++PIT_times) >= 200)//ÿ 500ms LED0��תһ��
    {
        PIT_times = 0;
        LED_0_TURN;
    }  
//    
  Inductor_analyse();//�����ж�
//Read_ADC();
  Test_RoadInfo();
//  Test_RoadInfo_Shuzhi(); 
  Test_Huandao(); 
  Gyro_ZS();
  Direction_ChaSpeed_Control();

//Direction_Controler_I();
z++;
if(z>1)
{
  z=0;
  Get_CarSpeed();//��ȡ����  
//  Direction_Controler();
  speed_control_counter++;
  if (speed_control_counter >= SPEED_CONTROL_PERIOD)//����100ms
 {
      Speed_Controler();//�ٶȻ�PI����
      speed_control_counter = 0;
 }
 
  

}

Direction_Controler();
  
  Motor_control();//����������PWM   



if(x++>51)
{
  x=0;
//OLED_Inductor_Dynamic();//�����������ݱ仯��
// OLED_Speed_Dynamic();////һ��OLED��ʾ0.158ms
// UART_Send();//�����������ݱ仯С//1�����ڷ���1.068ms
          UART_SendFloat(gyr_angle_speed,1);  

}  
 
//ˢOLED��ʹ����Ӳ��spi�����Ѿ���С����us����
    if (KEY_sta)
    {
        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
        {
            OLED_MenuFlicker();
            KEY_menuChange = !KEY_menuChange;
        }
        KEY_ParaMenuDisplay();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
        KEY_sta = !KEY_sta;
    }
//              LED_1_ON;
//   change_L(5000);
//   change_R(5000);
//   forward_L;
//   forward_R;
}


//uint8 scope_send_num;
//uint8 scope_send_count=0;
//uint8 send_flag=0;
////ϵͳ

//uint16 Runing_times=0;
//uint16 Runing_Distance = 0;
//#define Runing_Furthest  3000		//�Գ���Զ����(��λ:cm)
//uint8 Car_Status = Ready;	//������ֱ��
//uint8 Stop_Car_cnt = 0;
//uint8 Stop_Car_flag=0;
//uint8 forward_flag = 0;
//float power;
//uint8 key=0;
//
//uint8 alarm_status=0;
////�ٶ�
//uint8 speed_control_period = 0;
//uint8 podao_spd_flag=0;
//uint8 podao_flag;/* ������ʶ��������󣬽��˶����Ƶ����ĵ� --- han 2017-11-1 */
////����
//uint32 Brick_Time = 0,Podao_Time = 0,Start_Line_Time = 0,Test_Time = 0;
//uint8 boma, boma_last = 0, key_value;
