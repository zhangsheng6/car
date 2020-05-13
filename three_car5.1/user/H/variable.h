/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    Variable.h
  * 文件标识：
  * 摘    要：    所有变量
  *               蜂鸣器控制
  *               LED控制
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2017年12月25日 6:40:38
  ******************************************************************************
  */

#ifndef _VARIABLE_H_
#define _VARIABLE_H_
#include "allHead.h"

//系统
//extern uint8 boma;
//extern uint8 alarm_status;

//小车状态
extern uint8 carStatus; //小车状态选择
#define NORMAL    0  //正常运行
#define STOP      1  //电机不转
//#define Stand     1  //保持直立
//#define Ready     2  //准备两秒发车
//#define Runing   3   //正在运行
//#define Clear     4
//#define Sliding   5
//extern uint16 Runing_Distance;//行走距离

//菜单
extern uint8  menuSelect; //菜单选择,默认显示菜单
extern uint8  KEY_menuChange;//按键状态，默认关
extern uint8  KEY_sta;   //按键状态，默认关
#define LOGO    0
#define MENU    1
#define MENU_1  2
#define MENU_2  3
#define MENU_3  4
#define MENU_4  5
#define MENU_5  6
#define MENU_6  7
#define MENU_7  8
#define MENU_8  9
#define MENU_9  10
#define MENU_10  11
#define MENU_11  12
#define MENU_12  13
#define MENU_13  14
#define MENU_14  15
#define MENU_15  16
#define MENU_16  17
#define MENU_17  18

//测试电机菜单
extern uint16 FTM_motorDuty;//电机转速测试使用
extern uint8  KEY_textSelect;//测试菜单用于选择
#define TEXT_DEFAULT    0
#define MOTOR_REV      1//笑脸正对 逆时针
#define MOTOR_REV_L     2
#define MOTOR_REV_R     3
#define MOTOR_FOR      4//顺时针
#define MOTOR_FOR_L     5//顺时针
#define MOTOR_FOR_R     6
#define MOTOR_LOC      7//抱死
#define MOTOR_LOC_L     8
#define MOTOR_LOC_R     9

/* 所有对应引脚 -------------------------------------------------------------- */
      //预留
#define TEMPORARY_0     C2
#define TEMPORARY_1     C7

      //蜂鸣器
#define BUZZER          D0

      //LED
#define LED_0           G0
#define LED_1           G1
#define LED_2           G2
#define LED_3           G3

      //矩阵按键
#define KEY_U           I1
#define KEY_D           H6
#define KEY_L           D1
#define KEY_R           H5
#define KEY_M           I4

      //拨码按键
#define KEY_BO_0        F3
#define KEY_BO_1        H0
#define KEY_BO_2        H1
#define KEY_BO_3        I0

      //OLED
//#define OLED_CS          E6
#define OLED_DC          I6
//#define OLED_SDIN        H2
//#define OLED_OSCLK       C3  //ADC0_SE11，FTM2_CH3，修改复用
#define OLED_RES         I5

      //L3G4200
#define IIC_PORT         i2c1
#define IIC_SCL          D3//模拟引脚,没有使用，此处随便写的
#define IIC_SDA          C7//模拟引脚,没有使用，此处随便写的
#define SPI1_PCS         G7
#define SPI1_MISO        G6
#define SPI1_MOSI        G5//不能再用
#define SPI1_SCK         G4
#define SPI_PORT         spi1

      //MMA7361
#define MMA7361          B1

      //UART
#define UART_TX          UART2_TX_PIN //D7
#define UART_RX          UART2_RX_PIN //D6
#define UART_PART        uart2
#define UART_BAUD        115200 //修改波特率，要保证误差在 0.04 以内
#define DEBUG_PORT       UART_PART//不要修改，DEBUG_PORT的使用在最底层文件里，找不到
#define DEBUG_BAUD       UART_BAUD

      //电机方向 以驱动板插槽缺口反对判断方向
#define ENL_L           D4//D3受到iic高频率影响，不可使用
#define ENL_R           E4
#define ENR_L           F2
#define ENR_R           D2

      //PWM
