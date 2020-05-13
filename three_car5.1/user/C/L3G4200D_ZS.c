#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include "L3G4200D_ZS.h"

#define INTEGRAL_TIME_CONSTANT 0.005        //积分时间

//----------------------------陀螺仪--------------------------------------------
float gyr_angle_speed,gyr_angle_speed_up,//陀螺仪角速度
      gyr_angle_speed_static=1,//陀螺仪静止时的角速度
      gyr_angle_speed_static_sum,//陀螺仪静止时的角速度总和
      gyr_angle = 0, gyr_angle_up = 0,//陀螺仪角度
      gyr_angle_static=1,//陀螺仪静止时的角度误差,4min
 
gyr_offset_x = 18.8;//陀螺仪x轴偏移量0.85

float gyr_offset_y =-6.000;//陀螺仪y轴偏移量
float gyr_offset_z =21.24;//陀螺仪z轴偏移量
int   gg=0;
float gyr_offset__z_sum=0;//陀螺仪z轴静态偏移量总和；
float gyr_offset__z_average=0;//陀螺仪z轴静态偏移量平均值；
float gyr_offset__x_sum=0;//陀螺仪z轴静态偏移量总和；
float gyr_offset__x_average=0;//陀螺仪z轴静态偏移量平均值；
int zs=0;
/*****************陀螺仪测车角速度,角度******************************************************************
  未滤波4分钟产生10度
  滤波后4分钟产生1度
  小车转90度，陀螺仪测得45度
  过普通弯道，陀螺仪测得45度
  小车过圆圈弯道，实际车转过了270度,
                  陀螺仪测得了136度
  小车转过弯后，会显示已转角度，直立车的直立环可直接通过陀螺仪解算后
的角度给P,使其直立。直立环是为了让陀螺仪显示的角度一直为0度。但三轮
车转弯与其不同，并不是让陀螺仪显示角度为0度。之前想让其显示角度抑制
漂移，但是在过圆环弯道时，显示角度已达到了135度。
  故未想到用陀螺仪测得的角度抑制漂移。
  用陀螺仪测得的大角速度抑制其漂移
*********************************************************************************/
void Gyro_ZS()
{ 
//陀螺仪Z,Y轴数据读取
  L3G4200_Read();
 
//陀螺仪角速度=(陀螺仪z轴数据-陀螺仪z轴静态偏移量)*陀螺仪比例系数
  gyr_angle_speed=((float)gyro_z-gyr_offset_z)*gyr_ratio; //角速度，度/秒
  gyr_angle_speed_up=((float)gyro_x-gyr_offset_x)*gyr_ratio; //角速度，度/秒

//陀螺仪角速度静态滤波，代替加速度计
  if(gyr_angle_speed<gyr_angle_speed_static&&gyr_angle_speed>-gyr_angle_speed_static)
  {
    gyr_angle_speed=0;
  }
/* 1 先验估计 -----------------------------------------------------------  */
//根据上一次车体角度估计本次角度
//现在的角度 = 上次的角度 + (陀螺仪所测角速度 - 静态偏移)*陀螺仪采样周期
//car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
//     之前的角度偏差由卡尔额曼滤波和加速度计获得
  gyr_angle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
  gyr_angle_up += gyr_angle_speed_up * INTEGRAL_TIME_CONSTANT;
 
//  if(gyr_angle>gyr_angle_static||gyr_angle<-gyr_angle_static)
//  {角度确定
//     Direction_Angle=gyr_angle;
//  }
  
  
  
//  uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);

//确定陀螺仪Z轴静态偏移量值程序,可采集4.3min平均值
//  gg++;
//  gyr_offset__z_sum+=gyro_z;
//  gyr_offset__z_average=gyr_offset__z_sum/gg;
  
  gg++;
  gyr_offset__x_sum+=gyro_x;
  gyr_offset__x_average=gyr_offset__x_sum/gg;
//确定陀螺仪Z轴静态角速度平均值程序，可采集4.3min平均值，0.038
//  gg++;
//  gyr_angle_speed_static_sum+=gyr_angle_speed;
//  gyr_angle_speed_static=gyr_angle_speed_static_sum/gg;
//确定陀螺仪Z轴静态角速度最大值程序，0.89
//  if(gyr_angle_speed_static<gyr_angle_speed)
//    gyr_angle_speed_static=gyr_angle_speed;
}
//直立车
//角度输出=P*陀螺仪角度偏差+D*陀螺仪角速度
//Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;














