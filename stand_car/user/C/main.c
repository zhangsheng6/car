#include "allHead.h"

extern float tly_angle,tly_cangle;
 extern float  K_00, K_11;

int test_PWM;
int zs_car=1;
//uint8 scope_send_num;
//uint8 scope_send_count=0;
//uint8 send_flag=0;
////ϵͳ
uint32  i = 0;
uint16  j = 65532;
int   uart_flag;
uint16 PIT_times = 0;           //��ʱ����
uint8 chice = 0;    //����ʹ��
uint8 carStatus = NORMAL;     //С��״̬ѡ��
char RUN_flag = 0;
int star_times;
char Balance_Time,Motor_Time;


//�˵�
uint8 KEY_textSelect = TEXT_DEFAULT;  //���Բ˵� ʹ��
uint8 menuSelect = MENU;//�˵�ѡ��

//����
char testcar_flag = 0;
int16 testcar_num  = 0;

//�ٶ�
uint8 speed_control_period = 0;

/**
  * ���
  *     С��״̬����
  * ע��

  */
void PlanSet(void)
{
    switch (carStatus)
    {
    case NORMAL:
        break;

    case STOP:
        locking_L;
        locking_R;
        PIT_DisableIrq();//�� PIT �ж�
        OLED_logo();
        break;
    default :
        break;
    }
}


/**
  * ���
  *     �޶�Ӧģ���IO�ڳ�ʼ������
  * ע��
  */
void IoInit()
{
    //ָʾ��
    GpioInit(LED_0, GPO, 1);
    GpioInit(LED_1, GPO, 1);
    GpioInit(LED_2, GPO, 1);
    GpioInit(LED_3, GPO, 1);

    //������
    GpioInit(BUZZER, GPO, 0);

    //�������
    GpioInit(ENL_L, GPO, 0);
    GpioInit(ENL_R, GPO, 0);
    GpioInit(ENR_L, GPO, 0);
    GpioInit(ENR_R, GPO, 0);

    //�ⷽ��
    GpioInit(DIR_L, GPI, 0);
    GpioInit(DIR_R, GPI, 0);
}



/*****************************************************************************************/
// ----------------------------------- MAIN -------------------------------------------- //
/*****************************************************************************************/
void main()
{
    get_clk();  //��Ϊ�������ԭ�򣬱������main���棬���ܼ���ʱ����
    /* ��ʼ�� ------------------------------------------------------- */
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
    //OLED_Display();
    IoInit();
    PIT_Init(PIT0, 5000);//1000             //PIT0 ��ʱ 5ms

    //����ʱ�ж�֮ǰҪ��ɵ�
//    OLED_MenuFlicker();//��ʾ�˵�

    PIT_EnableIrq();                  //��PIT0 �ж�


    //֮ǰ�ĳ���
    //    set_irq_priority(IRQ_PIT_CH_1, 1); //PIT_CH_1 ���ȼ���Ϊ1

   ENABLE_INTERRUPTS;   //�����ж�

    /* ��ʼ�� -------- END ------------------------------------------ */

    while (1)
    {
        PlanSet();
       //���Ե���˵� ��ʹ��ʱ������
//       KEY_TestMenu();
       //���Բ˵�ѡ��
       KEY_ParaMenu();
   //     KEY_ParaMenuDisplay();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���

       //ƽ�����
//       KEY_balance();
       
       
        
//             adcHold = ADC_Once(MMA7361, adc12bit);
//                if (!chice)
//                {
//                    UART_Uint16(adcHold, 1);
//                }
//                UART_SendFloat(adcHold, 1);
    //        UART_Uint16((uint16)gyro_ID);

    }
}
/*****************************************************************************************/
// ------------------------------ MAIN -------- END ------------------------------------ //
/*****************************************************************************************/


/**
  * ���
  *     PIT0 �ж�
  */
