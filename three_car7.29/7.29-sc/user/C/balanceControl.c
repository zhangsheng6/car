/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    balanceControl.c
  * 文件标识：
  * 摘    要：    平衡控制
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月30日 20:35:50
  ******************************************************************************
  */

#include "balanceControl.h"
#include "Variable.h"
#define PI 3.141592654
#define INTEGRAL_TIME_CONSTANT 0.005         //积分时间

float R_angle =  0.00009;//0.009;	//越小,收敛快速,但稳态值毛刺多;越大，收敛变慢，稳态值越平滑  往小调 主要决定收敛快慢，增大去噪点，跟随不及时
float Q_angle = 0.0001;//0.00001;	//越大，收敛快速，但动态振幅过大，越小越好，大跟随性好噪点多
float Q_gyro = 0.0003;//0.00003;	//越小,滤出来的稳定角度不在加速度计的中心，往小调，不能太小，增大噪点多，跟随不及时

//----------------------------陀螺仪--------------------------------------------
float gyr_angle_speed, gyr_angle = 0, gyr_offset_x = 35;//陀螺仪x,y轴偏移量
//int16 gyr_offset_x;


//----------------------------加速度计------------------------------------------
float acc_ave,acc_angle,acc_mid = 1211.76;//车体垂直地面的AD值
float acc_angle_cos;						//用于计算加速度计角度
#define ACC_MV_NUM  1.220703125         //mv/num
#define acc_ratio	0.00100708       		//加速度计比例系数（理论值）

//---------------------------------直立控制-------------------------------------
//angle_mid  103.3 无配重  92.4 加配重到最后
//P_angle    1000起步调试
float car_angle = 0, car_angle_speed = 0;
float angle_mid = 90.35;//83.5; //80.690;// 90.930	88.5 重心前倾会使速度不稳（82~125）
float low_spd_agl = 90;
float P_angle = 2100;//1900;//;3340;//5300;//9500; 5000 - 直立,太大车轮打滑车会发抖
float D_angle = 0;//6.3; //6.8; //6.300
float Angle_Out = 0;

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
void Angle_Kalman(void)
{
    static float Pdot[4] = {0,0,0,0};             //过程协方差矩阵的微分矩阵
    static float P[2][2] = {{ 1, 0 }, { 0, 1 }};  //过程协方差矩阵      |1  0|
    static float gyro_error = 0, angle_error = 0; //陀螺仪角速度的偏差（数值由卡尔曼方程计算更新）  |0  1|
    static float K_0 = 0, K_1 = 0;                //含有卡尔曼增益的另外一个函数，用于计算最优估计值
    static float E, t_0, t_1;

    //陀螺仪测车角度
    L3G4200_Read();
    gyr_angle_speed = ((float)gyro_x-gyr_offset_x)*gyr_ratio; //X,角速度，度/秒

    //加速度计测车角度
    acc_ave = hw_ad_ave(MMA7361, adc12bit, 10);//jlink是3.3v供电，而电池是5v，所以基准电压不同，采集参数会不一样
//    acc_angle_cos = (acc_mid - acc_ave)*acc_ratio;/* 推算不出来这个算式 --- han */
    acc_angle_cos = (float)(((acc_ave + 1351.68 - acc_mid)*ACC_MV_NUM - 1650) / 7840.0);

    if (acc_angle_cos > 1.0)
        acc_angle_cos  = 1.0;
    else if (acc_angle_cos < -1.0)
        acc_angle_cos  = -1.0;

    acc_angle = acos(acc_angle_cos)*180/PI;     //转换为角度

    /* 1 先验估计 -----------------------------------------------------------  */
    //根据上一次车体角度估计本次角度
    //现在的角度 = 上次的角度 + (陀螺仪所测角速度 - 静态偏移)*陀螺仪采样周期
    car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;

    /* 2 预测方差阵的预测值 -------------------------------------------------- */
    //计算过程协方差矩阵的微分矩阵
    Pdot[0] = Q_angle  - P[0][1] - P[1][0];
    Pdot[1] = - P[1][1];
    Pdot[2] = - P[1][1];
    Pdot[3] = Q_gyro;

    //计算协方差矩阵
    P[0][0] += Pdot[0] * INTEGRAL_TIME_CONSTANT;
    P[0][1] += Pdot[1] * INTEGRAL_TIME_CONSTANT;
    P[1][0] += Pdot[2] * INTEGRAL_TIME_CONSTANT;
    P[1][1] += Pdot[3] * INTEGRAL_TIME_CONSTANT;

    /* 3 计算卡尔曼增益 ------------------------------------------------------ */
    E = R_angle + P[0][0];
    //计算卡尔曼增益
    K_0 =  P[0][0] / E;
    K_1 =  P[1][0] / E;

    /* 5 更新协方差矩阵 ------------------------------------------------------ */
    t_0 = P[0][0];
    t_1 = P[0][1];

    //更新协方差矩阵
    P[0][0] -= K_0 * t_0;  //P(K|K)
    P[0][1] -= K_0 * t_1;
    P[1][0] -= K_1 * t_0;
    P[1][1] -= K_1 * t_1;

    /* 4 用误差还有卡尔曼增益来修正 ------------------------------------------- */
    angle_error = acc_angle - car_angle;
    //给出最优估计值
    car_angle += K_0 * angle_error; //X(K|K)
    //更新最优估计值偏差
    gyro_error += K_1 * angle_error; //X(K|K)
    //为了PID控制把角速度算出来
    car_angle_speed = gyr_angle_speed - gyro_error;
}

/**
  * 简介
  *     直立控制
  * 注意
  *     math.h中三角函数用的是 弧度
  */
void Angle_Controler(void)
{
    static float angle_E, E_angle;

    angle_E = (angle_mid - car_angle);

    //>E_angle 才能直立起来(使用它实际上是因为P_angle的取值范围太小，所以只能使误差角范围变小)
    E_angle = tan(angle_E/180*PI) * 9.8;//a > tan(θ) * g -> 恢复力使小车恢复
    //tan(θ) -0.414~0.374
    //E_angle

    //    Angle_Out = -( P_angle*angle_E ) - D_angle*car_angle_speed;//取值范围太小，此方案不行

    Angle_Out = -(P_angle*E_angle) + D_angle*car_angle_speed;// E_angle = 10 <-> 0.02985259896577487006352080076417
    // P_angle*E_angle 349.2858
    //gyr_angle_speed 32.4  D_angle*gyr_angle_speed 1.8 负！！
    //	DataScope_Get_Channel_Data(car_angle,3);


//        UART_SendFloat(gyro_x, 1);
    switch (chice)
    {
      case 0:
        LED_2_OFF;
        break;

      case 1:
        LED_2_ON;
        UART_SendFloat(acc_ave, 1);
        break;

      case 2:
        LED_2_ON;
        OutPut_Data(acc_ave, 0, 0, 0);
//        UART_SendFloat(car_angle, 1);
        break;

      default :
        break;
    }
}


