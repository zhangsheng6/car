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
char  min_v[5] = {7,7,7,7,7};  //电感标定 采集值      ？？？？待测？？？？
int   Position_transit[4] = {0,0} ;  //记录过渡点归一化的值  ???待测？？？？
int  AD_MAX_NUM;  
int  position_back = 1;
float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
int RefAd = 20;
int Add_AD_value = 20;




//延时
void delayms(unsigned int time)
{
   unsigned int i=0;
   while(time--)
   {
      i=12000;  //自己定义
      while(i--);
   }
}

///取绝对值
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
 *  函数名称   Read_ADC
 *  功能说明： AD采集
 *  参数说明：
 *  函数返回： 无
 *  修改时间：
 *  备    注：
*************************************************************************/
void Read_ADC_heng(void)
{
      int16  i,j,k,temp;
      int16  ad_valu1[5],ad_sum[5];

      for(i=0;i<5;i++)
      {
            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //左  通道
            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //中  通道
            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //右  通道
//            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //中1 通道
//            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //中2 通道
      }
   //////////////////////冒泡排序///////////////////////////////////
      for(i=0;i<3;i++)     //5个电感
      {
         for(j=0;j<4;j++)  //五个数据排序
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu[i][k] > ad_valu[i][k+1])  //前面的比后面的大  则进行交换
               {
                  temp = ad_valu[i][k+1];
                  ad_valu[i][k+1] = ad_valu[i][k];
                  ad_valu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<3;i++)    //求中间三项的和
      {
         ad_sum[i]   = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
         ad_valu1[i] = ad_sum[i] / 3;
      }
   ////////////////////////滑动平均滤波/////////////////////////////
      for(i = 0;i < 3;i ++)  //取中间3位的值到前三位
      {
          AD_V[0][i] = ad_valu[0][i + 1];
          AD_V[1][i] = ad_valu[1][i + 1];
          AD_V[2][i] = ad_valu[2][i + 1];
//          AD_V[3][i] = ad_valu[3][i + 1];
//          AD_V[4][i] = ad_valu[4][i + 1];
      }
      for(i=0;i<3;i++)   //第三位存储平均值
      {
          AD_V[i][NM-1] =  ad_valu1[i];
      }
      for(i = 0;i < NM;i ++)   //得到原中间三位的值
      {
          AD_sum[0] += AD_V[0][i];
          AD_sum[1] += AD_V[1][i];
          AD_sum[2] += AD_V[2][i];
//          AD_sum[3] += AD_V[3][i];
//          AD_sum[4] += AD_V[4][i];
      }
      for(i=0;i<3;i++)  //求平均
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
            ad_valu_shu[0][i] = ADC_Once(ADC_4,adc12bit);  //中1 通道
            ad_valu_shu[1][i] = ADC_Once(ADC_5,adc12bit);  //中2 通道
      }
   //////////////////////冒泡排序///////////////////////////////////
      for(i=0;i<2;i++)     //5个电感
      {
         for(j=0;j<4;j++)  //五个数据排序
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu_shu[i][k] > ad_valu_shu[i][k+1])  //前面的比后面的大  则进行交换
               {
                  temp = ad_valu_shu[i][k+1];
                  ad_valu_shu[i][k+1] = ad_valu_shu[i][k];
                  ad_valu_shu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<2;i++)    //求中间三项的和
      {
         ad_sumshu[i] = ad_valu_shu[i][1] + ad_valu_shu[i][2] + ad_valu_shu[i][3];
         ad_valu1_shu[i] = ad_sumshu[i] / 3;
      }
   ////////////////////////滑动平均滤波/////////////////////////////
      for(i = 0;i < 2;i ++)  //取中间3位的值到前三位
      {
          AD_V_shu[0][i] = ad_valu_shu[0][i + 1];
          AD_V_shu[1][i] = ad_valu_shu[1][i + 1];
      }
      for(i=0;i< 2;i++)   //第三位存储平均值
      {
          AD_V_shu[i][2] =  ad_valu1_shu[i];
      }
      for(i = 0;i < 2;i ++)   //得到原中间三位的值
      {
          AD_sun_shu[0] += AD_V_shu[0][i];
          AD_sun_shu[1] += AD_V_shu[1][i];
      }
      for(i=0;i<2;i++)  //求平均
      {
          AD_valu_shu[i] = AD_sun_shu[i] / NM;
          AD_sun_shu[i] = 0;
      }
}