void PIT_CH0_IRQHandler(void)
{
    PIT_CLEAR;  //����жϱ�־
   
    //ÿ 500ms LED0��תһ��
    if ((++PIT_times) >= 300)
    {
        PIT_times = 0;
        LED_0_TURN;
    }
    
    //��������3s����
//    if(carStatus == Runing)
//    {
//      BUZZER_ON
//      if ((++star_times) >= 3000)
//      {
//        BUZZER_OFF
//         RUN_flag = 1;
//         carStatus = NORMAL;
//      }
//    }
    
    //������ʱ
//    if(testcar_flag == 1)
//    {
//      
//      testcar_num ++;
//      if(testcar_num >= 20000)
//      {
//        carStatus   = STOP;
//        testcar_num = 0;
//        testcar_flag = 0;
//      }
//    }
    
//uart_sendware_float(Chazhi,0,0,0);
//     uart_flag++;
//
//    if(uart_flag == 10)
//    {
//     uart_flag = 0;
//    //  UART_SendFloat(Direction_angle,1);
////      UART_SendFloat(car_angle_speed, 1);
////      UART_SendFloat(Chazhi,1);
////
////      for (i = 0;i < 3;i++)
////      {
////          UART_SendFloat(AD_inductor1[i],1);
////      }
////
////      for (i = 0;i < 3;i++)
////      {
////          UART_SendFloat(AD_valu[i],1);
////      }


//    UART_Send_String("........\r\n");
//
//    }
      //��вɼ�
//      Date_analyse();
//      //�������
//      Direction_Controler();

      //ƽ�����  5ms ����һ��
//      if(++Balance_Time >= 5)
//      {
        Balance_Time = 0;
       Angle_Kalman();
       Angle_Controler();
//      }
       //����
        Get_CarSpeed(); 

        //�ٶȿ���  //100msˢ��һ��
        speed_control_period++;
        Speed_Controler_Output();
        /*SPEED_TIME_OUT=20*/
        if(speed_control_period >= SPEED_TIME_OUT)
        {
            Speed_Controler();
            speed_control_period = 0;
        }

        //�������  5msִ��һ��
//        if(++Motor_Time >= 5)
//        {
          Motor_Time = 0;
           if(zs_car == 1)
      
         Motor_control();
//        }
//P
//���ٶȼƽǶ�                acc_angle
//�����Ǽ��ٶȻ�õĽǶ�
//�˲���ĽǶ�          car_angle
  
//D         
//�����ǽ��ٶ�   gyr_angle_speed
//�˲���Ľ��ٶ�    car_angle_speed     
/*
��ƽ��      
 car_angle_speedû��gyr_angle_speedë�̶�
 ����ƫ��+-1.5  ��3     
 �Ŵ�ͼƬ��
 car_angleΪֱ�ߣ�����ƫ��0.5��
 acc_angleΪë�̺ܶ��һֱ���²��������ߣ�����ƫ��12��  
*/         
   //uart_sendware_float(gyr_angle_speed,car_angle_speed,0,0);
   //uart_sendware_float(acc_angle,car_angle,0,0);
 //  uart_sendware_float(acc_angle,car_angle,tly_cangle,tly_angle);
uart_sendware_float(gyr_angle_speed,car_angle_speed,acc_angle,car_angle);
                           
//   OLED_DisplayFloat(10,1,acc_ave, 3); //���ٶȼƽǶ�
//    OLED_Int16(10, 1, gyro_x); //������ֵ
//    OLED_DisplayFloat(10,2,gyr_angle_speed, 3);//�����ǽ��ٶ�  
   OLED_DisplayFloat(75,2,car_angle_speed, 3); //�����ٶ�
//   
//   
//   OLED_DisplayFloat(10,3,acc_angle, 3); //���ٶȼƽǶ�
  OLED_DisplayFloat(75,3,car_angle, 3); //���Ƕ�
// 
//    OLED_DisplayFloat(10,4,K_00, 3); //���Ƕ�
//    OLED_DisplayFloat(75,4,K_11, 3); //���Ƕ�
//    
//    OLED_DisplayFloat(5,5,speed_L, 3); 
//    OLED_DisplayFloat(75,5,speed_R, 3); 

    //ˢOLED //ʹ����Ӳ��spi�����Ѿ���С����us����
    if (KEY_sta)
    {
//        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
//        {
//            OLED_MenuFlicker();
//            KEY_menuChange = !KEY_menuChange;
//        }
        KEY_ParaMenuDisplay();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
        KEY_sta = !KEY_sta;
    } 
//��������ת
//ʵ��  �ҷ�ת         
//     change_L(3000);
//            forward_L;//��ת
//////           reversal_L;         
////            change_R(4000);
//            forward_R;//��ת
////           reversal_R;
//    
//    change_L(FTM_motorDuty);//����ʹ��
//    change_R(FTM_motorDuty);//����ʱ������    
}
  
