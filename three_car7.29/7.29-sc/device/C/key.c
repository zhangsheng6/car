/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    key.c
  * 文件标识：
  * 摘    要：    按键配置
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月4日 09:43:48
  * 备    注：     功能没有添加
  ******************************************************************************
  */

#include "key.h"

uint16 FTM_motorDuty = 3000;//电机转速测试使用
uint8  KEY_menuChange = 0;//按键状态，1-按下
uint8  KEY_sta = 0;//按键状态，1-按下
char  inductor_flag;

void KEY_Init()
{
    //按键
    GpioInit(KEY_U, GPI, 0);
    GpioInit(KEY_D, GPI, 0);
    FTM_PwmMux(ftm2, ch3);//左键占用了ftm2_ch3 将其改到C3
    GpioInit(KEY_L, GPI, 0);
    GpioInit(KEY_R, GPI, 0);
    GpioInit(KEY_M, GPI, 0);

    //拨码
    GpioInit(KEY_BO_0, GPI, 0);
    GpioInit(KEY_BO_1, GPI, 0);
    GpioInit(KEY_BO_2, GPI, 0);
    GpioInit(KEY_BO_3, GPI, 0);
}


/**
  * 简介
  *     按键检测
  * 备注
  *     1 - 上
  *     2 - 下
  *     3 - 左
  *     4 - 右
  *     5 - 中
  */
uint8 KEY_Scan(void)
{
    uint8 keyNum = 0;

    if (GpioGet(KEY_U) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_U) != UP)
        {
            BUZZER_ON;

            keyNum = 1;//标记

            while (GpioGet(KEY_U) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_D) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_D) != UP)
        {
            BUZZER_ON;

            keyNum = 2;//标记

            while (GpioGet(KEY_D) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_L) != UP)
    {
        SystickDelayMs(10);
        if (GpioGet(KEY_L) != UP)
        {
            BUZZER_ON;

            keyNum = 3;//标记

            while (GpioGet(KEY_L) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_R) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_R) != UP)
        {
            BUZZER_ON;

            keyNum = 4;//标记

            while (GpioGet(KEY_R) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_M) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_M) != UP)
        {
            BUZZER_ON;

            keyNum = 5;//标记

            while (GpioGet(KEY_M) != UP);
            BUZZER_OFF;
        }
    }

    return      keyNum;
}

/**
  * 简介
  *     测试所用按键菜单
  * 注意
  *     测试电机
  */
void KEY_TestMenu(void)
{
    switch (KEY_Scan())
    {
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        FTM_motorDuty += 100;break;

    case 2: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        FTM_motorDuty -= 50;break;

    case 3: /* ------------------------------ 左 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        FTM_motorDuty += 10;break;

    case 4: /* ------------------------------ 右 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        FTM_motorDuty -= 5;break;

    case 5: /* ------------------------------ 中 */
        switch (KEY_textSelect)
        {
        case TEXT_DEFAULT://默认 -> 逆时针
            KEY_textSelect = MOTOR_REV;
            reversal_L;
            reversal_R; break;

        case MOTOR_REV://逆时针 -> 顺时针
            KEY_textSelect = MOTOR_LOC_R;
            forward_L;
            forward_R;  break;

        case MOTOR_LOC_R://顺时针 -> 左顺转右停
            KEY_textSelect = MOTOR_LOC_L;
            locking_R;
            forward_L;  break;

        case MOTOR_LOC_L://左转右停 -> 右顺转左停
            KEY_textSelect = MOTOR_LOC;
            locking_L;
            forward_R;   break;

        case MOTOR_LOC://右顺转左停 -> 抱死
            KEY_textSelect = TEXT_DEFAULT;
            locking_L;
            locking_R;   break;

        default :
            KEY_textSelect = TEXT_DEFAULT;  break;
        }break;

    default :
        break;
    }
}

/**
  * 简介
  *     按键 多级菜单
  * 注意
  *     中 --- 切换菜单
  *     上下左右 --- 自由控制
  */
void KEY_ParaMenu(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
           case MENU:
            Chasu_Bili += 1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp += 10;
            break;

        case MENU_2:
            Speed_I_D += 10;
            break;
        case MENU_3:
          Speed_D_D+=10;
            break;
        case MENU_4:
          Speed_P+=10;
            break;
        
        case MENU_5:
          Speed_I+=10;
            break;
            
            case MENU_6:
          Speed_D+=10;
            break;
            
            case MENU_7:
                          Angle_P+=10;
//          k1+=0.5;
            break;
            
            case MENU_8:
//          k2+=0.5;
            Angle_D+=10;
            break;
            
            case MENU_9:
          k3+=0.5;
            break;
            
             case MENU_10:
          speed_set_Z+=10;
            break;
            
        case MENU_11:
          speed_set_W+=10;
            break;
            
        case MENU_12:
          angle_limit+=10;
            break;
            


        default :
            break;
        }
        break;
    case 2: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili -= 1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp -= 10;
            break;

        case MENU_2:
            Speed_I_D -= 10;
            break;
        case MENU_3:
          Speed_D_D-=10;
            break;
        case MENU_4:
          Speed_P-=10;
            break;
        
        case MENU_5:
          Speed_I-=10;
            break;
            
            case MENU_6:
          Speed_D-=10;
            break;
            
            case MENU_7:
                          Angle_P-=10;

