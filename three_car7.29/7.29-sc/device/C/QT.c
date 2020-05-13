
#include "Variable.h"
#include "common.h"
#include "allHead.h"
uint8 chice = 0;    //按键使用
uint8 c=0;
uint8 cars=0;
uint8 sure=0;


/**
  * 简介
  *     无对应模块的IO口初始化函数
  * 注意
  */
void IoInit()
{
    //指示灯
    GpioInit(LED_0, GPO, 1);
    GpioInit(LED_1, GPO, 1);
    GpioInit(LED_2, GPO, 1);
    GpioInit(LED_3, GPO, 1);

    //蜂鸣器
    GpioInit(BUZZER, GPO, 0);

    //电机方向
    GpioInit(ENL_L, GPO, 0);
    GpioInit(ENL_R, GPO, 0);
    GpioInit(ENR_L, GPO, 0);
    GpioInit(ENR_R, GPO, 0);

    //测方向
    GpioInit(DIR_L, GPI, 0);
    GpioInit(DIR_R, GPI, 0);
}


/**
  * 简介
  *     小车状态设置
  * 注意
  */

//void PlanSet(void)
//{
//    if(c==1)
//    {
//      c=0;
//      cars++;
//      sure=1;
//    }
//    
//    if(sure==1)
//    {
//      sure=0;
//      
//      if(cars/2==0)//车开
//      {
//         ENABLE_INTERRUPTS;  //开总中断
//         OLED_MenuFlicker();//速度控制改参数显示菜单
//         LED_3_TURN;
//      }
//    
//      if(cars/2==1)//车开
//      {
//        locking_L;
//        locking_R;
//        PIT_DisableIrq();//关 PIT 中断
//        OLED_MenuFlicker();//速度控制改参数显示菜单
//        menuSelect = LOGO;
//        OLED_MenuFlicker();
//      }
//    }
//    
//    
//
////    
// }
//    
    
void PlanSet(void)
{
    switch (carStatus)
    {
    case NORMAL:
        break;

    case STOP:
        locking_L;
        locking_R;
//        BUZZER_ON;
        PIT_DisableIrq();//关 PIT 中断

        menuSelect = LOGO;
        OLED_MenuFlicker();
        break;

    default :
        break;
    }
}
