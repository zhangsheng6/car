#include "Fuzzy_ZS.h"

int rule[7][7]={  //�Ƕȵȼ���
// -45  -30 -15  0  15  30  45C_R
// -3   -2  -1   0   1   2  3   �ȼ�    CHa 
{  -3,  -3, -3, -2, -1, -1,-1 }, //  -3 -45
{  -3,  -3, -2, -2, -1,  0, 1 }, //  -2 -30  //������
{  -2,  -2, -1, -1,  0,  1, 1 }, //  -1 -15
{  -2,  -1, -1,  0,  0,  1, 2 }, //   0  0
{  -1,  -1,  0,  1,  1,  2, 2 }, //   1  15
{  -1,   0,  1,  1,  2,  3, 3 }, //   2  30
{   0,   1,  1,  2,  3,  3, 3 }  //   3  45
};
int   Angle_Grade[4]={0};//�Ƕȵȼ�
int   Angle_Grade2[4]={0};//�Ƕȵȼ�

//        �Ƕȵȼ� -3  -2  -3  0 1   2  3
float Angle_Set[7]={-60,-45,-22.5,0,22.5,45,60};//�Ƕ��趨/�Ƕ�������
float Angle_Fuzzy[4]={0};//�Ƕ�������
    

// ~-45 -45~-30 -30~-15 -15~0  0~15 15~30 30~45 45~
//   -3   -3       -2     -1    1     2    3     3
int   Chazhi_Grade=0;//��ֵ�ȼ�
//                     NB   NM   NS  ZO PS  PM  PB
float Chazhi_Set[7]=  {-45, -30, -15, 0, 15, 30, 45};//��ֵ�趨
float Chazhi_Fuzzy[2]={ 0 ,  0};//��ֵ�趨������


float Chazhi_Rate=0;
int   Chazhi_Rate_Grade=0;//��ֵ�仯�ʵȼ�
//float Chazhi_Rate_Set[7]={-45,-30,-,0,15,30,45,};//��ֵ�仯���趨
float Chazhi_Rate_Set[7]={-90,-70,-40,0,40,70,90,};//��ֵ�仯���趨
float Chazhi_Rate_Fuzzy[2]={0};//��ֵ�仯��������

float t1=0,t2=0,t3=0,t4=0,temp1=0,temp2=0;




float Fuzzy_Control_Direction()
{
// float NB,NM,NS,ZO,PS,PM,PB;

//Chazhi=1.5*Chazhi;
/***************��ֵģ����****************************************************/
 if(Chazhi<Chazhi_Set[0])//Chazhi<-45
   {
    Chazhi_Fuzzy[0]=1;
    Chazhi_Grade=-2;
   }
 else if(Chazhi<Chazhi_Set[1])//-45<Chazhi<-30
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[1]-Chazhi)/(Chazhi_Set[1]-Chazhi_Set[0]);
//    Chazhi_Fuzzy[1]=(Chazhi-Chazhi_Set[0])/(Chazhi_Set[1]-Chazhi_Set[0]);
    Chazhi_Grade=-2;
  }
 else if(Chazhi<Chazhi_Set[2])//-30<Chazhi<-15
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[2]-Chazhi)/(Chazhi_Set[2]-Chazhi_Set[1]);
//    Chazhi_Fuzzy[2]=(Chazhi-Chazhi_Set[1])/(Chazhi_Set[2]-Chazhi_Set[1]);
    Chazhi_Grade=-1;
  } 
 else if(Chazhi<Chazhi_Set[3])//-15<Chazhi<0
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[3]-Chazhi)/(Chazhi_Set[3]-Chazhi_Set[2]);
//    Chazhi_Fuzzy[3]=(Chazhi-Chazhi_Set[2])/(Chazhi_Set[3]-Chazhi_Set[2]);
    Chazhi_Grade=0;
  }
  else if(Chazhi<Chazhi_Set[4])//0<Chazhi<15
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[4]-Chazhi)/(Chazhi_Set[4]-Chazhi_Set[3]);
//    Chazhi_Fuzzy[4]=(Chazhi-Chazhi_Set[3])/(Chazhi_Set[4]-Chazhi_Set[3]);
    Chazhi_Grade=1;
  } 
 else if(Chazhi<Chazhi_Set[5])//15<Chazhi<30
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[5]-Chazhi)/(Chazhi_Set[5]-Chazhi_Set[4]);
//    Chazhi_Fuzzy[5]=(Chazhi-Chazhi_Set[4])/(Chazhi_Set[5]-Chazhi_Set[4]);
    Chazhi_Grade=2;
  }
 else if(Chazhi<Chazhi_Set[6])//30<Chazhi<45
  {
    Chazhi_Fuzzy[0]=(Chazhi_Set[6]-Chazhi)/(Chazhi_Set[6]-Chazhi_Set[5]);
//    Chazhi_Fuzzy[6]=(Chazhi-Chazhi_Set[5])/(Chazhi_Set[6]-Chazhi_Set[5]);
    Chazhi_Grade=3;
  }
  else //Chazhi>45
  {
    Chazhi_Fuzzy[0]=1;
    Chazhi_Grade=3;
  }
  Chazhi_Fuzzy[1]=1-Chazhi_Fuzzy[0];
