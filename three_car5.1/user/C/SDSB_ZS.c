#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include "SDSB_ZS.h"
/******************��з�������******************************************************************************/
int16 ad_valu[5][5];
char position=1;
#define NM   3
int AD_valu[5],AD_V[5][NM],chazhi_old;
float  Chazhi,Chazhi_Last,Chazhi_Max=50,Chazhi_Min=-50;//��Ϊ1,2λ�õ�����ֵ
float  AD_inductor_Last[5]={0};
float  AD_inductor[5],sensor_to_one[5];
float  Slope_AD_1;  // �����µ����
float  max_v[5] = {2000,2000,2000,2000,2000};
char  min_v[5] = {47,47,47,47,47};  //��б궨 �ɼ�ֵ      �����������⣿������
/*�ٶ��趨30:���ɵ㣺0��,0��֮ǰ��36.��Ϊ�������ڵ�k1=1.5����ֵ��50��ʱ��ʹ�
�����ƫת�Ƕȣ���û����׼���ɵ�������ƫת�Ƕ�*/
int   Position_transit[4] = {30,30} ;  //��¼���ɵ��һ����ֵ  ???���⣿������32,38
int  AD_sum[5];
int  AD_MAX_NUM;   
int  position_back = 1;
float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
/*------------------------------------------------------------------------------------------*/
/**************�жϵ�·��Ϣ����1****************************************************************/
int StraightRoad=0,StraightRoad2=0,StraightRoad_Old=0;//С��ֱ�ߴ���
int WindingRoad_Left = 0,WindingRoad_Right = 0;//С����ת,��ת����


float Road_Remember[P]={0};//��ֵ���棬�����жϵ�·��Ϣ
int StraightRoad_Flag = 0;//ֱ����־
int WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//��ת,��ת��־ 
/*             �жϵ�·��Ϣ����2                   */
//Road_Remember2[M]:[]�������Խ��ֵ��״̬Խ��
float Road_Remember2[M]={0},//��ֵ���棬�����жϵ�·��Ϣ
      Abs_sum_Chazhi=0,//50����ֵ�ľ���ֵ�ܺ�
      Alg_sum_Chazhi=0,//50����ֵ�Ĵ����ܺ�
      
      Abs_new_Chazhi=0,//����20����ֵ�ľ���ֵ�ͣ����ڼ�����
      Alg_new_Chazhi=0,//����20����ֵ�Ĵ�����
      
      Abs_old_Chazhi=0,
      Alg_old_Chazhi=0; 
/*******************END*************************************************************************************/

/*              ����       �е��     �ҵ��  
ƽʱֱ��         35           90          35
����������       45           100         62  
                 49          100          75
���������       80           100         92
��е��������   74           100         98    
ǰ�ֵ��������   48           100          
*/
/******************��������*************************************************/
//  100,0.5s  

int Circle_Flag=0,//  Բ�������־��=1Բ��˫��ʶ�������=2ʶ��ת��ʱ��
    Circle_L_Flag,Circle_R_Flag,//Բ����/��ת��־

    Circle_Count=0,//  ����Բ��˫�߼���
    Circle_Count_Max=2,//30,0.25s�� Բ��˫�߼������ֵ  
    Circle_Count2=0,// ��Բ��˫�߼���
    Circle_Count2_Max=2,//30,0.25s�� Բ��˫�߼������ֵ
    Circle_Count3=0,//Բ��ת��ʱ�̼���
    Circle_Count3_Max=2,//Բ��ת��ʱ�̼������ֵ

    Circle_L_Count=0,Circle_R_Count=0,//Բ����/��ת���� 
    Circle_Turn_Count=2,//Բ����/��ת�������ֵ
    Circle_Error_Count=0,
    Circle_Error_Count_Max=10000,
    Circle_Error_Flag=0,
    
    Circle_L_Finish_Count=0,Circle_R_Finish_Count=0,// Բ����/��ת��������
    Circle_Finish_Count_Max=160;//400:1s,// Բ����/��ת�����������ֵ

