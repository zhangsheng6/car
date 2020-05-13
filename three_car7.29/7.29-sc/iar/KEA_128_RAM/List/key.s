///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:40
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\key.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\key.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\key.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_D
        EXTERN Angle_P
        EXTERN Chasu_Bili
        EXTERN FTM_PwmMux
        EXTERN GpioGet
        EXTERN GpioInit
        EXTERN GpioSet
        EXTERN KEY_textSelect
        EXTERN OLED_DisplayFloat
        EXTERN Speed_D
        EXTERN Speed_D_D
        EXTERN Speed_I
        EXTERN Speed_I_D
        EXTERN Speed_P
        EXTERN Speed_P_D_Temp
        EXTERN SystickDelayMs
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN angle_limit
        EXTERN k3
        EXTERN menuSelect
        EXTERN speed_set_W
        EXTERN speed_set_Z

        PUBLIC FTM_motorDuty
        PUBLIC KEY_Init
        PUBLIC KEY_ParaMenu
        PUBLIC KEY_ParaMenuDisplay
        PUBLIC KEY_Scan
        PUBLIC KEY_TestMenu
        PUBLIC KEY_menuChange
        PUBLIC KEY_sta
        PUBLIC inductor_flag

// H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\key.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    key.c
//    8   * 文件标识：
//    9   * 摘    要：    按键配置
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1月4日 09:43:48
//   14   * 备    注：     功能没有添加
//   15   ******************************************************************************
//   16   */
//   17 
//   18 #include "key.h"
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   20 uint16 FTM_motorDuty = 3000;//电机转速测试使用
FTM_motorDuty:
        DATA
        DC16 3000

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   21 uint8  KEY_menuChange = 0;//按键状态，1-按下
KEY_menuChange:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   22 uint8  KEY_sta = 0;//按键状态，1-按下
KEY_sta:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 char  inductor_flag;
inductor_flag:
        DS8 1
//   24 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   25 void KEY_Init()
//   26 {
KEY_Init:
        PUSH     {R7,LR}
//   27     //按键
//   28     GpioInit(KEY_U, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+65
        BL       GpioInit
//   29     GpioInit(KEY_D, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+62
        BL       GpioInit
//   30     FTM_PwmMux(ftm2, ch3);//左键占用了ftm2_ch3 将其改到C3
        MOVS     R1,#+3
        MOVS     R0,#+2
        BL       FTM_PwmMux
//   31     GpioInit(KEY_L, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+25
        BL       GpioInit
//   32     GpioInit(KEY_R, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+61
        BL       GpioInit
//   33     GpioInit(KEY_M, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+68
        BL       GpioInit
//   34 
//   35     //拨码
//   36     GpioInit(KEY_BO_0, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+43
        BL       GpioInit
//   37     GpioInit(KEY_BO_1, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+56
        BL       GpioInit
//   38     GpioInit(KEY_BO_2, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+57
        BL       GpioInit
//   39     GpioInit(KEY_BO_3, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       GpioInit
//   40 }
        POP      {R0,PC}          ;; return
//   41 
//   42 
//   43 /**
//   44   * 简介
//   45   *     按键检测
//   46   * 备注
//   47   *     1 - 上
//   48   *     2 - 下
//   49   *     3 - 左
//   50   *     4 - 右
//   51   *     5 - 中
//   52   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 uint8 KEY_Scan(void)
//   54 {
KEY_Scan:
        PUSH     {R4,LR}
//   55     uint8 keyNum = 0;
        MOVS     R4,#+0
//   56 
//   57     if (GpioGet(KEY_U) != UP)
        MOVS     R0,#+65
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_0
//   58     {
//   59         SystickDelayMs(10);
        MOVS     R0,#+10
        BL       SystickDelayMs
//   60 
//   61         if (GpioGet(KEY_U) != UP)
        MOVS     R0,#+65
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//   62         {
//   63             BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//   64 
//   65             keyNum = 1;//标记
        MOVS     R4,#+1
//   66 
//   67             while (GpioGet(KEY_U) != UP);
??KEY_Scan_2:
        MOVS     R0,#+65
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??KEY_Scan_2
//   68             BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
        B        ??KEY_Scan_1
//   69         }
//   70     }
//   71     else if (GpioGet(KEY_D) != UP)
??KEY_Scan_0:
        MOVS     R0,#+62
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_3
//   72     {
//   73         SystickDelayMs(10);
        MOVS     R0,#+10
        BL       SystickDelayMs
//   74 
//   75         if (GpioGet(KEY_D) != UP)
        MOVS     R0,#+62
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//   76         {
//   77             BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//   78 
//   79             keyNum = 2;//标记
        MOVS     R4,#+2
//   80 
//   81             while (GpioGet(KEY_D) != UP);
??KEY_Scan_4:
        MOVS     R0,#+62
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??KEY_Scan_4
//   82             BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
        B        ??KEY_Scan_1
//   83         }
//   84     }
//   85     else if (GpioGet(KEY_L) != UP)
??KEY_Scan_3:
        MOVS     R0,#+25
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_5
//   86     {
//   87         SystickDelayMs(10);
        MOVS     R0,#+10
        BL       SystickDelayMs
//   88         if (GpioGet(KEY_L) != UP)
        MOVS     R0,#+25
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//   89         {
//   90             BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//   91 
//   92             keyNum = 3;//标记
        MOVS     R4,#+3
