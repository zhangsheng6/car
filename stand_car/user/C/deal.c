#include "deal.h"
#include "variable.h"
#include "common.h"
#include "allHead.h"


int  Angle_PreDerr = 0,Angle_PrePreDerr = 0;     //位移偏移量平均值，跟舵机打角有关，跟速度也有关。

float gyr_offset_y =209 ;//23.929;

float road_err_D_Tmp=0,Road_Err_D=0; 
//mid_AD放大倍数 主要数据
float P_Direction=0;
float P_Direction_high=0 , P_Direction_low=0;  //-280  476
float P_Direction_High_Temp=0 , P_Direction_Low_Temp=0;  //-280  476

//电感差算出来的  mid_AD一阶滤波放大系数
float D_Direction_Road_Low=0, D_Direction_Road_High=0,D_Direction_Road=0;
float D_Direction_Road_Low_Temp=0, D_Direction_Road_High_Temp=0; //300 1260

float Direction_Control_Output = 0.0;
float Direction_angle=0.0,D_Direction =0,D_Direction_Temp_H=0,D_Direction_Temp_L=0;//-36;// -30;



//参数融合
float RH=0,RH_Temp=0;




/*
//赛道标志
char g_StraightFlag    = 0;
char Long = 0;
char g_StartSpeedUp = 0;//清除发车标志


//直道弯道参考量
char Straight_Min,Straight_Max;
char RoadRight_Min,RoadRight_Max;
char RoadLeft_Min,RoadLeft_Max;

//霍尔元件
int32_t Pulse_Acc;

//长短赛道判断
int32_t g_Measure_Pluse;
char Measure_Pflag = 0;
extern int32_t g_Measure_Pluse_Num;

int32_t g_Measure_Pluse_long;
char Measure_Pflag_long = 0;
extern int32_t g_Measure_Pluse_long_Num;


//速度参量
int32_t g_Speed_Min = 0,g_Speed_Mid_Limt = 0,g_Speed_Low_Limt = 0,g_Speed_Limt = 0;
int32_t g_SM = 0,g_SL = 0;
extern int32_t g_Speed_SetPoint=0;        
extern int32_t g_Long_Speed;
int32_t Stright_Speed = 0;
int32_t g_Speed_Min;


//设置变速速度和抖动值
int32_t g_Vi_Ref = 0;                  //弯道变速时的参考速度
*/


/*************************************************************************
 *  函数名称   Deal_Init()
 *  功能说明： 赛道分析
 *  参数说明：         
 *  函数返回： 无
 *  修改时间：
 *  备    注：
*************************************************************************/
void Deal_Init()
{
  static  int32_t Chazhi_Sum,Aver_Chazhi_AD,Chazhi_Value[10] = {0};//定义AD采集多次和，每次AD值放在Chazhi_Value[]中
  static  char    Chazhi_head;
  char x;
  float r=0.15;
  
  /***********差值加和求平均************/
  Chazhi_Sum                -= Chazhi_Value[Chazhi_head];
  Chazhi_Value[Chazhi_head]  = Chazhi;
  Chazhi_Sum                += Chazhi_Value[Chazhi_head];
  Chazhi_head ++;
  if(Chazhi_head == 10)      Chazhi_head = 0;
  Aver_Chazhi_AD             = Chazhi_Sum/Chazhi_head;
  
  RH=RH_Temp;
  
  
  Angle_PrePreDerr = Angle_PreDerr;
  x                = Chazhi_head-1;
  if(x==-1) x=9;
    	
  road_err_D_Tmp   = Aver_Chazhi_AD-Angle_PreDerr;
  Road_Err_D       = (1-r)*Road_Err_D + r*road_err_D_Tmp;
  Direction_angle  = (gyro_y - gyr_offset_y) * gyr_ratio;
  
  D_Direction=D_Direction_Temp_H;
  
  Angle_PreDerr = Aver_Chazhi_AD*(1-RH)+(Aver_Chazhi_AD*1.5)*RH; 
  
  
  if(speed_car<180)
  {
     D_Direction_Road=D_Direction_Road_Low;
     P_Direction = P_Direction_low;
     D_Direction =D_Direction_Temp_L;
  }
  else 
  {
     D_Direction_Road=D_Direction_Road_High;//Fuzzy_Dir_Road();
     P_Direction = P_Direction_high;
     D_Direction =D_Direction_Temp_H;
  }
  Direction_Control_Output=( P_Direction * Angle_PreDerr) + D_Direction*Direction_angle + D_Direction_Road*Road_Err_D;

  
  /*
  
  Deal_Road();     //道路信息
  
  Deal_Road_Model();
  
*/
}


