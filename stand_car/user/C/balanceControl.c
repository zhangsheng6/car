#include "balanceControl.h"
#include "Variable.h"
/*Ӱ�����car_angle_speed��
gyro_error->K_1-> P[1][0],E ->R_angle,Q_angle   
*/  

/*Ӱ�����car_angle��
��ȷ�Ƕ�ȷ�����������ǽǶ��ۻ���gyro_error->ͬ��
��ŽǶ�ȷ����K_0->P[0][0],E->Q_gyro
*/


/*
  ��R_angle=0
����car_angle��car_angle_speed,�ܴ�б��ֱ������
��������ʱK_0,K_1��󣬵�������car_angle��car_angle_speed
����ϵ�����ֱ������

*/
//������1�ǶȲ�������ֵ
//��:ԽС,��������,����ֵ̬ë�̶�;Խ��������������ֵ̬Խƽ��
//��:��С�� ��Ҫ������������������ȥ��㣬���治��ʱ  0.5 0.001 0.003   // 0.25 0.001 0.0001
//ZS:��ƽ��
//��С����������ˣ����ڶ���Ӧ��
//R_angle��ֱ��ƽ���仯�������ڶ�����ƽ�������Ҳ�����
//R_angleС��ֱ�߲����ߣ��仯�죬���ڶ����߲�ƽ����������

//R_angle=1;���ǶȺ������������Ͼ���һ��ƽֱ�ߣ�0.25�����
//R_angle=0.5;���ǶȺ������������Ͼ���һ��ƽֱ�ߣ�
//R_angle=0.008;���Ƕ�����������һ��ƽֱ�ߣ�3�����
//R_angle=0.001;���Ƕ�������������
//R_angle=0;���Ƕȷ�ɢ���ܴ�б�ʴ�ֱ���������ߣ����������
//K_0,1��Ӱ��
float R_angle =0.008;//0.001 0.003;8

//������2���Ƕȣ���ʼ�������� P[0][0]
//����Խ���������٣�����̬�������ԽСԽ�ã�������Ժ�����
//�����ȽϺõ�һ������10 0.001 0.0001

//zs

//Q_angle=1;
//ͼ�Σ����ǶȻ����ϸ�����ٶȼƽǶ�
//ͼ�Σ������ٶȻ����ϸ��������ǽ��ٶ�
//K_0=0.538-0.537;��1�¡�K_1=-0.876һ��һ��䵽-0.01

//Q_angle=10;һģһ��
//K_0=0.876;ʼ�ղ��䡣K_1=-0.876һ��һ��䵽-0.008

/*�������ݸ�ֽ���������������������
//Q_angle��car_angle�Ը�����acc_angle�ĸ����Ժ�
//����Ѹ�٣�����Ļ����������̫�󣬲�����̫���أ�ë�̶࣬û����

//Q_angleС��
car_angle��acc_angle������ƽ�����ȶ��Ժ�
//����С�����ܸ����Բ��ã�

*/
//Q_angle=0;
//ͼ�Σ����ǶȻ����ϸ�����ٶȼƽǶ�
//ͼ�Σ������ٶȻ����ϸ��������ǽ��ٶ�
//K_0=0.1��-0.008;��һС��ʱ�䡣
//K_1=-0.876һ��һ��䵽-0.007

float Q_angle = 0.0003;//0006  0.00002;3


//������3�������ǽ��ٶȣ���ʼ�������� P[1][1]
float Q_gyro = 0.0000;//008    0.00003;1
//ԽС,�˳������ȶ��ǶȲ��ڼ��ٶȼƵ����ģ���С��������̫С���������࣬���治��ʱ


//������4
//P[2][2]:��ʼ��Ԥ��������
//������:���ٶȼƽǶȵı���ϵ��
#define acc_ratio	0.00100708       		//���ٶȼƱ���ϵ��������ֵ��

//car_angle:��ʼ�ĳ��ĽǶȣ�Ĭ��0��
//gyro_error:��ʼ�������ǽ��ٶ�ƫ��/������Ĭ��0��
///////////////////////////////////////////////////////////////////////////////
#define PI 3.141592654
#define INTEGRAL_TIME_CONSTANT 0.005         //����ʱ��

//----------------------------������--------------------------------------------
//                                                   0.85
float gyr_angle_speed, gyr_angle = 0, gyr_offset_x = -60;//������x,y��ƫ����
//int16 gyr_offset_x;

