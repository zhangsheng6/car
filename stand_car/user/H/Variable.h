#ifndef _VARIABLE_H_
#define _VARIABLE_H_
#include "allHead.h"

//ϵͳ
//extern uint8 boma;
//extern uint8 alarm_status;

//С��״̬
extern uint8 carStatus; //С��״̬ѡ��
#define NORMAL    0  //��������
#define STOP      1  //�����ת
//#define Stand     1  //����ֱ��
//#define Ready     2  //׼�����뷢��
#define Runing   2   //��������
//#define Clear     4
//#define Sliding   5
//extern uint16 Runing_Distance;//���߾���

//���Բ˵�
extern uint8  menuSelect; //�˵�ѡ��,Ĭ����ʾ�˵�
extern uint8  KEY_menuChange;//����״̬��Ĭ�Ϲ�
extern uint8  KEY_sta;   //����״̬��Ĭ�Ϲ�
extern char RUN_flag;
#define LOGO    0
#define MENU    1
#define MENU_1  2
#define MENU_2  3
#define MENU_3  4
#define MENU_4  5
#define MENU_5  6
#define MENU_6  7

//���Ե���˵�
extern uint8 KEY_textAble;//���Բ˵��Ƿ���
#define NO          0
#define OK          1
extern uint16 FTM_motorDuty;//���ת�ٲ���ʹ��
extern uint8  KEY_textSelect;//���Բ˵�����ѡ��
extern uint8  zhili_flag;
#define TEXT_DEFAULT    0
#define MOTOR_REV      1//Ц������ ��ʱ��
#define MOTOR_REV_L     2
#define MOTOR_REV_R     3
#define MOTOR_FOR      4//˳ʱ��
#define MOTOR_FOR_L     5//˳ʱ��
#define MOTOR_FOR_R     6
#define MOTOR_LOC      7//����
#define MOTOR_LOC_L     8
#define MOTOR_LOC_R     9

//���ڶ�ȡ
#define READ_DEFAULT    0
#define CAR_STATUS      '1'


/* ���ж�Ӧ���� -------------------------------------------------------------- */
      //Ԥ��
#define TEMPORARY_0     C2
#define TEMPORARY_1     C7

      //������
#define BUZZER          D0

      //LED
#define LED_0           G0
#define LED_1           G1
#define LED_2           G2
#define LED_3           G3

      //���󰴼�
#define KEY_U           I1
#define KEY_D           H6
#define KEY_L           D1
#define KEY_R           H5
#define KEY_M           I4

      //���밴��
#define KEY_BO_0        F3
#define KEY_BO_1        H0
#define KEY_BO_2        H1
#define KEY_BO_3        I0

      //OLED
//#define OLED_CS          E6
#define OLED_DC          I6
//#define OLED_SDIN        H2
//#define OLED_OSCLK       C3  //ADC0_SE11��FTM2_CH3���޸ĸ���
#define OLED_RES         I5

      //L3G4200
#define IIC_PORT         i2c1
#define IIC_SCL          D3//ģ������,û��ʹ�ã��˴����д��
#define IIC_SDA          C7//ģ������,û��ʹ�ã��˴����д��
#define SPI1_PCS         G7
#define SPI1_MISO        G6
#define SPI1_MOSI        G5//��������
#define SPI1_SCK         G4
#define SPI_PORT         spi1

      //MMA7361
#define MMA7361          B1

      //UART
#define UART_TX          UART2_TX_PIN //D7
#define UART_RX          UART2_RX_PIN //D6
#define UART_PART        uart2
#define UART_BAUD        115200 //�޸Ĳ����ʣ�Ҫ��֤����� 0.04 ����
#define DEBUG_PORT       UART_PART//��Ҫ�޸ģ�DEBUG_PORT��ʹ������ײ��ļ���Ҳ���
#define DEBUG_BAUD       UART_BAUD

      //������� ����������ȱ�ڷ����жϷ���
#define ENL_L           D4//D3�ܵ�iic��Ƶ��Ӱ�죬����ʹ��
#define ENL_R           E4
#define ENR_L           F2
#define ENR_R           D2

      //PWM
#define PWM_CH0         ftm2 //F0  L
#define PWM_CH1         ftm2 //F1  R

      //����
#define FTM_SPEED_L     ftm0 //E7  L
#define FTM_SPEED_R     ftm1 //E0  R

//�ⷽ��
#define DIR_L           E3
#define DIR_R           E1

//      //PWT
//#define PWT_IN0          D5
//#define PWT_IN1          H7

      //ADC
#define ADC_1            C0 //��ɫ   //C0
#define ADC_2            F5 //��ɫ   //F5
#define ADC_3            C1 //��ɫ   //C1
#define ADC_4            F7 //��ɫ   //F7
#define ADC_5            F4          //F4
#define ADC_6            B0

       //PIT
