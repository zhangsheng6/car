#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include "SDSB_ZS.h"
/******************电感分析变量******************************************************************************/
float  max_v[5] = {2000,2000,2000,2000,2000};
float  min_v[5] = {47,47,47,47,47};  //电感标定 采集值      ？？？？待测？？？？
int   Position_transit[4] = {30,30} ;  //记录过渡点归一化的值  ???待测？？？？32,38
float Chazhi_Chucun[20]={0},Chazhi_Old=0,Rate_Count=0,Rate_Flag=0;
/******************电感分析变量2******************************************************************************/
int16 ad_valu[5][5];
char position=1;
#define NM   3
int AD_valu[5],AD_V[5][NM],chazhi_old,RefAd=20, Add_AD_value = 20;
float  Chazhi,Chazhi_Last,Chazhi_Max=60,Chazhi_Min=-60,Chazhi_Max_New=200;//此为1,2位置的最大差值
float  AD_inductor_Last[5]={0};
float  AD_inductor[5],sensor_to_one[5],AD_inductor_Huan,sensor_to_one_Huan;

float  Slope_AD_1;  // 用于坡道检测
int  AD_sum[5];
int  AD_MAX_NUM;   
int  position_back = 1;
float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
/*------------------------------------------------------------------------------------------*/
/**************判断道路信息变量1****************************************************************/
int StraightRoad=0,StraightRoad2=0,StraightRoad_Old=0;//小车直走次数
int WindingRoad_Left = 0,WindingRoad_Right = 0,WindingRoad=0;//小车左转,右转次数


float Road_Remember[P]={0};//差值储存，用于判断道路信息
int StraightRoad_Flag = 0;//直道标志
int WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0,WindingRoad_Flag=0;//左转,右转标志 
/*             判断道路信息变量2                   */
//Road_Remember2[M]:[]里面的数越大，值的状态越新
float Road_Remember2[M]={0},//差值储存，用于判断道路信息
      Abs_sum_Chazhi=0,//50个差值的绝对值总和
      Alg_sum_Chazhi=0,//50个差值的代数总和
      
      Abs_new_Chazhi=0,//最新20个差值的绝对值和，用于检测进弯
      Alg_new_Chazhi=0,//最新20个差值的代数和
      
      Abs_old_Chazhi=0,
      Alg_old_Chazhi=0; 
/*******************END*************************************************************************************/
/******************环岛变量2*************************************************/
//  100,0.5s  
int 

    Circle_Flag=0,//  圆环进入标志，=1圆环双线识别结束，=2识别到转弯时刻
    Circle_L_Flag,Circle_R_Flag,//圆环左/右转标志
    Circle_Turn_Old_Flag=0,

    Circle_Count=0,//  进入圆环双线计数
    Circle_Count_Max=5,//30,0.25s， 圆环双线计数最大值  
    Circle_Count2=0,// 出圆环双线转弯前计数
    Circle_Count2_Max=2,//30,0.25s， 圆环双线计数最大值
    Circle_Count3=0,//圆环转弯时刻计数
    Circle_Count3_Max=2,//圆环转弯时刻计数最大值
    Circle_Count4=0,//圆环转弯时刻计数
    Circle_Count4_Max=20,//圆环转弯时刻计数最大值 
    Circle_Count5=0,//出环双线计数
    Circle_Count5_Max=2,//出环双线计数最大值
    Circle_Count6=0,//出环后直道计数
    
    
    Circle_Count_Out_Flag=0,
    Circle_Count_Out=0,//避免进环迟后,圆环强制转弯结束后保护时间，避免出赛道
    Circle_Count_Out_Max=400,//800，2s

    Circle_L_Count=0,Circle_R_Count=0,//圆环左/右转计数 
    Circle_Turn_Count=20,//圆环左/右转计数最大值20
    Circle_Turn_Count2=5,//圆环左/右转计数最大值20
    Circle_Error_Count=0,
    Circle_Error_Count_Max=10000,
    Circle_Error_Flag=0,
    
    Circle_L_Finish_Count=0,Circle_R_Finish_Count=0;// 圆环左/右转结束计数