#define PWM_CH0         ftm2 //F0  L
#define PWM_CH1         ftm2 //F1  R

      //测速
#define FTM_SPEED_L     ftm0 //E7  L
#define FTM_SPEED_R     ftm1 //E0  R

//测方向
#define DIR_L            E3
#define DIR_R           E1

#define Direction_L           GpioGet(E3)
#define Direction_R           GpioGet(E1)
//      //PWT
//#define PWT_IN0          D5
//#define PWT_IN1          H7

      //ADC
#define ADC_1           F5
#define ADC_2           C1
#define ADC_3           F7  //F4
#define ADC_4           C0
#define ADC_5            F4
//#define ADC_6            F6

       //PIT
#define PIT0             0
/* 所有对应引脚 -------- END ------------------------------------------------- */

/* 模块通道引脚号设定 -------------------------------------------------------- */
//      FTM 模块通道    端口      可选范围                备注
#define FTM0_CH0_PIN    A0        //B2 A0
#define FTM0_CH1_PIN    A1        //B3 A1

#define FTM1_CH0_PIN    H2        //H2 C4				 C4不要用（与SWD_CLK冲突）
#define FTM1_CH1_PIN    C5        //E7 C5

#define FTM2_CH0_PIN    F0        //C0  H0 F0
#define FTM2_CH1_PIN    F1        //C1  H1 F1
#define FTM2_CH2_PIN    C2        //C2  G4 D0
#define FTM2_CH3_PIN    C3        //C3  G5 D1
#define FTM2_CH4_PIN    B4        //B4  G6
#define FTM2_CH5_PIN    B5        //B5  G7

#define FTM0_COUNT_PIN  E7        //E7 A5  E0             A5不要用（与复位按键冲突）
#define FTM1_COUNT_PIN  E0        //E0 A5  E7             A5不要用（与复位按键冲突）
#define FTM2_COUNT_PIN  A5        //E0 E7  A5             A5不要用（与复位按键冲突）

//      UART模块通道    端口      可选范围                建议
#define UART0_RX_PIN    B0        //A2 B0
#define UART0_TX_PIN    B1        //A3 B1

#define UART1_RX_PIN    F2        //C6 F2
#define UART1_TX_PIN    F3        //C7 F3

#define UART2_RX_PIN    D6        //D6 I0
#define UART2_TX_PIN    D7        //D7 I1

//      I2C 模块通道    端口      可选范围                建议
#define I2C0_SCL_PIN    A3        //A3 B7
#define I2C0_SDA_PIN    A2        //A2 B6

#define I2C1_SCL_PIN    H4        //E1 H4
#define I2C1_SDA_PIN    H3        //E0 H3

//      IRQ模块通道     端口      可选范围                    建议
#define IRQ_PIN         I5        //A5 I0 I1 I2 I3 I4 I5 I6  A5不要用（与复位按键冲突）

//      SPI模块通道     端口      可选范围              建议
#define SPI0_SCK_PIN    B2       //E0 B2
#define SPI0_SOUT_PIN   B3       //E1 B3
#define SPI0_SIN_PIN    B4       //E2 B4
#define SPI0_PCS0_PIN   B5       //E3 B5

#define SPI1_SCK_PIN    G4       //G4 D0
#define SPI1_SOUT_PIN   G5       //G5 D1
#define SPI1_SIN_PIN    G6       //G6 D2
#define SPI1_PCS0_PIN   G7       //G7 D3


/* 蜂鸣器控制 ---------------------------------------------------------------- */
#define BUZZER_ON    	GpioSet(BUZZER, 1);
#define BUZZER_OFF   	GpioSet(BUZZER, 0);
#define BUZZER_TURN   	GpioTurn(BUZZER);

/* LED灯控制 ----------------------------------------------------------------- */
    //LED0
#define LED_0_ON    	GpioSet(LED_0, 0);
#define LED_0_OFF   	GpioSet(LED_0, 1);
#define LED_0_TURN      GpioTurn(LED_0);
    //LED1
#define LED_1_ON    	GpioSet(LED_1, 0);
#define LED_1_OFF   	GpioSet(LED_1, 1);
#define LED_1_TURN      GpioTurn(LED_1);
    //LED2