//----------------------------���ٶȼ�------------------------------------------
float acc_ave,acc_angle,acc_mid = 1211.76;     //���崹ֱ�����ADֵ
float acc_angle_cos;						//���ڼ�����ٶȼƽǶ�
#define ACC_MV_NUM  1.220703125         //mv/num

//---------------------------------ֱ������-------------------------------------
//angle_mid  89.9 ׼ȷ�Ƕ��㷨��87.5~93.2��
//           90.5 �Ӵ�Ƕ� (65~105)
//P_angle    1000�𲽵���
float car_angle = 0, car_angle_speed = 0;
//95.3
float angle_mid = 92.0;//90.5;//88.5 ����ǰ���ʹ�ٶȲ���  88.8
float P_angle = 2300;    ////���2��� ��������4000   û�ӵ��3700
float D_angle = 20;//12

float Angle_Out = 0;
float angle_E;
uint8  zhili_flag = 0;
char  Angle_flag = 0;

float Angle_Speed_P = 20  ,Angle_Speed_I = 0  ,Angle_Speed_D = 0;

float Angle_E_P     = 0.8 ,Angle_E_I     = 0  ,Angle_E_D     = 0;
int   Angle_out_num = 245;
 float   K_00,K_11;
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
int sure_time=0,gyr_offset_x_sum=0,offset_flag=0;
float tly_angle,tly_cangle;
void Angle_Kalman(void)
{
    static float Pdot[4] = {0,0,0,0};             //����Э��������΢�־���
//    
    static float P[2][2] = {{ 1, 0 }, { 0, 1 }};  //����Э�������      |1  0|
    static float gyro_error = 0, angle_error = 0; //�����ǽ��ٶȵ�ƫ���ֵ�ɿ��������̼�����£�  |0  1|
    static float K_0 = 0, K_1 = 0;                //���п��������������һ�����������ڼ������Ź���ֵ
    static float E, t_0, t_1;

    //�����ǲ⳵���ٶ�
    L3G4200_Read();
           
    gyr_angle_speed = ((float)gyro_x-gyr_offset_x)*gyr_ratio; //X,���ٶȣ���/��

    //���ٶȼƲ⳵�Ƕ�
    acc_ave = hw_ad_ave(MMA7361, adc12bit, 10);//jlink��3.3v���磬�������5v�����Ի�׼��ѹ��ͬ���ɼ������᲻һ��
    acc_angle_cos = (acc_mid - acc_ave)*acc_ratio;/* ���㲻���������ʽ --- han *///���ӽǶȷ�Χ
//    acc_angle_cos = (float)(((acc_ave + 1351.68 - acc_mid)*ACC_MV_NUM - 1650) / 7840.0);//�Ƕ�׼ȷ,����ΧС��Ҫ��PD���ȸ�

    if (acc_angle_cos > 1.0)
        acc_angle_cos  = 1.0;
    else if (acc_angle_cos < -1.0)
        acc_angle_cos  = -1.0;

    acc_angle = acos(acc_angle_cos)*180/PI;     //ת��Ϊ�Ƕ�

    /* 1 ������� -----------------------------------------------------------  */
    /*
    
     (1)�������
    X(k|k-1)=A X(k-1|k-1)+B U(k)  
    
    */
    //������һ�γ���Ƕȹ��Ʊ��νǶ�
    //���ڵĽǶ� = �ϴεĽǶ� + (������������ٶ� - �����ǽ��ٶ�ƫ��/����)*�����ǲ�������
    //�Ƕ�Ԥ�⣺
/*
  ������ȷ�ĳ��ĽǶ� ���������Ǿ�̬�Ƕ��ۻ���������һ��
  ��Ϊƽ����������Դ  
  tly_cangle������Ϊ��0��������бֱ��  
  tly_angle������Ϊ0�����ҵ�ƽ��
  car_angle��������ȷ��Ϊ110������ƽ��
*/    
    car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
    //
    tly_cangle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
    tly_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;

    /* 2 Ԥ�ⷽ�����Ԥ��ֵ -------------------------------------------------- */
    /*
   (2)Э��������Ԥ��
    Q:Ԥ�⣨�����ǽǶ� �����Ǿ�̬Ư�ƣ���������������
    P��k-1��|P(k-1)��Ϊ��һʱ�̵�Ԥ�ⷽ����
    
    P(k|k-1)=A P(k-1|k-1) A��+Q 
    */
    //�������    Э��������    ΢�־���
    //=��ߵ��Ǳ��ε�Э��������΢����ʽ
    //=�ұߵ����ϴε�Э�������
    //Q_angle�����Ƕȵ�����
    //Q_gyro�������ǽ��ٶȵ�����
    Pdot[0] = Q_angle  - P[0][1] - P[1][0];
    Pdot[1] = - P[1][1];
    Pdot[2] = - P[1][1];
    Pdot[3] = Q_gyro;

    //����        Э�������
    //���ε�Э�������+=���ε�Э�������΢��*ʱ��
    P[0][0] += Pdot[0] * INTEGRAL_TIME_CONSTANT;//�Ƕȵķ���
    P[0][1] += Pdot[1] * INTEGRAL_TIME_CONSTANT;
    P[1][0] += Pdot[2] * INTEGRAL_TIME_CONSTANT;
    P[1][1] += Pdot[3] * INTEGRAL_TIME_CONSTANT;//���ٶȵķ���

    /* 3 ���㿨�������棬Ȩ�� ------------------------------------------------------ */
    //R_angle:�ǶȲ�������ֵ
    //P[0][0]:�Ƕȷ���
    //Ȩ��
    E = R_angle + P[0][0];
    //���㿨��������
    //K_0,K_1ǰ����仯��//֮�󲻱仯
    K_0 =  P[0][0] / E;
    K_1 =  P[1][0] / E;

    /* 5 ����Э������� ------------------------------------------------------ */
    t_0 = P[0][0];
    t_1 = P[0][1];

    //����Э���������һ���˲�Ҫ�õ��µ�
    //�µ�Э�������=Ȩ��*��ֵ
    P[0][0] -= K_0 * t_0;  //P(K|K)
    P[0][1] -= K_0 * t_1;
    P[1][0] -= K_1 * t_0;
    P[1][1] -= K_1 * t_1;
    /* 4 ����angle_error�����п��������棨K_0��K_1�������� ------------------------------------------- */
   //�Ƕ�ƫ��=���ٶȼƽǶ�-���ĽǶȣ������ǲ�����ģ�
    //�Ƕ�ƫ��Խ������Խ��
    angle_error = acc_angle - car_angle;  
/*
   �����ϵ磬��������ϵ���Ƚϴ�Ȼ�󲻶ϱ�С��
�����ϵ�������ˡ�    
K_0:0.2   ->  0.016
K_1:-2.�� ->  -0.007    
*/ 
//��acc_angle>car_angle,���ĽǶ�����
//��acc_angle<car_angle,���ĽǶȼ���
//�Գ��ĽǶȽ�������    
//�����󳵵ĽǶ�=����ǰ���ĽǶ�+����������Գ��Ƕȵ�Ȩ��*�Ƕ�ƫ��
//������Ϊk_0�������Ƕ�ƫ���ϵ��
/*
    ������ȷ�ĳ��ĽǶȣ�
���۳���η��ã�����Դ��ʹ��ȷ�ĳ��ĽǶ���ʱ����
���ٶȼƵĴ�ŽǶ�   
*/    
    car_angle  += K_0 * angle_error; //X(K|K)  
//��acc_angle>car_angle,�����ǽ��ٶ�ƫ�����
//��acc_angle<car_angle,�����ǽ��ٶ�ƫ������
//�����������ǵĽ��ٶ�ƫ��=
//����ǰ�����ǵĽ��ٶ�ƫ��+����������������ǽ��ٶȵ�Ȩ��*�Ƕ�ƫ��
//������Ϊk_1�ǰѽǶ�ƫ��΢�ֳɽ��ٶ�ƫ���ϵ��    
    gyro_error += K_1 * angle_error; //X(K|K)  
//��acc_angle>car_angle,�����ٶ�����
//��acc_angle<car_angle,�����ٶȼ���  
//�Գ��Ľ��ٶȽ�������  

    car_angle_speed = gyr_angle_speed - gyro_error;
       
    K_00=K_0;
    K_11=K_1;
}