float  
        Circle_Inductor_value2=172,//圆环开始转弯计数值 3550，3500
        Circle_Inductor_value3=150,//不用了,圆环强制转弯值
        Circle_Inductor_value4=100,//圆环行驶值
        Circle_Inductor_value5=160,//出圆环双线值
        Circle_Inductor_value6=100,//出圆环进入单线值，解除本次圆环，进入下次圆环状态
       
        Circle_Turn_Again_Counter=0,//防止再次进弯计数
        Circle_Turn_Again_Counter_Max=400,//1s防止再次进弯计数最大值
        Circle_Turn_Again_Prevent_Flag=1,//防止再次进弯标志
        
        
       Circle_inductor_Max=165,Circle_inductor_Max2=175,//190
        Circle_inductor_Mid=150, Circle_inductor_Mid2=170,
        Circle_inductor_Min=105,Circle_inductor_Min2=120;

  float AD_hall,Stop_Plan_Flag=0,Stop_OK=0,Stop_Flag=0;
  int Stop_ms=0;
  
void Hall(void)
{
    AD_hall = ADC_Once(ADC_6,adc12bit);  //中2 通道
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
/******************环岛变量END*************************************************/
int     Circle_Count6_Max=5000;//下次圆环间隔时间1S1000

int   Circle_Inductor_M1=172,//进圆环双线值
         Circle_Inductor_M2=175,//测转弯值
         Circle_Inductor_M3=160,//转弯值
         Circle_Inductor_LR1=50;
                 
int   AD_inductor_Shuzhi_Max=40,AD_inductor_Shuzhi_Min=1;
int   Circle_Finish_Count_Max=300;//400:1s,// 圆环左/右转结束计数最大值
int   Circle_Chazhi=100;
void Test_Huandao()
{
/*检测进弯*/
if(Circle_Flag==0)//处于检测圆环双线状态
{ 
      if(AD_inductor[1]>Circle_Inductor_M1&&(AD_inductor[0]+AD_inductor[2]>Circle_Inductor_LR1))//&&(AD_inductor[3]>30||AD_inductor[4]>30)
      {
          Circle_Count++;//环岛双线计数   
          if(Circle_Count>Circle_Count_Max)
          {
               Circle_Flag=2; //进入环岛双线
               Circle_Count=0;
          }
      }
}
/*检测转弯计数***************************************************************/
if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
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
//同上解释，可通过计算速度时间路程来使用
        if(AD_inductor[1]<Circle_Inductor_M3)//150转弯
        {

            Circle_Flag=3;//转弯识别结束该转弯了
         }
}
/*开始强制转弯**************************************************************/   
if(Circle_Flag==3)//开始转弯
{      
      if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
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
           Chazhi =-Circle_Chazhi;//47=70度,43.5=65
           Circle_R_Finish_Count++;      
                     BUZZER_ON;

}
    

    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
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
     Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道

    }
  
/*下一个环岛等待*/
if(Circle_Flag==6)
  {
      if(AD_inductor[1]<100)
      {
        Circle_Count6++;
        if(Circle_Count6>Circle_Count6_Max)
        {
          Circle_Count6=0;
        Circle_Flag=0;
        Circle_Error_Flag=0;//转弯误判解除
        }
      }
  }

}
/*************************************************************************
电感数据分析
*************************************************************************/
void Inductor_analyse()
{
     int16  i,max_front=0;//max_back
     static int16 max_old = 1,max_crosstalk = 1;
     static int16 position_last = 1;
     float  sensor_1;

     Read_ADC();

     Inductor_Check();//电感最大最小值校验 
     
/*********************归一化处理********************/
     for(i=0;i<5;i++)
     {
        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
        if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
     }   
          sensor_to_one_Huan=sensor_to_one[1];

       for(i=0;i<5;i++)
     {
      
        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
     }
     AD_inductor_Huan=100*sensor_to_one_Huan;
/*******1号电感特殊归一化，用于坡道检测********/
      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
      Slope_AD_1 = 100 * sensor_1;
/***********找出最强的传感器**********************/
       for(i=0;i<3;i++)                 
       {
         if(AD_inductor[max_front]<AD_inductor[i])
           max_front=i;
       }
       max_value=AD_inductor[max_front];  //最大电感值
/**************丢线时最大值取旧值***************/
       if(max_value < 5)//?           
       {
         max_front=max_old;
         max_value=AD_inductor[max_front];
       }
       else
         max_old=max_front;
/********防串道***************/

/****************位置解算，解算过程的值用归一化放大后的值************************/
       position_last = position;
       
        if(max_front==0 && (AD_inductor[1] <= Position_transit[0]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[0]>1)&&AD_valu[1]>AD_valu[2])  //已经偏离0号传感器
       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
               position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//              LED_1_ON;
 //          AD_0_max = AD_inductor[0];//zs加
       }
       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
           //      中电感在电磁线左边                            中电感在电磁线左边
           
             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
            
       }
       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
        //    中电感在电磁线右边                         中电感在电磁线右边          
             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
       }
       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] &&AD_inductor[1]>AD_inductor[0]&&AD_inductor[2]>1)&&AD_valu[1]>AD_valu[0]) //已经偏离3号传感器
       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
            
               position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
            
               //                          LED_2_ON;
        // AD_2_max = AD_inductor[2];//zs加
       }   
       else 
       {
         position=position_last;
       }