#define LED_2_ON    	GpioSet(LED_2, 0);
#define LED_2_OFF   	GpioSet(LED_2, 1);
#define LED_2_TURN      GpioTurn(LED_2);
    //LED3
#define LED_3_ON    	GpioSet(LED_3, 0);
#define LED_3_OFF   	GpioSet(LED_3, 1);
#define LED_3_TURN      GpioTurn(LED_3);

/* UART开关控制 -------------------------------------------------------------- */
#define UART_DISABLE       {UART2_C2 &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );}// 关闭 UART
#define UART_ABLE    {UART2_C2 |=  (UART_C2_TE_MASK | UART_C2_RE_MASK );}// 开启 UART
//PWM周期置入值
extern uint16 g_mod;
//ADC暂时用来存储的
extern uint16 adcHold;

#define P 100
#define M 50

//----------------------------陀螺仪--------------------------------------------
#define gyr_ratio	-0.03675 /* 陀螺仪比例系数（理论值）,不知为何改成负数，暂不修改 */
    //存储三轴数据，每一轴两个字节，先低后高，补码形式存储
extern uint8 gx, gy, gz;
extern uint16 wgx, wgy, wgz;
extern int16 gyro_x, gyro_y, gyro_z;//陀螺仪读取值
extern float gyr_angle_speed,gyr_angle_speed_up,//陀螺仪角速度
              gyr_angle_speed_static,//陀螺仪静止时的角速度
              gyr_angle ,//陀螺仪角度
              gyr_angle_up ,//陀螺仪角度
              gyr_offset_x ,//陀螺仪x轴偏移量  
              gyr_offset_y ,//陀螺仪y轴偏移量
              gyr_offset_z,//陀螺仪y轴偏移量
              gyr_offset__z_sum,//陀螺仪z轴静态偏移量总和；
              gyr_offset__z_average,//陀螺仪z轴静态偏移量平均值；     
              gyr_offset__x_sum,//陀螺仪z轴静态偏移量总和；
              gyr_offset__x_average,//陀螺仪z轴静态偏移量平均值；
              Angle_D,Angle_P;


/******************电感分析变量******************************************************************************/
extern int16 ad_valu[5][5];
extern char position;
#define NM   3
extern int AD_valu[5],AD_V[5][NM],chazhi_old;
extern float  Chazhi,Chazhi_Last;
extern float  AD_inductor[5],sensor_to_one[5];
extern float  Slope_AD_1;  // 用于坡道检测
extern float  max_v[5];
extern char  min_v[5] ;  //电感标定 采集值      ？？？？待测？？？？
/*速度设定30:过渡点：0，,0；之前是36.因为按照现在的k1=1.5，差值是50的时候就达
到最大偏转角度，还没到标准过渡点就已最大偏转角度*/
extern int   Position_transit[4]  ;  //记录过渡点归一化的值  ???待测？？？？32,38
extern int  AD_sum[5];
extern int  AD_MAX_NUM;   
extern int  position_back ;
extern float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
/*------------------------------------------------------------------------------------------*/

/****************1赛道识别变量**********************************************************/
extern int AD_valu[5];
extern float Chazhi,Chazhi_Last;
extern char inductor_flag;
extern int Position_transit[4];
extern float AD_inductor[5];
extern float speed_set_Z,speed_set_W;
extern float  max_v[5];
extern char  min_v[5]; 
/****************1赛道识别变量END**********************************************************/

/**************2判断道路信息变量****************************************************************/
extern int StraightRoad,StraightRoad2,StraightRoad_Old;//小车直走次数
extern int WindingRoad_Left ,WindingRoad_Right ;//小车左转,右转次数
extern float Road_Remember[P];//差值储存，用于判断道路信息
extern int StraightRoad_Flag ;//直道标志
extern int WindingRoad_Left_Flag ,WindingRoad_Right_Flag ;//左转,右转标志 
/**************2判断道路信息变量END**************************************************************************************{***/

/******************3环岛变量*************************************************/
//  100,0.5s  

