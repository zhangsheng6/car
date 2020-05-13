///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Speed_Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Speed_Control.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\Speed_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_CountClean
        EXTERN FTM_SpeedGet
        EXTERN GpioGet
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN carStatus
        EXTERN gyr_angle_speed_up

        PUBLIC Angle_Kt_P
        PUBLIC E_speed
        PUBLIC Get_CarSpeed
        PUBLIC I_Speed
        PUBLIC I_Speed_D
        PUBLIC I_Speed_G
        PUBLIC KT
        PUBLIC KT_Flag
        PUBLIC Motor_Out_Max
        PUBLIC Motor_Out_Min
        PUBLIC Motor_Out_Old_L
        PUBLIC Motor_Out_Old_R
        PUBLIC P_Speed
        PUBLIC P_Speed_D
        PUBLIC P_Speed_G
        PUBLIC Pulse_L
        PUBLIC Pulse_R
        PUBLIC Speed_Control
        PUBLIC Speed_Control_Cha
        PUBLIC Speed_Control_Cha_L
        PUBLIC Speed_Control_Cha_R
        PUBLIC Speed_Control_L
        PUBLIC Speed_Control_Last
        PUBLIC Speed_Control_Last_L
        PUBLIC Speed_Control_Last_R
        PUBLIC Speed_Control_Output
        PUBLIC Speed_Control_Output2_L
        PUBLIC Speed_Control_Output2_R
        PUBLIC Speed_Control_Output_Cha_L
        PUBLIC Speed_Control_Output_Cha_R
        PUBLIC Speed_Control_Output_L
        PUBLIC Speed_Control_Output_L_Old
        PUBLIC Speed_Control_Output_Last_L
        PUBLIC Speed_Control_Output_Last_R
        PUBLIC Speed_Control_Output_R
        PUBLIC Speed_Control_Output_R_Old
        PUBLIC Speed_Control_R
        PUBLIC Speed_Controler
        PUBLIC Speed_Controler_Output
        PUBLIC Speed_D
        PUBLIC Speed_Error_L
        PUBLIC Speed_Error_Last_L
        PUBLIC Speed_Error_Last_Last_L
        PUBLIC Speed_Error_Last_Last_R
        PUBLIC Speed_Error_Last_R
        PUBLIC Speed_Error_R
        PUBLIC Speed_I
        PUBLIC Speed_I_Down
        PUBLIC Speed_I_Up
        PUBLIC Speed_I_lntegral
        PUBLIC Speed_Kt_I
        PUBLIC Speed_Kt_P
        PUBLIC Speed_P
        PUBLIC Speed_P_Down
        PUBLIC Speed_P_L
        PUBLIC Speed_P_R
        PUBLIC Speed_P_Up
        PUBLIC add_speed_flag
        PUBLIC gyr_angle_speed_up_kt
        PUBLIC podao_pulse_L
        PUBLIC podao_pulse_R
        PUBLIC podao_spd
        PUBLIC podao_spd2
        PUBLIC speed_L
        PUBLIC speed_R
        PUBLIC speed_car
        PUBLIC speed_control_period
        PUBLIC speed_measure_L
        PUBLIC speed_measure_R
        PUBLIC speed_old_L
        PUBLIC speed_old_R
        PUBLIC speed_set
        PUBLIC speed_set_L
        PUBLIC speed_set_R
        PUBLIC speed_set_W
        PUBLIC speed_set_Z
        PUBLIC speed_set_max
        PUBLIC speed_set_min
        PUBLIC speed_set_temp

// H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Speed_Control.c
//    1 #include "Speed_Control.h"
//    2 //30,1m//40 1.5m
//    3 //50:1.6,55
//    4 //60 1.9m//65，2.15m//70,2.3m
//    5 /***************速度变量*********************************************************************/
//    6 //编码器测的速度和自己设定的速度小写

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    7 float speed_set_Z=60,speed_set_W=60;
speed_set_Z:
        DATA
        DC32 42700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_set_W:
        DATA
        DC32 42700000H
//    8 /****************速度环*************************************************************************/
//    9 //V=30,P=80;I=10;D=0;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   10 float Speed_P=30,Speed_I=5,Speed_D=0.00;
Speed_P:
        DATA
        DC32 41F00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_I:
        DATA
        DC32 40A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_D:
        DS8 4
