#include "key.h"

uint16 FTM_motorDuty = 3000;//电机转速测试使用
uint8  KEY_menuChange = 0;//按键状态，1-按下
uint8  KEY_sta = 0;//按键状态，1-按下
extern int zs_car;
extern float speed_set ;

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
  *     调节平衡参数
  * 注意
  *     中 --- 切换菜单
  *     上下左右 --- 自由控制
  */
void KEY_balance(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
            Angle_Speed_P += 1;
            break;

        case MENU_2:
            Angle_Speed_I += 0.1;
            break;
        case MENU_3:
            Angle_Speed_D  += 1;
            break;
        case MENU_4:
            Angle_E_P += 1;
            break;
        default :
            break;
        }
        break;
     case 2: /* ------------------------------  下*/
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
          Angle_Speed_P  -= 1;
            break;

        case MENU_2:
            Angle_Speed_I -= 0.1;
            break;
        case MENU_3:
            Angle_Speed_D -= 1;
            break;
        case MENU_4:
            Angle_E_P -= 1;
            break;
        default :
            break;
        }
        break;
     case 3: /* ------------------------------  左*/
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
         Angle_Speed_P -= 0.5;
            break;

        case MENU_2:
            Angle_Speed_I -= 0.01;
            break;
        case MENU_3:
            Angle_Speed_D -= 0.2;
            break;
        case MENU_4:
            Angle_E_P -= 0.2;
            break;
        default :
            break;
        }
        break;
    case 4: /* ------------------------------ 右 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
           Angle_Speed_P += 0.5;
            break;

        case MENU_2:
            Angle_Speed_I += 0.01;
            break;
        case MENU_3:
            Angle_Speed_D += 0.2;
            break;
        case MENU_4:
            Angle_E_P  += 0.2;
            break;
        default :
            break;
        }
        break;
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect >= 6)//logo 和 菜单显示只一次
        {
            menuSelect = MENU_1;
        }
        break;

    default :
        break;
    }
}


/**
  * 简介
  *     主菜单
  * 注意
  *     中 --- 切换菜单
  *     上下左右 --- 自由控制*/