//        ����Բ��˫���е��ֵ   ת��ʱ���е��ֵ      ת������ۼ����ҵ��ֵ����˫��      ��˫��
float  Circle_Inductor_value1=175,
        Circle_Inductor_value2=165,
        Circle_Inductor_value3=140,
       Circle_inductor_Max=165,Circle_inductor_Max2=175,//190
        Circle_inductor_Mid=150, Circle_inductor_Mid2=170,
        Circle_inductor_Min=105,Circle_inductor_Min2=120;
/******************��������END*************************************************/

void Test_Huandao()
{
//  ״̬      ��     ��     ��   ����  ���� 
//  ���      2000  1600   2000  2000  2000
//                               400(13)   400(13)    
//  ����      825   1600   825   170(10)   170(10)
//  ������ ���������˲�
//  if(AD_inductor[0]>45&&AD_inductor[1]>80&&AD_inductor[2]>45)//��
//    Chazhi=Chazhi/10;
//  if(AD_inductor[1]>75&&(AD_inductor[0]>75||AD_inductor[2]>75))//������������֮��ʱ����
//    Chazhi=Chazhi/10; 
//   if(Circle_Flag>0)
//   {
//      if(AD_inductor[1]>105&&AD_inductor[1]<Circle_inductor_Max)//ʶ����뵽����˫��֮ǰ֮��
//         {
////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
////       Chazhi=0; 
//           if(AD_inductor[3]>AD_inductor[4]) //100       
//              Circle_R_Count++; 
//           if(AD_inductor[4]>AD_inductor[3]) //100       
//              Circle_L_Count++;    
//    }
//   }  
                     //100
//    if(AD_inductor[1]>120&&AD_inductor[1]<Circle_inductor_Mid2)//ʶ����뵽����˫��֮ǰ֮��
//    {
////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
////       Chazhi=0; 
//       if(AD_inductor[0]>90) //100       
//         Circle_R_Count++; 
//       if(AD_inductor[2]>90)  //100      
//         Circle_L_Count++;    
//    }
//    
//     if(AD_inductor[0]>70&&AD_inductor[1]>90&&AD_inductor[2]>70||
//        AD_inductor[1]>85&&(AD_inductor[0]>80||AD_inductor[2]>80))//��
  //2000,100;2500,125;3000,150;3500,175
  if(Circle_Flag==0)
  {
      if(AD_inductor[1]>Circle_Inductor_value1)
      {
              Circle_Count++;//����˫�߼���   
              if(Circle_Count>Circle_Count_Max)
              {
                  Circle_Flag=1; //���뻷��˫��
                  Circle_Count=0;
              }
      }
  }
  
  
  if(Circle_Flag==1)
  {
        if(AD_inductor[1]<Circle_Inductor_value2)      
                Circle_Count2++;//�뿪����˫�߼���
     
        if(Circle_Count2>Circle_Count2_Max)

        {
             Circle_Flag=2; //�뿪����˫�߱�־
             Circle_Count2=0;
        }

  }

   if(Circle_Flag==2)
   {
//      if(AD_inductor[0]>Circle_inductor_Min2) //100       
//         Circle_R_Count++; 
//       if(AD_inductor[2]>Circle_inductor_Min2)  //100      
//         Circle_L_Count++;   
       if(AD_inductor[3]>AD_inductor[4]) //100       
          Circle_R_Count++; 
       if(AD_inductor[4]>AD_inductor[3]) //100       
          Circle_L_Count++; 
       
       if(AD_inductor[1]<Circle_Inductor_value3)//150
        {
//          Circle_Count3++;//Բ��ת��������ۼ�Ϊ�˱����������У�����˫����ǰ����
//          if(Circle_Count3>Circle_Count3_Max)
//          {
//          Circle_Count3=0;
             Circle_Flag=3;//ת��ʶ�������ת����
//          }
        }
   }
   
   if(Circle_Flag==3)
   {      
      if(Circle_Error_Flag==0)//��ֹ��/��ת����Ϊ���ֵ�䷴��������/��ת��
      {
         if(Circle_L_Count>Circle_R_Count)
         {
          Circle_L_Count=0;
          Circle_R_Count=0;
          
           Circle_L_Flag=1;
           Circle_Error_Flag=2;
         }
         else
         {
            Circle_L_Count=0;
            Circle_R_Count=0;
          
            Circle_R_Flag=1;
            Circle_Error_Flag=1;
         }
           
      }
   }
      if(Circle_L_Flag==1)
      {
          Chazhi = 60;
          Circle_L_Finish_Count++;
          LED_2_ON;
//          BUZZER_ON;
      }
      if(Circle_R_Flag==1)
      {
           Chazhi =-60;
           Circle_R_Finish_Count++;      
           LED_1_ON;
//                     BUZZER_ON;

      }
    
    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)
    {
      Circle_Count=0;
      Circle_Count2=0;
      Circle_L_Finish_Count=0;
      Circle_R_Finish_Count=0;
      Circle_L_Count=0;
      Circle_R_Count=0;
      
      Circle_L_Flag=0;
      Circle_R_Flag=0;
     Circle_Flag=4;
    }
  
   
   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//��ֹ���м���
      {
         Circle_Error_Count++;
         if(Circle_Error_Count>Circle_Error_Count_Max)
         {
            Circle_Error_Flag=0;//ת�����н��
            Circle_Error_Count=0;
//                 Circle_Flag=0;
         }      
      }   

}
/*************************************************************************
������ݷ���
*************************************************************************/
void Inductor_analyse()
{
     int16  i,max_front=0;//max_back
     static int16 max_old = 1,max_crosstalk = 1;
     static int16 position_last = 1;
     float  sensor_1;

     Read_ADC();

     Inductor_Check();//��������СֵУ�� 
     
/*********************��һ������********************/
     for(i=0;i<5;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
//      if(sensor_to_one[i]>1.0)  sensor_to_one[0]=1.0;
        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
     }
/*******1�ŵ�������һ���������µ����********/
      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
      Slope_AD_1 = 100 * sensor_1;
/***********�ҳ���ǿ�Ĵ�����**********************/
       for(i=0;i<3;i++)                 
       {
         if(AD_inductor[max_front]<AD_inductor[i])
           max_front=i;
       }
       max_value=AD_inductor[max_front];  //�����ֵ
/**************����ʱ���ֵȡ��ֵ***************/
       if(max_value < 5)//?           
       {
         max_front=max_old;
         max_value=AD_inductor[max_front];
       }
       else
         max_old=max_front;
/********������***************/
       if(abs_inductor(max_front - max_crosstalk) < 2)  
       {
            max_crosstalk = max_front;
       }
       else
            max_front = max_crosstalk;
/****************λ�ý��㣬������̵�ֵ�ù�һ���Ŵ���ֵ************************/
       position_last = position;
        if(max_front==0 && (AD_inductor[1] <= Position_transit[0]&&AD_valu[0]>500 ))  //�Ѿ�ƫ��0�Ŵ�����
       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
             position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
//             LED_1_ON;
 //          AD_0_max = AD_inductor[0];//zs��
       }
       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //���λ��  0-1�Ŵ�����֮��
       {//�ҵ������Ҵ�ʱ�е�е�ֵ>���ɵ�0ʱ�е�е�ֵ||�е��������ҵ�е�ֵ>���е�ֵ
           //      �е���ڵ�������                            �е���ڵ�������
             position=1;//�е���ڵ�������,С��ƫ��(���С�����ϲ����ڵ������ߵ�����ȫ��)
             AD_0_max = AD_inductor[0]; //��¼�´�ʱ��0�Ŵ������Ĺ�һ�Ŵ���ֵ
       }
       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //�Ҳ�λ��  1-2�Ŵ�����֮��
       {//�е����������е�ֵ�����ҵ�е�ֵ||��������Ҵ�ʱ�е�е�ֵ>���ɵ�1ʱ�е�е�ֵ
        //    �е���ڵ�����ұ�                         �е���ڵ�����ұ�          
             position=2;//�е���ڵ�����ұ�,С��ƫ��(���С�����ϲ����ڵ�����ұߵ�����ȫ��)
             AD_2_max = AD_inductor[2]; //��¼�´�ʱ��3�Ŵ�������һ�Ŵ���ֵ
       }
       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] &&AD_valu[2]>500))  //�Ѿ�ƫ��3�Ŵ�����
       {//��������Ҵ�ʱ���е��ֵ<=���ɵ�1ʱ�е�е�ֵ
             position = 3;//�����ڵ�����ҷ�������С�����ڵ�����ҷ�
//                          LED_2_ON;
        // AD_2_max = AD_inductor[2];//zs��

       }   
       else 
       {
         position=position_last;
       }