#define PIT0             0
/* ���ж�Ӧ���� -------- END ------------------------------------------------- */

/* ģ��ͨ�����ź��趨 -------------------------------------------------------- */
//      FTM ģ��ͨ��    �˿�      ��ѡ��Χ                ��ע
#define FTM0_CH0_PIN    A0        //B2 A0
#define FTM0_CH1_PIN    A1        //B3 A1

#define FTM1_CH0_PIN    H2        //H2 C4				 C4��Ҫ�ã���SWD_CLK��ͻ��
#define FTM1_CH1_PIN    C5        //E7 C5

#define FTM2_CH0_PIN    F0        //C0  H0 F0
#define FTM2_CH1_PIN    F1        //C1  H1 F1
#define FTM2_CH2_PIN    C2        //C2  G4 D0
#define FTM2_CH3_PIN    C3        //C3  G5 D1
#define FTM2_CH4_PIN    B4        //B4  G6
#define FTM2_CH5_PIN    B5        //B5  G7

#define FTM0_COUNT_PIN  E7        //E7 A5  E0             A5��Ҫ�ã��븴λ������ͻ��
#define FTM1_COUNT_PIN  E0        //E0 A5  E7             A5��Ҫ�ã��븴λ������ͻ��
#define FTM2_COUNT_PIN  A5        //E0 E7  A5             A5��Ҫ�ã��븴λ������ͻ��

//      UARTģ��ͨ��    �˿�      ��ѡ��Χ                ����
#define UART0_RX_PIN    B0        //A2 B0
#define UART0_TX_PIN    B1        //A3 B1

#define UART1_RX_PIN    F2        //C6 F2
#define UART1_TX_PIN    F3        //C7 F3

#define UART2_RX_PIN    D6        //D6 I0
#define UART2_TX_PIN    D7        //D7 I1

//      I2C ģ��ͨ��    �˿�      ��ѡ��Χ                ����
#define I2C0_SCL_PIN    A3        //A3 B7
#define I2C0_SDA_PIN    A2        //A2 B6

#define I2C1_SCL_PIN    H4        //E1 H4
#define I2C1_SDA_PIN    H3        //E0 H3

//      IRQģ��ͨ��     �˿�      ��ѡ��Χ                    ����
#define IRQ_PIN         I5        //A5 I0 I1 I2 I3 I4 I5 I6  A5��Ҫ�ã��븴λ������ͻ��

//      SPIģ��ͨ��     �˿�      ��ѡ��Χ              ����
#define SPI0_SCK_PIN    B2       //E0 B2
#define SPI0_SOUT_PIN   B3       //E1 B3
#define SPI0_SIN_PIN    B4       //E2 B4
#define SPI0_PCS0_PIN   B5       //E3 B5

#define SPI1_SCK_PIN    G4       //G4 D0
#define SPI1_SOUT_PIN   G5       //G5 D1
#define SPI1_SIN_PIN    G6       //G6 D2
#define SPI1_PCS0_PIN   G7       //G7 D3


/* ���������� ---------------------------------------------------------------- */
#define BUZZER_ON    	GpioSet(BUZZER, 1);
#define BUZZER_OFF   	GpioSet(BUZZER, 0);
#define BUZZER_TURN   	GpioTurn(BUZZER);

/* LED�ƿ��� ----------------------------------------------------------------- */
    //LED0
#define LED_0_ON    	GpioSet(LED_0, 0);
#define LED_0_OFF   	GpioSet(LED_0, 1);0kiujhyHUuumN58+
#define LED_0_TURN      GpioTurn(LED_0);

    //LED1
#define LED_1_ON    	GpioSet(LED_1, 0);
#define LED_1_OFF   	GpioSet(LED_1, 1);
#define LED_1_TURN      GpioTurn(LED_1);

    //LED2
#define LED_2_ON    	GpioSet(LED_2, 0);
#define LED_2_OFF   	GpioSet(LED_2, 1);
#define LED_2_TURN      GpioTurn(LED_2);

    //LED3
#define LED_3_ON    	GpioSet(LED_3, 0);
#define LED_3_OFF   	GpioSet(LED_3, 1);
#define LED_3_TURN      GpioTurn(LED_3);

/* UART���ؿ��� -------------------------------------------------------------- */
#define UART_DISABLE       {UART2_C2 &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );}// �ر� UART
#define UART_ABLE    {UART2_C2 |=  (UART_C2_TE_MASK | UART_C2_RE_MASK );}// ���� UART


//������
extern uint8 gyro_ID;
extern float gyr_angle_speed;
extern uint8 chice;

//������
#define gyr_ratio	-0.04675 /* �����Ǳ���ϵ��������ֵ��,��֪Ϊ�θĳɸ������ݲ��޸� */
extern float gyr_offset_x;
extern int16 gyro_x, gyro_y, gyro_z;
extern int gyro_y_valu;
extern int16 L3G4200_valu[2];