/*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
       if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
       {
            position = position_last;//此刻小车位置转变为上一次小车位置
       }
       else
       {
       position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
       }   




       Chazhi_Last=Chazhi;

 switch (max_front)  //最大电感序列号
  {
  /*********** 车离开导线偏左，分3种情况************/
  case 0:   // 右侧电感最大
    {
      if(AD_inductor[0] > RefAd)     //右侧电感> RefAd=20 【RefAd参考值视情况改动】
      {
                          
        if(AD_inductor[1] > RefAd)  //中间电感> RefAd=20   16
        {
         Chazhi = -30 - 30*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
        }
        else 
        {
          Chazhi=-100 +40*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
        }
      }
     else  
       	Chazhi = -100;      //丢信号
    } break;

  case 1://中间电感最大
     {
        if(AD_inductor[1] > RefAd)   //已5修改  中间电感
        {  
          if(AD_inductor[2] > AD_inductor[0])       //  左边大于右边偏右            
           
Chazhi =  30 - 30*(AD_inductor[1]-AD_inductor[2])/(AD_inductor[1]-AD_inductor[0]);
          else	                          //  右边大于左边偏左                    
//          Chazhi = -34 + 34*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
Chazhi = -30 + 30*(AD_inductor[1]-AD_inductor[0])/(AD_inductor[1]-AD_inductor[2]);
        }                                                                          
     }  break;


  case 2:
    {
//2电感>参考电感
      if(AD_inductor[2] > RefAd)
	{
//1电感>参考电感：车越偏,分数越小，差值越大，
//最大差值50
          if(AD_inductor[1] > RefAd)
//        Chazhi = 25 + 25*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
          Chazhi = 30 + 30*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
          else 
//参考电感>1电感:车越偏,分数越小，差值越大，
//        Chazhi = 100 - 34*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
          Chazhi = 100 - 40*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
        }                                                                        
       else
      	  Chazhi = 100;	                 //丢信号3
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
/*   差值 竖直电感   差值 竖直电感
直道      15,20

弯道   1     20      0       10
      15     35      10      22
      30     51      20      29
      49     49      30      31
      60     34      40      28
      68     23      50      18
      78     11      59      0.1
      94     2
右竖直电感，差值负


*/
void Small_S(void)
{
float Road_Remember_SZ[100]={0}; 
int XS=0,XS_NO=0,XS_Flag=0,
//  StraightRoad=0,//小车直走次数
  WindingRoad = 0,
    WindingRoad_Flag;//小车左转,右转次数
  

   
  for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
  {
      Road_Remember[i] = Road_Remember[i+1];
  }
  Road_Remember[P-1] = abs_f(Chazhi);	//该值为电感检测值-100~100
  
  StraightRoad=0;//小车直走次数
  WindingRoad = 0;//小车左转,右转次数
  
  for(int8_t i = 0;i < P; i++)
  {        
    if(Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
    {
       StraightRoad++;		//判断直道稳定性，分别列出一百组信号
    }		
    else 
      WindingRoad++;		//判断弯道稳定性---右转累   
  }
  StraightRoad_Flag = 0;//直道标志
  WindingRoad_Flag = 0;//左转,右转标志                 
  if(StraightRoad >= 90)
  {
  StraightRoad_Flag = 1;
  }
  if(WindingRoad_Left >= 30)
  {
    WindingRoad_Flag = 1;
  }
 
  

  for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
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
       for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
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
检测弯道还是直道
******************************************************/
void Test_RoadInfo(void) 
{
  StraightRoad_Old = StraightRoad;
   
  for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
  {
      Road_Remember[i] = Road_Remember[i+1];
  }
  Road_Remember[P-1] = Chazhi;	//该值为电感检测值-100~100
  
  StraightRoad=0;;//小车直走次数
  WindingRoad=0;
  WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
  
//  for(int8_t i = 0;i < P; i++)
//  {        
//    if(Road_Remember[i] > -20 && Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
//    {
//      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//    }
//		
//    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -20)//100,38
//   {
//     WindingRoad_Right++;		//判断弯道稳定性---右转累加
//   }
//   else if(Road_Remember[i] >= 20 && Road_Remember[i] <= 300)
//   {
//      WindingRoad_Left++;		//判断弯道稳定性---左转累加
//   }
    
//  }
  
  for(int8_t i = 0;i < P; i++)
  {        
    if(abs_f(Road_Remember[i])< 15)	//在-35~35范围内，保证差值与位置的线性关系
    {
      WindingRoad--;		//判断直道稳定性，分别列出一百组信号
    }		
    else 
    {
      WindingRoad++;		//判断弯道稳定性---左转累加
    }
   
  StraightRoad_Flag = 0;//直道标志
  WindingRoad_Flag=0;
  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
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
检测弯道还是直道:利用两个竖直电感
******************************************************/
void Test_RoadInfo_Shuzhi(void) 
{
  StraightRoad_Old = StraightRoad;
#define SZ 50
float Road_Remember_RI[SZ]={0},Road_Remember_LI[SZ]={0}; 

  for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
  {
      Road_Remember_RI[i] = Road_Remember_RI[i+1];
  }
  Road_Remember[SZ-1] = AD_inductor[3];	
  
   for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
  {
      Road_Remember_LI[i] = Road_Remember_LI[i+1];
  }
  Road_Remember[SZ-1] = AD_inductor[4];	
  
  StraightRoad=0;;//小车直走次数
  WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
  
  for(int8_t i = 0;i < SZ; i++)
  {      	
      if(Road_Remember_RI[i]>15&&Road_Remember_LI[i]<1)//100,38
      {
          WindingRoad_Right++;		//判断弯道稳定性---右转累加
      }
      else if(Road_Remember_LI[i] >15 && Road_Remember_RI[i] <1)//100,38
      {
          WindingRoad_Left++;		//判断弯道稳定性---左转累加
      }
      else 
      {
          StraightRoad++; 
      }         
  }
  
  StraightRoad_Flag = 0;//直道标志
  WindingRoad_Left_Flag = 0;WindingRoad_Right_Flag = 0;//左转,右转标志                 
  
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








/*******************确定电感最大最小值**********************************************************************************/
void Inductor_Check(void)
{
  //起始电感值滤波:确定最低电感值
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
//电感最大值确定：防止实际最大电感值偏大
if(Circle_Flag==0)
  {
     if(AD_inductor[1]<90)
     {
//        if(AD_valu[0]>max_v[0]) max_v[0]=AD_valu[0];//避免差值变大
//        if(AD_valu[2]>max_v[2]) max_v[2]=AD_valu[2];
//        if(AD_valu[3]>max_v[3]) max_v[3]=AD_valu[3];
//        if(AD_valu[4]>max_v[4]) max_v[4]=AD_valu[4];
     }
  }
}
//电感最小值确定：防止实际最大电感值偏小？没想出来


///取绝对值
uint16 abs_i(int value)
{
    if(value<0)
      value=-value;
    return value;
}



/************************************************************************************************************************************************************************************************************************************
检测弯道还是直道
5.6、 弯道策略
电科：电磁组前瞻较小， S 道处理较困难， S 道的处理的好坏对整体速度有较大
的影响。 处理方法如下：初始化一个容量为 50 的数组，记录每次的弯曲度，动
态更新数组。然后对 50 个数据求绝对值和和代数和,如果代数和绝对值很小，
则车在直道，如果代数和和绝对值和较小，但是前 20 个数据较大，则可以判定
小车在出弯，如果代数和和绝对值和较小，后 20 较大，则判定小车在入弯，如
果代数和很小，但绝对值和很大，则在 s 弯道。经过调试， 虽然有一点滞后性，
还可以继续完善。但是这个算法可以非常好的处理弯道。

北科：对过弯速度的处理方式确定为：
入弯时急减速，以得到足够的调整时间，获得正确的转向角度；在弯道内适当
提速，并保持角度不变，为出弯时的加速节约时间；出弯时，先准确判断标志，
然后加速，虽然会耗费一些时间，但是面对连续变向弯道可以减少判断出错的
概率，保证行驶状态的稳定性，而且弯道内的有限加速对后面的提速也有很大
的帮助。综合考虑用可以接收的额外时间换回行驶稳定性还是值得的
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

      for(Chazhi_i = 0;Chazhi_i < 50; Chazhi_i++)   //将所有更新的数据往前移1位
  {
      Chazhi_wandao[Chazhi_i] = Chazhi_wandao[Chazhi_i+1];
  }
  Road_Remember[49] = Chazhi;	//该值为电感检测值-100~100
     
//     Chazhi_i++;
//  Chazhi_wandao[Chazhi_i] = Chazhi;
//  if(Chazhi_i >= 50)
//  {
//    Chazhi_i = 0;
  
    for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
    {   
//取50个的电感值的代数和
      Chazhi_he += Chazhi_wandao[Chazhi_j];
//取前20的值,
      if(Chazhi_j == 20)
      Chazhi_he_before = Chazhi_he;
//取后20的值,最新值
      if(Chazhi_j >=31&&Chazhi_j <= 50)
        Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
    }

//取50个电感值的绝对值和
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
//  for(int8_t i = 0;i <M-1; i++)   //将所有更新的数据往前移1位
//  {
//      Road_Remember2[i] = Road_Remember[i+1];
//  }
//  Road_Remember2[M-1] = Chazhi;	//该值为电感检测值-100~100
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
////  StraightRoad=0;;//小车直走次数
////  WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
//  
//  for(int8_t i = 0;i < 100; i++)
//  {        
//    if(Road_Remember[i] > -40 && Road_Remember[i] < 40)	//在-35~35范围内，保证差值与位置的线性关系
//    {
//      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//    }
// //else if(g_AD_Remember[i] > -45 && g_AD_Remember[i] < 45)				//在-35~35范围内，保证Mid_AD_value与位置的线性关系
// //{
// //  StraightRoad2++;		//判断直道稳定性，分别列出一百组信号
// //}		
//    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -40)//100,38
//   {
//     WindingRoad_Right++;		//判断弯道稳定性---右转累加
//   }
//   else if(Road_Remember[i] >= 40 && Road_Remember[i] <= 300)
//   {
//      WindingRoad_Left++;		//判断弯道稳定性---左转累加
//   }
//    
//  }
//  StraightRoad_Flag = 0;//直道标志
//  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
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
////  状态      右     中     左   右竖  左竖 
////  最大      2000  1600   2000  2000  2000
////                               400(13)   400(13)    
////  正常      825   1600   825   170(10)   170(10)
////  环岛两 个环切线滤波
////  if(AD_inductor[0]>45&&AD_inductor[1]>80&&AD_inductor[2]>45)//中
////    Chazhi=Chazhi/10;
////  if(AD_inductor[1]>75&&(AD_inductor[0]>75||AD_inductor[2]>75))//电磁线在俩电感之间时不行
////    Chazhi=Chazhi/10; 
////   if(Circle_Flag>0)
////   {
////      if(AD_inductor[1]>105&&AD_inductor[1]<Circle_inductor_Max)//识别进入到环岛双线之前之后
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
////    if(AD_inductor[1]>120&&AD_inductor[1]<Circle_inductor_Mid2)//识别进入到环岛双线之前之后
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
////        AD_inductor[1]>85&&(AD_inductor[0]>80||AD_inductor[2]>80))//中
//  //2000,100;2500,125;3000,150;3500,175
//  if(Circle_Flag==0)//处于检测圆环双线状态
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
//              Circle_Count++;//环岛双线计数   
//              if(Circle_Count>Circle_Count_Max)
//              {
//                  Circle_Flag=1; //进入环岛双线
//                  Circle_Count=0;
//              }
//      }
//  }
//  
//  
//  if(Circle_Flag==1)//检测到圆环双线，进入到检测离开圆环双线
//  {
//        if(AD_inductor[1]<Circle_Inductor_value2)      
//                Circle_Count2++;//离开环岛双线计数
//        
//         if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
//          Circle_R_Count++; 
//         if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
//          Circle_L_Count++; 
//         
// //会出现提前转弯，与滞后转弯后强制出环转冲突，导致提前转弯一直旋转        
////      if(Circle_L_Count>Circle_Turn_Count||Circle_R_Count>Circle_Turn_Count)//转弯计数达到上限，进入转弯时刻
////         Circle_Flag=3;//转弯识别结束该转弯了
//         
//         
//         
//         
//        if(Circle_Count2>Circle_Count2_Max)
//
//        {
//             Circle_Flag=2; //离开环岛双线标志
//             Circle_Count2=0;
//        }
//
//  }
//
//   if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
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
//    //同上解释，可通过计算速度时间路程来使用
////       if(Circle_L_Count>Circle_Turn_Count2||Circle_R_Count>Circle_Turn_Count2)//转弯计数达到上限，进入转弯时刻
////                    Circle_Flag=3;//转弯识别结束该转弯了
//
//       if(AD_inductor[1]<Circle_Inductor_value3)//150
//        {
//////          Circle_Count3++;//圆环转弯计数，累加为了避免遇到误判，环岛双线提前结束
//////          if(Circle_Count3>Circle_Count3_Max)
//////          {
//////          Circle_Count3=0;
//             Circle_Flag=3;//转弯识别结束该转弯了
//////          }
//        }
//   }
//   
//   if(Circle_Flag==3)//开始转弯
//   {      
//      if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
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
//           Chazhi =-43.5;//47=70度,43.5=65
//           Circle_R_Finish_Count++;      
//           LED_1_ON;
//                     BUZZER_ON;
//
//      }
//    
//
//    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
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
//     Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道
//
//    }
//  
// /*仅用电感150左右转弯，还会出现帅的提前转弯反转，故屏蔽
//  基本不会出现太滞后转弯,所以屏蔽，一旦出现提前转弯，和太滞后转弯的强制差值一样，导致一直在内旋转
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
////        if(Circle_Turn_Old_Flag==2)//左转进弯
////        {
////           if(Chazhi)
////           if(Chazhi<-40)
////            Chazhi=-Chazhi;     
////         }
////      
////         if(Circle_Turn_Old_Flag==1)//右转进弯
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
//    if(Circle_Flag==4)//圆环强制转弯结束,进入圆环行驶检测
//   {
//        if(AD_inductor[1]<Circle_Inductor_value4)
//      {
//              Circle_Count4++;//环岛双线计数   
//              if(Circle_Count4>Circle_Count4_Max)
//              {
//                  Circle_Flag=5; //出环岛双线标志
//                  Circle_Count4=0;
//              }
//      }
//   }
//     
//  
//   if(Circle_Flag==5)//圆环正规行驶结束束,进入检测出圆环双线
//   {
//        if(AD_inductor[1]>Circle_Inductor_value5)
//      {
//              Circle_Count5++;//环岛双线计数   
//              if(Circle_Count5>Circle_Count5_Max)
//              {
//                  Circle_Flag=6; //出环岛双线标志
//                  Circle_Count5=0;
//              }
//      }
//   }
//     
// 
////   if(Circle_Flag==6)//标志6暂定时间3s
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
////         if(Circle_Turn_Old_Flag==2)//左转进弯预防差值60
////         {
////           if(Chazhi>30)
////            Chazhi=-Chazhi/2;     
////         }
////      
////        if(Circle_Turn_Old_Flag==1)//右转进弯预防差值-60
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
//        Circle_Error_Flag=0;//转弯误判解除
//        }
//      }
//  }
//
////   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//防止误判计数
////      {
////         Circle_Error_Count++;
////         if(Circle_Error_Count>Circle_Error_Count_Max)
////         {
////            Circle_Error_Flag=0;//转弯误判解除
////            Circle_Error_Count=0;
//////                 Circle_Flag=0;
////         }      
////      }   
//
//}
//
//
//