/*λ�÷�������󣬱���ǰ1msС�����ڵ������ߣ���1msС��ƫ��*/  
       if(abs_inductor(position - position_last) > 1)  //λ���������ʱ���� 
       {
            position = position_last;//�˿�С��λ��ת��Ϊ��һ��С��λ��
       }
       else
       {
       position_last = position;//������¼�����������ϴ�С��λ��=�˿�С��λ��
       }   
/*************����ƫ����*************/
  Chazhi_Last=Chazhi;
  
       if(position == 0)   //��ඪ��
       {
//           Chazhi =Chazhi_Min-abs_f(Chazhi_Min+AD_inductor[0]);//Ŀǰ�ò�����ֵ50,60���ϵ�
         Chazhi =-60;
       }
       else if(position == 1 || position == 2) //�����м�λ��        
       {
         Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//         AD_inductor_Last[0]=AD_inductor[0];
//         AD_inductor_Last[2]=AD_inductor[2];
//         if(Chazhi>Chazhi_Max)
//           Chazhi_Max=Chazhi;
//         if(Chazhi<Chazhi_Min)
//           Chazhi_Min=Chazhi;
//         if(AD_inductor[3]>20&&AD_inductor[4]<1&&AD_inductor[3]>abs_f(Chazhi)   )    
//            Chazhi=-AD_inductor[3]; 
//         if(AD_inductor[4]>20&&AD_inductor[3]<1&&AD_inductor[4]>Chazhi   )    
//            Chazhi=AD_inductor[4]; 
       }
       else if(position == 3)  //�Ҳඪ��
       {
//           Chazhi =Chazhi_Max+abs_f(Chazhi_Max-AD_inductor[2]);//Ŀǰ�ò�����ֵ50,60���ϵ�
          Chazhi = 60;
       }
     
   
     

}
/*************************************************************************************************************
����������ֱ��
******************************************************/
void Test_RoadInfo(void) 
{
  StraightRoad_Old = StraightRoad;
   
  for(int8_t i = 0;i < P-1; i++)   //�����и��µ�������ǰ��1λ
  {
      Road_Remember[i] = Road_Remember[i+1];
  }
  Road_Remember[P-1] = Chazhi;	//��ֵΪ��м��ֵ-100~100
  
  StraightRoad=0;;//С��ֱ�ߴ���
  WindingRoad_Left = 0;WindingRoad_Right = 0;//С����ת,��ת����
  
  for(int8_t i = 0;i < P; i++)
  {        
    if(Road_Remember[i] > -20 && Road_Remember[i] < 20)	//��-35~35��Χ�ڣ���֤��ֵ��λ�õ����Թ�ϵ
    {
      StraightRoad++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
    }
 //else if(g_AD_Remember[i] > -45 && g_AD_Remember[i] < 45)				//��-35~35��Χ�ڣ���֤Mid_AD_value��λ�õ����Թ�ϵ
 //{
 //  StraightRoad2++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
 //}		
    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -20)//100,38
   {
     WindingRoad_Right++;		//�ж�����ȶ���---��ת�ۼ�
   }
   else if(Road_Remember[i] >= 20 && Road_Remember[i] <= 300)
   {
      WindingRoad_Left++;		//�ж�����ȶ���---��ת�ۼ�
   }
    
  }
  StraightRoad_Flag = 0;//ֱ����־
  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//��ת,��ת��־                 
  if(StraightRoad >= 80)
  {
  StraightRoad_Flag = 1;
  }
  if(WindingRoad_Left >= 10)//50
  {
    WindingRoad_Left_Flag = 1;
  }
  if(WindingRoad_Right >= 10)
  {
    WindingRoad_Right_Flag = 1;
  }       
}