/*************************************************************************
 *  函数名称   Deal_SpeedFeedback()
 *  功能说明： 1.检测长直道短直道
 *  参数说明：         
 *  函数返回： 无
 *  修改时间：
 *  备    注：
************************************************************************

void Deal_SpeedFeedback()
{
  
  /********* LPTMR脉冲计数值  求和 求平均**********
    const uint8_t ArraySize = 4;
    static uint32_t Speed_Sum = 0,g_Velocity_Average,Speed_Value[4] = {0,0,0,0};//定义AD采集多次和
    static uint8_t Speed_Head = 0;	//Mid_AD_Value作为数组指针
    
    Speed_Value[Speed_Head] = LPTMR_Measure();
    Speed_Sum += Speed_Value[Speed_Head];//加上此次的值
    Cnt0_1_Clear();//计数器清零

    Speed_Head ++ ;
    if(Speed_Head >= ArraySize)
    Speed_Head = 0;	
    Speed_Sum -= Speed_Value[Speed_Head];//减去上ArraySize次的值
    
    g_Velocity_Average = Speed_Sum / (int32_t)ArraySize;	//获得g_Velocity_Average接口
    
    
    /**********检测长直道短直道*********
        //10ms一次速度反馈值
    if(g_StraightRoad >= 60)
    {
      /*
            //此处的值，用于霍尔检测
            Pulse_Acc += g_Velocity_Average;//四次测速平均值
            if(Pulse_Acc >= 50000)
            {
                    Pulse_Acc = 51000;	//限定范围
            }
      *
            
            //短直道
            g_Measure_Pluse += g_Velocity_Average;         
            if(g_Measure_Pluse >= g_Measure_Pluse_Num)
            {
                    g_Measure_Pluse = g_Measure_Pluse_Num;   //80cm直道进入减速弯道，作为短直道
            }
            if(g_Measure_Pluse >= g_Measure_Pluse_Num)
            {
                    Measure_Pflag = 1;
            }
            //长直道
            g_Measure_Pluse_long += g_Velocity_Average;
            if(g_Measure_Pluse_long > g_Measure_Pluse_long_Num)     //7200
            {
                    g_Measure_Pluse_long =g_Measure_Pluse_long_Num;	//240cm直线才算做长直道
            }
            if(g_Measure_Pluse_long >= g_Measure_Pluse_long_Num)
            {
                    Measure_Pflag_long = 1;
                    Long = 1;
            }
    }
    
    else
    {
      
         g_Measure_Pluse = 0;//短直道脉冲计数
         g_Measure_Pluse_long = 0;//长直道脉冲计数
         //标志清零

         Measure_Pflag = 0;//短直道标志
         Measure_Pflag_long = 0;//长直道标志.

         Pulse_Acc += g_Velocity_Average;
         
         /*
         if(Pulse_Acc >= 50000)//3000大约1m，此处表示跑了大于10秒后若检测到霍尔，才开始刹车
         {
             Pulse_Acc = 51000;
         }
         */
/*
    }
    
    
    
    
}

*/
/*************************************************************************
 *  函数名称   Deal_Road_Model()
 *  功能说明： 赛道处理方法
 *  参数说明：         
 *  函数返回： 无
 *  修改时间：
 *  备    注：
************************************************************************
void Deal_Road_Model()
{
  int32_t g_Vi_Temp = 0;
  static int Wan_Count = 0,Zhi_Count = 0;
  
  //开口向上的二次函数，某个参数
  g_Vi_Temp = (int32_t)((g_Speed_SetPoint - g_SL)*((fabs(Aver_Chazhi_AD)-100)*(fabs(Aver_Chazhi_AD)-100))/10000.0 + g_SL);
  
    
   if(Long == 1)
  {
    g_Vi_Ref = g_Long_Speed;
  }
  else
  {
    ///直道写法
    if(g_StraightFlag == 1)
    {
       //该情况是检测到小车处于刚刚起跑状态
       //直道瞬间提速，之后平稳，车入弯后，令车以某一线性，不断增加，
       //但增加的幅度逐渐减小，加速运行，可以使车在通过直道时已某一线性规律行进
       g_Vi_Ref = g_Vi_Temp + Start_Speed - (int32_t)(2 * sqrt(Zhi_Count));
    }
    else 
    {
      //该情况是检测到小车处于刚走进直道的状态
      //直道提速
      g_Vi_Ref = g_Vi_Temp + Stright_Speed - (int32_t)( sqrt(Zhi_Count));
    }
    
    if(Zhi_Count < 255)
    {
      Zhi_Count ++;
    }
    Wan_Count = 0;   
  }
  
  
}

*/



/*************************************************************************
 *  函数名称   Ref_Init()
 *  功能说明： 设置参数
 *  参数说明：         
 *  函数返回： 无
 *  修改时间：
 *  备    注：
***********************************************************************
void Ref_Init()
{
	//刹车时间初定，由设定时间及手动调整数值共同确定
	g_Brake_Time = (g_Speed_SetPoint - 90) / 10 + g_Brake_Adjust;

        
        g_Brake_Time_T=(g_Speed_SetPoint - 170) / 10 + g_Brake_Adjust1;


	
	//最小速度
	g_Speed_Min = g_Speed_SetPoint * 8/10;			//120 * 8/10 = 96
	//弯道速度极限值---限定速度范围
	g_Speed_Mid_Limt = g_Speed_SetPoint * 9/10;		//100 * 9/10 = 90
	
	//过弯最小速度
	g_Speed_Low_Limt = g_Speed_SetPoint * 8/10; 	//100 * 8/10 = 80
	//刚入弯速度限定
	g_Speed_Limt = g_Speed_SetPoint * 8/10;			//100 * 8/10 = 80
	
	//用于作为弯道速度值
	g_SM = (g_Speed_SetPoint + g_Speed_Min) / 2;	//(100 + 80 )/ 2 = 90
	//刚入弯的速度参考值
	g_SL = g_Speed_Min - v_temp ;						//86
	
	if(g_SM > g_Speed_Mid_Limt)	//弯道中的速度限定
	{
		g_SM = g_Speed_Mid_Limt;
	}
	if(g_SM < g_SL)			//弯道速度最小值限定
	{
		g_SM = g_SL;
	}
	if(g_SL > g_Speed_Low_Limt)	//刚入弯速度限定值
	{
		g_SL = g_Speed_Low_Limt;
	}
}



*/


















