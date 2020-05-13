#include "Fuzzy.h"
//��άģ������ϵͳ
//����С����ʵ���ٶ���������Y�����ݣ������������P

float  Angle_E[3]  = {5,10,15};   //С���ٶ�
float  Gyro_E[3] = {10,15,30};	   //���ٶ�����
float  Shell_P[3]  = {10,15,40};  //����������ϵ��

//�����������ݾ�Ϊ�������ݣ��ʹ�����ⶨΪ����
 int rule[3][3]=
        {
          {2,1,0},
          {1,1,0},
          {0,0,0},
        };

	

float Fuzzy_Shell_P(float E_angle,float E_gyro)
{
  float  angle_err=0,gyro_err=0;
  int angle_N=0,gyro_N=0; //��������ֵ
  int  num=0;
  float fuzzy_P=0;
   //��¼�������������ֵ
  float  Angle_Fzy[2] ={0.0,0.0};
  float  Gyro_Fzy[2] ={0.0,0.0};

  float  Shell_P_Fzy[3] ={0.0,0.0,0.0};
  // /*----- ���ݸ���-----*/
  // Shell_P[1]  = P_Direction_low;
  // Shell_P[2]  = P_Direction_high;


  //������ȡ����ֵ�����ݵ���������������	
//	ABS_val(E_angle,angle_err);
//	ABS_val(E_gyro,gyro_err);

  /*-----   Angle ������������-----*/
	if(angle_err<Angle_E[0]) //1
	{
		Angle_Fzy[0] =1.0;
		angle_N = 0;
	}
	else if(angle_err<Angle_E[1])  //2
	{
		Angle_Fzy[0] = (Angle_E[1]-angle_err)/(Angle_E[1]-Angle_E[0]);
		angle_N = 0;
	}
	else if(angle_err<Angle_E[2])  //3
	{
		Angle_Fzy[0] = (Angle_E[2]-angle_err)/(Angle_E[2]-Angle_E[1]);
		angle_N = 1;
	}
	else
	{
		Angle_Fzy[0] =0;//4
		angle_N =1;
	}
	Angle_Fzy[1] = 1.0 - Angle_Fzy[0];//�����������ֵ

  /*----- Pre_dirr �仯������������-----*/
   if(gyro_err<Gyro_E[0])//��������Y������С��40ʱ����Ӧ��������������������Ϊ1����������ģ���ȼ�Ϊ0��
	{
		Gyro_Fzy[0] =1;
		gyro_N = 0;
	}
	else if(gyro_err<Gyro_E[1])//��������Y������С��70ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ0������ʱΪ40�����ε��ұ�һ��
	{
		Gyro_Fzy[0] = (Gyro_E[1] - gyro_err)/(Gyro_E[1]-Gyro_E[0]);
		gyro_N = 0 ;
	}
	else if(gyro_err<Gyro_E[2])//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
	{
		Gyro_Fzy[0] = (Gyro_E[2] - gyro_err)/(Gyro_E[2]-Gyro_E[1]);
		gyro_N = 1;
	}
	else                     //��������Y�����ݴ���160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε��ұ�һ��
	{
		Gyro_Fzy[0] =0.0;
		gyro_N = 1;
	}
	//һ�������������������Ⱥ����ж�Ӧ�����������������е������ȣ����������Ⱥ�Ϊ1
	Gyro_Fzy[1] = 1.0 - Gyro_Fzy[0];

	/*��ѯģ�������*/
	//����ʱ�򲻵�����ѯһ�����򣬶�������������չ��һ�����������β�ѯ
	num =rule[gyro_N][angle_N];
	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[0];

	num =rule[gyro_N+1][angle_N];
	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[0];

	num =rule[gyro_N][angle_N+1];
	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[1];

	num =rule[gyro_N+1][angle_N+1];
	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[1];

	/*������ķ���ģ��*/
	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2];
  return(fuzzy_P);
}