/*************************************************************************************************************
����������ֱ��:����������ֱ���
******************************************************/
void Test_RoadInfo_Shuzhi(void) 
{
  StraightRoad_Old = StraightRoad;
#define SZ 20
float Road_Remember_RI[SZ]={0},Road_Remember_LI[SZ]={0}; 

  for(int8_t i = 0;i < SZ-1; i++)   //�����и��µ�������ǰ��1λ
  {
      Road_Remember_RI[i] = Road_Remember_RI[i+1];
  }
  Road_Remember[SZ-1] = AD_inductor[3];	
  
   for(int8_t i = 0;i < SZ-1; i++)   //�����и��µ�������ǰ��1λ
  {
      Road_Remember_LI[i] = Road_Remember_LI[i+1];
  }
  Road_Remember[SZ-1] = AD_inductor[4];	
  
  StraightRoad=0;;//С��ֱ�ߴ���
  WindingRoad_Left = 0;WindingRoad_Right = 0;//С����ת,��ת����
  
  for(int8_t i = 0;i < SZ; i++)
  {      	
      if(Road_Remember_RI[i]>20&&Road_Remember_LI[i]<1)//100,38
      {
          WindingRoad_Right++;		//�ж�����ȶ���---��ת�ۼ�
      }
      else if(Road_Remember_LI[i] >20 && Road_Remember_RI[i] <1)//100,38
      {
          WindingRoad_Left++;		//�ж�����ȶ���---��ת�ۼ�
      }
      else 
      {
          StraightRoad++; 
      }         
  }
  
  StraightRoad_Flag = 0;//ֱ����־
  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//��ת,��ת��־                 
  
  if(StraightRoad >= 15)
  {
  StraightRoad_Flag = 1;
  }
  if(WindingRoad_Left >= 5)//50
  {
    WindingRoad_Left_Flag = 1;
  }
  if(WindingRoad_Right >= 5)
  {
    WindingRoad_Right_Flag = 1;
  }       
}