//   93 
//   94             while (GpioGet(KEY_L) != UP);
??KEY_Scan_6:
        MOVS     R0,#+25
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??KEY_Scan_6
//   95             BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
        B        ??KEY_Scan_1
//   96         }
//   97     }
//   98     else if (GpioGet(KEY_R) != UP)
??KEY_Scan_5:
        MOVS     R0,#+61
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_7
//   99     {
//  100         SystickDelayMs(10);
        MOVS     R0,#+10
        BL       SystickDelayMs
//  101 
//  102         if (GpioGet(KEY_R) != UP)
        MOVS     R0,#+61
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//  103         {
//  104             BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  105 
//  106             keyNum = 4;//标记
        MOVS     R4,#+4
//  107 
//  108             while (GpioGet(KEY_R) != UP);
??KEY_Scan_8:
        MOVS     R0,#+61
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??KEY_Scan_8
//  109             BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
        B        ??KEY_Scan_1
//  110         }
//  111     }
//  112     else if (GpioGet(KEY_M) != UP)
??KEY_Scan_7:
        MOVS     R0,#+68
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//  113     {
//  114         SystickDelayMs(10);
        MOVS     R0,#+10
        BL       SystickDelayMs
//  115 
//  116         if (GpioGet(KEY_M) != UP)
        MOVS     R0,#+68
        BL       GpioGet
        CMP      R0,#+1
        BEQ      ??KEY_Scan_1
//  117         {
//  118             BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  119 
//  120             keyNum = 5;//标记
        MOVS     R4,#+5
//  121 
//  122             while (GpioGet(KEY_M) != UP);
??KEY_Scan_9:
        MOVS     R0,#+68
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??KEY_Scan_9
//  123             BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  124         }
//  125     }
//  126 
//  127     return      keyNum;
??KEY_Scan_1:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//  128 }
//  129 
//  130 /**
//  131   * 简介
//  132   *     测试所用按键菜单
//  133   * 注意
//  134   *     测试电机
//  135   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void KEY_TestMenu(void)
//  137 {
KEY_TestMenu:
        PUSH     {R7,LR}
//  138     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??KEY_TestMenu_0
        BCS      .+4
        B        ??KEY_TestMenu_1
        CMP      R0,#+3
        BEQ      ??KEY_TestMenu_2
        BCC      ??KEY_TestMenu_3
        CMP      R0,#+5
        BEQ      ??KEY_TestMenu_4
        BCC      ??KEY_TestMenu_5
        B        ??KEY_TestMenu_1
//  139     {
//  140     case 1: /* ------------------------------ 上 */
//  141         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_TestMenu_0:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_TestMenu_6
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??KEY_TestMenu_7
??KEY_TestMenu_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  142         FTM_motorDuty += 100;break;
??KEY_TestMenu_7:
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
        B        ??KEY_TestMenu_8
//  143 
//  144     case 2: /* ------------------------------ 下 */
//  145         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_TestMenu_3:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_TestMenu_9
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??KEY_TestMenu_10
??KEY_TestMenu_9:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  146         FTM_motorDuty -= 50;break;
??KEY_TestMenu_10:
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+50
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
        B        ??KEY_TestMenu_8
//  147 
//  148     case 3: /* ------------------------------ 左 */
//  149         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_TestMenu_2:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_TestMenu_11
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??KEY_TestMenu_12
??KEY_TestMenu_11:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  150         FTM_motorDuty += 10;break;
??KEY_TestMenu_12:
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
        B        ??KEY_TestMenu_8
//  151 
//  152     case 4: /* ------------------------------ 右 */
//  153         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_TestMenu_5:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_TestMenu_13
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??KEY_TestMenu_14
??KEY_TestMenu_13:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  154         FTM_motorDuty -= 5;break;
??KEY_TestMenu_14:
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
        B        ??KEY_TestMenu_8
//  155 
//  156     case 5: /* ------------------------------ 中 */
//  157         switch (KEY_textSelect)
??KEY_TestMenu_4:
        LDR      R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??KEY_TestMenu_15
        CMP      R0,#+1
        BEQ      ??KEY_TestMenu_16
        CMP      R0,#+7
        BEQ      ??KEY_TestMenu_17
        CMP      R0,#+8
        BEQ      ??KEY_TestMenu_18
        CMP      R0,#+9
        BEQ      ??KEY_TestMenu_19
        B        ??KEY_TestMenu_20
//  158         {
//  159         case TEXT_DEFAULT://默认 -> 逆时针
//  160             KEY_textSelect = MOTOR_REV;
??KEY_TestMenu_15:
        MOVS     R0,#+1
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  161             reversal_L;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+26
        BL       GpioSet
//  162             reversal_R; break;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       GpioSet
        B        ??KEY_TestMenu_21
//  163 
//  164         case MOTOR_REV://逆时针 -> 顺时针
//  165             KEY_textSelect = MOTOR_LOC_R;
??KEY_TestMenu_16:
        MOVS     R0,#+9
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  166             forward_L;
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  167             forward_R;  break;
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
        B        ??KEY_TestMenu_21
//  168 
//  169         case MOTOR_LOC_R://顺时针 -> 左顺转右停
//  170             KEY_textSelect = MOTOR_LOC_L;
??KEY_TestMenu_19:
        MOVS     R0,#+8
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  171             locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//  172             forward_L;  break;
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
        B        ??KEY_TestMenu_21
