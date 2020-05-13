#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include "L3G4200D_ZS.h"

#define INTEGRAL_TIME_CONSTANT 0.005        //����ʱ��

//----------------------------������--------------------------------------------
float gyr_angle_speed,gyr_angle_speed_up,//�����ǽ��ٶ�
      gyr_angle_speed_static=1,//�����Ǿ�ֹʱ�Ľ��ٶ�
      gyr_angle_speed_static_sum,//�����Ǿ�ֹʱ�Ľ��ٶ��ܺ�
      gyr_angle = 0, gyr_angle_up = 0,//�����ǽǶ�
      gyr_angle_static=1,//�����Ǿ�ֹʱ�ĽǶ����,4min
 
gyr_offset_x = 18.8;//������x��ƫ����0.85

float gyr_offset_y =-6.000;//������y��ƫ����
float gyr_offset_z =21.24;//������z��ƫ����
int   gg=0;
float gyr_offset__z_sum=0;//������z�ᾲ̬ƫ�����ܺͣ�
float gyr_offset__z_average=0;//������z�ᾲ̬ƫ����ƽ��ֵ��
float gyr_offset__x_sum=0;//������z�ᾲ̬ƫ�����ܺͣ�
float gyr_offset__x_average=0;//������z�ᾲ̬ƫ����ƽ��ֵ��
int zs=0;
/*****************�����ǲ⳵���ٶ�,�Ƕ�******************************************************************
  δ�˲�4���Ӳ���10��
  �˲���4���Ӳ���1��
  С��ת90�ȣ������ǲ��45��
  ����ͨ����������ǲ��45��
  С����ԲȦ�����ʵ�ʳ�ת����270��,
                  �����ǲ����136��
  С��ת����󣬻���ʾ��ת�Ƕȣ�ֱ������ֱ������ֱ��ͨ�������ǽ����
�ĽǶȸ�P,ʹ��ֱ����ֱ������Ϊ������������ʾ�ĽǶ�һֱΪ0�ȡ�������
��ת�����䲻ͬ������������������ʾ�Ƕ�Ϊ0�ȡ�֮ǰ��������ʾ�Ƕ�����
Ư�ƣ������ڹ�Բ�����ʱ����ʾ�Ƕ��Ѵﵽ��135�ȡ�
  ��δ�뵽�������ǲ�õĽǶ�����Ư�ơ�
  �������ǲ�õĴ���ٶ�������Ư��
*********************************************************************************/
void Gyro_ZS()
{ 
//������Z,Y�����ݶ�ȡ
  L3G4200_Read();
 
//�����ǽ��ٶ�=(������z������-������z�ᾲ̬ƫ����)*�����Ǳ���ϵ��
  gyr_angle_speed=((float)gyro_z-gyr_offset_z)*gyr_ratio; //���ٶȣ���/��
  gyr_angle_speed_up=((float)gyro_x-gyr_offset_x)*gyr_ratio; //���ٶȣ���/��

//�����ǽ��ٶȾ�̬�˲���������ٶȼ�
  if(gyr_angle_speed<gyr_angle_speed_static&&gyr_angle_speed>-gyr_angle_speed_static)
  {
    gyr_angle_speed=0;
  }
/* 1 ������� -----------------------------------------------------------  */
//������һ�γ���Ƕȹ��Ʊ��νǶ�
//���ڵĽǶ� = �ϴεĽǶ� + (������������ٶ� - ��̬ƫ��)*�����ǲ�������
//car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
//     ֮ǰ�ĽǶ�ƫ���ɿ��������˲��ͼ��ٶȼƻ��
  gyr_angle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
  gyr_angle_up += gyr_angle_speed_up * INTEGRAL_TIME_CONSTANT;
 
//  if(gyr_angle>gyr_angle_static||gyr_angle<-gyr_angle_static)
//  {�Ƕ�ȷ��
//     Direction_Angle=gyr_angle;
//  }
  
  
  
//  uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);

//ȷ��������Z�ᾲ̬ƫ����ֵ����,�ɲɼ�4.3minƽ��ֵ
//  gg++;
//  gyr_offset__z_sum+=gyro_z;
//  gyr_offset__z_average=gyr_offset__z_sum/gg;
  
  gg++;
  gyr_offset__x_sum+=gyro_x;
  gyr_offset__x_average=gyr_offset__x_sum/gg;
//ȷ��������Z�ᾲ̬���ٶ�ƽ��ֵ���򣬿ɲɼ�4.3minƽ��ֵ��0.038
//  gg++;
//  gyr_angle_speed_static_sum+=gyr_angle_speed;
//  gyr_angle_speed_static=gyr_angle_speed_static_sum/gg;
//ȷ��������Z�ᾲ̬���ٶ����ֵ����0.89
//  if(gyr_angle_speed_static<gyr_angle_speed)
//    gyr_angle_speed_static=gyr_angle_speed;
}
//ֱ����
//�Ƕ����=P*�����ǽǶ�ƫ��+D*�����ǽ��ٶ�
//Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;