/*******************ȷ����������Сֵ**********************************************************************************/
void Inductor_Check(void)
{
  //��ʼ���ֵ�˲�:ȷ����͵��ֵ
if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500)
    {
      if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&
      AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5)
         {
            min_v[0]=AD_valu[0];
            min_v[1]=AD_valu[1];
            min_v[2]=AD_valu[2];
         }    
    }

if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500&&AD_valu[3]<500&&AD_valu[4]<500)
    {
      if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&AD_valu[1]-AD_valu[3]<5&&AD_valu[1]-AD_valu[4]<5&&
      AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[3]>-5&&AD_valu[1]-AD_valu[4]>-5)
         {
            min_v[0]=AD_valu[0];
            min_v[1]=AD_valu[1];
            min_v[2]=AD_valu[2];
            min_v[3]=AD_valu[3];
            min_v[4]=AD_valu[4];
         }    
    }
//������ֵȷ������ֹʵ�������ֵƫ��
if(Circle_Flag==0)
  {
     if(AD_inductor[1]<90)
     {
        if(AD_valu[0]>max_v[0]) max_v[0]=AD_valu[0];//�����ֵ���
        if(AD_valu[2]>max_v[2]) max_v[2]=AD_valu[2];
        if(AD_valu[3]>max_v[3]) max_v[3]=AD_valu[3];
        if(AD_valu[4]>max_v[4]) max_v[4]=AD_valu[4];
     }
  }
}
//�����Сֵȷ������ֹʵ�������ֵƫС��û�����


///ȡ����ֵ
uint16 abs_i(int value)
{
    if(value<0)
      value=-value;
    return value;
}



/************************************************************************************************************************************************************************************************************************************
����������ֱ��
5.6�� �������
��ƣ������ǰհ��С�� S ����������ѣ� S ���Ĵ���ĺû��������ٶ��нϴ�
��Ӱ�졣 ���������£���ʼ��һ������Ϊ 50 �����飬��¼ÿ�ε������ȣ���
̬�������顣Ȼ��� 50 �����������ֵ�ͺʹ�����,��������;���ֵ��С��
����ֱ������������ͺ;���ֵ�ͽ�С������ǰ 20 �����ݽϴ�������ж�
С���ڳ��䣬��������ͺ;���ֵ�ͽ�С���� 20 �ϴ����ж�С�������䣬��
�������ͺ�С��������ֵ�ͺܴ����� s ������������ԣ� ��Ȼ��һ���ͺ��ԣ�
�����Լ������ơ���������㷨���Էǳ��õĴ��������

���ƣ��Թ����ٶȵĴ���ʽȷ��Ϊ��
����ʱ�����٣��Եõ��㹻�ĵ���ʱ�䣬�����ȷ��ת��Ƕȣ���������ʵ�
���٣������ֽǶȲ��䣬Ϊ����ʱ�ļ��ٽ�Լʱ�䣻����ʱ����׼ȷ�жϱ�־��
Ȼ����٣���Ȼ��ķ�һЩʱ�䣬���������������������Լ����жϳ����
���ʣ���֤��ʻ״̬���ȶ��ԣ���������ڵ����޼��ٶԺ��������Ҳ�кܴ�
�İ������ۺϿ����ÿ��Խ��յĶ���ʱ�任����ʻ�ȶ��Ի���ֵ�õ�
******************************************************************************************************************************/

