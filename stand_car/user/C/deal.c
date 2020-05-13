#include "deal.h"
#include "variable.h"
#include "common.h"
#include "allHead.h"


int  Angle_PreDerr = 0,Angle_PrePreDerr = 0;     //λ��ƫ����ƽ��ֵ�����������йأ����ٶ�Ҳ�йء�

float gyr_offset_y =209 ;//23.929;

float road_err_D_Tmp=0,Road_Err_D=0; 
//mid_AD�Ŵ��� ��Ҫ����
float P_Direction=0;
float P_Direction_high=0 , P_Direction_low=0;  //-280  476
float P_Direction_High_Temp=0 , P_Direction_Low_Temp=0;  //-280  476

//��в��������  mid_ADһ���˲��Ŵ�ϵ��
float D_Direction_Road_Low=0, D_Direction_Road_High=0,D_Direction_Road=0;
float D_Direction_Road_Low_Temp=0, D_Direction_Road_High_Temp=0; //300 1260

float Direction_Control_Output = 0.0;
float Direction_angle=0.0,D_Direction =0,D_Direction_Temp_H=0,D_Direction_Temp_L=0;//-36;// -30;



//�����ں�
float RH=0,RH_Temp=0;




/*
//������־
char g_StraightFlag    = 0;
char Long = 0;
char g_StartSpeedUp = 0;//���������־


//ֱ������ο���
char Straight_Min,Straight_Max;
char RoadRight_Min,RoadRight_Max;
char RoadLeft_Min,RoadLeft_Max;

//����Ԫ��
int32_t Pulse_Acc;

//���������ж�
int32_t g_Measure_Pluse;
char Measure_Pflag = 0;
extern int32_t g_Measure_Pluse_Num;

int32_t g_Measure_Pluse_long;
char Measure_Pflag_long = 0;
extern int32_t g_Measure_Pluse_long_Num;


//�ٶȲ���
int32_t g_Speed_Min = 0,g_Speed_Mid_Limt = 0,g_Speed_Low_Limt = 0,g_Speed_Limt = 0;
int32_t g_SM = 0,g_SL = 0;
extern int32_t g_Speed_SetPoint=0;        
extern int32_t g_Long_Speed;
int32_t Stright_Speed = 0;
int32_t g_Speed_Min;


//���ñ����ٶȺͶ���ֵ
int32_t g_Vi_Ref = 0;                  //�������ʱ�Ĳο��ٶ�
*/


/*************************************************************************
 *  ��������   Deal_Init()
 *  ����˵���� ��������
 *  ����˵����         
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
*************************************************************************/
void Deal_Init()
{
  static  int32_t Chazhi_Sum,Aver_Chazhi_AD,Chazhi_Value[10] = {0};//����AD�ɼ���κͣ�ÿ��ADֵ����Chazhi_Value[]��
  static  char    Chazhi_head;
  char x;
  float r=0.15;
  
  /***********��ֵ�Ӻ���ƽ��************/
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
  
  Deal_Road();     //��·��Ϣ
  
  Deal_Road_Model();
  
*/
}


/*************************************************************************
 *  ��������   Deal_SpeedFeedback()
 *  ����˵���� 1.��ⳤֱ����ֱ��
 *  ����˵����         
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
************************************************************************

void Deal_SpeedFeedback()
{
  
  /********* LPTMR�������ֵ  ��� ��ƽ��**********
    const uint8_t ArraySize = 4;
    static uint32_t Speed_Sum = 0,g_Velocity_Average,Speed_Value[4] = {0,0,0,0};//����AD�ɼ���κ�
    static uint8_t Speed_Head = 0;	//Mid_AD_Value��Ϊ����ָ��
    
    Speed_Value[Speed_Head] = LPTMR_Measure();
    Speed_Sum += Speed_Value[Speed_Head];//���ϴ˴ε�ֵ
    Cnt0_1_Clear();//����������

    Speed_Head ++ ;
    if(Speed_Head >= ArraySize)
    Speed_Head = 0;	
    Speed_Sum -= Speed_Value[Speed_Head];//��ȥ��ArraySize�ε�ֵ
    
    g_Velocity_Average = Speed_Sum / (int32_t)ArraySize;	//���g_Velocity_Average�ӿ�
    
    
    /**********��ⳤֱ����ֱ��*********
        //10msһ���ٶȷ���ֵ
    if(g_StraightRoad >= 60)
    {
      /*
            //�˴���ֵ�����ڻ������
            Pulse_Acc += g_Velocity_Average;//�Ĵβ���ƽ��ֵ
            if(Pulse_Acc >= 50000)
            {
                    Pulse_Acc = 51000;	//�޶���Χ
            }
      *
            
            //��ֱ��
            g_Measure_Pluse += g_Velocity_Average;         
            if(g_Measure_Pluse >= g_Measure_Pluse_Num)
            {
                    g_Measure_Pluse = g_Measure_Pluse_Num;   //80cmֱ����������������Ϊ��ֱ��
            }
            if(g_Measure_Pluse >= g_Measure_Pluse_Num)
            {
                    Measure_Pflag = 1;
            }
            //��ֱ��
            g_Measure_Pluse_long += g_Velocity_Average;
            if(g_Measure_Pluse_long > g_Measure_Pluse_long_Num)     //7200
            {
                    g_Measure_Pluse_long =g_Measure_Pluse_long_Num;	//240cmֱ�߲�������ֱ��
            }
            if(g_Measure_Pluse_long >= g_Measure_Pluse_long_Num)
            {
                    Measure_Pflag_long = 1;
                    Long = 1;
            }
    }
    
    else
    {
      
         g_Measure_Pluse = 0;//��ֱ���������
         g_Measure_Pluse_long = 0;//��ֱ���������
         //��־����

         Measure_Pflag = 0;//��ֱ����־
         Measure_Pflag_long = 0;//��ֱ����־.

         Pulse_Acc += g_Velocity_Average;
         
         /*
         if(Pulse_Acc >= 50000)//3000��Լ1m���˴���ʾ���˴���10�������⵽�������ſ�ʼɲ��
         {
             Pulse_Acc = 51000;
         }
         */