/*
   ���ٶȼƵĽǶȴ���Ϸ�ӳ�˳���ʵ�ʽǶȣ�
����(��̬��)���ٶȼƵĽǶ�ë�̴󣬽Ƕȷ�Χ��12�����ҡ��Ƕȱ仯Ƶ�ʿ��Ҵ�
   �����ǵĽ��ٶ�û�м��ٶȼƵĽǶ�ë�̴�
����(��̬��)�����ǵĽ��ٶ��о�̬ƫ���һֱ�ۼӲ�������ĽǶ�ֵ����
   ���ԣ��������ۺ�������
   �������ǻ��ֳ����ĽǶ���Ϊ�����Ƕȣ��ü��ٶȼƳ����ĽǶȲ�
���Ͽ������˲���ȥ�����ǵľ�̬�Ƕ��ۻ���λ�ò�(�ѳ�������һ���Ƕ�
�򿪵�Դ�������ǻ��ֵĽǶȶ��Ǵ�0�ȿ�ʼ��������Ҫ���ٶȼƳ����Ĵ�ŽǶ�)��
   
    angle_error = acc_angle - car_angle;  
    gyro_error += K_1 * angle_error; //X(K|K)
   
car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
     
car_angle  += K_0 * angle_error; //X(K|K)  

   ��ͨ�������ǽ��ٶȻ��ֳ��Ƕȣ�Ϊ�������Ƕ��ۻ���
Ȼ�����ü��ٶȼƲ�����Ĵ�ŽǶȣ�����angle_error΢�ֳ��Ľ��ٶ�ƫ���������Ƕ��ۻ�
������
   ��ƽ�Ÿտ�ʼ��car_angle=0��acc_angle=110��
   angle_error=110�����ٶȼƽǶ����ô� 
   K_1=-2,gyro_error=-220,
   car_angle=221*0.005=1.1��   --Ϊ+��0.005s
   1s��1.1*200=110��
   ʵ���ϣ�����1s�����У�ÿ��һ��0.005�����1.1Խ��ԽС
   
   K_0=0.����car_angle+=0.��*110

    1sʱ���car_angle=109��acc_angle=110��
   angle_error=1�����ٶȼƽǶ�����С 
        K_1=-0.007,gyro_error=-0.007,
   car_angle=1.007*0.005=0.����   --Ϊ+��0.005s
   
   ����car_angle=120��acc_angle=110��
   angle_error=-10�����ٶȼƽǶ�����С 
        K_1=-0.007,gyro_error=0.07,
   car_angle=-0.07*0.005=-��.����   ��0.005s
   
angle_error = acc_angle - car_angle;  
gyro_error += K_1 * angle_error; //X(K|K)   
car_angle_speed = gyr_angle_speed - gyro_error;
   �������ǵļ��ٶ��о�̬��ϴ��Сʱ�������Ǽ��ٶȲ��ȶ����� 
����gyro_error�Ĵ����������Ǽ��ٶ����󣬴����Ƕ�����
�Ƕ����󣬴������ٶ���������ͬ��gyr_angle_speed��car_angle_speed   
������Ҳ�� 
*/


