#include "Fuzzy.h"
//二维模糊控制系统
//输入小车的实际速度与陀螺仪Y轴数据，控制输出方向P

float  Angle_E[3]  = {5,10,15};   //小车速度
float  Gyro_E[3] = {10,15,30};	   //角速度数据
float  Shell_P[3]  = {10,15,40};  //外层比例控制系数

//由于所测数据均为单向数据，故规则表拟定为单向
 int rule[3][3]=
        {
          {2,1,0},
          {1,1,0},
          {0,0,0},
        };

	

float Fuzzy_Shell_P(float E_angle,float E_gyro)
{
  float  angle_err=0,gyro_err=0;
  int angle_N=0,gyro_N=0; //隶属语言值
  int  num=0;
  float fuzzy_P=0;
   //记录隶属函数的输出值
  float  Angle_Fzy[2] ={0.0,0.0};
  float  Gyro_Fzy[2] ={0.0,0.0};

  float  Shell_P_Fzy[3] ={0.0,0.0,0.0};
  // /*----- 数据更新-----*/
  // Shell_P[1]  = P_Direction_low;
  // Shell_P[2]  = P_Direction_high;


  //将数据取绝对值，数据的正负仅代表左右	
//	ABS_val(E_angle,angle_err);
//	ABS_val(E_gyro,gyro_err);

  /*-----   Angle 隶属函数描述-----*/
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
	Angle_Fzy[1] = 1.0 - Angle_Fzy[0];//隶属函数输出值

  /*----- Pre_dirr 变化隶属函数描述-----*/
   if(gyro_err<Gyro_E[0])//当陀螺仪Y轴数据小于40时，对应三角隶属函数的隶属度为1，方向量度模糊等级为0级
	{
		Gyro_Fzy[0] =1;
		gyro_N = 0;
	}
	else if(gyro_err<Gyro_E[1])//当陀螺仪Y轴数据小于70时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为0级，此时为40三角形的右边一半
	{
		Gyro_Fzy[0] = (Gyro_E[1] - gyro_err)/(Gyro_E[1]-Gyro_E[0]);
		gyro_N = 0 ;
	}
	else if(gyro_err<Gyro_E[2])//当陀螺仪Y轴数据小于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的左边一半
	{
		Gyro_Fzy[0] = (Gyro_E[2] - gyro_err)/(Gyro_E[2]-Gyro_E[1]);
		gyro_N = 1;
	}
	else                     //当陀螺仪Y轴数据大于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的右边一半
	{
		Gyro_Fzy[0] =0.0;
		gyro_N = 1;
	}
	//一个数据在三角形隶属度函数中对应着两个相邻三角形中的隶属度，两个隶属度和为1
	Gyro_Fzy[1] = 1.0 - Gyro_Fzy[0];

	/*查询模糊规则表*/
	//查表的时候不单单查询一个规则，而是向右向下拓展成一个规则正方形查询
	num =rule[gyro_N][angle_N];
	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[0];

	num =rule[gyro_N+1][angle_N];
	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[0];

	num =rule[gyro_N][angle_N+1];
	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[1];

	num =rule[gyro_N+1][angle_N+1];
	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[1];

	/*面积中心法解模糊*/
	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2];
  return(fuzzy_P);
}
