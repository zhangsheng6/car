#include "balanceControl.h"
#include "Variable.h"
/*影响调节car_angle_speed：
gyro_error->K_1-> P[1][0],E ->R_angle,Q_angle   
*/  

/*影响调节car_angle：
精确角度确定消除陀螺仪角度累积：gyro_error->同上
大概角度确定：K_0->P[0][0],E->Q_gyro
*/


/*
  若R_angle=0
现象：car_angle，car_angle_speed,很大斜率直速上升
分析：此时K_0,K_1最大，导致运算car_angle，car_angle_speed
比例系数最大，直线上升

*/
//调节量1角度测量噪声值
//韩:越小,收敛快速,但稳态值毛刺多;越大，收敛变慢，稳态值越平滑
//韩:往小调 主要决定收敛快慢，增大去噪点，跟随不及时  0.5 0.001 0.003   // 0.25 0.001 0.0001
//ZS:车平放
//往小调，如果大了，车摆动反应慢
//R_angle大：直线平，变化慢，车摆动曲线平缓，正弦波那种
//R_angle小：直线波浪线，变化快，车摆动曲线不平缓，有皱纹

//R_angle=1;车角度很收敛，基本上就是一条平直线，0.25度起伏
//R_angle=0.5;车角度很收敛，基本上就是一条平直线，
//R_angle=0.008;车角度收敛，类似一条平直线，3度起伏
//R_angle=0.001;车角度收敛，波浪线
//R_angle=0;车角度发散，很大斜率垂直上升的曲线，无穷度上升
//K_0,1都影响
float R_angle =0.008;//0.001 0.003;8

//调节量2：角度（初始？）方差 P[0][0]
//韩：越大，收敛快速，但动态振幅过大，越小越好，大跟随性好噪点多
//韩：比较好的一个参数10 0.001 0.0001

//zs

//Q_angle=1;
//图形：车角度基本上跟随加速度计角度
//图形：车角速度基本上跟随陀螺仪角速度
//K_0=0.538-0.537;变1下。K_1=-0.876一点一点变到-0.01

//Q_angle=10;一模一样
//K_0=0.876;始终不变。K_1=-0.876一点一点变到-0.008

/*分析：草稿纸计算分析？？？？？？？
//Q_angle大，car_angle对跟随性acc_angle的跟随性好
//收敛迅速，过大的话，但是振幅太大，波浪线太严重，毛刺多，没法用

//Q_angle小，
car_angle对acc_angle的曲线平滑，稳定性好
//但过小，可能跟随性不好，

*/
//Q_angle=0;
//图形：车角度基本上跟随加速度计角度
//图形：车角速度基本上跟随陀螺仪角速度
//K_0=0.1几-0.008;变一小段时间。
//K_1=-0.876一点一点变到-0.007

float Q_angle = 0.0003;//0006  0.00002;3


//调节量3：陀螺仪角速度（初始？）方差 P[1][1]
float Q_gyro = 0.0000;//008    0.00003;1
//越小,滤出来的稳定角度不在加速度计的中心，往小调，不能太小，增大噪点多，跟随不及时


//调节量4
//P[2][2]:初始的预测误差矩阵
//调节量:加速度计角度的比例系数
#define acc_ratio	0.00100708       		//加速度计比例系数（理论值）

//car_angle:初始的车的角度，默认0度
//gyro_error:初始的陀螺仪角速度偏差/噪声，默认0度
///////////////////////////////////////////////////////////////////////////////
#define PI 3.141592654
#define INTEGRAL_TIME_CONSTANT 0.005         //积分时间

//----------------------------陀螺仪--------------------------------------------
//                                                   0.85
float gyr_angle_speed, gyr_angle = 0, gyr_offset_x = -60;//陀螺仪x,y轴偏移量
//int16 gyr_offset_x;