/*
����ʵ���˶����ı�R_angle
 R_angle =  0.008;
 //Q_angle = 0.0003;
 //Q_gyro = 0.0001;
------------------------------------------
 R_angle =  1;
    ��Ѹ����������Ȼ��һֱ���º�Ӳ�Ķ�

R_angle =  0.5;
    ��Ѹ��������������һֱ������92��
�����������Ӻ󣬿�ʼһֱ���º�Ӳ�Ķ�

-------------------
   ˵��R_angle�ϴ�Ļ����Ƕ����������Ƕȸ��治��ʱ��
����PID���ڲ��ǵ�ǰ�Ƕ�Ӧ�еĲ������ʳ��ܵ����ź�
�Ƕȷ����仯��Ȼ��Ƕȸ����ͺ󣬳�һֱ���°ڶ���
   R_angle�ϴ�Ҳ�кô����Ƕ�����٣��Ƕ���ֵ̬ƽ��������
����������92��ʱ�����������ţ�������һֱ�ȶ����֡� 
----------------
R_angle =  0.3;
      ��Ѹ��������������һֱ������92�ȣ�
�������������Կ��ٻظ����ڶ�

R_angle =  0;
   ������
----------------
   ˵��R_angle��С���Ƕ��������Ƕȸ��漰ʱ������PID���ڸ����ϵ�ǰ
�ĽǶȡ���Ϊ0�������˲����󣬳��ĽǶȼ�������Ǽ�����������������
-------------------------
R_angle�ܽ᣺
   R_angle����ʱ�򣬴Ӵ���С�������ʱ��Ƕ��ȶ�ƽ�����ȱ�֤
1�������˲������������ȷ�Ƕȡ����ǳ��ܵ��Ŷ�(�Ƕȸ��治��ʱ��PID���ڲ���ʱ)��
���ظ���������һֱ�ڶ����ڴˣ���С�����������������ӣ������������Իָ�������
���ڴˣ�������������Ϊ�����ٶȻ������򻷣����ǻ�Ӱ��ֱ������Ҫ����ϸ΢���ơ�
*/


/*
�Ƕȣ���ʼ��������
 Q_angle = 0.0003;

 Q_angle = 0.1;
   �����������������ǳ�һֱ�����˵��� 
Q_angle = 0.2;
   ������������������������������һֱ�����˵��졣
Q_angle = 0.1;
   ������������������������������ż����һֱ���˵��졣
----------------------------------------------------------
   Q_angle̫��(�Ƕȷ���̫�󣬲����γ̶ȴ�),�Ƕ��������٣���̬�����
���೵ƽ��ʱ�����ĽǶȻ���һ���̶����Խ������Ҳ��ı䣬
PID����̫�죬��һֱ���˵��죬��˵���С����
----------------------------------------------------------
Q_angle = 0.01;
  �������������� һֱ���������ܸо���������

Q_angle = 0.001;
   Ч�����������������Կ��ٻָ���
ƽ��λ�ã���Ҳ����ڶ�
-------------------------------------------------------------------------------------------------------------------------------
  Q_angle = 0.001;�ȱ�����Q_angle�Ƕȷ���ϴ�ʱ��
�Ƕȸ��漰ʱ���Ƕ����������죬�ֱ�����
Q_angle�Ƕȷ����Сʱ���ȶ��ԡ�

-----------------------------------------------
Q_angle = 0.0005;ͬ��

Q_angle = 0;
   ����������ƽ�ź͵�������״̬ѭ����
----------------------------------
  Q_angle = 0;�Ƕȸ�����Ȼƽ���ȶ������ǽǶȸ���
̫����ʱ�˳����˼�������
*/

/*�����ǽ��ٶȣ���ʼ��������
 //Q_gyro = 0.0001;

Q_gyro = 0.5;
Q_gyro = 0.1;
   ��վ���ȣ�������
----------------------------
   �˳������ȶ��Ƕ��ڼ��ٶȼƵ�����
   Q_gyro̫��(�������ǽ��ٶȲ����δ�)���Ƕȱ仯��
�����Σ����治��ʱ�����Գ�һֱ�ڶ���������
----------------------------------------
Q_gyro = 0.01;
   �����ǲ��ȣ�����֮��ڶ�
Q_gyro = 0.001;
   ����
Q_gyro = 0;
���ԣ��Խ��ٶ����δ�һ���仯�͵��ڻָ�
Ӧ�ö����ģ�������û�С�
*/





//��ֱ�����ܽ᣺
//1������3�������Ӵ���С��
//2ֱ����PD��С��������ȵ�P����D
//ͨ����1��2�ȱ�ֻ֤��ֱ������ʱ����ƽ��
//��ͨ����12��֤�ܵ�����Ҳ��ƽ�⣬���֤
//���ٶȻ�����Ҳ��ƽ�⡣

//������ǰ����������������
//Ҫô�Ƕȸ��漰ʱ�������ӣ�����
//Ҫô�Ƕȸ��治��ʱ���Ƕ��ȶ�ƽ��

