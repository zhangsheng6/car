#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include "SDSB_ZS.h"
/******************��з�������******************************************************************************/
float  max_v[5] = {2000,2000,2000,2000,2000};
float  min_v[5] = {47,47,47,47,47};  //��б궨 �ɼ�ֵ      �����������⣿������
int   Position_transit[4] = {30,30} ;  //��¼���ɵ��һ����ֵ  ???���⣿������32,38
float Chazhi_Chucun[20]={0},Chazhi_Old=0,Rate_Count=0,Rate_Flag=0;
/******************��з�������2******************************************************************************/
int16 ad_valu[5][5];
char position=1;
#define NM   3
int AD_valu[5],AD_V[5][NM],chazhi_old,RefAd=20, Add_AD_value = 20;
float  Chazhi,Chazhi_Last,Chazhi_Max=60,Chazhi_Min=-60,Chazhi_Max_New=200;//��Ϊ1,2λ�õ�����ֵ
float  AD_inductor_Last[5]={0};
float  AD_inductor[5],sensor_to_one[5],AD_inductor_Huan,sensor_to_one_Huan;

float  Slope_AD_1;  // �����µ����
int  AD_sum[5];
int  AD_MAX_NUM;   
int  position_back = 1;
float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
/*------------------------------------------------------------------------------------------*/
/**************�жϵ�·��Ϣ����1****************************************************************/
int StraightRoad=0,StraightRoad2=0,StraightRoad_Old=0;//С��ֱ�ߴ���
int WindingRoad_Left = 0,WindingRoad_Right = 0,WindingRoad=0;//С����ת,��ת����


float Road_Remember[P]={0};//��ֵ���棬�����жϵ�·��Ϣ
int StraightRoad_Flag = 0;//ֱ����־
int WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0,WindingRoad_Flag=0;//��ת,��ת��־ 
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
/******************��������2*************************************************/
//  100,0.5s  
int 

    Circle_Flag=0,//  Բ�������־��=1Բ��˫��ʶ�������=2ʶ��ת��ʱ��
    Circle_L_Flag,Circle_R_Flag,//Բ����/��ת��־
    Circle_Turn_Old_Flag=0,

    Circle_Count=0,//  ����Բ��˫�߼���
    Circle_Count_Max=5,//30,0.25s�� Բ��˫�߼������ֵ  
    Circle_Count2=0,// ��Բ��˫��ת��ǰ����
    Circle_Count2_Max=2,//30,0.25s�� Բ��˫�߼������ֵ
    Circle_Count3=0,//Բ��ת��ʱ�̼���
    Circle_Count3_Max=2,//Բ��ת��ʱ�̼������ֵ
    Circle_Count4=0,//Բ��ת��ʱ�̼���
    Circle_Count4_Max=20,//Բ��ת��ʱ�̼������ֵ 
    Circle_Count5=0,//����˫�߼���
    Circle_Count5_Max=2,//����˫�߼������ֵ
    Circle_Count6=0,//������ֱ������
    
    
    Circle_Count_Out_Flag=0,
    Circle_Count_Out=0,//��������ٺ�,Բ��ǿ��ת������󱣻�ʱ�䣬���������
    Circle_Count_Out_Max=400,//800��2s

    Circle_L_Count=0,Circle_R_Count=0,//Բ����/��ת���� 
    Circle_Turn_Count=20,//Բ����/��ת�������ֵ20
    Circle_Turn_Count2=5,//Բ����/��ת�������ֵ20
    Circle_Error_Count=0,
    Circle_Error_Count_Max=10000,
    Circle_Error_Flag=0,
    
    Circle_L_Finish_Count=0,Circle_R_Finish_Count=0;// Բ����/��ת��������
float  
        Circle_Inductor_value2=172,//Բ����ʼת�����ֵ 3550��3500
        Circle_Inductor_value3=150,//������,Բ��ǿ��ת��ֵ
        Circle_Inductor_value4=100,//Բ����ʻֵ
        Circle_Inductor_value5=160,//��Բ��˫��ֵ
        Circle_Inductor_value6=100,//��Բ�����뵥��ֵ���������Բ���������´�Բ��״̬
       
        Circle_Turn_Again_Counter=0,//��ֹ�ٴν������
        Circle_Turn_Again_Counter_Max=400,//1s��ֹ�ٴν���������ֵ
        Circle_Turn_Again_Prevent_Flag=1,//��ֹ�ٴν����־
        
        
       Circle_inductor_Max=165,Circle_inductor_Max2=175,//190
        Circle_inductor_Mid=150, Circle_inductor_Mid2=170,
        Circle_inductor_Min=105,Circle_inductor_Min2=120;

  float AD_hall,Stop_Plan_Flag=0,Stop_OK=0,Stop_Flag=0;
  int Stop_ms=0;
  
void Hall(void)
{
    AD_hall = ADC_Once(ADC_6,adc12bit);  //��2 ͨ��
    if(Stop_Plan_Flag==0)
    {
       if(AD_hall<2500) 
       {
           Stop_Plan_Flag=1;
       }
    }
    if(Stop_Plan_Flag==1)
    {
       Stop_ms++;
       if(Stop_ms>10000)
         Stop_OK=1;       
    }
    
    if(Stop_OK==1)
    {
       if(AD_hall<2500) 
       {
           Stop_Flag=1;
       }  
    }      
}
/******************��������END*************************************************/
int     Circle_Count6_Max=5000;//�´�Բ�����ʱ��1S1000

int   Circle_Inductor_M1=172,//��Բ��˫��ֵ
         Circle_Inductor_M2=175,//��ת��ֵ
         Circle_Inductor_M3=160,//ת��ֵ
         Circle_Inductor_LR1=50;
                 