//----------------------------加速度计------------------------------------------
float acc_ave,acc_angle,acc_mid = 1211.76;     //车体垂直地面的AD值
float acc_angle_cos;						//用于计算加速度计角度
#define ACC_MV_NUM  1.220703125         //mv/num

//---------------------------------直立控制-------------------------------------
//angle_mid  89.9 准确角度算法（87.5~93.2）
//           90.5 加大角度 (65~105)
//P_angle    1000起步调试
float car_angle = 0, car_angle_speed = 0;
//95.3
float angle_mid = 92.0;//90.5;//88.5 重心前倾会使速度不稳  88.8
float P_angle = 2300;    ////多加2电感 重量增加4000   没加电感3700
float D_angle = 20;//12

float Angle_Out = 0;
float angle_E;
uint8  zhili_flag = 0;
char  Angle_flag = 0;

float Angle_Speed_P = 20  ,Angle_Speed_I = 0  ,Angle_Speed_D = 0;

float Angle_E_P     = 0.8 ,Angle_E_I     = 0  ,Angle_E_D     = 0;
int   Angle_out_num = 245;
 float   K_00,K_11;
/**
  * 简介
  *     卡尔曼滤波
  * 注意
  *     1
  *       卡尔曼方程 见 助赢电子直立调试手册 PDF
    
  *     2
  *       陀螺仪短时间数据可信
  *       加速度计长时间数据可信，两者互补
  */
