#include "Fuzzy_ZS2.h"
#include "allHead.h"
//extern float speed_set; 
//��άģ������ϵͳ
//���룺��ֵ���ٶȣ�������x
//���������P,D,������D
//�ٶ�=�����/2

//����С����ʵ���ٶ���������Y�����ݣ������������P
//float speed_set_Low,speed_set_Mid,speed_set_High;
//float  Angle_E[3]  = {5,10,15};   //С���ٶ�
//float  Gyro_E[3] = {10,15,30};	   //���ٶ�����
//float  Shell_P[3]  = {10,15,40};  //����������ϵ��
//��������ֵ             0           1         
//                      20           40        60
//float Speed_E[3]={speed_set-50,speed_set-30,speed_set-10 };   //С���ٶ�
float Speed_E[5]={30,40,50,60,70 };   //С���ٶ�
float Chazhi_E[5]={30,45,60,75,95};	   //���ٶ�����
float Shell_P[5]={180,220,260,300,380};  //����������ϵ��

//�����������ݾ�Ϊ�������ݣ��ʹ�����ⶨΪ����
//  int rule2[3][3]=
//        {       
//          {2,1,0},
//          {1,1,0},
//          {0,0,0},    
//        };
//          {0,1,2},              //30
//          {1,1,2},              //45
//          {2,2,2},              //90
 int rule2[5][5]=
        {
//  �ٶ�  10 20 30 40 60   
//                             ��ֵ      
          {0,1,2,3 ,4},              //30
          {1,1,2,3 ,4},              //45
          {2,2,3,3 ,4},              //60
          {3,3,3,4 ,4},              //75
          {4,4,4,4 ,4},              //90
          
          
          
        };                    


 
//float Fuzzy_Shell_P(float E_angle,float E_gyro)
float Fuzzy_Shell_P(float speed_car,float Chazhi)
{
//  float  angle_err=0,gyro_err=0;
  float  Speed_abs=0,Chazhi_abs=0;
  int speed_N=0,Chazhi_N=0; //��������ֵ��������ֵΪX�ᵵλ
  int  num=0;
  float fuzzy_P=0;
   //��¼�������������ֵ
  float  Speed_Fzy[2] ={0.0,0.0};
  float  Chazhi_Fzy[2] ={0.0,0.0};

  float  Shell_P_Fzy[5] ={0.0,0.0,0.0,0.0,0.0};
  // /*----- ���ݸ���-----*/
  // Shell_P[1]  = P_Direction_low;
  // Shell_P[2]  = P_Direction_high;


  //������ȡ����ֵ�����ݵ���������������	
//	ABS_val(E_angle,angle_err);
//	ABS_val(E_gyro,gyro_err);
  Chazhi_abs=abs_f(Chazhi);
//  Speed_abs=abs_f(speed_car);
  /*-----   Angle ������������-----*/
	if(speed_car<Speed_E[0]) //�ٶ�<0��
	{
		Speed_Fzy[0] =1.0;//�ٶȵ͵�������Ϊ1
		speed_N = 0;//�ٶ�20
	}
	else if(speed_car<Speed_E[1])  //0��<�ٶ�<1��
	{//  Ϊ�ٶȵ͵�������=1���ٶ�-�ٶ�/1���ٶ�-0���ٶ�
		Speed_Fzy[0] = (Speed_E[1]-speed_car)/(Speed_E[1]-Speed_E[0]);
		speed_N = 0;//�ٶ�20
	}
	else if(speed_car<Speed_E[2])  //1��<�ٶ�<2��
	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
		Speed_Fzy[0] = (Speed_E[2]-speed_car)/(Speed_E[2]-Speed_E[1]);
		speed_N = 1;//�ٶ�40
	}
        
        else if(speed_car<Speed_E[3])  //2��<�ٶ�<3��
	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
		Speed_Fzy[0] = (Speed_E[3]-speed_car)/(Speed_E[3]-Speed_E[2]);
		speed_N = 2;//�ٶ�40
	}
        
         else if(speed_car<Speed_E[4])  //3��<�ٶ�<4��
	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
		Speed_Fzy[0] = (Speed_E[4]-speed_car)/(Speed_E[4]-Speed_E[3]);
		speed_N = 3;//�ٶ�40
	}
        
	else//�ٶ�>4��
	{//�ٶȵ�������
		Speed_Fzy[0] =0;//4
		speed_N =3;//�ٶ�40
	}
	Speed_Fzy[1] = 1.0 - Speed_Fzy[0];//�����ٶȸߺ������ֵ

        
  /*----- Pre_dirr �仯������������-----*/
   if(Chazhi_abs<Chazhi_E[0])//��ֵ<0��//��������Y������С��40ʱ����Ӧ��������������������Ϊ1����������ģ���ȼ�Ϊ0��
	{
		Chazhi_Fzy[0] =1;
		Chazhi_N = 0;
	}//��ֵ<60,
	else if(Chazhi_abs<Chazhi_E[1])//0��<��ֵ<1��//��������Y������С��70ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ0������ʱΪ40�����ε��ұ�һ��
	{
		Chazhi_Fzy[0] = (Chazhi_E[1] - Chazhi_abs)/(Chazhi_E[1]-Chazhi_E[0]);
		Chazhi_N = 0 ;
	}
	else if(Chazhi_abs<Chazhi_E[2])//1��<��ֵ<2��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
	{
		Chazhi_Fzy[0] = (Chazhi_E[2] - Chazhi_abs)/(Chazhi_E[2]-Chazhi_E[1]);
		Chazhi_N = 1;
	}
   
   else if(Chazhi_abs<Chazhi_E[3])//2��<��ֵ<3��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
	{
		Chazhi_Fzy[0] = (Chazhi_E[3] - Chazhi_abs)/(Chazhi_E[3]-Chazhi_E[2]);
		Chazhi_N = 2;
	}
   
   else if(Chazhi_abs<Chazhi_E[4])//3��<��ֵ<4��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
	{
		Chazhi_Fzy[0] = (Chazhi_E[4] - Chazhi_abs)/(Chazhi_E[4]-Chazhi_E[3]);
		Chazhi_N = 3;
	}
   
	else//��ֵ>4��                     //��������Y�����ݴ���160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε��ұ�һ��
	{
		Chazhi_Fzy[0] =0.0;
		Chazhi_N = 3;
	}
	//һ�������������������Ⱥ����ж�Ӧ�����������������е������ȣ����������Ⱥ�Ϊ1
	Chazhi_Fzy[1] = 1.0 - Chazhi_Fzy[0];

	/*��ѯģ������������*/
//����ʱ�򲻵�����ѯһ�����򣬶�������������չ��һ�����������β�ѯ
//num�����������,
//eg:�ٶ�30����ֵ45��Chazhi_N=0��speed_N=0
	num =rule2[Chazhi_N][speed_N];
	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[0];//0.5

	num =rule2[Chazhi_N+1][speed_N];
	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[0];

	num =rule2[Chazhi_N][speed_N+1];
	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[1];

	num =rule2[Chazhi_N+1][speed_N+1];
	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[1];

	/*������ķ���ģ��*/
	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2]
                +Shell_P_Fzy[3]*Shell_P[3]+Shell_P_Fzy[4]*Shell_P[4];
  return(fuzzy_P);
}
