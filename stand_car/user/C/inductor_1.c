#include "inductor_1.h"
#include "Variable.h"
#include "common.h"
#include "allHead.h"

#define NM   3

float Chazhi_wandao[50];
char Chazhi_j;
char Chazhi_i = 0;
float Chazhi_he_before=0,Chazhi_he_after=0,Chazhi_he=0,Chazhi_abs=0;
int  Zhidao_road = 5,Wandao_in_temp = 10,Wandao_out_temp = 10 ,s_temp = 10,s_abs_temp = 20;
int  Wandao_in_beforetemp = 10,Wandao_in_aftertemp =20,Wandao_out_beforetemp = 20,Wandao_out_aftertemp =10;
char huandao_in_num,huandao_num,huandao_in_flag;
char huandao_in = 0,huandao_ready = 0,huandao_in_ready = 0;
char right_flag = 0;
char Lost_Flag = 0;
float Last_Posa = 0;

float Chazhi_valu[7],Chazhi_V[5],Chazhi_temp;

int  AD_sum[5];
int16 ad_valu[5][5];
int16 ad_valu_shu[3][3];
int AD_valu[5],AD_V[5][NM];
int AD_V_shu[3][3],AD_valu_shu[3];

char flag_1=0,Stright_Flag,UPhill_flag,position,Sum_flag = 0;
float Chazhi,Chazhi_sum = 0;
float  AD_inductor[5],sensor_to_one[5],AD_inductor1[5];
int   AD_reference = 900;
float  max_v[5] = {1300,1300,1300,1300,1300};
float  max_v1[5] = {3600,3600,3600,3600,3600};
char  min_v[5] = {7,7,7,7,7};  //��б궨 �ɼ�ֵ      �����������⣿������
int   Position_transit[4] = {0,0} ;  //��¼���ɵ��һ����ֵ  ???���⣿������
int  AD_MAX_NUM;  
int  position_back = 1;
float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
int RefAd = 20;
int Add_AD_value = 20;




//��ʱ
void delayms(unsigned int time)
{
   unsigned int i=0;
   while(time--)
   {
      i=12000;  //�Լ�����
      while(i--);
   }
}

///ȡ����ֵ
int abs_inductor(int value)
{
    if(value<=0)
      value=-value;
    return value;
}

float abs_f(float value)
{
    if(value<=0)
      value=-value;
    return value;
}

/*************************************************************************
 *  ��������   Read_ADC
 *  ����˵���� AD�ɼ�
 *  ����˵����
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
*************************************************************************/
void Read_ADC_heng(void)
{
      int16  i,j,k,temp;
      int16  ad_valu1[5],ad_sum[5];

      for(i=0;i<5;i++)
      {
            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //��  ͨ��
            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //��  ͨ��
            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //��  ͨ��
//            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //��1 ͨ��
//            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //��2 ͨ��
      }
   //////////////////////ð������///////////////////////////////////
      for(i=0;i<3;i++)     //5�����
      {
         for(j=0;j<4;j++)  //�����������
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu[i][k] > ad_valu[i][k+1])  //ǰ��ıȺ���Ĵ�  ����н���
               {
                  temp = ad_valu[i][k+1];
                  ad_valu[i][k+1] = ad_valu[i][k];
                  ad_valu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<3;i++)    //���м�����ĺ�
      {
         ad_sum[i]   = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
         ad_valu1[i] = ad_sum[i] / 3;
      }
   ////////////////////////����ƽ���˲�/////////////////////////////
      for(i = 0;i < 3;i ++)  //ȡ�м�3λ��ֵ��ǰ��λ
      {
          AD_V[0][i] = ad_valu[0][i + 1];
          AD_V[1][i] = ad_valu[1][i + 1];
          AD_V[2][i] = ad_valu[2][i + 1];
//          AD_V[3][i] = ad_valu[3][i + 1];
//          AD_V[4][i] = ad_valu[4][i + 1];
      }
      for(i=0;i<3;i++)   //����λ�洢ƽ��ֵ
      {
          AD_V[i][NM-1] =  ad_valu1[i];
      }
      for(i = 0;i < NM;i ++)   //�õ�ԭ�м���λ��ֵ
      {
          AD_sum[0] += AD_V[0][i];
          AD_sum[1] += AD_V[1][i];
          AD_sum[2] += AD_V[2][i];
//          AD_sum[3] += AD_V[3][i];
//          AD_sum[4] += AD_V[4][i];
      }
      for(i=0;i<3;i++)  //��ƽ��
      {
          AD_valu[i] = AD_sum[i] / NM;
          AD_sum[i] = 0;
      }
}