int sure_time=0,gyr_offset_x_sum=0,offset_flag=0;
float tly_angle,tly_cangle;
void Angle_Kalman(void)
{
    static float Pdot[4] = {0,0,0,0};             //过程协方差矩阵的微分矩阵
//    
    static float P[2][2] = {{ 1, 0 }, { 0, 1 }};  //过程协方差矩阵      |1  0|
    static float gyro_error = 0, angle_error = 0; //陀螺仪角速度的偏差（数值由卡尔曼方程计算更新）  |0  1|
    static float K_0 = 0, K_1 = 0;                //含有卡尔曼增益的另外一个函数，用于计算最优估计值
    static float E, t_0, t_1;

    //陀螺仪测车角速度
    L3G4200_Read();
           
    gyr_angle_speed = ((float)gyro_x-gyr_offset_x)*gyr_ratio; //X,角速度，度/秒

    //加速度计测车角度
    acc_ave = hw_ad_ave(MMA7361, adc12bit, 10);//jlink是3.3v供电，而电池是5v，所以基准电压不同，采集参数会不一样
    acc_angle_cos = (acc_mid - acc_ave)*acc_ratio;/* 推算不出来这个算式 --- han *///增加角度范围
//    acc_angle_cos = (float)(((acc_ave + 1351.68 - acc_mid)*ACC_MV_NUM - 1650) / 7840.0);//角度准确,但范围小，要求PD精度高

    if (acc_angle_cos > 1.0)
        acc_angle_cos  = 1.0;
    else if (acc_angle_cos < -1.0)
        acc_angle_cos  = -1.0;

    acc_angle = acos(acc_angle_cos)*180/PI;     //转换为角度

    /* 1 先验估计 -----------------------------------------------------------  */
    /*
    
     (1)先验估计
    X(k|k-1)=A X(k-1|k-1)+B U(k)  
    
    */
    //根据上一次车体角度估计本次角度
    //现在的角度 = 上次的角度 + (陀螺仪所测角速度 - 陀螺仪角速度偏差/噪声)*陀螺仪采样周期
    //角度预测：
/*
  对于正确的车的角度 抵消陀螺仪静态角度累积靠下面这一行
  因为平方车，开电源  
  tly_cangle：波形为从0度上升的斜直线  
  tly_angle：波形为0度左右的平线
  car_angle：波形正确，为110度左右平线
*/    
    car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
    //
    tly_cangle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
    tly_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;

    /* 2 预测方差阵的预测值 -------------------------------------------------- */
    /*
   (2)协方差矩阵的预测
    Q:预测（陀螺仪角度 陀螺仪静态漂移）带来的噪声矩阵
    P（k-1）|P(k-1)：为上一时刻的预测方差阵
    
    P(k|k-1)=A P(k-1|k-1) A’+Q 
    */
    //计算过程    协方差矩阵的    微分矩阵
    //=左边的是本次的协方差矩阵的微分形式
    //=右边的是上次的协方差矩阵
    //Q_angle：车角度的噪声
    //Q_gyro：陀螺仪角速度的噪声
    Pdot[0] = Q_angle  - P[0][1] - P[1][0];
    Pdot[1] = - P[1][1];
    Pdot[2] = - P[1][1];
    Pdot[3] = Q_gyro;

    //计算        协方差矩阵
    //本次的协方差矩阵+=本次的协方差矩阵微分*时间
    P[0][0] += Pdot[0] * INTEGRAL_TIME_CONSTANT;//角度的方差
    P[0][1] += Pdot[1] * INTEGRAL_TIME_CONSTANT;
    P[1][0] += Pdot[2] * INTEGRAL_TIME_CONSTANT;
    P[1][1] += Pdot[3] * INTEGRAL_TIME_CONSTANT;//角速度的方差

    /* 3 计算卡尔曼增益，权重 ------------------------------------------------------ */
    //R_angle:角度测量噪声值
    //P[0][0]:角度方差
    //权重
    E = R_angle + P[0][0];
    //计算卡尔曼增益
    //K_0,K_1前几秒变化，//之后不变化
    K_0 =  P[0][0] / E;
    K_1 =  P[1][0] / E;

    /* 5 更新协方差矩阵 ------------------------------------------------------ */
    t_0 = P[0][0];
    t_1 = P[0][1];

    //更新协方差矩阵，下一次滤波要用到新的
    //新的协方差矩阵=权重*旧值
    P[0][0] -= K_0 * t_0;  //P(K|K)
    P[0][1] -= K_0 * t_1;
    P[1][0] -= K_1 * t_0;
    P[1][1] -= K_1 * t_1;
    /* 4 用误差（angle_error）还有卡尔曼增益（K_0，K_1）来修正 ------------------------------------------- */
   //角度偏差=加速度计角度-车的角度（陀螺仪测出来的）
    //角度偏差越大，修正越大
    angle_error = acc_angle - car_angle;  
/*
   车刚上电，两个增益系数比较大，然后不断变小，
几秒后系数不变了。    
K_0:0.2   ->  0.016
K_1:-2.几 ->  -0.007    
*/ 
//当acc_angle>car_angle,车的角度增加
//当acc_angle<car_angle,车的角度减少
//对车的角度进行修正    
//修正后车的角度=修正前车的角度+卡尔曼增益对车角度的权重*角度偏差
//个人认为k_0是修正角度偏差的系数
/*
    对于正确的车的角度：
无论车如何放置，开电源，使正确的车的角度随时都是
加速度计的大概角度   
*/    
    car_angle  += K_0 * angle_error; //X(K|K)  
//当acc_angle>car_angle,陀螺仪角速度偏差减少
//当acc_angle<car_angle,陀螺仪角速度偏差增加
//修正后陀螺仪的角速度偏差=
//修正前陀螺仪的角速度偏差+卡尔曼增益对陀螺仪角速度的权重*角度偏差
//个人认为k_1是把角度偏差微分成角速度偏差的系数    
    gyro_error += K_1 * angle_error; //X(K|K)  
//当acc_angle>car_angle,车角速度增加
//当acc_angle<car_angle,车角速度减少  
//对车的角速度进行修正  

    car_angle_speed = gyr_angle_speed - gyro_error;
       
    K_00=K_0;
    K_11=K_1;
}

/**
  * 简介
  *     直立控制
  * 注意
  *    
  */