extern int Circle_Flag,//  圆环进入标志，=1圆环双线识别结束，=2识别到转弯时刻
    Circle_L_Flag,Circle_R_Flag,//圆环左/右转标志

    Circle_Count,//  进入圆环双线计数
    Circle_Count_Max,//30,0.25s， 圆环双线计数最大值  
    Circle_Count2,// 出圆环双线计数
    Circle_Count2_Max,//30,0.25s， 圆环双线计数最大值
    Circle_Count3,//圆环转弯时刻计数
    Circle_Count3_Max,//圆环转弯时刻计数最大值

    Circle_L_Count,Circle_R_Count,//圆环左/右转计数 
    Circle_Turn_Count,//圆环左/右转计数最大值
    Circle_Error_Count,
    Circle_Error_Count_Max,
    Circle_Error_Flag,
    
    Circle_L_Finish_Count,Circle_R_Finish_Count,// 圆环左/右转结束计数
    Circle_Finish_Count_Max;//10s,// 圆环左/右转结束计数最大值

//        进入圆环双线中电感值   转弯时刻中电感值      转弯计数累加左右电感值：进双线      出双线
extern float  Circle_inductor_Max,Circle_inductor_Max2,
        Circle_inductor_Mid, Circle_inductor_Mid2,
     Circle_inductor_Min,Circle_inductor_Min2;
/******************3环岛变量END*************************************************/


/*****************模糊控制*************************************************/
extern float Chazhi_Rate;
/*****************模糊控制*************************************************/


/*********************阿克曼角变量***************************************/
extern float Chasu_Bili;
extern float Chazhi_limit;//60
extern double angle_limit;//70

extern float k1,k2,k3;//通过k1,2确定差值与角度的转换比例
extern float angle;//小车偏转角度
/*********************阿克曼角变量END***************************************/


/*--------------------速度设定，测速变量--------------------------------------*/
extern float speed_set_L,speed_set_R,speed_set_L_W,speed_set_R_W;
extern float speed_L ,speed_R ,speed_car;//测速左,车整体速度
extern float speed_old_L,speed_old_R;//上一次测速
extern float speed_set ,speed_set_temp ;//速度设定值，临时速度设定值
extern float speed_set_max, speed_set_min;//速度设定最大最小值
/*--------------------速度设定，测速变量END--------------------------------------*/


/*------------------------速度环变量----------------------------------------------*/
extern float Speed_P,Speed_I,Speed_D;//p，i有作用,使右轮一直2500，左变化的可以
//编码器测的速度和自己设定的速度小写

extern float Speed_Error_L , Speed_Error_Last_L , Speed_Error_Last_Last_L ;  //L速度偏差值   
extern float Speed_Error_R  , Speed_Error_Last_R , Speed_Error_Last_Last_R ;  //R速度偏差值 
extern float Motor_Out_Old_L,Motor_Out_Old_R;//上一次电机输出PWM值
extern float Motor_Out_Max,Motor_Out_Min;//电机输出最大最小值


/*------------------------速度环变量----------------------------------------------*/


/*---------------------------------方向环-------------------------------------*/
extern float Speed_P_D,//方向环P选择
              Speed_I_D,//方向环I选择
              Speed_D_D;//方向环D选择80 


extern float Direction_Control_Output_L ;
extern float Direction_Control_Output_R ;

 extern float Speed_P_Up,Speed_P_Down;//速度环P选择
 extern float Speed_P_L,Speed_P_R;//速度环P_左轮，速度环P_右轮  
 extern float Speed_I_Up, Speed_I_Down;//速度环I选择
 extern float Speed_I_lntegral_L ,Speed_I_lntegral_R;//速度环I积分累加_左轮，速度环I积分累加_右轮
 extern float Speed_I_lntegral_Max  ;//速度环积分累加最大值
 extern float Speed_Control_L,Speed_Control_Last_L;//本次和上次的左/右轮速度控制
 extern float Speed_Control_R,Speed_Control_Last_R;//目前由P,I积分累加组成。
 extern float Speed_Control_Cha_L;//左/右轮的速度控制差值，本次和上次的控制差
 extern float Speed_Control_Cha_R;
 extern float Speed_Control_Output_L;//左右轮的速度控制输出
 extern float Speed_Control_Output_R;//        电机PWM输出