int   AD_inductor_Shuzhi_Max=40,AD_inductor_Shuzhi_Min=1;
int   Circle_Finish_Count_Max=300;//400:1s,// Բ����/��ת�����������ֵ
int   Circle_Chazhi=100;
void Test_Huandao()
{
/*������*/
if(Circle_Flag==0)//���ڼ��Բ��˫��״̬
{ 
      if(AD_inductor[1]>Circle_Inductor_M1&&(AD_inductor[0]+AD_inductor[2]>Circle_Inductor_LR1))//&&(AD_inductor[3]>30||AD_inductor[4]>30)
      {
          Circle_Count++;//����˫�߼���   
          if(Circle_Count>Circle_Count_Max)
          {
               Circle_Flag=2; //���뻷��˫��
               Circle_Count=0;
          }
      }
}
/*���ת�����***************************************************************/
if(Circle_Flag==2)//�Ѿ���⵽�뿪Բ��˫�ߣ���ʼת�����
{
     if(AD_inductor[3]>AD_inductor[4]+40) //100       
          Circle_R_Count++; 
     if(AD_inductor[4]>AD_inductor[3]+40) //100       
          Circle_L_Count++;   
       
     if(AD_inductor[1]<Circle_Inductor_M2)
     {
         
       if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
         Circle_R_Count++; 
     if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
         Circle_L_Count++; 
         
       if(AD_inductor[3]>AD_inductor[4]&&AD_inductor[4]<20) //100       
          Circle_R_Count++; 
       if(AD_inductor[4]>AD_inductor[3]&&AD_inductor[3]<20) //100       
          Circle_L_Count++;   
     }      
//ͬ�Ͻ��ͣ���ͨ�������ٶ�ʱ��·����ʹ��
        if(AD_inductor[1]<Circle_Inductor_M3)//150ת��
        {

            Circle_Flag=3;//ת��ʶ�������ת����
         }
}
/*��ʼǿ��ת��**************************************************************/   
if(Circle_Flag==3)//��ʼת��
{      
      if(Circle_Error_Flag==0)//��ֹ��/��ת����Ϊ���ֵ�䷴��������/��ת��
      {
         if(Circle_L_Count>Circle_R_Count)
         {
          Circle_L_Count=0;
          Circle_R_Count=0;
          
           Circle_L_Flag=1;
           
           Circle_Turn_Old_Flag=2;
           
           Circle_Error_Flag=2;
         }
         else
         {
            Circle_L_Count=0;
            Circle_R_Count=0;
          
            Circle_R_Flag=1;
            
             Circle_Turn_Old_Flag=1;
            
            Circle_Error_Flag=1;
         }           
      }
   }
      if(Circle_L_Flag==1)
      {
          Chazhi = Circle_Chazhi;
          
          Circle_L_Finish_Count++;
          BUZZER_ON;
      }
      if(Circle_R_Flag==1)
      {
           Chazhi =-Circle_Chazhi;//47=70��,43.5=65
           Circle_R_Finish_Count++;      
                     BUZZER_ON;

}
    

    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//Բ��ת�����
    {
      Circle_Count=0;
      Circle_Count2=0;
      Circle_L_Finish_Count=0;
      Circle_R_Finish_Count=0;
      Circle_L_Count=0;
      Circle_R_Count=0;
      
      Circle_L_Flag=0;
      Circle_R_Flag=0;
     Circle_Flag=6;
                          BUZZER_OFF;
     Circle_Count_Out_Flag=1;//����ǿ��ת���,��ɽ����󷴷��������

    }
  
/*��һ�������ȴ�*/
if(Circle_Flag==6)
  {
      if(AD_inductor[1]<100)
      {
        Circle_Count6++;
        if(Circle_Count6>Circle_Count6_Max)
        {
          Circle_Count6=0;
        Circle_Flag=0;
        Circle_Error_Flag=0;//ת�����н��
        }
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
     }   
          sensor_to_one_Huan=sensor_to_one[1];

       for(i=0;i<5;i++)
     {
      
        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
     }
     AD_inductor_Huan=100*sensor_to_one_Huan;
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

/****************λ�ý��㣬������̵�ֵ�ù�һ���Ŵ���ֵ************************/
       position_last = position;
       
        if(max_front==0 && (AD_inductor[1] <= Position_transit[0]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[0]>1)&&AD_valu[1]>AD_valu[2])  //�Ѿ�ƫ��0�Ŵ�����
       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
               position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
//              LED_1_ON;
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
       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] &&AD_inductor[1]>AD_inductor[0]&&AD_inductor[2]>1)&&AD_valu[1]>AD_valu[0]) //�Ѿ�ƫ��3�Ŵ�����
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




       Chazhi_Last=Chazhi;

 switch (max_front)  //��������к�
  {
  /*********** ���뿪����ƫ�󣬷�3�����************/
  case 0:   // �Ҳ������
    {
      if(AD_inductor[0] > RefAd)     //�Ҳ���> RefAd=20 ��RefAd�ο�ֵ������Ķ���
      {
                          
        if(AD_inductor[1] > RefAd)  //�м���> RefAd=20   16
        {
         Chazhi = -30 - 30*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
        }
        else 
        {
          Chazhi=-100 +40*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
        }
      }
     else  
       	Chazhi = -100;      //���ź�
    } break;

  case 1://�м������
     {
        if(AD_inductor[1] > RefAd)   //��5�޸�  �м���
        {  
          if(AD_inductor[2] > AD_inductor[0])       //  ��ߴ����ұ�ƫ��            
           
Chazhi =  30 - 30*(AD_inductor[1]-AD_inductor[2])/(AD_inductor[1]-AD_inductor[0]);
          else	                          //  �ұߴ������ƫ��                    
//          Chazhi = -34 + 34*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
Chazhi = -30 + 30*(AD_inductor[1]-AD_inductor[0])/(AD_inductor[1]-AD_inductor[2]);
        }                                                                          
     }  break;


  case 2:
    {
//2���>�ο����
      if(AD_inductor[2] > RefAd)
	{
//1���>�ο���У���Խƫ,����ԽС����ֵԽ��
//����ֵ50
          if(AD_inductor[1] > RefAd)
//        Chazhi = 25 + 25*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
          Chazhi = 30 + 30*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
          else 
//�ο����>1���:��Խƫ,����ԽС����ֵԽ��
//        Chazhi = 100 - 34*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
          Chazhi = 100 - 40*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
        }                                                                        
       else
      	  Chazhi = 100;	                 //���ź�3
    }  break;
   }