//PWM��������ֵ
extern uint16 g_mod;


//ADC��ʱ�����洢��
extern uint16 adcHold;

//���ٶȼ�
extern float acc_ave,acc_mid;

//ֱ��
extern float acc_angle;
extern float acc_ave;
extern float car_angle,car_angle_speed;
extern float P_angle,D_angle;
extern float angle_mid;
extern float Angle_Out;
extern float R_angle;//�˲�������
extern float Q_angle;
extern float Q_gyro;
extern float angle_E;
extern float Angle_Speed_P;
extern float Angle_Speed_I;
extern float Angle_Speed_D;
extern float Angle_E_P;



//����
extern float speed_car;
extern float Set_Speed;
extern float speed_L;
extern float speed_R;
extern char  car_start;
extern float P_Speed;


//���
extern float Chazhi;
extern int   AD_valu[5]; 
extern float AD_inductor[5];
//extern float AD_inductor1[5];
extern int   AD_valu_shu[3];
//extern int16 ad_valu_shu[3][3]; 
extern char  position;
extern char huandao_flag_in;
extern char huandao_flag;
extern char   huandao_ready;

//����
extern float Direction_Control_Output;
extern float P_Direction_high; 
extern float P_Dir_agl;
extern int16  gyro_y;
extern float Direction_angle;
extern float   Chazhi_he_before;
extern float   Chazhi_he_after;
extern float   Chazhi_he;
extern float   Chazhi_abs;
extern char   Direction_flag;

//��ʱ��������
extern char testcar_flag;


//
////����
//extern float gyr_ave_direction,gyr_ave_direction_zero,gyr_mid;
//extern float D_gyr;
//extern float P_Direction,D_Direction;
//extern float P_Direction1,D_Direction1;
//extern float P_Direction2,D_Direction2;
//extern float P_Direction3,D_Direction3;
//extern float P_Direction_high, P_Direction_low;
//extern float turn_spd;  //��ǵķֶ��ٶ�
//extern float P_Direction_ZhiJiao;
//extern float K;
//extern uint8 Direction_Control_Period;
//extern float Direction_Control,Direction_Control_Output,Direction_angle,P_Dir_agl;
//
////�ٶ�
//extern uint8 add_speed_flag;
extern uint8 speed_control_period;
extern float Speed_Control_Output;
//extern float Speed_Control_Max;
extern float P_Speed,I_Speed;
//extern float Speed_I_lntegral,Speed_I_lntegral_Max;
//extern float speed_L,speed_R,speed_car,speed_set,speed_set_tmp;
//extern signed int Pulse_L,Pulse_R;
//extern signed int podao_pulse_L,podao_pulse_R;
//extern uint16 zhijiao_speed;
//extern signed int podao_spd, podao_spd2;
//extern uint8 slow_flag, slow_flag2;
//extern float low_spd_agl;

//���
extern unsigned int DEAD_L,DEAD_R;
extern float Motor_Out_L,Motor_Out_R;

//extern uint8 ccdData[128];
//extern uint8 discharge_time;
//
//extern signed char ccddata_der[128];
//extern uint16 ccddata_der_sum,ccddata_der_sum_set;
//extern uint16 ccdData_sum,ccdData_sum_set;
//extern uint16 wandao_cnt,huanwan_cnt,zhidao_cnt,zhidao_num,shizi_cnt,shizi_out,dual2single_flag;
//extern uint8 Left_Lost , Right_Lost;
//extern uint8 zhijiao_flag, zhijiao_Err_max;
//extern int8 zhijiao_Err;
//extern uint16 zhijiao_cnt;
//extern uint8 zhijiao_turn_cnt, zhijiao_turn_cntL, zhijiao_turn_cntR, zhijiao_turn_cnt_err;
//
//extern uint8 zhangai_cnt,zhangai_cnt_max,zhang_Err;
//
//extern uint8 podao_flag;
//extern uint16 podao_cnt,podao_cnt_tmp,podao_cnt_up;
//
//extern uint16 star2podao_cnt,star2podao_set;
////��������
//extern uint8 Road_Type;
//#define ZhiDao	1
//#define WanDao	2
//#define ShiZi		3
//#define ZhiJiao_L	4
//#define ZhiJiao_R	5
//#define ZhangAi	6
//#define Center_Guide	7
//#define ZhangAi_L 8
//#define ZhangAi_R 9
//#define PoDao	10
//
//#define FOUND	1	//�������Ԫ��
//#define CONFIRM	2	//���Ԫ��ȷ�����
//#define Exit		3	//�˳���ӦԪ�ر�־
//#define NONE		4
//
//#define ToLeft	3	//ƫ��
//#define ToRight	4	//ƫ��
//
//

#endif