/*************************************************************************
 *  函数名称   Date_analyse
 *  功能说明： 数据分析
 *  参数说明：
 *  函数返回： 无
 *  修改时间：
 *  备    注：
*************************************************************************/
void Date_analyse()
{
     int16  i,max_front=0,max_back=0;
     //static int16 max_old = 1,max_crosstalk = 1;
     //static int16 position_last = 2;
     //float  sensor_1;
     
     Read_ADC_heng();
     Read_ADC_shu();

     /*********************归一化处理********************/
     for(i=0;i<3;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        if(sensor_to_one[i]>1.0)   sensor_to_one[i]=1.0;

        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
     }
     for(i=0;i<3;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v1[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        if(sensor_to_one[i]>1.0)   sensor_to_one[i]=1.0;

        AD_inductor1[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
     }
     if(AD_inductor1[1] >= 36)
     {
        for (i = 0;i < 3;i++)
          AD_inductor[i] = AD_inductor1[i];
     }
     
       /*******1号电感特殊归一化，用于坡道检测********/
//      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//      Slope_AD_1 = 100 * sensor_1;
   ////////////////////////////////////////////////////////////////////

       for(i=0;i<3;i++)                 //找出最强的传感器
       {
         if(AD_inductor[max_front]<AD_inductor[i]-0)
           max_front=i;
       }
       max_value=AD_inductor[max_front];  //最大电感值

    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //找后排最强电感
       
       //丢线时最大值取旧值
       if(max_value < 40)           
       {
         Lost_Flag = 1;
       }
       else
       {
         Lost_Flag = 0;
       }

       //用到俩个电感识别赛道
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
       
       
       /*****************对偏差值滤波*************/
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
          
        for(i=0;i<3;i++)    //求中间三项的和放在数组第6位
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
        
        
//       //防串道
//       if(abs_inductor(max_front - max_crosstalk) < 2)  
//       {
//            max_crosstalk = max_front;
//       }
//       else
//            max_front = max_crosstalk;
       
      // AD_MAX_NUM = max_front;        //传送速度控制

//    if(Lost_Flag == 1)
//    {
//      Chazhi = Last_Posa;
//      
//      if(Last_Posa <= 0 && (max_front == 0||max_front == 1) && max_value >= 10 )   
//      {
//   	Lost_Flag = 0;    //信号找到
//      }
//      else if(Last_Posa >= 0 && (max_front == 1||max_front == 2) && max_value >= 10) 
//      {
//    	Lost_Flag = 0;    //信号找到
//      }
//    	//当传感器与赛道角度很小时采集值突变，整定值保持，
//    //	if(Mid_AD<-20) Last_Posa=Last_Posa-3;  //  Mid_AD偏移量 舵机P值
//    //	if(Mid_AD> 20) Last_Posa=Last_Posa+3;
//    	if(Last_Posa > 100) Last_Posa = 100;   //Last_Posa 在-100~100之间。
//    	if(Last_Posa < -100) Last_Posa = -100;	
//    }
//        
//   if(huandao_in == 0&&Lost_Flag == 0)
//   {
//  switch (max_front)  //最大电感序列号
//  {
//  /*********** 车离开导线偏左，分3种情况************/
//  case 0:   // 右侧电感最大
//    {
//      if(AD_inductor[0] > RefAd)     //右侧电感> RefAd=20 【RefAd参考值视情况改动】
//      {
//                          
//        if(AD_inductor[1] > RefAd)  //中间电感> RefAd=20   16
//        {
//         Chazhi = -35 - 35*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
//        }
//        else 
//        {
//          Chazhi=-100 + 30*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
//        }
//      }
//     else  
//       	Chazhi = -100;      //丢信号
//    } break;
///*********** 车在左右之间晃荡 ，分2种情况 ************/
//  case 1://中间电感最大
//     {
//        if(AD_inductor[1] > RefAd)   //已5修改  中间电感
//        {                		  
//          if(AD_inductor[2] > AD_inductor[0])       //  左边大于右边偏右            
//          Chazhi =  55 - 55*(Add_AD_value+AD_inductor[1]-AD_inductor[2])/(Add_AD_value+AD_inductor[1]-AD_inductor[0]);
//          else	                          //  右边大于左边偏左                    
//          Chazhi = -55 + 55*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
//        }                                                                          
//     }  break;
//
///***************车离开导线偏右，分3种情况 **************************/
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
//      	  Chazhi = 100;	                 //丢信号3
//    }  break;
//   }
//   Last_Posa = Chazhi;
//  
//           //跑直弯
////  if(AD_inductor[0]<=10&&AD_inductor[1]<=10&&AD_inductor[2]<=10&&Chazhi <= 0)Chazhi = -40;
////  if(AD_inductor[0]<=10&&AD_inductor[1]<=10&&AD_inductor[2]<=10&&Chazhi >= 0)Chazhi =  40;
//   }

 if(Chazhi>100)  Chazhi =  100;
 if(Chazhi<-100) Chazhi = -100;
 
// Chazhi_sum += Chazhi;
// Sum_flag++;
// Chazhi      = Chazhi_sum/Sum_flag;
// if(Sum_flag == 10){Sum_flag = 0; Chazhi_sum = 0;}
 
 
 /////第一套方案
  //环岛    
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
//    //取50个的电感值的代数和
//    for (Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//    {
//      Chazhi_he += Chazhi_wandao[Chazhi_j];
//      //取前20的值
//      if(Chazhi_j == 20)
//      Chazhi_he_before = Chazhi_he;
//      //取后20的值
//      if(Chazhi_j >=31&&Chazhi_j <= 50)
//        Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
//    }
//    //取50个电感值的绝对值和
//    for (Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//    { Chazhi_abs  += abs_f(Chazhi_wandao[Chazhi_j]);}
//  }
//  
// /*
//    电磁组前瞻较小， S 道处理较困难， S 道的处理的好坏对整体速度有较大
//的影响。 处理方法如下：初始化一个容量为 50 的数组，记录每次的弯曲度，动
//态更新数组。然后对 50 个数据求绝对值和和代数和,如果代数和绝对值很小，
//则车在直道，如果代数和和绝对值和较小，但是前 20 个数据较大，则可以判定
//小车在出弯，如果代数和和绝对值和较小，后 20 较大，则判定小车在入弯，如
//果代数和很小，但绝对值和很大，则在 s 弯道。经过调试， 虽然有一点滞后性，
//还可以继续完善。但是这个算法可以非常好的处理弯道。
//*/
//  
//  if(((Chazhi_he=>-Zhidao_road)&&(Chazhi_he<=Zhidao_road))&&((Chazhi_abs>=-Zhidao_road)&&(Chazhi_abs<=Zhidao_road)))  ///数可调
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
//    //加直道策略
//  }
//  //以后再加
//  
//  
//  
//  Chazhi_he_before = 0;
//  Chazhi_he_after  = 0;
//  Chazhi_he        = 0;
//  Chazhi_abs       = 0;
//  Chazhi_abs       = 0;
 

 
 
 
//       /****************位置解算************************/
//       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] - 1))  //已经偏离0号传感器
//       {
//             position=0;
//       }
//       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //左侧位置  0-1号传感器之间
//       {
//             position=1;
//             AD_0_max = AD_inductor[0];  //记录下此时的0号传感器的值
//       }
//       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //右侧位置  1-2号传感器之间
//       {
//             position=2;
//             AD_2_max = AD_inductor[2];  //记录下此时的3号传感器的值
//       }
//       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //已经偏离3号传感器
//       {
//             position = 3;
//       }
//       else if((AD_inductor[0] <= 25)&&(AD_inductor[1] <= 25)&&(AD_inductor[2] <= 25))
//       {
//            position = 4;
//       }
//       /*
//       //~~~~~~~~~~~~~~~~~~~~~~~ 后排位置解算~~~~~~~~~~~~~~~~~~~//
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
//       if(abs_inductor(position - position_last) == 2)  //位置防跳变
//       {
//            position = position_last;
//       }
//       else
//       {
//       position_last = position;
//       }
//       
//       
//      //////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
//       if(position == 0 && AD_0_max < 75)
//       {
//           AD_0_max = 75 + abs_f(75 - AD_0_max);
//       }
//       else if(position == 3 && AD_2_max < 75)
//       {
//           AD_2_max = 75 + abs_f(75 - AD_2_max);
//       }
//
//       /*************计算偏移量*************/
//       if(position == 0)   //左侧丢线
//       {
//            Chazhi = (int16)((AD_inductor[1] - abs_f(AD_0_max-AD_inductor[0]) - AD_0_max)*1)-0;  ///需调？？？
//       }
//       else if(position == 1 || position == 2) //处于中间位置
//       {
//                
//                Chazhi = (AD_inductor[2] - AD_inductor[0]);    
//                if(((AD_inductor[0]>=40)&&(AD_inductor[1]>=65))||((AD_inductor[1]>=65)&&(AD_inductor[2]>=40)))
//                  Chazhi = 0;
//       }
//       else if(position == 3)  //右侧丢线
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
//           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //长直道用斜率控制舵机
//       }
//       if(UPhill_flag)  //上坡时 强制用两侧电感偏移量
//       {
//           Chazhi = (int16)((AD_inductor[2] - AD_inductor[0]));
//       }
      
        

}