/*****************************************************************************************/

/***************��ֵ�仯��ģ����****************************************************/
//��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
//��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
 Chazhi_Rate=Chazhi-Chazhi_Last;

 if(Chazhi_Rate<Chazhi_Rate_Set[0])//Chazhi_Rate<-45
   {
    Chazhi_Rate_Fuzzy[0]=1;
    Chazhi_Rate_Grade=-2;
   }
 else if(Chazhi_Rate<Chazhi_Rate_Set[1])//-45<Chazhi_Rate<-30
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[1]-Chazhi_Rate)/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
    Chazhi_Rate_Grade=-2;
  }
 else if(Chazhi_Rate<Chazhi_Rate_Set[2])//-30<Chazhi_Rate<-15
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[2]-Chazhi_Rate)/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
    Chazhi_Rate_Grade=-1;
  } 
 else if(Chazhi_Rate<Chazhi_Rate_Set[3])//-15<Chazhi_Rate<0
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[3]-Chazhi_Rate)/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
    Chazhi_Rate_Grade=0;
  }
  else if(Chazhi_Rate<Chazhi_Rate_Set[4])//0<Chazhi_Rate<15
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[4]-Chazhi_Rate)/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
    Chazhi_Rate_Grade=1;
  } 
 else if(Chazhi_Rate<Chazhi_Rate_Set[5])//15<Chazhi_Rate<30
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[5]-Chazhi_Rate)/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
    Chazhi_Rate_Grade=2;
  }
 else if(Chazhi_Rate<Chazhi_Rate_Set[6])//30<Chazhi_Rate<45
  {
    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[6]-Chazhi_Rate)/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
    Chazhi_Rate_Grade=3;
  }
  else //Chazhi_Rate>45
  {
    Chazhi_Rate_Fuzzy[0]=1;
    Chazhi_Rate_Grade=3;
  }
  Chazhi_Rate_Fuzzy[1]=1-Chazhi_Rate_Fuzzy[0];
/*****************************************************************************************/

 /*ʹ����Χ�Ż���Ĺ����rule[7][7]*/ 
 /*���ֵʹ��13����������,����ֵ��UFF[7]ָ��*/ 
 /*һ�㶼���ĸ�������Ч*/ 
//int rule[7][7]={  //�Ƕȵȼ���
//// -45  -30 -154 0  15  30  45C_R
//// -3   -2  -1   0   1   2  3   �ȼ�    CHa 

//{  -3,  -3, -3, -2, -1, -1,-1 }, //  -3 -45
//{  -3,  -3, -2, -2, -1,  0, 1 }, //  -2 -30  //������
//{  -2,  -2, -1, -1,  0,  1, 1 }, //  -1 -15
//{  -2,  -1, -1,  0,  0,  1, 2 }, //   0  0
//{  -1,  -1,  0,  1,  1,  2, 2 }, //   1  15
//{  -1,   0,  1,  1,  2,  3, 3 }, //   2  30
//{   0,   1,  1,  2,  3,  3, 3 }  //   3  45
//}//2.
  