//          k1-=0.5;
            break;
            
          case MENU_8:
          Angle_D-=10;
//          k2-=0.5;
            break;
            
            case MENU_9:
          k3-=0.5;
            break;
            
             case MENU_10:
          speed_set_Z-=10;
            break;
            
        case MENU_11:
          speed_set_W-=10;
            break;
            
        case MENU_12:
          angle_limit-=10;
            break;

        default :
            break;
        }
                    break;
    case 3: /* ------------------------------ 左 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili += 0.1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp += 1;
            break;

        case MENU_2:
            Speed_I_D += 1;
            break;
        case MENU_3:
          Speed_D_D+=1;
            break;
        case MENU_4:
          Speed_P+=1;
            break;
        
        case MENU_5:
          Speed_I+=1;
            break;
            
            case MENU_6:
          Speed_D+=1;
            break;
            
            case MENU_7:
                          Angle_P+=1;

//          k1+=0.1;
            break;
            
          case MENU_8:
//          k2+=0.1;
           Angle_D+=1;
            break;
            
            case MENU_9:
          k3+=0.1;
            break;
            
             case MENU_10:
          speed_set_Z+=1;
            break;
            
        case MENU_11:
          speed_set_W+=1;
            break;
            
        case MENU_12:
          angle_limit+=1;
            break;
            
        default :
            break;
        }
        break;
    case 4: /* ------------------------------ 右 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
         case MENU:
            Chasu_Bili -= 0.1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp -= 1;
            break;

        case MENU_2:
            Speed_I_D -= 1;
            break;
        case MENU_3:
          Speed_D_D-=1;
            break;
        case MENU_4:
          Speed_P-=1;
            break;
        
        case MENU_5:
          Speed_I-=1;
            break;
            
            case MENU_6:
          Speed_D-=1;
            break;
            
            case MENU_7:
                          Angle_P-=1;

//          k1-=0.1;
            break;
            
         case MENU_8:
//          k2-=0.1;
         Angle_D-=1;
            break;
            
            case MENU_9:
          k3-=0.1;
            break;
            
             case MENU_10:
          speed_set_Z-=1;
            break;
            
        case MENU_11:
          speed_set_W-=1;
            break;
            
        case MENU_12:
          angle_limit-=1;
            break;

        default :
            break;
        }
        break;
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 13)//logo 和 菜单显示只一次
        {
//          menuSelect=1;
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}



/**
  * 简介
  *     多级菜单 显示
  
* 注意
  *     坐标不要随便改 预先显示内容在OLED_Menu中修改,默认前4个字符用于显示标志
  *     显示区域坐标
  *         菜单     x   y --- x  y
  *           1      1   2    66  4  可显示 11个字符，3行
  *           2      68  2   126  4  可显示 9 个字符,3行
  *           3      1   6   126  7  可显示 21个字符,2行
  *           4      1   6   126  7  可显示 21个字符,2行
  */
void KEY_ParaMenuDisplay(void)
{
    switch (menuSelect) 
    {
    case MENU:
//OLED_DisplayFloat(35, 0, Chasu_Bili, 2);//OLED显示 float  
    break;
    
    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
OLED_DisplayFloat(1+6*3+1, 2,Speed_P_D_Temp, 1);//OLED显示 float  
   break;
   
   case MENU_2:
OLED_DisplayFloat(1+6*3+1, 3,Speed_I_D, 3);//3行11列
   break;
   
    case MENU_3:
OLED_DisplayFloat(1+6*3+1, 4,Speed_D_D, 1);//4行11列
   break;
   
   case MENU_4:
OLED_DisplayFloat(68+6*3+1, 2,Speed_P, 1);//3行2表格 
   break;
 
    case MENU_5:
OLED_DisplayFloat(68+6*3+1, 3,Speed_I, 3);//3行2表格
    break;

   case MENU_6:
OLED_DisplayFloat(68+6*3+1, 4,Speed_D, 1);//3行2表格 
   break;
   
    case MENU_7:     
OLED_DisplayFloat(1+6*3+1, 6,Angle_P, 1);//OLED显示 float  
        break;
        
   case MENU_8:     
OLED_DisplayFloat(1+6*3+1, 7,Angle_D, 1);//OLED显示 float  
        break;
        
           case MENU_9:     
//OLED_DisplayFloat(1+6*3+1, 8,k3, 3);//OLED显示 float  
        break;
        
     
        
    case MENU_10://第4表格
OLED_DisplayFloat(68+6*3+1,6,speed_set_Z, 2);//OLED显示 float  
//OLED_DisplayFloat(68+6*3+1,6,k1, 2);//OLED显示 float  
        break;
        
    case MENU_11://第4表格
OLED_DisplayFloat(68+6*3+1,7,speed_set_W, 2);//OLED显示 float  
//OLED_DisplayFloat(68+6*3+1,7,k2, 2);//OLED显示 float  
        break;
        
   case MENU_12://第4表格
//OLED_DisplayFloat(68+6*3+1,8,angle_limit, 0);//OLED显示 float  
        break;

 
        
    default :
        break;
    }
}