//void Test_RoadInfo2(void) 
//{
//  StraightRoad_Old = StraightRoad;
//   
//  for(int8_t i = 0;i <M-1; i++)   //�����и��µ�������ǰ��1λ
//  {
//      Road_Remember2[i] = Road_Remember[i+1];
//  }
//  Road_Remember2[M-1] = Chazhi;	//��ֵΪ��м��ֵ-100~100
//  
//  for(int8_t i = 0;i<20;i++)  
//  {
//      Abs_old_Chazhi+= abs_f(Road_Remember2[i]);
//      Alg_old_Chazhi+=Road_Remember2[i];
//  }
//  for(int8_t i = 30;i<M;i++)  
//  {
//      Abs_new_Chazhi+= abs_f(Road_Remember2[i]);
//      Alg_new_Chazhi+=Road_Remember2[i];
//  }
//   for(int8_t i = 20;i<30;i++)  
//  {
//      Abs_sum_Chazhi+= abs_f(Road_Remember2[i]);
//      Alg_sum_Chazhi+=Road_Remember2[i];
//  }
//  
//  Abs_sum_Chazhi+=Abs_new_Chazhi+Abs_old_Chazhi;
//  Alg_sum_Chazhi+=Alg_new_Chazhi+Alg_old_Chazhi;
//  
//  Chazhi_Acc_Zhi=250,//50*5
//  Chazhi_Acc_Wan=400,//20*20
//
//  if(Abs_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi>-Chazhi_Acc_Zhi)
//  {
//       StraightRoad_Flag = 1;
//  }
//  
//   if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi>Chazhi_Acc_Wan)
//  {
//      WindingRoad_Left_Flag = 1;
//  } 
//  if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
//  {
//      WindingRoad_Right_Flag = 1;
//  }
//  
//  if(Abs_old_Chazhi<Chazhi_Acc_Wan&&Alg_old_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
//  {
//      WindingRoad_Left_Flag = 1;
//  }

//  
////  StraightRoad=0;;//С��ֱ�ߴ���
////  WindingRoad_Left = 0;WindingRoad_Right = 0;//С����ת,��ת����
//  
//  for(int8_t i = 0;i < 100; i++)
//  {        
//    if(Road_Remember[i] > -40 && Road_Remember[i] < 40)	//��-35~35��Χ�ڣ���֤��ֵ��λ�õ����Թ�ϵ
//    {
//      StraightRoad++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
//    }
// //else if(g_AD_Remember[i] > -45 && g_AD_Remember[i] < 45)				//��-35~35��Χ�ڣ���֤Mid_AD_value��λ�õ����Թ�ϵ
// //{
// //  StraightRoad2++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
// //}		
//    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -40)//100,38
//   {
//     WindingRoad_Right++;		//�ж�����ȶ���---��ת�ۼ�
//   }
//   else if(Road_Remember[i] >= 40 && Road_Remember[i] <= 300)
//   {
//      WindingRoad_Left++;		//�ж�����ȶ���---��ת�ۼ�
//   }
//    
//  }
//  StraightRoad_Flag = 0;//ֱ����־
//  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//��ת,��ת��־                 
//  if(StraightRoad >= 95)
//  {
//  StraightRoad_Flag = 1;
//  }
//  if(WindingRoad_Left >= 5)//50
//  {
//    WindingRoad_Left_Flag = 1;
//  }
//  if(WindingRoad_Right >= 5)
//  {
//    WindingRoad_Right_Flag = 1;
//  }       
//}




