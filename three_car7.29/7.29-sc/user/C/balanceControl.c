/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    balanceControl.c
  * �ļ���ʶ��
  * ժ    Ҫ��    ƽ�����
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��30�� 20:35:50
  ******************************************************************************
  */

#include "balanceControl.h"
#include "Variable.h"
#define PI 3.141592654
#define INTEGRAL_TIME_CONSTANT 0.005         //����ʱ��

float R_angle =  0.00009;//0.009;	//ԽС,��������,����ֵ̬ë�̶�;Խ��������������ֵ̬Խƽ��  ��С�� ��Ҫ������������������ȥ��㣬���治��ʱ
float Q_angle = 0.0001;//0.00001;	//Խ���������٣�����̬�������ԽСԽ�ã�������Ժ�����
float Q_gyro = 0.0003;//0.00003;	//ԽС,�˳������ȶ��ǶȲ��ڼ��ٶȼƵ����ģ���С��������̫С���������࣬���治��ʱ

//----------------------------������--------------------------------------------
float gyr_angle_speed, gyr_angle = 0, gyr_offset_x = 35;//������x,y��ƫ����
//int16 gyr_offset_x;


//----------------------------���ٶȼ�------------------------------------------
float acc_ave,acc_angle,acc_mid = 1211.76;//���崹ֱ�����ADֵ
float acc_angle_cos;						//���ڼ�����ٶȼƽǶ�
#define ACC_MV_NUM  1.220703125         //mv/num
#define acc_ratio	0.00100708       		//���ٶȼƱ���ϵ��������ֵ��

//---------------------------------ֱ������-------------------------------------
//angle_mid  103.3 ������  92.4 �����ص����
//P_angle    1000�𲽵���
float car_angle = 0, car_angle_speed = 0;
float angle_mid = 90.35;//83.5; //80.690;// 90.930	88.5 ����ǰ���ʹ�ٶȲ��ȣ�82~125��
float low_spd_agl = 90;
float P_angle = 2100;//1900;//;3340;//5300;//9500; 5000 - ֱ��,̫���ִ򻬳��ᷢ��
float D_angle = 0;//6.3; //6.8; //6.300
float Angle_Out = 0;

/**
  * ���
  *     �������˲�
  * ע��
  *     1
  *       ���������� �� ��Ӯ����ֱ�������ֲ� PDF
  *     2
  *       �����Ƕ�ʱ�����ݿ���
  *       ���ٶȼƳ�ʱ�����ݿ��ţ����߻���
  */
void Angle_Kalman(void)
{
    static float Pdot[4] = {0,0,0,0};             //����Э��������΢�־���
    static float P[2][2] = {{ 1, 0 }, { 0, 1 }};  //����Э�������      |1  0|
    static float gyro_error = 0, angle_error = 0; //�����ǽ��ٶȵ�ƫ���ֵ�ɿ��������̼�����£�  |0  1|
    static float K_0 = 0, K_1 = 0;                //���п��������������һ�����������ڼ������Ź���ֵ
    static float E, t_0, t_1;

    //�����ǲ⳵�Ƕ�
    L3G4200_Read();
    gyr_angle_speed = ((float)gyro_x-gyr_offset_x)*gyr_ratio; //X,���ٶȣ���/��

    //���ٶȼƲ⳵�Ƕ�
    acc_ave = hw_ad_ave(MMA7361, adc12bit, 10);//jlink��3.3v���磬�������5v�����Ի�׼��ѹ��ͬ���ɼ������᲻һ��
//    acc_angle_cos = (acc_mid - acc_ave)*acc_ratio;/* ���㲻���������ʽ --- han */
    acc_angle_cos = (float)(((acc_ave + 1351.68 - acc_mid)*ACC_MV_NUM - 1650) / 7840.0);

    if (acc_angle_cos > 1.0)
        acc_angle_cos  = 1.0;
    else if (acc_angle_cos < -1.0)
        acc_angle_cos  = -1.0;

    acc_angle = acos(acc_angle_cos)*180/PI;     //ת��Ϊ�Ƕ�

    /* 1 ������� -----------------------------------------------------------  */
    //������һ�γ���Ƕȹ��Ʊ��νǶ�
    //���ڵĽǶ� = �ϴεĽǶ� + (������������ٶ� - ��̬ƫ��)*�����ǲ�������
    car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;

    /* 2 Ԥ�ⷽ�����Ԥ��ֵ -------------------------------------------------- */
    //�������Э��������΢�־���
    Pdot[0] = Q_angle  - P[0][1] - P[1][0];
    Pdot[1] = - P[1][1];
    Pdot[2] = - P[1][1];
    Pdot[3] = Q_gyro;

    //����Э�������
    P[0][0] += Pdot[0] * INTEGRAL_TIME_CONSTANT;
    P[0][1] += Pdot[1] * INTEGRAL_TIME_CONSTANT;
    P[1][0] += Pdot[2] * INTEGRAL_TIME_CONSTANT;
    P[1][1] += Pdot[3] * INTEGRAL_TIME_CONSTANT;

    /* 3 ���㿨�������� ------------------------------------------------------ */
    E = R_angle + P[0][0];
    //���㿨��������
    K_0 =  P[0][0] / E;
    K_1 =  P[1][0] / E;

    /* 5 ����Э������� ------------------------------------------------------ */
    t_0 = P[0][0];
    t_1 = P[0][1];

    //����Э�������
    P[0][0] -= K_0 * t_0;  //P(K|K)
    P[0][1] -= K_0 * t_1;
    P[1][0] -= K_1 * t_0;
    P[1][1] -= K_1 * t_1;

    /* 4 �����п��������������� ------------------------------------------- */
    angle_error = acc_angle - car_angle;
    //�������Ź���ֵ
    car_angle += K_0 * angle_error; //X(K|K)
    //�������Ź���ֵƫ��
    gyro_error += K_1 * angle_error; //X(K|K)
    //Ϊ��PID���ưѽ��ٶ������
    car_angle_speed = gyr_angle_speed - gyro_error;
}

/**
  * ���
  *     ֱ������
  * ע��
  *     math.h�����Ǻ����õ��� ����
  */
void Angle_Controler(void)
{
    static float angle_E, E_angle;

    angle_E = (angle_mid - car_angle);

    //>E_angle ����ֱ������(ʹ����ʵ��������ΪP_angle��ȡֵ��Χ̫С������ֻ��ʹ���Ƿ�Χ��С)
    E_angle = tan(angle_E/180*PI) * 9.8;//a > tan(��) * g -> �ָ���ʹС���ָ�
    //tan(��) -0.414~0.374
    //E_angle

    //    Angle_Out = -( P_angle*angle_E ) - D_angle*car_angle_speed;//ȡֵ��Χ̫С���˷�������

    Angle_Out = -(P_angle*E_angle) + D_angle*car_angle_speed;// E_angle = 10 <-> 0.02985259896577487006352080076417
    // P_angle*E_angle 349.2858
    //gyr_angle_speed 32.4  D_angle*gyr_angle_speed 1.8 ������
    //	DataScope_Get_Channel_Data(car_angle,3);


//        UART_SendFloat(gyro_x, 1);
    switch (chice)
    {
      case 0:
        LED_2_OFF;
        break;

      case 1:
        LED_2_ON;
        UART_SendFloat(acc_ave, 1);
        break;

      case 2:
        LED_2_ON;
        OutPut_Data(acc_ave, 0, 0, 0);
//        UART_SendFloat(car_angle, 1);
        break;

      default :
        break;
    }
}