void Read_ADC_shu(void)
{
      int16  i,j,k,temp;
      int16  ad_valu1_shu[5],ad_sumshu[3],AD_sun_shu[3];

      for(i=0;i<5;i++)
      {
            ad_valu_shu[0][i] = ADC_Once(ADC_4,adc12bit);  //��1 ͨ��
            ad_valu_shu[1][i] = ADC_Once(ADC_5,adc12bit);  //��2 ͨ��
      }
   //////////////////////ð������///////////////////////////////////
      for(i=0;i<2;i++)     //5�����
      {
         for(j=0;j<4;j++)  //�����������
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu_shu[i][k] > ad_valu_shu[i][k+1])  //ǰ��ıȺ���Ĵ�  ����н���
               {
                  temp = ad_valu_shu[i][k+1];
                  ad_valu_shu[i][k+1] = ad_valu_shu[i][k];
                  ad_valu_shu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<2;i++)    //���м�����ĺ�
      {
         ad_sumshu[i] = ad_valu_shu[i][1] + ad_valu_shu[i][2] + ad_valu_shu[i][3];
         ad_valu1_shu[i] = ad_sumshu[i] / 3;
      }
   ////////////////////////����ƽ���˲�/////////////////////////////
      for(i = 0;i < 2;i ++)  //ȡ�м�3λ��ֵ��ǰ��λ
      {
          AD_V_shu[0][i] = ad_valu_shu[0][i + 1];
          AD_V_shu[1][i] = ad_valu_shu[1][i + 1];
      }
      for(i=0;i< 2;i++)   //����λ�洢ƽ��ֵ
      {
          AD_V_shu[i][2] =  ad_valu1_shu[i];
      }
      for(i = 0;i < 2;i ++)   //�õ�ԭ�м���λ��ֵ
      {
          AD_sun_shu[0] += AD_V_shu[0][i];
          AD_sun_shu[1] += AD_V_shu[1][i];
      }
      for(i=0;i<2;i++)  //��ƽ��
      {
          AD_valu_shu[i] = AD_sun_shu[i] / NM;
          AD_sun_shu[i] = 0;
      }
}