//  173 
//  174         case MOTOR_LOC_L://左转右停 -> 右顺转左停
//  175             KEY_textSelect = MOTOR_LOC;
??KEY_TestMenu_18:
        MOVS     R0,#+7
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  176             locking_L;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  177             forward_R;   break;
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
        B        ??KEY_TestMenu_21
//  178 
//  179         case MOTOR_LOC://右顺转左停 -> 抱死
//  180             KEY_textSelect = TEXT_DEFAULT;
??KEY_TestMenu_17:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  181             locking_L;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  182             locking_R;   break;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
        B        ??KEY_TestMenu_21
//  183 
//  184         default :
//  185             KEY_textSelect = TEXT_DEFAULT;  break;
??KEY_TestMenu_20:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  186         }break;
??KEY_TestMenu_21:
        B        ??KEY_TestMenu_8
//  187 
//  188     default :
//  189         break;
//  190     }
//  191 }
??KEY_TestMenu_1:
??KEY_TestMenu_8:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     FTM_motorDuty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     KEY_textSelect
//  192 
//  193 /**
//  194   * 简介
//  195   *     按键 多级菜单
//  196   * 注意
//  197   *     中 --- 切换菜单
//  198   *     上下左右 --- 自由控制
//  199   */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  200 void KEY_ParaMenu(void)
//  201 {
KEY_ParaMenu:
        PUSH     {R7,LR}
//  202     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenu_0
        BCS      .+4
        B        ??KEY_ParaMenu_1
        CMP      R0,#+3
        BNE      .+4
        B        ??KEY_ParaMenu_2
        BCS      .+4
        B        ??KEY_ParaMenu_3
        CMP      R0,#+5
        BNE      .+4
        B        ??KEY_ParaMenu_4
        BCS      .+4
        B        ??KEY_ParaMenu_5
        B        ??KEY_ParaMenu_1
