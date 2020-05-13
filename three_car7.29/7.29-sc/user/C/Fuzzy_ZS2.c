#include "Fuzzy_ZS2.h"
#include "allHead.h"
//extern float speed_set; 
//二维模糊控制系统
//输入：差值，速度，陀螺仪x
//输出：方向P,D,陀螺仪D
//速度=左加右/2

//输入小车的实际速度与陀螺仪Y轴数据，控制输出方向P
//float speed_set_Low,speed_set_Mid,speed_set_High;
//float  Angle_E[3]  = {5,10,15};   //小车速度
//float  Gyro_E[3] = {10,15,30};	   //角速度数据
//float  Shell_P[3]  = {10,15,40};  //外层比例控制系数
//隶属语言值             0           1         
//                      20           40        60
//float Speed_E[3]={speed_set-50,speed_set-30,speed_set-10 };   //小车速度
float Speed_E[5]={30,40,50,60,70 };   //小车速度
float Chazhi_E[5]={30,45,60,75,95};	   //角速度数据
float Shell_P[5]={180,220,260,300,380};  //外层比例控制系数

//由于所测数据均为单向数据，故规则表拟定为单向
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
//  速度  10 20 30 40 60   
//                             差值      
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
  int speed_N=0,Chazhi_N=0; //隶属语言值，该语言值为X轴档位
  int  num=0;
  float fuzzy_P=0;
   //记录隶属函数的输出值
  float  Speed_Fzy[2] ={0.0,0.0};
  float  Chazhi_Fzy[2] ={0.0,0.0};

  float  Shell_P_Fzy[5] ={0.0,0.0,0.0,0.0,0.0};
  // /*----- 数据更新-----*/
  // Shell_P[1]  = P_Direction_low;
  // Shell_P[2]  = P_Direction_high;


  //将数据取绝对值，数据的正负仅代表左右	
//	ABS_val(E_angle,angle_err);
//	ABS_val(E_gyro,gyro_err);
  Chazhi_abs=abs_f(Chazhi);
//  Speed_abs=abs_f(speed_car);
  /*-----   Angle 隶属函数描述-----*/
	if(speed_car<Speed_E[0]) //速度<0档
	{
		Speed_Fzy[0] =1.0;//速度低的隶属度为1
		speed_N = 0;//速度20
	}
	else if(speed_car<Speed_E[1])  //0档<速度<1档
	{//  为速度低的隶属度=1挡速度-速度/1挡速度-0挡速度
		Speed_Fzy[0] = (Speed_E[1]-speed_car)/(Speed_E[1]-Speed_E[0]);
		speed_N = 0;//速度20
	}
	else if(speed_car<Speed_E[2])  //1档<速度<2档
	{//  为速度低(40)的隶属度=60-速度/60-40
		Speed_Fzy[0] = (Speed_E[2]-speed_car)/(Speed_E[2]-Speed_E[1]);
		speed_N = 1;//速度40
	}
        
        else if(speed_car<Speed_E[3])  //2档<速度<3档
	{//  为速度低(40)的隶属度=60-速度/60-40
		Speed_Fzy[0] = (Speed_E[3]-speed_car)/(Speed_E[3]-Speed_E[2]);
		speed_N = 2;//速度40
	}
        
         else if(speed_car<Speed_E[4])  //3档<速度<4档
	{//  为速度低(40)的隶属度=60-速度/60-40
		Speed_Fzy[0] = (Speed_E[4]-speed_car)/(Speed_E[4]-Speed_E[3]);
		speed_N = 3;//速度40
	}
        
	else//速度>4档
	{//速度低隶属度
		Speed_Fzy[0] =0;//4
		speed_N =3;//速度40
	}
	Speed_Fzy[1] = 1.0 - Speed_Fzy[0];//隶属速度高函数输出值

        
  /*----- Pre_dirr 变化隶属函数描述-----*/
   if(Chazhi_abs<Chazhi_E[0])//差值<0挡//当陀螺仪Y轴数据小于40时，对应三角隶属函数的隶属度为1，方向量度模糊等级为0级
	{
		Chazhi_Fzy[0] =1;
		Chazhi_N = 0;
	}//差值<60,
	else if(Chazhi_abs<Chazhi_E[1])//0挡<差值<1挡//当陀螺仪Y轴数据小于70时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为0级，此时为40三角形的右边一半
	{
		Chazhi_Fzy[0] = (Chazhi_E[1] - Chazhi_abs)/(Chazhi_E[1]-Chazhi_E[0]);
		Chazhi_N = 0 ;
	}
	else if(Chazhi_abs<Chazhi_E[2])//1挡<差值<2挡//当陀螺仪Y轴数据小于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的左边一半
	{
		Chazhi_Fzy[0] = (Chazhi_E[2] - Chazhi_abs)/(Chazhi_E[2]-Chazhi_E[1]);
		Chazhi_N = 1;
	}
   
   else if(Chazhi_abs<Chazhi_E[3])//2挡<差值<3挡//当陀螺仪Y轴数据小于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的左边一半
	{
		Chazhi_Fzy[0] = (Chazhi_E[3] - Chazhi_abs)/(Chazhi_E[3]-Chazhi_E[2]);
		Chazhi_N = 2;
	}
   
   else if(Chazhi_abs<Chazhi_E[4])//3挡<差值<4挡//当陀螺仪Y轴数据小于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的左边一半
	{
		Chazhi_Fzy[0] = (Chazhi_E[4] - Chazhi_abs)/(Chazhi_E[4]-Chazhi_E[3]);
		Chazhi_N = 3;
	}
   
	else//差值>4挡                     //当陀螺仪Y轴数据大于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的右边一半
	{
		Chazhi_Fzy[0] =0.0;
		Chazhi_N = 3;
	}
	//一个数据在三角形隶属度函数中对应着两个相邻三角形中的隶属度，两个隶属度和为1
	Chazhi_Fzy[1] = 1.0 - Chazhi_Fzy[0];

	/*查询模糊规则表：求比例*/
//查表的时候不单单查询一个规则，而是向右向下拓展成一个规则正方形查询
//num：规则表数字,
//eg:速度30，差值45，Chazhi_N=0，speed_N=0
	num =rule2[Chazhi_N][speed_N];
	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[0];//0.5

	num =rule2[Chazhi_N+1][speed_N];
	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[0];

	num =rule2[Chazhi_N][speed_N+1];
	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[1];

	num =rule2[Chazhi_N+1][speed_N+1];
	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[1];

	/*面积中心法解模糊*/
	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2]
                +Shell_P_Fzy[3]*Shell_P[3]+Shell_P_Fzy[4]*Shell_P[4];
  return(fuzzy_P);
}