/*
    }
    
    
    
    
}

*/
/*************************************************************************
 *  ��������   Deal_Road_Model()
 *  ����˵���� ����������
 *  ����˵����         
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
************************************************************************
void Deal_Road_Model()
{
  int32_t g_Vi_Temp = 0;
  static int Wan_Count = 0,Zhi_Count = 0;
  
  //�������ϵĶ��κ�����ĳ������
  g_Vi_Temp = (int32_t)((g_Speed_SetPoint - g_SL)*((fabs(Aver_Chazhi_AD)-100)*(fabs(Aver_Chazhi_AD)-100))/10000.0 + g_SL);
  
    
   if(Long == 1)
  {
    g_Vi_Ref = g_Long_Speed;
  }
  else
  {
    ///ֱ��д��
    if(g_StraightFlag == 1)
    {
       //������Ǽ�⵽С�����ڸո�����״̬
       //ֱ��˲�����٣�֮��ƽ�ȣ�����������ĳһ���ԣ��������ӣ�
       //�����ӵķ����𽥼�С���������У�����ʹ����ͨ��ֱ��ʱ��ĳһ���Թ����н�
       g_Vi_Ref = g_Vi_Temp + Start_Speed - (int32_t)(2 * sqrt(Zhi_Count));
    }
    else 
    {
      //������Ǽ�⵽С�����ڸ��߽�ֱ����״̬
      //ֱ������
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
 *  ��������   Ref_Init()
 *  ����˵���� ���ò���
 *  ����˵����         
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
***********************************************************************
void Ref_Init()
{
	//ɲ��ʱ����������趨ʱ�估�ֶ�������ֵ��ͬȷ��
	g_Brake_Time = (g_Speed_SetPoint - 90) / 10 + g_Brake_Adjust;

        
        g_Brake_Time_T=(g_Speed_SetPoint - 170) / 10 + g_Brake_Adjust1;


	
	//��С�ٶ�
	g_Speed_Min = g_Speed_SetPoint * 8/10;			//120 * 8/10 = 96
	//����ٶȼ���ֵ---�޶��ٶȷ�Χ
	g_Speed_Mid_Limt = g_Speed_SetPoint * 9/10;		//100 * 9/10 = 90
	
	//������С�ٶ�
	g_Speed_Low_Limt = g_Speed_SetPoint * 8/10; 	//100 * 8/10 = 80
	//�������ٶ��޶�
	g_Speed_Limt = g_Speed_SetPoint * 8/10;			//100 * 8/10 = 80
	
	//������Ϊ����ٶ�ֵ
	g_SM = (g_Speed_SetPoint + g_Speed_Min) / 2;	//(100 + 80 )/ 2 = 90
	//��������ٶȲο�ֵ
	g_SL = g_Speed_Min - v_temp ;						//86
	
	if(g_SM > g_Speed_Mid_Limt)	//����е��ٶ��޶�
	{
		g_SM = g_Speed_Mid_Limt;
	}
	if(g_SM < g_SL)			//����ٶ���Сֵ�޶�
	{
		g_SM = g_SL;
	}
	if(g_SL > g_Speed_Low_Limt)	//�������ٶ��޶�ֵ
	{
		g_SL = g_Speed_Low_Limt;
	}
}



*/


