Angle_Grade[0]=rule[Chazhi_Grade-1+3][Chazhi_Rate_Grade-1+3]; //�Ƕ�=��ȷ��
Angle_Grade[1]=rule[Chazhi_Grade+3][Chazhi_Rate_Grade-1+3]; 
Angle_Grade[2]=rule[Chazhi_Grade-1+3][Chazhi_Rate_Grade+3]; 
Angle_Grade[3]=rule[Chazhi_Grade+3][Chazhi_Rate_Grade+3]; 

//Angle_Grade[0]=rule[Chazhi_Grade-1+4][Chazhi_Rate_Grade-1+4]; //�Ƕ�=��ȷ��
//Angle_Grade[1]=rule[Chazhi_Grade+4][Chazhi_Rate_Grade-1+4]; 
//Angle_Grade[2]=rule[Chazhi_Grade-1+4][Chazhi_Rate_Grade+4]; 
//Angle_Grade[3]=rule[Chazhi_Grade+4][Chazhi_Rate_Grade+4]; 

 
 if(Chazhi_Fuzzy[0]<=Chazhi_Rate_Fuzzy[0])    //��С   ��ֵ����ֵ�仯�������ȱȽ�
  Angle_Fuzzy[0]=Chazhi_Fuzzy[0];        //      �Ƕ�������=С��������
 else
  Angle_Fuzzy[0]=Chazhi_Rate_Fuzzy[0];
 
 if(Chazhi_Fuzzy[1]<=Chazhi_Rate_Fuzzy[0])
  Angle_Fuzzy[1]=Chazhi_Fuzzy[1];
 else
  Angle_Fuzzy[1]=Chazhi_Rate_Fuzzy[0];
 
 if(Chazhi_Fuzzy[0]<=Chazhi_Rate_Fuzzy[1])
  Angle_Fuzzy[2]=Chazhi_Fuzzy[0];
 else
  Angle_Fuzzy[2]=Chazhi_Rate_Fuzzy[1];
 
 if(Chazhi_Fuzzy[1]<=Chazhi_Rate_Fuzzy[1])
  Angle_Fuzzy[3]=Chazhi_Fuzzy[1];
 else
  Angle_Fuzzy[3]=Chazhi_Rate_Fuzzy[1];

 /*ͬ���������������ֵ���*/ 
 if(Angle_Grade[0]==Angle_Grade[1]) //��ȷ�� �Ƕ�==�Ƕ�
 {
   if(Angle_Fuzzy[0]>Angle_Fuzzy[1])   //�����ȱȽ�:����С��
  Angle_Fuzzy[1]=0;          //
  else
  Angle_Fuzzy[0]=0;
 }
 
 if(Angle_Grade[0]==Angle_Grade[2])
 {
  if(Angle_Fuzzy[0]>Angle_Fuzzy[2])
  Angle_Fuzzy[2]=0;
  else
  Angle_Fuzzy[0]=0;
 }
 
 if(Angle_Grade[0]==Angle_Grade[3])
 {
  if(Angle_Fuzzy[0]>Angle_Fuzzy[3])
  Angle_Fuzzy[3]=0;
  else
  Angle_Fuzzy[0]=0;
 }
 
 if(Angle_Grade[1]==Angle_Grade[2])
 {
  if(Angle_Fuzzy[1]>Angle_Fuzzy[2])
  Angle_Fuzzy[2]=0;
  else
  Angle_Fuzzy[1]=0;
 }
 
 if(Angle_Grade[1]==Angle_Grade[3])
 {
  if(Angle_Fuzzy[1]>Angle_Fuzzy[3])
  Angle_Fuzzy[3]=0;
  else
  Angle_Fuzzy[1]=0;
 } 
 
 if(Angle_Grade[2]==Angle_Grade[3])
 {
  if(Angle_Fuzzy[2]>Angle_Fuzzy[3])
  Angle_Fuzzy[3]=0;
  else
  Angle_Fuzzy[2]=0;
 }
 for(int i=0;i<4;i++)
 {
    Angle_Grade2[i]=Angle_Grade[i]+3;
 }
 //�Ƕ������=������*�����㡾��ȷ��/�ȼ���
 t1=Angle_Fuzzy[0]*Angle_Set[Angle_Grade2[0]];  
 t2=Angle_Fuzzy[1]*Angle_Set[Angle_Grade2[1]];
 t3=Angle_Fuzzy[2]*Angle_Set[Angle_Grade2[2]];
 t4=Angle_Fuzzy[3]*Angle_Set[Angle_Grade2[3]];
 temp1=t1+t2+t3+t4;
 temp2=Angle_Fuzzy[0]+Angle_Fuzzy[1]+Angle_Fuzzy[2]+Angle_Fuzzy[3];//ģ�������//���������
// angle=temp1/temp2;
// return angle;
  return temp1/temp2; 

}


















/*
/void Fuzzy_Control_Direction()
//{
//
////  Angle[]={-60,60};
//
//// float NB,NM,NS,ZO,PS,PM,PB;
//  
//  
//  
//  
//// ~-45 -45~-30 -30~-15 -15~0  0~15 15~30 30~45 45~
////   -3   -3       -2     -1    1     2    3     3
//int   Chazhi_Grade=0;//��ֵ�ȼ�
////                     NB   NM   NS  ZO PS  PM  PB
//float Chazhi_Set[]=  {-45, -30, -15, 0, 15, 30, 45};//��ֵ�趨
////                     0     1   2   3   4   5   6
//float Chazhi_Fuzzy[]={ 0 ,  0,   0,  0,  0,  0,  0};//��ֵ�趨������
//
//int   Chazhi_Rate_Grade=0;//��ֵ�仯�ʵȼ�
//float Chazhi_Rate_Set[]={-45,-30,-15,0,15,30,45,};//��ֵ�仯���趨
//float Chazhi_Rate_Fuzzy[]={0};//��ֵ�仯��������*/
/***************��ֵģ����****************************************************/
/* if(Chazhi<Chazhi_Set[0])//Chazhi<-45
//   {
//    Chazhi_Fuzzy[0]=1;
//    Chazhi_Grade=-3;
//   }
// else if(Chazhi<Chazhi_Set[1])//-45<Chazhi<-30
//  {
//    Chazhi_Fuzzy[0]=(Chazhi_Set[1]-Chazhi)/(Chazhi_Set[1]-Chazhi_Set[0]);
//    Chazhi_Fuzzy[1]=(Chazhi-Chazhi_Set[0])/(Chazhi_Set[1]-Chazhi_Set[0]);
//    Chazhi_Grade=-3;
//  }
// else if(Chazhi<Chazhi_Set[2])//-30<Chazhi<-15
//  {
//    Chazhi_Fuzzy[1]=(Chazhi_Set[2]-Chazhi)/(Chazhi_Set[2]-Chazhi_Set[1]);
//    Chazhi_Fuzzy[2]=(Chazhi-Chazhi_Set[1])/(Chazhi_Set[2]-Chazhi_Set[1]);
//    Chazhi_Grade=-2;
//  } 
// else if(Chazhi<Chazhi_Set[3])//-15<Chazhi<0
//  {
//    Chazhi_Fuzzy[2]=(Chazhi_Set[3]-Chazhi)/(Chazhi_Set[3]-Chazhi_Set[2]);
//    Chazhi_Fuzzy[3]=(Chazhi-Chazhi_Set[2])/(Chazhi_Set[3]-Chazhi_Set[2]);
//    Chazhi_Grade=-1;
//  }
//  else if(Chazhi<Chazhi_Set[4])//0<Chazhi<15
//  {
//    Chazhi_Fuzzy[3]=(Chazhi_Set[4]-Chazhi)/(Chazhi_Set[4]-Chazhi_Set[3]);
//    Chazhi_Fuzzy[4]=(Chazhi-Chazhi_Set[3])/(Chazhi_Set[4]-Chazhi_Set[3]);
//    Chazhi_Grade=1;
//  } 
// else if(Chazhi<Chazhi_Set[5])//15<Chazhi<30
//  {
//    Chazhi_Fuzzy[4]=(Chazhi_Set[5]-Chazhi)/(Chazhi_Set[5]-Chazhi_Set[4]);
//    Chazhi_Fuzzy[5]=(Chazhi-Chazhi_Set[4])/(Chazhi_Set[5]-Chazhi_Set[4]);
//    Chazhi_Grade=2;
//  }
// else if(Chazhi<Chazhi_Set[6])//30<Chazhi<45
//  {
//    Chazhi_Fuzzy[5]=(Chazhi_Set[6]-Chazhi)/(Chazhi_Set[6]-Chazhi_Set[5]);
//    Chazhi_Fuzzy[6]=(Chazhi-Chazhi_Set[5])/(Chazhi_Set[6]-Chazhi_Set[5]);
//    Chazhi_Grade=3;
//  }
//  else //Chazhi>45
//  {
//    Chazhi_Fuzzy[6]=1;
//    Chazhi_Grade=3;
//  }*/
/*****************************************************************************************/