void KEY_ParaMenu(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
            P_angle += 1000;
            break;

        case MENU_2:
            D_angle += 100;
            break;

        case MENU_3:
            R_angle+= 0.001;
            break;
            
        case MENU_4:
          angle_mid += 1;
            break;
            
            
        case MENU_5:
          Q_angle += 0.0001;
            break; 
        
        case MENU_6:
          Q_gyro += 0.0001;
            break;
            
            
        default :
            break;
        }
        break;
    case 2: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
            P_angle -= 1000;
            break;

        case MENU_2:
            D_angle -= 100;
            break;
        case MENU_3:
            R_angle+= 0.01;
            break;
        case MENU_4:
                    angle_mid -= 1;

            break;

         case MENU_5:
          Q_angle += 0.001;
            break; 
        
        case MENU_6:
          Q_gyro += 0.001;
            break;
            
            
        default :
            break;
        }
        break;
    case 3: /* ------------------------------ 左 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
            P_angle += 100;
            break;

        case MENU_2:
            D_angle += 10;
            break;
        case MENU_3:
            R_angle+= 0.1;
            break;
        case MENU_4:
            angle_mid += 0.1;
            break;

       case MENU_5:
          Q_angle += 0.01;
            break; 
        
        case MENU_6:
          Q_gyro += 0.01;
            break;
            
            
        default :
            break;
        }
        break;
    case 4: /* ------------------------------ 右 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
        case MENU_1:
            P_angle -= 100;
            break;

        case MENU_2:
            D_angle -= 10;
            break;
        case MENU_3:
            R_angle+= 1;
            break;
        case MENU_4:
          angle_mid -= 0.1;
            break;
            
     case MENU_5:
          Q_angle += 0.1;
            break; 
        
        case MENU_6:
          Q_gyro += 0.1;
            break;
            
        default :
            break;
        }
        break;
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect >= 8)//logo 和 菜单显示只一次
        {
            menuSelect = MENU_1;
        }
        break;

    default :
        break;
    }
}

  void KEY_ParaMenuDisplay(void)
{
    switch (menuSelect)
    {
    case MENU:
      //  OLED_Uint16(24, 0, (uint16)FTM_motorDuty);
            break;
    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
        OLED_Uint16(5, 6, (uint16)P_angle);
        break;
    case MENU_2:
//        OLED_Uint16(68+6*3+1, 2, (uint16)D_angle);
        OLED_DisplayFloat(5, 7, (float)D_angle, 1);
        break;
    case MENU_3:
       // OLED_DisplayFloat(70, 6, (float)I_Speed, 1);
//        OLED_DisplayFloat(30, 6, (float)zs_car, 1);
        OLED_DisplayFloat(50, 6, (float)R_angle, 5);
      //  OLED_DisplayFloat(10, 6, (float)P_Speed, 1);
        break;
    case MENU_4:
       OLED_DisplayFloat(50, 7, (float)angle_mid, 1);
        break;

            case MENU_5:
       OLED_DisplayFloat(5, 1, (float)Q_angle, 5);
        break;
        
    case MENU_6:
       OLED_DisplayFloat(5, 2, (float)Q_gyro, 5);
        break;

        
    default :
        break;
    }
            OLED_Uint16(10, 5, menuSelect-1);

    
}





//void KEY_ParaMenu(void)
//{
//    switch (KEY_Scan())
//{
//    case 1: /* ------------------------------ 上 */
//        KEY_sta = !KEY_sta;//控制状态OLED是否更新
//        switch (menuSelect)
//        {
//        case MENU_1:
//            carStatus = Runing;
//            break;
//
//        case MENU_2:
//            P_Direction_high += 5;
//            break;
//        case MENU_3:
//            P_Dir_agl  += 5;
//            break;
//        case MENU_4:
//          Set_Speed += 0.1;
//            break;
//        case MENU_5:
//           P_Speed += 0.5;
//            break;
//        
//        default :
//            break;
//        }
//        break;
//     case 2: /* ------------------------------  下*/
//        KEY_sta = !KEY_sta;//控制状态OLED是否更新
//        switch (menuSelect)
//        {
//        case MENU_1:
//          Direction_flag = !Direction_flag;
//            break;
//
//        case MENU_2:
//            P_Direction_high -= 5;
//            break;
//        case MENU_3:
//            P_Dir_agl -= 5;
//            break;
//        case MENU_4:
//          Set_Speed -= 0.1;
//            break;
//        case MENU_5:
//           P_Speed -= 0.5;
//           break;
//        default :
//            break;
//        }
//        break;
//     case 3: /* ------------------------------  左*/
//        KEY_sta = !KEY_sta;//控制状态OLED是否更新
//        switch (menuSelect)
//        {
//        case MENU_1:
//         testcar_flag = 1;
//            break;
//
//        case MENU_2:
//            P_Direction_high -= 2;
//            break;
//        case MENU_3:
//            P_Dir_agl -= 2;
//            break;
//        case MENU_4:
//          Set_Speed -= 0.2;
//            break;
//        case MENU_5:
//           P_Speed -= 0.2;
//             break;
//        default :
//            break;
//        }
//        break;
//    case 4: /* ------------------------------ 右 */
//        KEY_sta = !KEY_sta;//控制状态OLED是否更新
//        switch (menuSelect)
//        {
//        case MENU_1:
//           zhili_flag = !zhili_flag;
//            break;
//
//        case MENU_2:
//            P_Direction_high += 2;
//            break;
//        case MENU_3:
//            P_Dir_agl += 2;
//            break;
//        case MENU_4:
//          Set_Speed  += 0.2;
//            break;
//        case MENU_5:
//           P_Speed += 0.2;
//           break;
//        default :
//            break;
//        }
//        break;
//    case 5: /* ------------------------------ 中 */
//        KEY_sta = !KEY_sta;
//        KEY_menuChange = !KEY_menuChange;
//        if (++menuSelect >= 7)//logo 和 菜单显示只一次
//        {
//            menuSelect = MENU_1;
//        }
//        break;
//
//    default :
//        break;
//    }
//}




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
//void KEY_ParaMenuDisplay(void)
//{
//    switch (menuSelect)
//    {
//    case MENU:
//        OLED_Uint16(24, 0, (uint16)FTM_motorDuty);
//            break;
//    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
//        OLED_Uint16(1+6*3+1, 2, (uint16)P_Direction_low);
//        break;
//    case MENU_2:
////        OLED_Uint16(68+6*3+1, 2, (uint16)D_angle);
//        OLED_DisplayFloat(68+6*3+1, 2, (float)speed_set, 1);
//        break;
//    case MENU_3:
//        OLED_DisplayFloat(1+6*3+1, 6, (float)I_Speed, 1);
//        OLED_DisplayFloat(1+6*3+1, 7, (float)P_Speed, 1);
//        break;
//    case MENU_4:
//       OLED_DisplayFloat(68+6*3+1, 6, (float)angle_mid, 1);
//        break;
//
//    default :
//        break;
//    }
//}

//速度方向参数
//void KEY_ParaMenuDisplay(void)
//{
//    switch (menuSelect)
//    {
//    case MENU:
//        OLED_Uint16(24, 0, (uint16)FTM_motorDuty);
//        break;
//    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
//        OLED_Uint16(0, 2, (uint16)carStatus);
//        OLED_Uint16(7, 2, (uint16)Direction_flag);
//        OLED_Uint16(14, 2, (uint16)zhili_flag);
//        OLED_Uint16(21, 2, (uint16)testcar_flag);
//        break;
//    case MENU_2:
////        OLED_Uint16(68+6*3+1, 2, (uint16)D_angle);
//        OLED_DisplayFloat(0, 3, (float)P_Direction_high, 1);
//        break;
//    case MENU_3:
//        OLED_DisplayFloat(0, 4, (float)P_Dir_agl, 1);
//        break;
//    case MENU_4:
//       OLED_DisplayFloat(0, 5, (float)Set_Speed, 1);
//        break;
//    case MENU_5:
//       OLED_DisplayFloat(0, 6, (float)P_Speed, 1);
//    default :
//        break;
//    }
//    OLED_Uint16(0, 0, (uint16)(menuSelect-2));
//}
//

//平衡参数,帅印后来的
void KEY_balance_Display(void)
{
    switch (menuSelect)
    {
    case MENU:
        OLED_Uint16(24, 0, (uint16)FTM_motorDuty);
        break;
    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
        OLED_DisplayFloat(0, 2, (float)Angle_Speed_P, 1);
        break;
    case MENU_2:
//        OLED_Uint16(68+6*3+1, 2, (uint16)D_angle);
        OLED_DisplayFloat(0, 3, (float)Angle_Speed_I, 1);
        break;
    case MENU_3:
        OLED_DisplayFloat(0, 4, (float)Angle_Speed_D, 1);
        break;
    case MENU_4:
       OLED_DisplayFloat(0, 5, (float)Angle_E_P, 1);
        break;
    default :
        break;
    }
    OLED_Uint16(0, 0, (uint16)(menuSelect-2));
}




