/**
  * ���
  *     ֱ������
  * ע��
  *    
  */
//void Angle_Controler(void)
//{  
//  //�Ƕ�
//  float Angle_E_last = 0,Angle_E_now = 0,Angle_E_error = 0,Angle_E = 0,Angle_E_inter = 0,Angle_E_inter_Max = 10,Angle_E_out = 0;
//
//  //���ٶ�
//  float Angle_Speed_last = 0,Angle_Speed_now = 0,Angle_Speed_error = 0,Angle_Speed = 0,Angle_Speed_inter = 0,Angle_Speed_inter_Max = 8000;
//  
//  
//  //���Ƕ���Ϊ�⻷ ����PID
//  Angle_E       = (  angle_mid - Speed_Control_Output);
//  Angle_E_last  = Angle_E_now;
//  Angle_E_error = car_angle - Angle_E;
//  Angle_E_inter += Angle_E_error;
//  if(Angle_E_inter > Angle_E_inter_Max) Angle_E_inter = Angle_E_inter_Max;
//  if(Angle_E_inter < -Angle_E_inter_Max) Angle_E_inter = -Angle_E_inter_Max;
//  Angle_E_out     = Angle_E_P * Angle_E_error + Angle_E_inter * Angle_E_I + Angle_E_D * (Angle_E_error - Angle_E_last);
//  
//  //�Ƕȴ������ٶ����� ����PID����
//  Angle_Speed   = -Angle_E_out * Angle_out_num + car_angle_speed;
//  Angle_Speed_last  = Angle_Speed_now;
//  Angle_Speed_error = 0 - Angle_Speed;
//  Angle_Speed_inter += Angle_Speed_error;
//  if(Angle_Speed_inter > Angle_Speed_inter_Max) Angle_Speed_inter = Angle_Speed_inter_Max;
//  if(Angle_Speed_inter < -Angle_Speed_inter_Max) Angle_Speed_inter = -Angle_Speed_inter_Max;
//  Angle_Out     = Angle_Speed_P * Angle_Speed_error + Angle_Speed_inter * Angle_Speed_I + Angle_Speed_D * (Angle_Speed_error - Angle_Speed_last);
//  
//  if(zhili_flag == 0) Angle_Out = 0;
//}


    