/***************��ֵ�仯��ģ����****************************************************/
/*///��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
////��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
// Chazhi_Rate=Chazhi-Chazhi_Last;
//
// if(Chazhi_Rate<Chazhi_Rate_Set[0])//Chazhi_Rate<-45
//   {
//    Chazhi_Rate_Fuzzy[0]=1;
//    Chazhi_Rate_Grade=-3;
//   }
// else if(Chazhi_Rate_<Chazhi_Rate_Set[1])//-45<Chazhi_Rate<-30
//  {
//    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[1]-Chazhi_Rate)/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
//    Chazhi_Rate_Fuzzy[1]=(Chazhi_Rate-Chazhi_Rate_Set[0])/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
//    Chazhi_Rate_Grade=-3;
//  }
// else if(Chazhi_Rate<Chazhi_Rate_Set[2])//-30<Chazhi_Rate<-15
//  {
//    Chazhi_Rate_Fuzzy[1]=(Chazhi_Rate_Set[2]-Chazhi_Rate)/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
//    Chazhi_Rate_Fuzzy[2]=(Chazhi_Rate-Chazhi_Rate_Set[1])/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
//    Chazhi_Rate_Grade=-2;
//  } 
// else if(Chazhi_Rate<Chazhi_Rate_Set[3])//-15<Chazhi_Rate<0
//  {
//    Chazhi_Rate_Fuzzy[2]=(Chazhi_Rate_Set[3]-Chazhi_Rate)/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
//    Chazhi_Rate_Fuzzy[3]=(Chazhi_Rate-Chazhi_Rate_Set[2])/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
//    Chazhi_Rate_Grade=-1;
//  }
//  else if(Chazhi_Rate<Chazhi_Rate_Set[4])//0<Chazhi_Rate<15
//  {
//    Chazhi_Rate_Fuzzy[3]=(Chazhi_Rate_Set[4]-Chazhi_Rate)/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
//    Chazhi_Rate_Fuzzy[4]=(Chazhi_Rate-Chazhi_Rate_Set[3])/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
//    Chazhi_Rate_Grade=1;
//  } 
// else if(Chazhi_Rate<Chazhi_Rate_Set[5])//15<Chazhi_Rate<30
//  {
//    Chazhi_Rate_Fuzzy[4]=(Chazhi_Rate_Set[5]-Chazhi_Rate)/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
//    Chazhi_Rate_Fuzzy[5]=(Chazhi_Rate-Chazhi_Rate_Set[4])/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
//    Chazhi_Rate_Grade=2;
//  }
// else if(Chazhi_Rate<Chazhi_Rate_Set[6])//30<Chazhi_Rate<45
//  {
//    Chazhi_Rate_Fuzzy[5]=(Chazhi_Rate_Set[6]-Chazhi_Rate)/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
//    Chazhi_Rate_Fuzzy[6]=(Chazhi_Rate-Chazhi_Rate_Set[5])/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
//    Chazhi_Rate_Grade=3;
//  }
//  else //Chazhi_Rate>45
//  {
//    Chazhi_Rate_Fuzzy[6]=1;
//    Chazhi_Rate_Grade=3;
//  }*/
/*****************************************************************************************/