//   11 /****************KT*************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   12 float Angle_Kt_P=100,Speed_Kt_P=0,Speed_Kt_I=0;
Angle_Kt_P:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Kt_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Kt_I:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float gyr_angle_speed_up_kt=2;
gyr_angle_speed_up_kt:
        DATA
        DC32 40000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int   KT_Flag=0;
KT_Flag:
        DS8 4
//   15 /*-----------------------------------------------------------------------*/
//   16 
//   17 
//   18 
//   19 
//   20 /***************速度变量2*********************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float speed_set_L=0,speed_set_R=0;
speed_set_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 float speed_set = 30,speed_set_temp = 240;//速度设定值，临时速度设定值
speed_set:
        DATA
        DC32 41F00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_set_temp:
        DATA
        DC32 43700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 float speed_set_max=80, speed_set_min=20;//速度设定最大最小值
speed_set_max:
        DATA
        DC32 42A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_set_min:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float Motor_Out_Old_L=0,Motor_Out_Old_R=0;//上一次电机输出PWM值
Motor_Out_Old_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_Old_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   25 float Motor_Out_Max=6500,Motor_Out_Min=2500;//电机输出最大最小值
Motor_Out_Max:
        DATA
        DC32 45CB2000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Out_Min:
        DATA
        DC32 451C4000H
//   26 /*-----------------------------------------------------------------------*/
//   27 /****************速度环2*************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 float Speed_Error_L = 0, Speed_Error_Last_L = 0, Speed_Error_Last_Last_L = 0,  //L速度偏差值   
Speed_Error_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29       Speed_Error_R = 0, Speed_Error_Last_R = 0, Speed_Error_Last_Last_R = 0;  //R速度偏差值 
Speed_Error_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 float Speed_Control_Output_L=0,//左右轮的速度控制输出
Speed_Control_Output_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31       Speed_Control_Output_R=0,//        电机PWM输出 
Speed_Control_Output_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32       Speed_Control_Output2_L=0,
Speed_Control_Output2_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33       Speed_Control_Output2_R=0,
Speed_Control_Output2_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34       Speed_Control_Output_Last_L=0,
Speed_Control_Output_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35       Speed_Control_Output_Last_R=0,
Speed_Control_Output_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36       Speed_Control_Output_Cha_L=0,
Speed_Control_Output_Cha_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37       Speed_Control_Output_Cha_R=0,
Speed_Control_Output_Cha_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38       Speed_Control_Output_L_Old=0,
Speed_Control_Output_L_Old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39       Speed_Control_Output_R_Old=0;
Speed_Control_Output_R_Old:
        DS8 4
//   40 /*-----------------------------------------------------------------------*/
//   41 
//   42 
//   43 
//   44 /******************测速变量***********************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 float speed_measure_L,speed_measure_R,//测速左,车整体速度
speed_measure_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_measure_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46       speed_L = 0,speed_R = 0,speed_car = 0;
speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_car:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 float speed_old_L=0,speed_old_R=0;//上一次测速
speed_old_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_old_R:
        DS8 4
//   48 /*-----------------------------------------------------------------------*/
//   49 
//   50 /******************测速变量***********************************************************************
//   51 简介：速度控制，
//   52 输入：速度设定值
//   53 功能：调节实际速度达到设定值
//   54 输出：PWM值
//   55 *********************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 void Speed_Controler()
//   57 {   
Speed_Controler:
        PUSH     {R3-R5,LR}