//  203 {
//  204     case 1: /* ------------------------------ 上 */
//  205         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_ParaMenu_0:
        LDR      R0,??KEY_ParaMenu_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_7
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_6
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_8
??KEY_ParaMenu_7:
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_6
        STRB     R0,[R1, #+0]
//  206         switch (menuSelect)
??KEY_ParaMenu_8:
        LDR      R0,??KEY_ParaMenu_6+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenu_9
        BCS      .+4
        B        ??KEY_ParaMenu_10
        CMP      R0,#+3
        BEQ      ??KEY_ParaMenu_11
        BCC      ??KEY_ParaMenu_12
        CMP      R0,#+5
        BEQ      ??KEY_ParaMenu_13
        BCC      ??KEY_ParaMenu_14
        CMP      R0,#+7
        BEQ      ??KEY_ParaMenu_15
        BCC      ??KEY_ParaMenu_16
        CMP      R0,#+9
        BEQ      ??KEY_ParaMenu_17
        BCC      ??KEY_ParaMenu_18
        CMP      R0,#+11
        BEQ      ??KEY_ParaMenu_19
        BCC      ??KEY_ParaMenu_20
        CMP      R0,#+13
        BEQ      ??KEY_ParaMenu_21
        BCC      ??KEY_ParaMenu_22
        B        ??KEY_ParaMenu_10
//  207         {
//  208            case MENU:
//  209             Chasu_Bili += 1;
??KEY_ParaMenu_9:
        LDR      R0,??KEY_ParaMenu_6+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x8
        STR      R0,[R1, #+0]
//  210             break;
        B        ??KEY_ParaMenu_23
//  211             
//  212         case MENU_1:
//  213             Speed_P_D_Temp += 10;
??KEY_ParaMenu_12:
        LDR      R0,??KEY_ParaMenu_6+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0xC
        STR      R0,[R1, #+0]
//  214             break;
        B        ??KEY_ParaMenu_23
//  215 
//  216         case MENU_2:
//  217             Speed_I_D += 10;
??KEY_ParaMenu_11:
        LDR      R0,??KEY_ParaMenu_6+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x14
        STR      R0,[R1, #+0]
//  218             break;
        B        ??KEY_ParaMenu_23
//  219         case MENU_3:
//  220           Speed_D_D+=10;
??KEY_ParaMenu_14:
        LDR      R0,??KEY_ParaMenu_6+0x18
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x18
        STR      R0,[R1, #+0]
//  221             break;
        B        ??KEY_ParaMenu_23
//  222         case MENU_4:
//  223           Speed_P+=10;
??KEY_ParaMenu_13:
        LDR      R0,??KEY_ParaMenu_6+0x1C
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x1C
        STR      R0,[R1, #+0]
//  224             break;
        B        ??KEY_ParaMenu_23
//  225         
//  226         case MENU_5:
//  227           Speed_I+=10;
??KEY_ParaMenu_16:
        LDR      R0,??KEY_ParaMenu_6+0x20
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x20
        STR      R0,[R1, #+0]
//  228             break;
        B        ??KEY_ParaMenu_23
//  229             
//  230             case MENU_6:
//  231           Speed_D+=10;
??KEY_ParaMenu_15:
        LDR      R0,??KEY_ParaMenu_6+0x24
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x24
        STR      R0,[R1, #+0]
//  232             break;
        B        ??KEY_ParaMenu_23
//  233             
//  234             case MENU_7:
//  235                           Angle_P+=10;
??KEY_ParaMenu_18:
        LDR      R0,??KEY_ParaMenu_6+0x28
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x28
        STR      R0,[R1, #+0]
//  236 //          k1+=0.5;
//  237             break;
        B        ??KEY_ParaMenu_23
//  238             
//  239             case MENU_8:
//  240 //          k2+=0.5;
//  241             Angle_D+=10;
??KEY_ParaMenu_17:
        LDR      R0,??KEY_ParaMenu_6+0x2C
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x2C
        STR      R0,[R1, #+0]
//  242             break;
        B        ??KEY_ParaMenu_23
//  243             
//  244             case MENU_9:
//  245           k3+=0.5;
??KEY_ParaMenu_20:
        LDR      R0,??KEY_ParaMenu_6+0x30
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??KEY_ParaMenu_6+0x34  ;; 0x3fe00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??KEY_ParaMenu_6+0x30
        STR      R0,[R1, #+0]
//  246             break;
        B        ??KEY_ParaMenu_23
//  247             
//  248              case MENU_10:
//  249           speed_set_Z+=10;
??KEY_ParaMenu_19:
        LDR      R0,??KEY_ParaMenu_6+0x38
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x38
        STR      R0,[R1, #+0]
//  250             break;
        B        ??KEY_ParaMenu_23
//  251             
//  252         case MENU_11:
//  253           speed_set_W+=10;
??KEY_ParaMenu_22:
        LDR      R0,??KEY_ParaMenu_24
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_6+0x10  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_24
        STR      R0,[R1, #+0]
//  254             break;
        B        ??KEY_ParaMenu_23
//  255             
//  256         case MENU_12:
//  257           angle_limit+=10;
??KEY_ParaMenu_21:
        LDR      R0,??KEY_ParaMenu_24+0x4
        LDM      R0!,{R2,R3}
        SUBS     R0,R0,#+8
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_24+0x8  ;; 0x40240000
        BL       __aeabi_dadd
        LDR      R2,??KEY_ParaMenu_24+0x4
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  258             break;
        B        ??KEY_ParaMenu_23
//  259             
//  260 
//  261 
//  262         default :
//  263             break;
//  264         }
//  265         break;
??KEY_ParaMenu_10:
??KEY_ParaMenu_23:
        B        ??KEY_ParaMenu_25
//  266     case 2: /* ------------------------------ 下 */
//  267         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_ParaMenu_3:
        LDR      R0,??KEY_ParaMenu_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_26
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_6
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_27
??KEY_ParaMenu_26:
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_6
        STRB     R0,[R1, #+0]
//  268         switch (menuSelect)
??KEY_ParaMenu_27:
        LDR      R0,??KEY_ParaMenu_6+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenu_28
        BCS      .+4
        B        ??KEY_ParaMenu_29
        CMP      R0,#+3
        BEQ      ??KEY_ParaMenu_30
        BCC      ??KEY_ParaMenu_31
        CMP      R0,#+5
        BEQ      ??KEY_ParaMenu_32
        BCC      ??KEY_ParaMenu_33
        CMP      R0,#+7
        BEQ      ??KEY_ParaMenu_34
        BCC      ??KEY_ParaMenu_35
        CMP      R0,#+9
        BEQ      ??KEY_ParaMenu_36
        BCC      ??KEY_ParaMenu_37
        CMP      R0,#+11
        BEQ      ??KEY_ParaMenu_38
        BCC      ??KEY_ParaMenu_39
        CMP      R0,#+13
        BEQ      ??KEY_ParaMenu_40
        BCC      ??KEY_ParaMenu_41
        B        ??KEY_ParaMenu_29
//  269         {
//  270        case MENU:
//  271             Chasu_Bili -= 1;
??KEY_ParaMenu_28:
        LDR      R0,??KEY_ParaMenu_6+0x8
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_42  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x8
        STR      R0,[R1, #+0]
//  272             break;
        B        ??KEY_ParaMenu_43
//  273             
//  274         case MENU_1:
//  275             Speed_P_D_Temp -= 10;
??KEY_ParaMenu_31:
        LDR      R0,??KEY_ParaMenu_6+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0xC
        STR      R0,[R1, #+0]
//  276             break;
        B        ??KEY_ParaMenu_43
//  277 
//  278         case MENU_2:
//  279             Speed_I_D -= 10;
??KEY_ParaMenu_30:
        LDR      R0,??KEY_ParaMenu_6+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x14
        STR      R0,[R1, #+0]
//  280             break;
        B        ??KEY_ParaMenu_43
//  281         case MENU_3:
//  282           Speed_D_D-=10;
??KEY_ParaMenu_33:
        LDR      R0,??KEY_ParaMenu_6+0x18
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x18
        STR      R0,[R1, #+0]
//  283             break;
        B        ??KEY_ParaMenu_43
//  284         case MENU_4:
//  285           Speed_P-=10;
??KEY_ParaMenu_32:
        LDR      R0,??KEY_ParaMenu_6+0x1C
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x1C
        STR      R0,[R1, #+0]
//  286             break;
        B        ??KEY_ParaMenu_43
//  287         
//  288         case MENU_5:
//  289           Speed_I-=10;
??KEY_ParaMenu_35:
        LDR      R0,??KEY_ParaMenu_6+0x20
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x20
        STR      R0,[R1, #+0]
//  290             break;
        B        ??KEY_ParaMenu_43
//  291             
//  292             case MENU_6:
//  293           Speed_D-=10;
??KEY_ParaMenu_34:
        LDR      R0,??KEY_ParaMenu_6+0x24
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x24
        STR      R0,[R1, #+0]
//  294             break;
        B        ??KEY_ParaMenu_43
//  295             
//  296             case MENU_7:
//  297                           Angle_P-=10;
??KEY_ParaMenu_37:
        LDR      R0,??KEY_ParaMenu_6+0x28
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x28
        STR      R0,[R1, #+0]
//  298 
//  299 //          k1-=0.5;
//  300             break;
        B        ??KEY_ParaMenu_43
//  301             
//  302           case MENU_8:
//  303           Angle_D-=10;
??KEY_ParaMenu_36:
        LDR      R0,??KEY_ParaMenu_6+0x2C
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x2C
        STR      R0,[R1, #+0]
//  304 //          k2-=0.5;
//  305             break;
        B        ??KEY_ParaMenu_43
//  306             
//  307             case MENU_9:
//  308           k3-=0.5;
??KEY_ParaMenu_39:
        LDR      R0,??KEY_ParaMenu_6+0x30
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??KEY_ParaMenu_45  ;; 0xbfe00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??KEY_ParaMenu_6+0x30
        STR      R0,[R1, #+0]
//  309             break;
        B        ??KEY_ParaMenu_43
//  310             
//  311              case MENU_10:
//  312           speed_set_Z-=10;
??KEY_ParaMenu_38:
        LDR      R0,??KEY_ParaMenu_6+0x38
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_6+0x38
        STR      R0,[R1, #+0]
//  313             break;
        B        ??KEY_ParaMenu_43
//  314             
//  315         case MENU_11:
//  316           speed_set_W-=10;
??KEY_ParaMenu_41:
        LDR      R0,??KEY_ParaMenu_24
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_44  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_24
        STR      R0,[R1, #+0]
//  317             break;
        B        ??KEY_ParaMenu_43
//  318             
//  319         case MENU_12:
//  320           angle_limit-=10;
??KEY_ParaMenu_40:
        LDR      R0,??KEY_ParaMenu_24+0x4
        LDM      R0!,{R2,R3}
        SUBS     R0,R0,#+8
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_46  ;; 0xc0240000
        BL       __aeabi_dadd
        LDR      R2,??KEY_ParaMenu_24+0x4
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  321             break;
        B        ??KEY_ParaMenu_43
//  322 
//  323         default :
//  324             break;
//  325         }
//  326                     break;
??KEY_ParaMenu_29:
??KEY_ParaMenu_43:
        B        ??KEY_ParaMenu_25
//  327     case 3: /* ------------------------------ 左 */
//  328         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_ParaMenu_2:
        LDR      R0,??KEY_ParaMenu_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_47
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_6
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_48
        Nop      
        DATA
??KEY_ParaMenu_6:
        DC32     KEY_sta
        DC32     menuSelect
        DC32     Chasu_Bili
        DC32     Speed_P_D_Temp
        DC32     0x41200000
        DC32     Speed_I_D
        DC32     Speed_D_D
        DC32     Speed_P
        DC32     Speed_I
        DC32     Speed_D
        DC32     Angle_P
        DC32     Angle_D
        DC32     k3
        DC32     0x3fe00000
        DC32     speed_set_Z
        THUMB
??KEY_ParaMenu_47:
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_49
        STRB     R0,[R1, #+0]
//  329         switch (menuSelect)
??KEY_ParaMenu_48:
        LDR      R0,??KEY_ParaMenu_49+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenu_50
        BCS      .+4
        B        ??KEY_ParaMenu_51
        CMP      R0,#+3
        BEQ      ??KEY_ParaMenu_52
        BCC      ??KEY_ParaMenu_53
        CMP      R0,#+5
        BEQ      ??KEY_ParaMenu_54
        BCC      ??KEY_ParaMenu_55
        CMP      R0,#+7
        BEQ      ??KEY_ParaMenu_56
        BCC      ??KEY_ParaMenu_57
        CMP      R0,#+9
        BEQ      ??KEY_ParaMenu_58
        BCC      ??KEY_ParaMenu_59
        CMP      R0,#+11
        BEQ      ??KEY_ParaMenu_60
        BCC      ??KEY_ParaMenu_61
        CMP      R0,#+13
        BEQ      ??KEY_ParaMenu_62
        BCC      ??KEY_ParaMenu_63
        B        ??KEY_ParaMenu_51
//  330         {
//  331        case MENU:
//  332             Chasu_Bili += 0.1;
??KEY_ParaMenu_50:
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  333             break;
        B        ??KEY_ParaMenu_64
//  334             
//  335         case MENU_1:
//  336             Speed_P_D_Temp += 1;
??KEY_ParaMenu_53:
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  337             break;
        B        ??KEY_ParaMenu_64
//  338 
//  339         case MENU_2:
//  340             Speed_I_D += 1;
??KEY_ParaMenu_52:
        LDR      R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_4
        STR      R0,[R1, #+0]
//  341             break;
        B        ??KEY_ParaMenu_64
//  342         case MENU_3:
//  343           Speed_D_D+=1;
??KEY_ParaMenu_55:
        LDR      R0,??DataTable1_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  344             break;
        B        ??KEY_ParaMenu_64
//  345         case MENU_4:
//  346           Speed_P+=1;
??KEY_ParaMenu_54:
        LDR      R0,??DataTable1_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  347             break;
        B        ??KEY_ParaMenu_64
//  348         
//  349         case MENU_5:
//  350           Speed_I+=1;
??KEY_ParaMenu_57:
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_7
        STR      R0,[R1, #+0]
//  351             break;
        B        ??KEY_ParaMenu_64
//  352             
//  353             case MENU_6:
//  354           Speed_D+=1;
??KEY_ParaMenu_56:
        LDR      R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  355             break;
        B        ??KEY_ParaMenu_64
//  356             
//  357             case MENU_7:
//  358                           Angle_P+=1;
??KEY_ParaMenu_59:
        LDR      R0,??DataTable1_9
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  359 
//  360 //          k1+=0.1;
//  361             break;
        B        ??KEY_ParaMenu_64
//  362             
//  363           case MENU_8:
//  364 //          k2+=0.1;
//  365            Angle_D+=1;
??KEY_ParaMenu_58:
        LDR      R0,??DataTable1_10
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  366             break;
        B        ??KEY_ParaMenu_64
//  367             
//  368             case MENU_9:
//  369           k3+=0.1;
??KEY_ParaMenu_61:
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  370             break;
        B        ??KEY_ParaMenu_64
//  371             
//  372              case MENU_10:
//  373           speed_set_Z+=1;
??KEY_ParaMenu_60:
        LDR      R0,??DataTable1_12
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//  374             break;
        B        ??KEY_ParaMenu_64
//  375             
//  376         case MENU_11:
//  377           speed_set_W+=1;
??KEY_ParaMenu_63:
        LDR      R0,??KEY_ParaMenu_24
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??KEY_ParaMenu_24
        STR      R0,[R1, #+0]
//  378             break;
        B        ??KEY_ParaMenu_64
//  379             
//  380         case MENU_12:
//  381           angle_limit+=1;
??KEY_ParaMenu_62:
        LDR      R0,??KEY_ParaMenu_24+0x4
        LDM      R0!,{R2,R3}
        SUBS     R0,R0,#+8
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1  ;; 0x3ff00000
        BL       __aeabi_dadd
        LDR      R2,??KEY_ParaMenu_24+0x4
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  382             break;
        B        ??KEY_ParaMenu_64
//  383             
//  384         default :
//  385             break;
//  386         }
//  387         break;
??KEY_ParaMenu_51:
??KEY_ParaMenu_64:
        B        ??KEY_ParaMenu_25
//  388     case 4: /* ------------------------------ 右 */
//  389         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_ParaMenu_5:
        LDR      R0,??KEY_ParaMenu_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_65
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_49
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_66
        DATA
??KEY_ParaMenu_24:
        DC32     speed_set_W
        DC32     angle_limit
        DC32     0x40240000
        THUMB
??KEY_ParaMenu_65:
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_49
        STRB     R0,[R1, #+0]
//  390         switch (menuSelect)
??KEY_ParaMenu_66:
        LDR      R0,??KEY_ParaMenu_49+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenu_67
        BCS      .+4
        B        ??KEY_ParaMenu_68
        CMP      R0,#+3
        BEQ      ??KEY_ParaMenu_69
        BCC      ??KEY_ParaMenu_70
        CMP      R0,#+5
        BEQ      ??KEY_ParaMenu_71
        BCC      ??KEY_ParaMenu_72
        CMP      R0,#+7
        BEQ      ??KEY_ParaMenu_73
        BCC      ??KEY_ParaMenu_74
        CMP      R0,#+9
        BEQ      ??KEY_ParaMenu_75
        BCC      ??KEY_ParaMenu_76
        CMP      R0,#+11
        BEQ      ??KEY_ParaMenu_77
        BCC      ??KEY_ParaMenu_78
        CMP      R0,#+13
        BEQ      ??KEY_ParaMenu_79
        BCC      ??KEY_ParaMenu_80
        B        ??KEY_ParaMenu_68
//  391         {
//  392          case MENU:
//  393             Chasu_Bili -= 0.1;
??KEY_ParaMenu_67:
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable2
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  394             break;
        B        ??KEY_ParaMenu_81
//  395             
//  396         case MENU_1:
//  397             Speed_P_D_Temp -= 1;
??KEY_ParaMenu_70:
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_42  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  398             break;
        B        ??KEY_ParaMenu_81
//  399 
//  400         case MENU_2:
//  401             Speed_I_D -= 1;
??KEY_ParaMenu_69:
        LDR      R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        LDR      R0,??KEY_ParaMenu_42  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_4
        STR      R0,[R1, #+0]
//  402             break;
        B        ??KEY_ParaMenu_81
        Nop      
        DATA
??KEY_ParaMenu_42:
        DC32     0xbf800000
        THUMB
//  403         case MENU_3:
//  404           Speed_D_D-=1;
??KEY_ParaMenu_72:
        LDR      R0,??DataTable1_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  405             break;
        B        ??KEY_ParaMenu_81
        DATA
??KEY_ParaMenu_44:
        DC32     0xc1200000
        THUMB
//  406         case MENU_4:
//  407           Speed_P-=1;
??KEY_ParaMenu_71:
        LDR      R0,??DataTable1_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  408             break;
        B        ??KEY_ParaMenu_81
//  409         
//  410         case MENU_5:
//  411           Speed_I-=1;
??KEY_ParaMenu_74:
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_7
        STR      R0,[R1, #+0]
//  412             break;
        B        ??KEY_ParaMenu_81
//  413             
//  414             case MENU_6:
//  415           Speed_D-=1;
??KEY_ParaMenu_73:
        LDR      R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  416             break;
        B        ??KEY_ParaMenu_81
//  417             
//  418             case MENU_7:
//  419                           Angle_P-=1;
??KEY_ParaMenu_76:
        LDR      R0,??DataTable1_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  420 
//  421 //          k1-=0.1;
//  422             break;
        B        ??KEY_ParaMenu_81
//  423             
//  424          case MENU_8:
//  425 //          k2-=0.1;
//  426          Angle_D-=1;
??KEY_ParaMenu_75:
        LDR      R0,??DataTable1_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  427             break;
        B        ??KEY_ParaMenu_81
//  428             
//  429             case MENU_9:
//  430           k3-=0.1;
??KEY_ParaMenu_78:
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable2
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  431             break;
        B        ??KEY_ParaMenu_81
//  432             
//  433              case MENU_10:
//  434           speed_set_Z-=1;
??KEY_ParaMenu_77:
        LDR      R0,??DataTable1_12
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//  435             break;
        B        ??KEY_ParaMenu_81
        Nop      
        DATA
??KEY_ParaMenu_45:
        DC32     0xbfe00000
        THUMB
//  436             
//  437         case MENU_11:
//  438           speed_set_W-=1;
??KEY_ParaMenu_80:
        LDR      R0,??DataTable1_13
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_13
        STR      R0,[R1, #+0]
//  439             break;
        B        ??KEY_ParaMenu_81
//  440             
//  441         case MENU_12:
//  442           angle_limit-=1;
??KEY_ParaMenu_79:
        LDR      R0,??DataTable2_3
        LDM      R0!,{R2,R3}
        SUBS     R0,R0,#+8
        MOVS     R0,#+0
        LDR      R1,??DataTable2_2  ;; 0xbff00000
        BL       __aeabi_dadd
        LDR      R2,??DataTable2_3
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  443             break;
        B        ??KEY_ParaMenu_81
//  444 
//  445         default :
//  446             break;
//  447         }
//  448         break;
??KEY_ParaMenu_68:
??KEY_ParaMenu_81:
        B        ??KEY_ParaMenu_25
//  449     case 5: /* ------------------------------ 中 */
//  450         KEY_sta = !KEY_sta;
??KEY_ParaMenu_4:
        LDR      R0,??KEY_ParaMenu_49
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_82
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_49
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_83
        DATA
??KEY_ParaMenu_46:
        DC32     0xc0240000
        THUMB
??KEY_ParaMenu_82:
        MOVS     R0,#+0
        LDR      R1,??KEY_ParaMenu_49
        STRB     R0,[R1, #+0]
//  451         KEY_menuChange = !KEY_menuChange;
??KEY_ParaMenu_83:
        LDR      R0,??DataTable2_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_ParaMenu_84
        MOVS     R0,#+1
        LDR      R1,??DataTable2_4
        STRB     R0,[R1, #+0]
        B        ??KEY_ParaMenu_85
??KEY_ParaMenu_84:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//  452         if (++menuSelect > 13)//logo 和 菜单显示只一次
??KEY_ParaMenu_85:
        LDR      R0,??KEY_ParaMenu_49+0x4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??KEY_ParaMenu_49+0x4
        STRB     R0,[R1, #+0]
        LDR      R0,??KEY_ParaMenu_49+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+14
        BLT      ??KEY_ParaMenu_86
//  453         {
//  454 //          menuSelect=1;
//  455             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??KEY_ParaMenu_49+0x4
        STRB     R0,[R1, #+0]
//  456         }
//  457         break;
??KEY_ParaMenu_86:
        B        ??KEY_ParaMenu_25
//  458 
//  459     default :
//  460         break;
//  461     }
//  462 }
??KEY_ParaMenu_1:
??KEY_ParaMenu_25:
        POP      {R0,PC}          ;; return
        DATA
??KEY_ParaMenu_49:
        DC32     KEY_sta
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x9999999A,0x3FB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Speed_P_D_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Speed_I_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     Speed_D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     Speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     Speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     k3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     speed_set_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     speed_set_W
//  463 
//  464 
//  465 
//  466 /**
//  467   * 简介
//  468   *     多级菜单 显示
//  469   
//  470 * 注意
//  471   *     坐标不要随便改 预先显示内容在OLED_Menu中修改,默认前4个字符用于显示标志
//  472   *     显示区域坐标
//  473   *         菜单     x   y --- x  y
//  474   *           1      1   2    66  4  可显示 11个字符，3行
//  475   *           2      68  2   126  4  可显示 9 个字符,3行
//  476   *           3      1   6   126  7  可显示 21个字符,2行
//  477   *           4      1   6   126  7  可显示 21个字符,2行
//  478   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  479 void KEY_ParaMenuDisplay(void)
//  480 {
KEY_ParaMenuDisplay:
        PUSH     {R7,LR}
//  481     switch (menuSelect) 
        LDR      R0,??DataTable2_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_ParaMenuDisplay_0
        BCC      ??KEY_ParaMenuDisplay_1
        CMP      R0,#+3
        BEQ      ??KEY_ParaMenuDisplay_2
        BCC      ??KEY_ParaMenuDisplay_3
        CMP      R0,#+5
        BEQ      ??KEY_ParaMenuDisplay_4
        BCC      ??KEY_ParaMenuDisplay_5
        CMP      R0,#+7
        BEQ      ??KEY_ParaMenuDisplay_6
        BCC      ??KEY_ParaMenuDisplay_7
        CMP      R0,#+9
        BEQ      ??KEY_ParaMenuDisplay_8
        BCC      ??KEY_ParaMenuDisplay_9
        CMP      R0,#+11
        BEQ      ??KEY_ParaMenuDisplay_10
        BCC      ??KEY_ParaMenuDisplay_11
        CMP      R0,#+13
        BEQ      ??KEY_ParaMenuDisplay_12
        BCC      ??KEY_ParaMenuDisplay_13
        B        ??KEY_ParaMenuDisplay_1
//  482     {
//  483     case MENU:
//  484 //OLED_DisplayFloat(35, 0, Chasu_Bili, 2);//OLED显示 float  
//  485     break;
??KEY_ParaMenuDisplay_0:
        B        ??KEY_ParaMenuDisplay_14
//  486     
//  487     case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
//  488 OLED_DisplayFloat(1+6*3+1, 2,Speed_P_D_Temp, 1);//OLED显示 float  
??KEY_ParaMenuDisplay_3:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  489    break;
        B        ??KEY_ParaMenuDisplay_14
//  490    
//  491    case MENU_2:
//  492 OLED_DisplayFloat(1+6*3+1, 3,Speed_I_D, 3);//3行11列
??KEY_ParaMenuDisplay_2:
        MOVS     R3,#+3
        LDR      R0,??DataTable2_7
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  493    break;
        B        ??KEY_ParaMenuDisplay_14
//  494    
//  495     case MENU_3:
//  496 OLED_DisplayFloat(1+6*3+1, 4,Speed_D_D, 1);//4行11列
??KEY_ParaMenuDisplay_5:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  497    break;
        B        ??KEY_ParaMenuDisplay_14
//  498    
//  499    case MENU_4:
//  500 OLED_DisplayFloat(68+6*3+1, 2,Speed_P, 1);//3行2表格 
??KEY_ParaMenuDisplay_4:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_9
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  501    break;
        B        ??KEY_ParaMenuDisplay_14
//  502  
//  503     case MENU_5:
//  504 OLED_DisplayFloat(68+6*3+1, 3,Speed_I, 3);//3行2表格
??KEY_ParaMenuDisplay_7:
        MOVS     R3,#+3
        LDR      R0,??DataTable2_10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  505     break;
        B        ??KEY_ParaMenuDisplay_14
//  506 
//  507    case MENU_6:
//  508 OLED_DisplayFloat(68+6*3+1, 4,Speed_D, 1);//3行2表格 
??KEY_ParaMenuDisplay_6:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_11
        LDR      R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  509    break;
        B        ??KEY_ParaMenuDisplay_14
//  510    
//  511     case MENU_7:     
//  512 OLED_DisplayFloat(1+6*3+1, 6,Angle_P, 1);//OLED显示 float  
??KEY_ParaMenuDisplay_9:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_12
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  513         break;
        B        ??KEY_ParaMenuDisplay_14
//  514         
//  515    case MENU_8:     
//  516 OLED_DisplayFloat(1+6*3+1, 7,Angle_D, 1);//OLED显示 float  
??KEY_ParaMenuDisplay_8:
        MOVS     R3,#+1
        LDR      R0,??DataTable2_13
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  517         break;
        B        ??KEY_ParaMenuDisplay_14
//  518         
//  519            case MENU_9:     
//  520 //OLED_DisplayFloat(1+6*3+1, 8,k3, 3);//OLED显示 float  
//  521         break;
??KEY_ParaMenuDisplay_11:
        B        ??KEY_ParaMenuDisplay_14
//  522         
//  523      
//  524         
//  525     case MENU_10://第4表格
//  526 OLED_DisplayFloat(68+6*3+1,6,speed_set_Z, 2);//OLED显示 float  
??KEY_ParaMenuDisplay_10:
        MOVS     R3,#+2
        LDR      R0,??DataTable2_14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  527 //OLED_DisplayFloat(68+6*3+1,6,k1, 2);//OLED显示 float  
//  528         break;
        B        ??KEY_ParaMenuDisplay_14
//  529         
//  530     case MENU_11://第4表格
//  531 OLED_DisplayFloat(68+6*3+1,7,speed_set_W, 2);//OLED显示 float  
??KEY_ParaMenuDisplay_13:
        MOVS     R3,#+2
        LDR      R0,??DataTable2_15
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  532 //OLED_DisplayFloat(68+6*3+1,7,k2, 2);//OLED显示 float  
//  533         break;
        B        ??KEY_ParaMenuDisplay_14
//  534         
//  535    case MENU_12://第4表格
//  536 //OLED_DisplayFloat(68+6*3+1,8,angle_limit, 0);//OLED显示 float  
//  537         break;
??KEY_ParaMenuDisplay_12:
        B        ??KEY_ParaMenuDisplay_14
//  538 
//  539  
//  540         
//  541     default :
//  542         break;
//  543     }
//  544 }
??KEY_ParaMenuDisplay_1:
??KEY_ParaMenuDisplay_14:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x9999999A,0xBFB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xbff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     angle_limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     KEY_menuChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Speed_P_D_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     Speed_I_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     Speed_D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     Speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     speed_set_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     speed_set_W

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  545 
//  546 
//  547 
//  548 
//  549 
//  550 
//  551 
//  552 
// 
//     3 bytes in section .bss
//     2 bytes in section .data
// 2 592 bytes in section .text
// 
// 2 592 bytes of CODE memory
//     5 bytes of DATA memory
//
//Errors: none
//Warnings: none