/*************************************************************************
 *  ��������   Date_analyse
 *  ����˵���� ���ݷ���
 *  ����˵����
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
*************************************************************************/
void Date_analyse()
{
     int16  i,max_front=0,max_back=0;
     //static int16 max_old = 1,max_crosstalk = 1;
     //static int16 position_last = 2;
     //float  sensor_1;
     
     Read_ADC_heng();
     Read_ADC_shu();

     /*********************��һ������********************/
     for(i=0;i<3;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        if(sensor_to_one[i]>1.0)   sensor_to_one[i]=1.0;

        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
     }
     for(i=0;i<3;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v1[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        if(sensor_to_one[i]>1.0)   sensor_to_one[i]=1.0;

        AD_inductor1[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
     }
     if(AD_inductor1[1] >= 36)
     {
        for (i = 0;i < 3;i++)
          AD_inductor[i] = AD_inductor1[i];
     }
     
       /*******1�ŵ�������һ���������µ����********/
//      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//      Slope_AD_1 = 100 * sensor_1;
   ////////////////////////////////////////////////////////////////////

       for(i=0;i<3;i++)                 //�ҳ���ǿ�Ĵ�����
       {
         if(AD_inductor[max_front]<AD_inductor[i]-0)
           max_front=i;
       }
       max_value=AD_inductor[max_front];  //�����ֵ

    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //�Һ�����ǿ���
       
       //����ʱ���ֵȡ��ֵ
       if(max_value < 40)           
       {
         Lost_Flag = 1;
       }
       else
       {
         Lost_Flag = 0;
       }

       //�õ��������ʶ������
       if(Lost_Flag == 0||huandao_in == 0)
       {
         if(max_value >= 60)
         {            
          Chazhi = (AD_inductor[2] - AD_inductor[0])*1.2;
         }
         else
          Chazhi = (AD_inductor[2] - AD_inductor[0])*2.5;
          Last_Posa = Chazhi;
       }
       if(Lost_Flag == 1)
       {
          Chazhi = Last_Posa;
       }
       
       
       /*****************��ƫ��ֵ�˲�*************/
       for (i = 0;i < 5;i++)
        {
          Chazhi_valu[i] = Chazhi;
        }

        for (i = 0;i < 5;i++)
        {
          if(Chazhi_valu[i] > Chazhi_valu[i+1])
          {
            Chazhi_temp      = Chazhi_valu[i+1];
            Chazhi_valu[i+1] = Chazhi_valu[i];
            Chazhi_valu[i]   = Chazhi_temp;
          }
        }
          
        for(i=0;i<3;i++)    //���м�����ĺͷ��������6λ
        {
           Chazhi_valu[5]       = Chazhi_valu[1] + Chazhi_valu[2] + Chazhi_valu[3];
           Chazhi_V[3]   = Chazhi_valu[5] / 3;
        }

        for(i=0;i<3;i++)
        {
            Chazhi_V[i] = Chazhi_valu[i+1];
        }

        Chazhi_V[2] = Chazhi_V[3];

        for(i=0;i<3;i++)
        {
            Chazhi_V[4] += Chazhi_V[i];
        }

        Chazhi = Chazhi_V[4]/3;
        Chazhi_V[4] = 0;
        /***************************************************/
        
        
//       //������
//       if(abs_inductor(max_front - max_crosstalk) < 2)  
//       {
//            max_crosstalk = max_front;
//       }
//       else
//            max_front = max_crosstalk;
       
      // AD_MAX_NUM = max_front;        //�����ٶȿ���

//    if(Lost_Flag == 1)
//    {
//      Chazhi = Last_Posa;
//      
//      if(Last_Posa <= 0 && (max_front == 0||max_front == 1) && max_value >= 10 )   
//      {
//   	Lost_Flag = 0;    //�ź��ҵ�
//      }
//      else if(Last_Posa >= 0 && (max_front == 1||max_front == 2) && max_value >= 10) 
//      {
//    	Lost_Flag = 0;    //�ź��ҵ�
//      }
//    	//���������������ǶȺ�Сʱ�ɼ�ֵͻ�䣬����ֵ���֣�
//    //	if(Mid_AD<-20) Last_Posa=Last_Posa-3;  //  Mid_ADƫ���� ���Pֵ
//    //	if(Mid_AD> 20) Last_Posa=Last_Posa+3;
//    	if(Last_Posa > 100) Last_Posa = 100;   //Last_Posa ��-100~100֮�䡣
//    	if(Last_Posa < -100) Last_Posa = -100;	
//    }
//        
//   if(huandao_in == 0&&Lost_Flag == 0)
//   {
//  switch (max_front)  //��������к�
//  {
//  /*********** ���뿪����ƫ�󣬷�3�����************/
//  case 0:   // �Ҳ������
//    {
//      if(AD_inductor[0] > RefAd)     //�Ҳ���> RefAd=20 ��RefAd�ο�ֵ������Ķ���
//      {
//                          
//        if(AD_inductor[1] > RefAd)  //�м���> RefAd=20   16
//        {
//         Chazhi = -35 - 35*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
//        }
//        else 
//        {
//          Chazhi=-100 + 30*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
//        }
//      }
//     else  
//       	Chazhi = -100;      //���ź�
//    } break;
///*********** ��������֮��ε� ����2����� ************/
//  case 1://�м������
//     {
//        if(AD_inductor[1] > RefAd)   //��5�޸�  �м���
//        {                		  
//          if(AD_inductor[2] > AD_inductor[0])       //  ��ߴ����ұ�ƫ��            
//          Chazhi =  55 - 55*(Add_AD_value+AD_inductor[1]-AD_inductor[2])/(Add_AD_value+AD_inductor[1]-AD_inductor[0]);
//          else	                          //  �ұߴ������ƫ��                    
//          Chazhi = -55 + 55*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
//        }                                                                          
//     }  break;
//
///***************���뿪����ƫ�ң���3����� **************************/
//  case 2:
//    {
//      if(AD_inductor[2] > RefAd)
//	{
//          if(AD_inductor[1] > RefAd)
//          Chazhi = 35 + 35*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
//          else                                                                  
//          Chazhi = 100 - 30*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
//        }                                                                        
//       else
//      	  Chazhi = 100;	                 //���ź�3
//    }  break;
//   }
//   Last_Posa = Chazhi;
//  
//           //��ֱ��
////  if(AD_inductor[0]<=10&&AD_inductor[1]<=10&&AD_inductor[2]<=10&&Chazhi <= 0)Chazhi = -40;
////  if(AD_inductor[0]<=10&&AD_inductor[1]<=10&&AD_inductor[2]<=10&&Chazhi >= 0)Chazhi =  40;
//   }

 if(Chazhi>100)  Chazhi =  100;
 if(Chazhi<-100) Chazhi = -100;
 
// Chazhi_sum += Chazhi;
// Sum_flag++;
// Chazhi      = Chazhi_sum/Sum_flag;
// if(Sum_flag == 10){Sum_flag = 0; Chazhi_sum = 0;}
 
 
 /////��һ�׷���
  //����    
  if(AD_valu[1] >= 1800&&AD_valu[2] >= 1800&&AD_valu[0] >= 1500&&huandao_ready == 0&&car_angle>=88&&car_angle_speed<=20&&car_angle_speed>=-20&&Direction_angle<=10&&Direction_angle>=-10)
  {
    huandao_ready = 1;
  }
 
  if(AD_valu[1] <= 1800&&huandao_ready == 1)
  {huandao_ready = 0;right_flag = 0;}

  if(AD_valu[1] >= 3100&&AD_valu[2] >= 2400&&AD_valu[0] >= 1800&&huandao_ready == 1&&car_angle>=88&&car_angle_speed<=20&&car_angle_speed>=-20&&Direction_angle<=10 &&Direction_angle>=-10)
  { 

      huandao_in_ready = 1;
  }
  if(AD_valu[1] <= 3000&&huandao_in_ready == 1&&car_angle>=88&&car_angle_speed<=20&&car_angle_speed>=-20&&Direction_angle<=10&&Direction_angle>=-10)//AD_valu[2] >= 2000&&AD_valu[0] >= 1200&&
  {
      
      huandao_in_flag = 1;
      if(right_flag == 0)
      {
      if(AD_valu_shu[0]<AD_valu_shu[1])
      right_flag = 1;
      if(AD_valu_shu[0]>AD_valu_shu[1])
      right_flag = 2;
      }
  }
 
//  if(AD_valu[2] >= 2400&&car_angle>=90&&car_angle_speed<=20&&car_angle_speed>=-20&&Direction_angle<=10&&Direction_angle>=-10&&huandao_in == 1)
//  {
//      huandao_in_flag = 1;
//  }

  if(huandao_in_flag == 1)//&&car_angle>=88&&speed_car>=300&&car_angle_speed<=20&&car_angle_speed>=-20&&Direction_angle<=10&&Direction_angle>=-10
  {
    LED_1_ON
    if(right_flag == 1)
    {Chazhi = 70;}
    else if(right_flag == 2)
    {Chazhi = -70;}
    huandao_in_num ++;
  }
    
  if(huandao_in_num>=250&&huandao_in_flag == 1)
  {
      BUZZER_OFF
      right_flag = 0;
      huandao_in = 0;
      huandao_ready = 0;
      huandao_in_num = 0;
      huandao_in_flag = 0;
      huandao_in_ready = 0;
  }
 
//  Chazhi_i++;
//  Chazhi_wandao[Chazhi_i] = Chazhi;
//  if(Chazhi_i >= 50)
//  {
//    Chazhi_i = 0;
//    //ȡ50���ĵ��ֵ�Ĵ�����
//    for (Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//    {
//      Chazhi_he += Chazhi_wandao[Chazhi_j];
//      //ȡǰ20��ֵ
//      if(Chazhi_j == 20)
//      Chazhi_he_before = Chazhi_he;
//      //ȡ��20��ֵ
//      if(Chazhi_j >=31&&Chazhi_j <= 50)
//        Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
//    }
//    //ȡ50�����ֵ�ľ���ֵ��
//    for (Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//    { Chazhi_abs  += abs_f(Chazhi_wandao[Chazhi_j]);}
//  }
//  
// /*
//    �����ǰհ��С�� S ����������ѣ� S ���Ĵ���ĺû��������ٶ��нϴ�
//��Ӱ�졣 ���������£���ʼ��һ������Ϊ 50 �����飬��¼ÿ�ε������ȣ���
//̬�������顣Ȼ��� 50 �����������ֵ�ͺʹ�����,��������;���ֵ��С��
//����ֱ������������ͺ;���ֵ�ͽ�С������ǰ 20 �����ݽϴ�������ж�
//С���ڳ��䣬��������ͺ;���ֵ�ͽ�С���� 20 �ϴ����ж�С�������䣬��
//�������ͺ�С��������ֵ�ͺܴ����� s ������������ԣ� ��Ȼ��һ���ͺ��ԣ�
//�����Լ������ơ���������㷨���Էǳ��õĴ��������
//*/
//  
//  if(((Chazhi_he=>-Zhidao_road)&&(Chazhi_he<=Zhidao_road))&&((Chazhi_abs>=-Zhidao_road)&&(Chazhi_abs<=Zhidao_road)))  ///���ɵ�
//  {
//    Zhidao_road = 1;
//    zhidao_num  ++;
//  }
//  if(((Chazhi_he=>-Wandao_in_temp)&&(Chazhi_he<=Wandao_in_temp))&&(Chazhi_abs<=Wandao_in_temp)&&((Chazhi_he_before>=-Wandao_in_beforetemp)&&(Chazhi_he_before<=Wandao_in_beforetemp))&&((Chazhi_he_after>=-Wandao_in_aftertemp)&&(Chazhi_he_after<=Wandao_in_aftertemp))) 
//    Wandao_road_in = 1;
//  if(((Chazhi_he=>-Wandao_out_temp)&&(Chazhi_he<=Wandao_out_temp))&&(Chazhi_abs<=Wandao_out_temp)&&((Chazhi_he_before>=-Wandao_out_beforetemp)&&(Chazhi_he_before<=Wandao_out_beforetemp))&&((Chazhi_he_after>=-Wandao_out_aftertemp)&&(Chazhi_he_after<=Wandao_out_aftertemp))) 
//    Wandao_road_out = 1;
//  if(((Chazhi_he=>-s_temp)&&(Chazhi_he<=s_temp))&&(Chazhi_abs<=s_abs_temp))
//    s_road   = 1;
//  
//  
//  if(Zhidao_road = 1&&zhidao_num >=2)
//  {
//    zhidao_num = 0;
//    //��ֱ������
//  }
//  //�Ժ��ټ�
//  
//  
//  
//  Chazhi_he_before = 0;
//  Chazhi_he_after  = 0;
//  Chazhi_he        = 0;
//  Chazhi_abs       = 0;
//  Chazhi_abs       = 0;
 

 
 
 
//       /****************λ�ý���************************/
//       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] - 1))  //�Ѿ�ƫ��0�Ŵ�����
//       {
//             position=0;
//       }
//       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //���λ��  0-1�Ŵ�����֮��
//       {
//             position=1;
//             AD_0_max = AD_inductor[0];  //��¼�´�ʱ��0�Ŵ�������ֵ
//       }
//       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //�Ҳ�λ��  1-2�Ŵ�����֮��
//       {
//             position=2;
//             AD_2_max = AD_inductor[2];  //��¼�´�ʱ��3�Ŵ�������ֵ
//       }
//       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //�Ѿ�ƫ��3�Ŵ�����
//       {
//             position = 3;
//       }
//       else if((AD_inductor[0] <= 25)&&(AD_inductor[1] <= 25)&&(AD_inductor[2] <= 25))
//       {
//            position = 4;
//       }
//       /*
//       //~~~~~~~~~~~~~~~~~~~~~~~ ����λ�ý���~~~~~~~~~~~~~~~~~~~//
//       if(max_back == 3 && AD_inductor[4] <= Position_transit[2] - 1)
//       {
//            if(AD_inductor[4] <= Position_transit[2] - 22)
//               position_back = 0;
//            if(AD_inductor[4] >= Position_transit[2] - 20)
//               position_back = 1;
//       }
//       else  if(max_back == 3 && AD_inductor[4] > Position_transit[2] + 1 || max_back == 4 && AD_inductor[3] > Position_transit[3] + 1)
//       {
//            position_back = 2;
//       }
//       else if(max_back == 4 && AD_inductor[3] <= Position_transit[3] - 1)
//       {
//            if(AD_inductor[3] >= Position_transit[3] - 20)
//               position_back = 3;
//            if(AD_inductor[3] <= Position_transit[3] - 22)
//               position_back = 4;
//       }
//       */
//       
//       if(abs_inductor(position - position_last) == 2)  //λ�÷�����
//       {
//            position = position_last;
//       }
//       else
//       {
//       position_last = position;
//       }
//       
//       
//      //////����ں͵��߼нǹ����º���ת���㣬��ʱ���ɵ�ǿ������//////////////
//       if(position == 0 && AD_0_max < 75)
//       {
//           AD_0_max = 75 + abs_f(75 - AD_0_max);
//       }
//       else if(position == 3 && AD_2_max < 75)
//       {
//           AD_2_max = 75 + abs_f(75 - AD_2_max);
//       }
//
//       /*************����ƫ����*************/
//       if(position == 0)   //��ඪ��
//       {
//            Chazhi = (int16)((AD_inductor[1] - abs_f(AD_0_max-AD_inductor[0]) - AD_0_max)*1)-0;  ///���������
//       }
//       else if(position == 1 || position == 2) //�����м�λ��
//       {
//                
//                Chazhi = (AD_inductor[2] - AD_inductor[0]);    
//                if(((AD_inductor[0]>=40)&&(AD_inductor[1]>=65))||((AD_inductor[1]>=65)&&(AD_inductor[2]>=40)))
//                  Chazhi = 0;
//       }
//       else if(position == 3)  //�Ҳඪ��
//       {
//            Chazhi = (int16)((abs_f(AD_2_max-AD_inductor[2]) + AD_2_max - AD_inductor[1] )*1)+0;
//       }
//       else if(position == 4)
//       {
//            Chazhi = 80;
//       }
//     
//       if(Strig  ht_Flag)
//       {
//           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //��ֱ����б�ʿ��ƶ��
//       }
//       if(UPhill_flag)  //����ʱ ǿ����������ƫ����
//       {
//           Chazhi = (int16)((AD_inductor[2] - AD_inductor[0]));
//       }
      
        

}