void Angle_Controler(void)
{
//    static float E_angle;
  
//��ƽ��ʱ�Ƕ�124 ��ƫ��Ϊ��29   
//������ʱ�Ƕ�75 ��ƫ��Ϊ��-17.5
  
  //����ƫ�ߣ��������
  //����ƫ�ͣ��������
  
//    angle_E = (car_angle - angle_mid + Speed_Control_Output);
    angle_E = (car_angle - angle_mid );
    //89.9 (87.5~93.2�� 2.4  ~ -3.3
    //88.5 (65~105)   23.5 ~ -16.5

    //>E_angle ����ֱ������(ʹ����ʵ��������ΪP_angle��ȡֵ��Χ̫С������ֻ��ʹ���Ƿ�Χ��С)
    
   // E_angle = tan(angle_E/180*PI) * 9.8;//a > tan(��) * g -> �ָ���ʹС���ָ�

    //89.9 ��87.5~93.2��
    //tan(��) -0.04~0.057
    //90.5 �Ӵ�Ƕ� (65~105)
    //tan(��) 0.4~-0.2
    //88.5 tan(��) 4.26~-2.9
    
 if(car_angle_speed>=-0.30&&car_angle_speed<=0.3)car_angle_speed = 0;

   Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;//��ʹPȡֵ��Χ��С�������ʹ��
   
   // if(zhili_flag == 0) Angle_Out = 0;
  //  Angle_Out = -(P_angle*E_angle) + D_angle*car_angle_speed;
    //car_angle_speed 0 ~ 27
    //D_angle*gyr_angle_speed ������
//       UART_SendFloat(car_angle, 1);
//       UART_SendFloat(car_angle_speed, 1);
//       OutPut_Data(car_angle, acc_ave, 0, 0);
// uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);
       

}


















 //ZSȷ�������Ǿ�̬Ư����   
//    if(sure_time<100)//2.5*100=250ms
//  {
//    sure_time++;
//    gyr_offset_x_sum+=gyro_x;
//  }
//  else
//    offset_flag=1;
//  
//  if(offset_flag==1)
//  {
//      gyr_offset_x=gyr_offset_x_sum/100;
//      offset_flag=2;
//  }