//   58 //  if(speed_set_temp > speed_set_max)
//   59 //    speed_set_temp = speed_set_max;
//   60 //  if(speed_set_temp < speed_set_min)
//   61 //    speed_set_temp = speed_set_min;  
//   62 //  speed_set_L = speed_set_temp;
//   63 //  speed_set_R = speed_set_temp; 
//   64 
//   65   Speed_Error_L = speed_set_L- speed_L; 
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   66   Speed_Error_R = speed_set_R - speed_R; 
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5
        STR      R0,[R1, #+0]
//   67   
//   68 Speed_Control_Output_L=(uint32)(Speed_Control_Output_L_Old + Speed_P*(Speed_Error_L-Speed_Error_Last_L) + Speed_I*Speed_Error_L + Speed_D*(Speed_Error_L+Speed_Error_Last_Last_L-2*Speed_Error_Last_L));
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R5,R0
        LDR      R0,??DataTable2_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2uiz
        BL       __aeabi_ui2f
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//   69 Speed_Control_Output_R=(uint32)(Speed_Control_Output_R_Old + Speed_P*(Speed_Error_R-Speed_Error_Last_R) + Speed_I*Speed_Error_R + Speed_D*(Speed_Error_R+Speed_Error_Last_Last_R-2*Speed_Error_Last_R));  
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R5,R0
        LDR      R0,??DataTable3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2uiz
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   70   
//   71   if(Speed_Control_Output_L > Motor_Out_Max)
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_0
//   72     Speed_Control_Output_L = Motor_Out_Max; 
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//   73   if(Speed_Control_Output_L < Motor_Out_Min)
??Speed_Controler_0:
        LDR      R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_1
//   74     Speed_Control_Output_L = Motor_Out_Min; 
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//   75   
//   76   if(Speed_Control_Output_R > Motor_Out_Max)
??Speed_Controler_1:
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_2
//   77     Speed_Control_Output_R = Motor_Out_Max; 
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   78   if(Speed_Control_Output_R < Motor_Out_Min)
??Speed_Controler_2:
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_3
//   79     Speed_Control_Output_R = Motor_Out_Min;   
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   80   
//   81   Speed_Control_Output_L_Old= Speed_Control_Output_L;
??Speed_Controler_3:
        LDR      R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//   82   Speed_Error_Last_Last_L = Speed_Error_Last_L;
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//   83   Speed_Error_Last_L = Speed_Error_L;
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_6
        STR      R0,[R1, #+0]
//   84   speed_old_L = speed_L;
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
//   85   
//   86   Speed_Control_Output_R_Old= Speed_Control_Output_R;
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   87   Speed_Error_Last_Last_R = Speed_Error_Last_R;
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   88   Speed_Error_Last_R = Speed_Error_R;
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//   89   speed_old_R = speed_R;  
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_7
        STR      R0,[R1, #+0]
//   90  
//   91 }
        POP      {R0,R4,R5,PC}    ;; return
//   92 /**
//   93   * 简介
//   94   *     速度输出平滑函数
//   95   * 说明
//   96   *     将速度调整分为20个周期，防止影响稳定性
//   97   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 void Speed_Controler_Output(void)
//   99 {
Speed_Controler_Output:
        PUSH     {R7,LR}
//  100   Speed_Control_Output2_L = Speed_Control_Output_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  101                          + Speed_Control_Output_Last_L; 
        LDR      R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_10  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_12
        STR      R0,[R1, #+0]
//  102  
//  103   Speed_Control_Output2_R = Speed_Control_Output_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  104                          + Speed_Control_Output_Last_R;  
        LDR      R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_13
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_10  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_15
        STR      R0,[R1, #+0]
//  105 //  Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  106 //                         + Speed_Control_Last;
//  107 //    
//  108 }
        POP      {R0,PC}          ;; return
//  109 
//  110 /*可在角速度大于2的绝对值时蜂鸣器向测试*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  111 void KT()
//  112 {
KT:
        PUSH     {R7,LR}
//  113   if(gyr_angle_speed_up>gyr_angle_speed_up_kt)
        LDR      R0,??DataTable3_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??KT_0
//  114      KT_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_18
        STR      R0,[R1, #+0]
//  115   if(KT_Flag==1)
//  116   { //KT输出=P*
//  117 //     Kt_Output_L=Angle_Kt_P*gyr_angle_speed_up
//  118   }
//  119     
//  120     
//  121     
//  122     
//  123     
//  124     
//  125     
//  126     
//  127     
//  128     
//  129     
//  130     
//  131     
//  132     
//  133 }
??KT_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     speed_set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     Speed_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Speed_Error_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     Speed_Control_Output_L_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     Speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Speed_Error_Last_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     Speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     Speed_Control_Output_L
//  134 
//  135 /*************************************************************************
//  136 获取车速：分时复用两路测速
//  137 (PACNT/200)*(编码器齿数/连接轮齿数)*连接轮周长/测速周期==speed
//  138 
//  139  Distance+=(qd1_result+qd2_result)/6100.0;  //转化为距离
//  140   CarSpeed=(qd1_result+qd2_result)*250.0/6100.0;    //求出车速转换为M/S
//  141    if(CarSpeed>3.5)CarSpeed=3.5;
//  142 *****************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  143 void Get_CarSpeed(void)
//  144 {
Get_CarSpeed:
        PUSH     {R7,LR}
//  145   static uint8 LR_Flag = 0;
//  146   LR_Flag = !LR_Flag;//分时复用测两路
        LDR      R0,??DataTable3_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Get_CarSpeed_0
        MOVS     R0,#+1
        LDR      R1,??DataTable3_19
        STRB     R0,[R1, #+0]
        B        ??Get_CarSpeed_1
??Get_CarSpeed_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable3_19
        STRB     R0,[R1, #+0]
//  147   //开通道
//  148   if (LR_Flag)
??Get_CarSpeed_1:
        LDR      R0,??DataTable3_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Get_CarSpeed_2
//  149   {
//  150      speed_measure_L= FTM_SpeedGet(FTM_SPEED_L);//在开始右通道计数前，将左通道数读出
        MOVS     R0,#+0
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_20
        STR      R0,[R1, #+0]
//  151      
//  152      if(Direction_L==1)
        MOVS     R0,#+35
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_3
//  153      {
//  154         speed_L=speed_measure_L;//改成2ms一次的测速,速度频率太快，得重调参数,放慢节奏，用4ms
        LDR      R0,??DataTable3_20
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_21
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_4
//  155 //        speed_L=speed_L*2;//4ms一次的测速,
//  156      }
//  157      else
//  158      {
//  159         speed_L=-1*speed_measure_L;
??Get_CarSpeed_3:
        LDR      R0,??DataTable3_20
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_22  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_21
        STR      R0,[R1, #+0]
//  160      }
//  161      
//  162      Choose_R;//清零计数
??Get_CarSpeed_4:
        MOVS     R0,#+1
        BL       FTM_CountClean
        B        ??Get_CarSpeed_5
//  163   }   
//  164   else
//  165   {
//  166      speed_measure_R= FTM_SpeedGet(FTM_SPEED_R);//在开始右通道计数前，将左通道数读出
??Get_CarSpeed_2:
        MOVS     R0,#+1
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_23
        STR      R0,[R1, #+0]
//  167      if(Direction_R==1)
        MOVS     R0,#+33
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_6
//  168      {
//  169        speed_R=-1*speed_measure_R;
        LDR      R0,??DataTable3_23
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_22  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_24
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_7
//  170 //       speed_R=speed_R*2;
//  171      }
//  172      else
//  173      {
//  174       speed_R=speed_measure_R;
??Get_CarSpeed_6:
        LDR      R0,??DataTable3_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_24
        STR      R0,[R1, #+0]
//  175      }
//  176   Choose_L;//清零计数
??Get_CarSpeed_7:
        MOVS     R0,#+0
        BL       FTM_CountClean
//  177   }
//  178 //    if ( (Pulse_L>7)   && (Pulse_R>7)
//  179 //      || (Pulse_L>2)   && (Pulse_L<7) && (Pulse_R>12)
//  180 //      || (Pulse_L>127) && (Pulse_R>2) && (Pulse_R<7) )
//  181 //    {
//  182 //        Pulse_L = 0;
//  183 //        Pulse_R = 0;
//  184 //        forward_flag = 1;
//  185 //        Runing_Distance++;
//  186 //    }
//  187 //    else
//  188 //        forward_flag = 0;
//  189     if ((speed_L > 150) && (speed_R > 150)&&(speed_L < -150) && (speed_R < -150))
??Get_CarSpeed_5:
        LDR      R0,??DataTable3_21
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_25  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_25  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_21
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_26  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_26  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
//  190     {
//  191         carStatus = STOP;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_27
        STRB     R0,[R1, #+0]
//  192     }
//  193 
//  194 }
??Get_CarSpeed_8:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     Speed_Error_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     Speed_Control_Output_R_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     Speed_Error_Last_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     Speed_Control_Output_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     Motor_Out_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     Motor_Out_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     speed_old_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     speed_old_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     speed_control_period

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     Speed_Control_Output_Cha_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     Speed_Control_Output_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     Speed_Control_Output2_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     Speed_Control_Output_Cha_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     Speed_Control_Output_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     Speed_Control_Output2_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     gyr_angle_speed_up_kt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     gyr_angle_speed_up

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     KT_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     ??LR_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     speed_measure_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     speed_measure_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     0x43160001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     0xc3160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     carStatus

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??LR_Flag:
        DS8 1
//  195 
//  196 
//  197 
//  198 
//  199 
//  200 
//  201 
//  202 
//  203 
//  204 
//  205 
//  206 
//  207 
//  208 
//  209 
//  210 
//  211 
//  212 
//  213 
//  214 
//  215 
//  216 
//  217 
//  218 
//  219 
//  220 
//  221 
//  222 
//  223 
//  224 
//  225 
//  226 
//  227 
//  228 
//  229 
//  230 
//  231 
//  232 
//  233 
//  234 
//  235 
//  236 
//  237 
//  238 
//  239 
//  240 
//  241 
//  242 
//  243 
//  244 
//  245 
//  246 
//  247 
//  248 
//  249 
//  250 
//  251 
//  252 
//  253 
//  254 ///*******************************************************************************
//  255 //简介：速度输出平滑函数，参考直立
//  256 //说明：将速度调整分为20个周期，防止影响稳定性
//  257 //*********************************************************************************/
//  258 //void Speed_Controler_Output(void)
//  259 //{
//  260 ////  Speed_Control_Cha_L=0;
//  261 ////    Speed_Control_Cha_R=0;
//  262 //// Speed_Control_Output_L=Speed_Control_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD + Speed_Control_L;
//  263 //// Speed_Control_Output_R=Speed_Control_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD + Speed_Control_R;
//  264 ////    
//  265 //}
//  266 ///**
//  267 //  * 简介
//  268 //  *     速度控制
//  269 //  * 注意
//  270 //  *     转换进制：脉冲数量 / (s转换 * 编码盘)
//  271 //    调节  P_Speed_D         P_Speed_G
//  272 //  */
//  273 
//  274 //void Speed_Controler(void)
//  275 //{
//  276 //    //Speed_I_lntegral_Max = Speed_I_lntegral_Max_Temp;
//  277 //    speed_car = (speed_R+speed_L) / 2;
//  278 //    speed_R = 0;
//  279 //    speed_L = 0;
//  280 ////    speed_car = speed_car / (10*);//转换进制
//  281 ////    E_speed = speed_set - speed_car;
//  282 //
//  283 //    //Speed_I_lntegral_Max = 7000;
//  284 //
//  285 //    if (E_speed > 0)
//  286 //    {
//  287 //        P_Speed = P_Speed_D;   ///调
//  288 //        Speed_I_lntegral += I_Speed_D*E_speed;
//  289 //    }
//  290 //    else if(E_speed < 0)
//  291 //    {
//  292 //        P_Speed = P_Speed_G;    ///调
//  293 //        Speed_I_lntegral += I_Speed_G*E_speed;
//  294 //    }
//  295 //
//  296 //    if (Speed_I_lntegral < -Speed_I_lntegral_Max)
//  297 //        Speed_I_lntegral = -Speed_I_lntegral_Max;
//  298 //    if (Speed_I_lntegral >  Speed_I_lntegral_Max)
//  299 //        Speed_I_lntegral =  Speed_I_lntegral_Max;
//  300 //
//  301 //    Speed_Control_Last = Speed_Control;
//  302 //    Speed_Control = P_Speed*E_speed + Speed_I_lntegral;   //记为位置式
//  303 //
//  304 ////    if (Runing_Distance < 60)
//  305 ////    {
//  306 ////        if (Speed_Control > 15000)
//  307 ////            Speed_Control = 15000;
//  308 ////        //else if(Speed_Control<-30000)
//  309 ////        //  Speed_Control=-30000;
//  310 ////    }
//  311 ////    else
//  312 ////    {
//  313 ////        if (Speed_Control > Motor_Max)
//  314 ////            Speed_Control = Motor_Max;
//  315 ////        else if (Speed_Control < -Motor_Max)
//  316 ////            Speed_Control = -Motor_Max;
//  317 ////    }
//  318 //    
//  319 //    
//  320 //    //速度控制输出量的变化（增量）   当前时刻减去前一时刻的输出量
//  321 //    Speed_Control_Cha = Speed_Control - Speed_Control_Last;
//  322 //      //Speed_I_lntegral_Max = 7000;
//  323   //   if (Speed_Error_L > 0)
//  324   //   {
//  325   //       Speed_P_L = Speed_P_Down;   ///调
//  326 //       Speed_I_lntegral_L += Speed_I_D*Speed_Error_L;
//  327     //   }
//  328     //    else if(Speed_Error_L < 0)
//  329     //    {
//  330     //        Speed_P_L = Speed_P_Up;   ///调
//  331     //        Speed_I_lntegral_L += Speed_I_Up*Speed_Error_L;
//  332   //    }
//  333   //    
//  334    //   if (Speed_Error_R> 0)
//  335   //    {
//  336   //        Speed_P_R = Speed_P_Down;   ///调
//  337 //        Speed_I_lntegral_R += Speed_I_D*Speed_Error_R;
//  338   //    }
//  339   //    else if(Speed_Error_R < 0)
//  340   //    {
//  341   //        Speed_P_R = Speed_P_Up;   ///调
//  342   //        Speed_I_lntegral_R += Speed_I_Up*Speed_Error_R;
//  343   //    }
//  344 
//  345 //    
//  346 //}
//  347 ///**
//  348 //  * 简介
//  349 //  *     速度输出平滑函数
//  350 //  * 说明
//  351 //  *     将速度调整分为20个周期，防止影响稳定性
//  352 //  */
//  353 //void Speed_Controler_Output(void)
//  354 //{
//  355 //    Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  356 //                         + Speed_Control_Last;
//  357 //    
//  358 //}
//  359 
//  360 /*---------------------NO------------速度控制参考直立-------------------------------------*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  361  float Speed_P_Up=130,Speed_P_Down=130;//速度环P选择
Speed_P_Up:
        DATA
        DC32 43020000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_P_Down:
        DATA
        DC32 43020000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  362  float Speed_P_L=0,Speed_P_R=0;//速度环P_左轮，速度环P_右轮  
Speed_P_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_P_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  363  float Speed_I_Up=0, Speed_I_Down=0;//速度环I选择
Speed_I_Up:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_Down:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  364  float Speed_Control_L=0,Speed_Control_Last_L=0;//本次和上次的左/右轮速度控制
Speed_Control_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  365  float Speed_Control_R=0,Speed_Control_Last_R=0;//目前由P,I积分累加组成。
Speed_Control_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  366  float Speed_Control_Cha_L=0;//左/右轮的速度控制差值，本次和上次的控制差
Speed_Control_Cha_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  367  float Speed_Control_Cha_R=0;
Speed_Control_Cha_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  368 uint8 add_speed_flag=1;	//起步加速过程
add_speed_flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  369 signed int Pulse_L=0,Pulse_R=0;
Pulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Pulse_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  370 float P_Speed = 0,I_Speed = 0; 
P_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
I_Speed:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  371 float P_Speed_D =10,P_Speed_G = 10;// 100;
P_Speed_D:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Speed_G:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  372 float I_Speed_D =2,I_Speed_G=2;//2;
I_Speed_D:
        DATA
        DC32 40000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
I_Speed_G:
        DATA
        DC32 40000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  373 float E_speed = 0.0;//E_speed_Last = 0.0,E_speed_Last_Last = 0.0;
E_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  374 float Speed_I_lntegral = 0;
Speed_I_lntegral:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  375 float Speed_Control = 0,Speed_Control_Last = 0;
Speed_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  376 float Speed_Control_Output = 0;
Speed_Control_Output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  377 float Speed_Control_Cha = 0;
Speed_Control_Cha:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  378 int   speed_control_period = 0;
speed_control_period:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  379 signed int podao_spd=164,podao_spd2=100;
podao_spd:
        DATA
        DC32 164

        SECTION `.data`:DATA:REORDER:NOROOT(2)
podao_spd2:
        DATA
        DC32 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  380 signed int podao_pulse_L=0, podao_pulse_R =0;
podao_pulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
podao_pulse_R:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  381 
//  382 
// 
// 217 bytes in section .bss
//  81 bytes in section .data
// 878 bytes in section .text
// 
// 878 bytes of CODE memory
// 298 bytes of DATA memory
//
//Errors: none
//Warnings: none