//速度控制
extern float speed_L,speed_R, speed_car;
extern float P_Speed_D;
extern float P_Speed_G;
extern float I_Speed_D;
extern float I_Speed_G;
extern float Speed_Control_Output;
extern int   speed_control_period;
extern float Speed_Control_Cha;
extern float E_speed;

//方向控制
extern float Direction_Control_Output;


//速度控制



/*********************电机输出变量***************************************/
extern unsigned int DEAD_L,DEAD_R;
extern float Motor_Out_L,Motor_Out_R;
/*********************电机输出变量END***************************************/



////方向
//extern float gyr_ave_direction,gyr_ave_direction_zero,gyr_mid;
//extern float D_gyr;
//extern float P_Direction,D_Direction;
//extern float P_Direction1,D_Direction1;
//extern float P_Direction2,D_Direction2;
//extern float P_Direction3,D_Direction3;
//extern float P_Direction_high, P_Direction_low;
//extern float turn_spd;  //打角的分段速度
//extern float P_Direction_ZhiJiao;
//extern float K;
//extern uint8 Direction_Control_Period;
//extern float Direction_Control,Direction_Control_Output,Direction_angle,P_Dir_agl;
//
////速度
extern float speed_set_L,speed_set_R;//设定左右轮速度
//extern float speed_set;
//extern float Speed_Error_L , Speed_Error_Last_L , Speed_Error_Last_Last_L ;  //L速度偏差值   
//extern float Speed_Error_R , Speed_Error_Last_R , Speed_Error_Last_Last_R ;  //R速度偏差值 
////extern uint8 add_speed_flag;
//extern uint8 speed_control_period;
//extern float Speed_Control_Output;
//extern float Speed_Control_Max;
//extern float P_Speed,I_Speed;
//extern float Speed_I_lntegral,Speed_I_lntegral_Max;
//extern float speed_L,speed_R,speed_car,speed_set,speed_set_tmp;
//extern signed int Pulse_L,Pulse_R;
//extern signed int podao_pulse_L,podao_pulse_R;
//extern uint16 zhijiao_speed;
//extern signed int podao_spd, podao_spd2;
//extern uint8 slow_flag, slow_flag2;
//extern float low_spd_agl;


//extern uint8 ccdData[128];
//extern uint8 discharge_time;
//
//extern signed char ccddata_der[128];
//extern uint16 ccddata_der_sum,ccddata_der_sum_set;
//extern uint16 ccdData_sum,ccdData_sum_set;
//extern uint16 wandao_cnt,huanwan_cnt,zhidao_cnt,zhidao_num,shizi_cnt,shizi_out,dual2single_flag;
//extern uint8 Left_Lost , Right_Lost;
//extern uint8 zhijiao_flag, zhijiao_Err_max;
//extern int8 zhijiao_Err;
//extern uint16 zhijiao_cnt;
//extern uint8 zhijiao_turn_cnt, zhijiao_turn_cntL, zhijiao_turn_cntR, zhijiao_turn_cnt_err;
//
//extern uint8 zhangai_cnt,zhangai_cnt_max,zhang_Err;
//
//extern uint8 podao_flag;
//extern uint16 podao_cnt,podao_cnt_tmp,podao_cnt_up;
//
//extern uint16 star2podao_cnt,star2podao_set;
////赛道类型
//extern uint8 Road_Type;
//#define ZhiDao	1
//#define WanDao	2
//#define ShiZi		3
//#define ZhiJiao_L	4
//#define ZhiJiao_R	5
//#define ZhangAi	6
//#define Center_Guide	7
//#define ZhangAi_L 8
//#define ZhangAi_R 9
//#define PoDao	10
//
//#define FOUND	1	//发现相关元素
//#define CONFIRM	2	//相关元素确认完成
//#define Exit		3	//退出相应元素标志
//#define NONE		4
//
//#define ToLeft	3	//偏左
//#define ToRight	4	//偏右
//
//

#endif