//void Angle_Controler(void)
//{  
//  //角度
//  float Angle_E_last = 0,Angle_E_now = 0,Angle_E_error = 0,Angle_E = 0,Angle_E_inter = 0,Angle_E_inter_Max = 10,Angle_E_out = 0;
//
//  //角速度
//  float Angle_Speed_last = 0,Angle_Speed_now = 0,Angle_Speed_error = 0,Angle_Speed = 0,Angle_Speed_inter = 0,Angle_Speed_inter_Max = 8000;
//  
//  
//  //将角度作为外环 进行PID
//  Angle_E       = (  angle_mid - Speed_Control_Output);
//  Angle_E_last  = Angle_E_now;
//  Angle_E_error = car_angle - Angle_E;
//  Angle_E_inter += Angle_E_error;
//  if(Angle_E_inter > Angle_E_inter_Max) Angle_E_inter = Angle_E_inter_Max;
//  if(Angle_E_inter < -Angle_E_inter_Max) Angle_E_inter = -Angle_E_inter_Max;
//  Angle_E_out     = Angle_E_P * Angle_E_error + Angle_E_inter * Angle_E_I + Angle_E_D * (Angle_E_error - Angle_E_last);
//  
//  //角度串到角速度里面 进行PID调节
//  Angle_Speed   = -Angle_E_out * Angle_out_num + car_angle_speed;
//  Angle_Speed_last  = Angle_Speed_now;
//  Angle_Speed_error = 0 - Angle_Speed;
//  Angle_Speed_inter += Angle_Speed_error;
//  if(Angle_Speed_inter > Angle_Speed_inter_Max) Angle_Speed_inter = Angle_Speed_inter_Max;
//  if(Angle_Speed_inter < -Angle_Speed_inter_Max) Angle_Speed_inter = -Angle_Speed_inter_Max;
//  Angle_Out     = Angle_Speed_P * Angle_Speed_error + Angle_Speed_inter * Angle_Speed_I + Angle_Speed_D * (Angle_Speed_error - Angle_Speed_last);
//  
//  if(zhili_flag == 0) Angle_Out = 0;
//}


    

void Angle_Controler(void)
{
//    static float E_angle;
  
//车平放时角度124 ，偏差为正29   
//车倒下时角度75 ，偏差为负-17.5
  
  //仰角偏高，车会减速
  //仰角偏低，车会加速
  
//    angle_E = (car_angle - angle_mid + Speed_Control_Output);
    angle_E = (car_angle - angle_mid );
    //89.9 (87.5~93.2） 2.4  ~ -3.3
    //88.5 (65~105)   23.5 ~ -16.5

    //>E_angle 才能直立起来(使用它实际上是因为P_angle的取值范围太小，所以只能使误差角范围变小)
    
   // E_angle = tan(angle_E/180*PI) * 9.8;//a > tan(θ) * g -> 恢复力使小车恢复

    //89.9 （87.5~93.2）
    //tan(θ) -0.04~0.057
    //90.5 加大角度 (65~105)
    //tan(θ) 0.4~-0.2
    //88.5 tan(θ) 4.26~-2.9
    
 if(car_angle_speed>=-0.30&&car_angle_speed<=0.3)car_angle_speed = 0;

   Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;//可使P取值范围变小，看情况使用
   
   // if(zhili_flag == 0) Angle_Out = 0;
  //  Angle_Out = -(P_angle*E_angle) + D_angle*car_angle_speed;
    //car_angle_speed 0 ~ 27
    //D_angle*gyr_angle_speed 负！！
//       UART_SendFloat(car_angle, 1);
//       UART_SendFloat(car_angle_speed, 1);
//       OutPut_Data(car_angle, acc_ave, 0, 0);
// uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);
       

}


















 //ZS确定陀螺仪静态漂移量   
//    if(sure_time<100)//2.5*100=250ms
//  {
//    sure_time++;
//    gyr_offset_x_sum+=gyro_x;
//  }
//  else
//    offset_flag=1;
//  
//  if(offset_flag==1)
//  {
//      gyr_offset_x=gyr_offset_x_sum/100;
//      offset_flag=2;
//  }