//     
// if(AD_inductor[3]>40&&AD_inductor[4]>40)
//   Chazhi=Chazhi/3;
       
     if(Chazhi>Chazhi_Max_New)
       Chazhi=Chazhi_Max_New;
     if(Chazhi<-Chazhi_Max_New)
       Chazhi=-Chazhi_Max_New;
   
     Chazhi*=1;
  for(uint8 i=0;i<19;i++)
    {
        Chazhi_Chucun[i]=Chazhi_Chucun[i+1];
         
    }
        Chazhi_Chucun[19]=Chazhi;

    Chazhi_Old=Chazhi_Chucun[0];
     Chazhi_Rate=Chazhi_Old-Chazhi;//D

//     if(Rate_Count++>19)
//     {
//        Rate_Count=0;
//        Chazhi_Old=Chazhi;
//     }
//      Chazhi_Rate=Chazhi_Old-Chazhi;//D

     
//     Chazhi_Rate=Chazhi-Chazhi_Old;//P
     
}
/*   ��ֵ ��ֱ���   ��ֵ ��ֱ���
ֱ��      15,20

���   1     20      0       10
      15     35      10      22
      30     51      20      29
      49     49      30      31
      60     34      40      28
      68     23      50      18
      78     11      59      0.1
      94     2
����ֱ��У���ֵ��


*/
void Small_S(void)
{
float Road_Remember_SZ[100]={0}; 
int XS=0,XS_NO=0,XS_Flag=0,
//  StraightRoad=0,//С��ֱ�ߴ���
  WindingRoad = 0,
    WindingRoad_Flag;//С����ת,��ת����
  

   
  for(int8_t i = 0;i < P-1; i++)   //�����и��µ�������ǰ��1λ
  {
      Road_Remember[i] = Road_Remember[i+1];
  }
  Road_Remember[P-1] = abs_f(Chazhi);	//��ֵΪ��м��ֵ-100~100
  
  StraightRoad=0;//С��ֱ�ߴ���
  WindingRoad = 0;//С����ת,��ת����
  
  for(int8_t i = 0;i < P; i++)
  {        
    if(Road_Remember[i] < 20)	//��-35~35��Χ�ڣ���֤��ֵ��λ�õ����Թ�ϵ
    {
       StraightRoad++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
    }		
    else 
      WindingRoad++;		//�ж�����ȶ���---��ת��   
  }
  StraightRoad_Flag = 0;//ֱ����־
  WindingRoad_Flag = 0;//��ת,��ת��־                 
  if(StraightRoad >= 90)
  {
  StraightRoad_Flag = 1;
  }
  if(WindingRoad_Left >= 30)
  {
    WindingRoad_Flag = 1;
  }
 
  

  for(int8_t i = 0;i < P-1; i++)   //�����и��µ�������ǰ��1λ
  {
      Road_Remember_SZ[i] = Road_Remember_SZ[i+1];
  }
  
  if(AD_inductor[3]>AD_inductor[4])
     Road_Remember[P-1] = AD_inductor[3];	
  else
     Road_Remember[P-1] = AD_inductor[4];	
  
  XS=0; 
      XS_NO=0;
        XS_Flag=0;

  if(WindingRoad_Flag==1&&AD_inductor[1]<110)
  { 
       for(int8_t i = 0;i < P-1; i++)   //�����и��µ�������ǰ��1λ
      {
         if(Road_Remember_SZ[i]<35)
            XS++; 
         if(Road_Remember_SZ[i]>40)
            XS_NO++;
      }
      if(XS>95)
        XS_Flag=1;
      if(XS_NO>1)
        XS_Flag=0;
  }
  if(XS_Flag==1)  
  {
//     Chazhi=Chazhi/3;
     BUZZER_ON;
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
  WindingRoad=0;
  WindingRoad_Left = 0;WindingRoad_Right = 0;//С����ת,��ת����
  
//  for(int8_t i = 0;i < P; i++)
//  {        
//    if(Road_Remember[i] > -20 && Road_Remember[i] < 20)	//��-35~35��Χ�ڣ���֤��ֵ��λ�õ����Թ�ϵ
//    {
//      StraightRoad++;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
//    }
//		
//    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -20)//100,38
//   {
//     WindingRoad_Right++;		//�ж�����ȶ���---��ת�ۼ�
//   }
//   else if(Road_Remember[i] >= 20 && Road_Remember[i] <= 300)
//   {
//      WindingRoad_Left++;		//�ж�����ȶ���---��ת�ۼ�
//   }
    
//  }
  
  for(int8_t i = 0;i < P; i++)
  {        
    if(abs_f(Road_Remember[i])< 15)	//��-35~35��Χ�ڣ���֤��ֵ��λ�õ����Թ�ϵ
    {
      WindingRoad--;		//�ж�ֱ���ȶ��ԣ��ֱ��г�һ�����ź�
    }		
    else 
    {
      WindingRoad++;		//�ж�����ȶ���---��ת�ۼ�
    }
   
  StraightRoad_Flag = 0;//ֱ����־
  WindingRoad_Flag=0;
  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//��ת,��ת��־                 
  if(WindingRoad <10)
  {
  StraightRoad_Flag = 1;
       WindingRoad_Flag=0;

  }
else
{
     WindingRoad_Flag=1;
       StraightRoad_Flag = 0;

  }  
}

}
/*************************************************************************************************************
����������ֱ��:����������ֱ���
******************************************************/
void Test_RoadInfo_Shuzhi(void) 
{
  StraightRoad_Old = StraightRoad;
#define SZ 50
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
      if(Road_Remember_RI[i]>15&&Road_Remember_LI[i]<1)//100,38
      {
          WindingRoad_Right++;		//�ж�����ȶ���---��ת�ۼ�
      }
      else if(Road_Remember_LI[i] >15 && Road_Remember_RI[i] <1)//100,38
      {
          WindingRoad_Left++;		//�ж�����ȶ���---��ת�ۼ�
      }
      else 
      {
          StraightRoad++; 
      }         
  }
  
  StraightRoad_Flag = 0;//ֱ����־
  WindingRoad_Left_Flag = 0;WindingRoad_Right_Flag = 0;//��ת,��ת��־                 
  
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

  for(int i=0;i<5;i++)
  {
     if( min_v[i]>499)
         min_v[i]=499;
  }
//������ֵȷ������ֹʵ�������ֵƫ��
if(Circle_Flag==0)
  {
     if(AD_inductor[1]<90)
     {
//        if(AD_valu[0]>max_v[0]) max_v[0]=AD_valu[0];//�����ֵ���
//        if(AD_valu[2]>max_v[2]) max_v[2]=AD_valu[2];
//        if(AD_valu[3]>max_v[3]) max_v[3]=AD_valu[3];
//        if(AD_valu[4]>max_v[4]) max_v[4]=AD_valu[4];
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
/*void Small_S(void)
{
int Chazhi_i=0;
float Chazhi_wandao[50]={0};
 float    Chazhi_he=0,Chazhi_he_before=0,Chazhi_he_after=0,
     Chazhi_abs=0,     
     Chazhi_he_before_flag = 0,
     Chazhi_he_after_flag  = 0,
     Chazhi_he_flag        = 0,
     Chazhi_abs_flag       =0;

      for(Chazhi_i = 0;Chazhi_i < 50; Chazhi_i++)   //�����и��µ�������ǰ��1λ
  {
      Chazhi_wandao[Chazhi_i] = Chazhi_wandao[Chazhi_i+1];
  }
  Road_Remember[49] = Chazhi;	//��ֵΪ��м��ֵ-100~100
     
//     Chazhi_i++;
//  Chazhi_wandao[Chazhi_i] = Chazhi;
//  if(Chazhi_i >= 50)
//  {
//    Chazhi_i = 0;
  
    for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
    {   
//ȡ50���ĵ��ֵ�Ĵ�����
      Chazhi_he += Chazhi_wandao[Chazhi_j];
//ȡǰ20��ֵ,
      if(Chazhi_j == 20)
      Chazhi_he_before = Chazhi_he;
//ȡ��20��ֵ,����ֵ
      if(Chazhi_j >=31&&Chazhi_j <= 50)
        Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
    }

//ȡ50�����ֵ�ľ���ֵ��
    for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
    { Chazhi_abs  += abs_f(Chazhi_wandao[Chazhi_j]);}
  }
  
//  Chazhi_he_before_flag = Chazhi_he_before;
//  Chazhi_he_after_flag  = Chazhi_he_after;
//  Chazhi_he_flag        = Chazhi_he;
//  Chazhi_abs_flag       = Chazhi_abs;
//  
//
//  Chazhi_he_before = 0;
//  Chazhi_he_after  = 0;
//  Chazhi_he        = 0;
//  Chazhi_abs       = 0;

*/
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
//void Test_Huandao()
//{
////  ״̬      ��     ��     ��   ����  ���� 
////  ���      2000  1600   2000  2000  2000
////                               400(13)   400(13)    
////  ����      825   1600   825   170(10)   170(10)
////  ������ ���������˲�
////  if(AD_inductor[0]>45&&AD_inductor[1]>80&&AD_inductor[2]>45)//��
////    Chazhi=Chazhi/10;
////  if(AD_inductor[1]>75&&(AD_inductor[0]>75||AD_inductor[2]>75))//������������֮��ʱ����
////    Chazhi=Chazhi/10; 
////   if(Circle_Flag>0)
////   {
////      if(AD_inductor[1]>105&&AD_inductor[1]<Circle_inductor_Max)//ʶ����뵽����˫��֮ǰ֮��
////         {
//////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//////       Chazhi=0; 
////           if(AD_inductor[3]>AD_inductor[4]) //100       
////              Circle_R_Count++; 
////           if(AD_inductor[4]>AD_inductor[3]) //100       
////              Circle_L_Count++;    
////    }
////   }  
//                     //100
////    if(AD_inductor[1]>120&&AD_inductor[1]<Circle_inductor_Mid2)//ʶ����뵽����˫��֮ǰ֮��
////    {
//////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//////       Chazhi=0; 
////       if(AD_inductor[0]>90) //100       
////         Circle_R_Count++; 
////       if(AD_inductor[2]>90)  //100      
////         Circle_L_Count++;    
////    }
////    
////     if(AD_inductor[0]>70&&AD_inductor[1]>90&&AD_inductor[2]>70||
////        AD_inductor[1]>85&&(AD_inductor[0]>80||AD_inductor[2]>80))//��
//  //2000,100;2500,125;3000,150;3500,175
//  if(Circle_Flag==0)//���ڼ��Բ��˫��״̬
//  {
//    
////       if(AD_inductor[1]>130&&AD_inductor[1]<170)
////          {
//////            if(AD_inductor[0]>AD_inductor[2]+30) //100       
//////              Circle_R_Count++; 
//////             if(AD_inductor[2]>AD_inductor[0]+30) //100       
//////              Circle_L_Count++; 
//////          
////          }
//    
//    
//      if(AD_inductor[1]>Circle_Inductor_value1)
//      {
//              Circle_Count++;//����˫�߼���   
//              if(Circle_Count>Circle_Count_Max)
//              {
//                  Circle_Flag=1; //���뻷��˫��
//                  Circle_Count=0;
//              }
//      }
//  }
//  
//  
//  if(Circle_Flag==1)//��⵽Բ��˫�ߣ����뵽����뿪Բ��˫��
//  {
//        if(AD_inductor[1]<Circle_Inductor_value2)      
//                Circle_Count2++;//�뿪����˫�߼���
//        
//         if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
//          Circle_R_Count++; 
//         if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
//          Circle_L_Count++; 
//         
// //�������ǰת�䣬���ͺ�ת���ǿ�Ƴ���ת��ͻ��������ǰת��һֱ��ת        
////      if(Circle_L_Count>Circle_Turn_Count||Circle_R_Count>Circle_Turn_Count)//ת������ﵽ���ޣ�����ת��ʱ��
////         Circle_Flag=3;//ת��ʶ�������ת����
//         
//         
//         
//         
//        if(Circle_Count2>Circle_Count2_Max)
//
//        {
//             Circle_Flag=2; //�뿪����˫�߱�־
//             Circle_Count2=0;
//        }
//
//  }
//
//   if(Circle_Flag==2)//�Ѿ���⵽�뿪Բ��˫�ߣ���ʼת�����
//   {
//       if(AD_inductor[3]>AD_inductor[4]) //100       
//          Circle_R_Count++; 
//       if(AD_inductor[4]>AD_inductor[3]) //100       
//          Circle_L_Count++;
////       if(AD_inductor[0]>AD_inductor[2]) //100       
////          Circle_R_Count++; 
////       if(AD_inductor[2]>AD_inductor[0]) //100       
////          Circle_L_Count++; 
////   
//       
//    //ͬ�Ͻ��ͣ���ͨ�������ٶ�ʱ��·����ʹ��
////       if(Circle_L_Count>Circle_Turn_Count2||Circle_R_Count>Circle_Turn_Count2)//ת������ﵽ���ޣ�����ת��ʱ��
////                    Circle_Flag=3;//ת��ʶ�������ת����
//
//       if(AD_inductor[1]<Circle_Inductor_value3)//150
//        {
//////          Circle_Count3++;//Բ��ת��������ۼ�Ϊ�˱����������У�����˫����ǰ����
//////          if(Circle_Count3>Circle_Count3_Max)
//////          {
//////          Circle_Count3=0;
//             Circle_Flag=3;//ת��ʶ�������ת����
//////          }
//        }
//   }
//   
//   if(Circle_Flag==3)//��ʼת��
//   {      
//      if(Circle_Error_Flag==0)//��ֹ��/��ת����Ϊ���ֵ�䷴��������/��ת��
//      {
//         if(Circle_L_Count>Circle_R_Count)
//         {
//          Circle_L_Count=0;
//          Circle_R_Count=0;
//          
//           Circle_L_Flag=1;
//           
//           Circle_Turn_Old_Flag=2;
//           
//           Circle_Error_Flag=2;
//         }
//         else
//         {
//            Circle_L_Count=0;
//            Circle_R_Count=0;
//          
//            Circle_R_Flag=1;
//            
//             Circle_Turn_Old_Flag=1;
//            
//            Circle_Error_Flag=1;
//         }           
//      }
//   }
//
//
//      if(Circle_L_Flag==1)
//      {
//          Chazhi = 43.5;
//          
//          Circle_L_Finish_Count++;
//          LED_2_ON;
//          BUZZER_ON;
//      }
//      if(Circle_R_Flag==1)
//      {
//           Chazhi =-43.5;//47=70��,43.5=65
//           Circle_R_Finish_Count++;      
//           LED_1_ON;
//                     BUZZER_ON;
//
//      }
//    
//
//    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//Բ��ת�����
//    {
//      Circle_Count=0;
//      Circle_Count2=0;
//      Circle_L_Finish_Count=0;
//      Circle_R_Finish_Count=0;
//      Circle_L_Count=0;
//      Circle_R_Count=0;
//      
//      Circle_L_Flag=0;
//      Circle_R_Flag=0;
//     Circle_Flag=4;
//                          BUZZER_OFF;
//     Circle_Count_Out_Flag=1;//����ǿ��ת���,��ɽ����󷴷��������
//
//    }
//  
// /*���õ��150����ת�䣬�������˧����ǰת�䷴ת��������
//  �����������̫�ͺ�ת��,�������Σ�һ��������ǰת�䣬��̫�ͺ�ת���ǿ�Ʋ�ֵһ��������һֱ������ת
//  
//  */ 
////    if(Circle_Count_Out_Flag==1)
////    {
////        Circle_Count_Out++;
////        if(Circle_Count_Out>Circle_Count_Out_Max)
////        {
////            Circle_Count_Out=0;
////            Circle_Count_Out_Flag=0;
////        }
////        
////        if(Circle_Turn_Old_Flag==2)//��ת����
////        {
////           if(Chazhi)
////           if(Chazhi<-40)
////            Chazhi=-Chazhi;     
////         }
////      
////         if(Circle_Turn_Old_Flag==1)//��ת����
////         {
////             
////            if(Chazhi>50)
////               Circle_Count_Out__Wai_Flag=1;
////            if(Chazhi>50)
////               Circle_Count_Out__Wai_Flag=1;             
////         if(Chazhi>40)
////            Chazhi=-Chazhi;     
////         }
////      
////     }
//  
//  
//    if(Circle_Flag==4)//Բ��ǿ��ת�����,����Բ����ʻ���
//   {
//        if(AD_inductor[1]<Circle_Inductor_value4)
//      {
//              Circle_Count4++;//����˫�߼���   
//              if(Circle_Count4>Circle_Count4_Max)
//              {
//                  Circle_Flag=5; //������˫�߱�־
//                  Circle_Count4=0;
//              }
//      }
//   }
//     
//  
//   if(Circle_Flag==5)//Բ��������ʻ������,�������Բ��˫��
//   {
//        if(AD_inductor[1]>Circle_Inductor_value5)
//      {
//              Circle_Count5++;//����˫�߼���   
//              if(Circle_Count5>Circle_Count5_Max)
//              {
//                  Circle_Flag=6; //������˫�߱�־
//                  Circle_Count5=0;
//              }
//      }
//   }
//     
// 
////   if(Circle_Flag==6)//��־6�ݶ�ʱ��3s
////   {
////     
//////     if(AD_inductor[1]>?)
////     if(AD_inductor[1]>100)
////     {
//////     if(AD_inductor[2]>?)
////     
////     Circle_Turn_Again_Counter++;
////     if(Circle_Turn_Again_Counter>Circle_Turn_Again_Counter_Max)
////     {
////        Circle_Turn_Again_Prevent_Flag=0;
////     }
////     else
////     {
////       Circle_Turn_Again_Prevent_Flag=1;
////     }
////     
////     if(Circle_Turn_Again_Prevent_Flag==1)
////     {
////         if(Circle_Turn_Old_Flag==2)//��ת����Ԥ����ֵ60
////         {
////           if(Chazhi>30)
////            Chazhi=-Chazhi/2;     
////         }
////      
////        if(Circle_Turn_Old_Flag==1)//��ת����Ԥ����ֵ-60
////        {
////            if(Chazhi<-30)
////            Chazhi=-Chazhi/2;     
////        }
////     }
////   }
////   }
//  
//  
//
//  if(Circle_Flag==6)
//  {
//      if(AD_inductor[1]<Circle_Inductor_value6)
//      {
//        Circle_Count6++;
//        if(Circle_Count6>Circle_Count6_Max)
//        {
//        Circle_Flag=0;
//        Circle_Error_Flag=0;//ת�����н��
//        }
//      }
//  }
//
////   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//��ֹ���м���
////      {
////         Circle_Error_Count++;
////         if(Circle_Error_Count>Circle_Error_Count_Max)
////         {
////            Circle_Error_Flag=0;//ת�����н��
////            Circle_Error_Count=0;
//////                 Circle_Flag=0;
////         }      
////      }   
//
//}
//
//
//
