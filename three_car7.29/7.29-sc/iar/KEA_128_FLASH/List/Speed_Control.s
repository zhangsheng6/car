///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  12:39:42
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Speed_Control.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Speed_Control.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\device\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\user\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\lib\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\Speed_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_inductor
        EXTERN FTM_CountClean
        EXTERN FTM_SpeedGet
        EXTERN GpioGet
        EXTERN GpioSet
        EXTERN PIT_DisableIrq
        EXTERN Speed_D
        EXTERN Speed_I
        EXTERN Speed_P
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN carStatus
        EXTERN speed_set

        PUBLIC Angle_Kt_P
        PUBLIC E_speed
        PUBLIC Error_Weight
        PUBLIC Get_CarSpeed
        PUBLIC I_Speed
        PUBLIC I_Speed_D
        PUBLIC I_Speed_G
        PUBLIC KT
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
        PUBLIC Speed_Error_L
        PUBLIC Speed_Error_L1
        PUBLIC Speed_Error_L2
        PUBLIC Speed_Error_Last_L
        PUBLIC Speed_Error_Last_Last_L
        PUBLIC Speed_Error_Last_Last_R
        PUBLIC Speed_Error_Last_R
        PUBLIC Speed_Error_R
        PUBLIC Speed_Error_R1
        PUBLIC Speed_Error_R2
        PUBLIC Speed_I_Down
        PUBLIC Speed_I_Up
        PUBLIC Speed_I_lntegral
        PUBLIC Speed_Kt_I
        PUBLIC Speed_Kt_P
        PUBLIC Speed_P_Down
        PUBLIC Speed_P_L
        PUBLIC Speed_P_R
        PUBLIC Speed_P_Up
        PUBLIC Stop_zs
        PUBLIC add_speed_flag
        PUBLIC podao_pulse_L
        PUBLIC podao_pulse_R
        PUBLIC podao_spd
        PUBLIC podao_spd2
        PUBLIC speed_L
        PUBLIC speed_R
        PUBLIC speed_buzzer
        PUBLIC speed_car
        PUBLIC speed_car_L
        PUBLIC speed_car_R
        PUBLIC speed_control_period
        PUBLIC speed_measure_L
        PUBLIC speed_measure_R
        PUBLIC speed_old_L
        PUBLIC speed_old_R
        PUBLIC speed_set_L
        PUBLIC speed_set_L_2
        PUBLIC speed_set_R
        PUBLIC speed_set_R_2
        PUBLIC speed_set_W
        PUBLIC speed_set_Z
        PUBLIC speed_set_max
        PUBLIC speed_set_min
        PUBLIC speed_set_temp
        PUBLIC speed_set_temp_L
        PUBLIC speed_set_temp_R

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Speed_Control.c
//    1 #include "Speed_Control.h"
//    2 //30,1m//40 1.5m
//    3 //50:1.6,55
//    4 //60 1.9m//65，2.15m//70,2.3m
//    5 /***************速度变量*********************************************************************/
//    6 //编码器测的速度和自己设定的速度小写
//    7 //float speed_set_Z=60,speed_set_W=50;
//    8 /****************速度环*************************************************************************/
//    9 //V=30,P=80;I=10;D=0;
//   10 //float Speed_P=130,Speed_I=30,Speed_D=0.00;
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
//   13 //float gyr_angle_speed_up_kt=2*
//   14 //int   KT_Flag=0;
//   15 /***************速度变量2*********************************************************************/  

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float speed_buzzer=0;
speed_buzzer:
        DS8 4
//   17 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float speed_set_L=0,speed_set_R=0,speed_set_L_2=0,speed_set_R_2=0;
speed_set_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_L_2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_R_2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 float speed_set_W=60, speed_set_Z=60,speed_set_temp = 0,speed_set_temp_L = 0,speed_set_temp_R=0;//速度设定值，临时速度设定值
speed_set_W:
        DATA
        DC32 42700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_set_Z:
        DATA
        DC32 42700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_temp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_temp_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_set_temp_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 float speed_set_max=80, speed_set_min=20;//速度设定最大最小值
speed_set_max:
        DATA
        DC32 42A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_set_min:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float Motor_Out_Old_L=0,Motor_Out_Old_R=0;//上一次电机输出PWM值
Motor_Out_Old_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_Old_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 float Motor_Out_Max=8500,Motor_Out_Min=2500;//电机输出最大最小值
Motor_Out_Max:
        DATA
        DC32 4604D000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Out_Min:
        DATA
        DC32 451C4000H
//   23 /****************速度环2*************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float Speed_Error_L = 0, Speed_Error_Last_L = 0, Speed_Error_Last_Last_L = 0,  //L速度偏差值   
Speed_Error_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25       Speed_Error_R = 0, Speed_Error_Last_R = 0, Speed_Error_Last_Last_R = 0;  //R速度偏差值 
Speed_Error_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_Last_Last_R:
        DS8 4
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 float Speed_Error_L1 = 0,Speed_Error_R1 = 0,Error_Weight,
Speed_Error_L1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_R1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Error_Weight:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28        Speed_Error_L2 = 0,Speed_Error_R2 = 0;
Speed_Error_L2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Error_R2:
        DS8 4
//   29 

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
//   40 /******************测速变量***********************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 float speed_measure_L,speed_measure_R,//测速左,车整体速度
speed_measure_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_measure_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42       speed_L = 0,speed_R = 0,speed_car = 0,speed_car_L = 0,speed_car_R = 0;
speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_car:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_car_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_car_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 float speed_old_L=0,speed_old_R=0;//上一次测速
speed_old_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_old_R:
        DS8 4
//   44 
//   45 /******************测速变量***********************************************************************
//   46 简介：速度控制，
//   47 输入：速度设定值
//   48 功能：调节实际速度达到设定值
//   49 输出：PWM值
//   50 *********************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void Speed_Controler()
//   52 {  
Speed_Controler:
        PUSH     {R3-R5,LR}
//   53 
//   54   
//   55   Speed_Error_L = speed_set_L- speed_L; 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_2
        STR      R0,[R1, #+0]
//   56   Speed_Error_R = speed_set_R - speed_R;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   57 
//   58 
//   59 Speed_Control_Output_L=Speed_Control_Output_L_Old - Speed_P*(Speed_Error_L-Speed_Error_Last_L) + Speed_I*Speed_Error_L + Speed_D*(Speed_Error_L+Speed_Error_Last_Last_L-2*Speed_Error_Last_L);
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable0_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable0_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable0_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R5,R0
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//   60 Speed_Control_Output_R=Speed_Control_Output_R_Old - Speed_P*(Speed_Error_R-Speed_Error_Last_R) + Speed_I*Speed_Error_R + Speed_D*(Speed_Error_R+Speed_Error_Last_Last_R-2*Speed_Error_Last_R);  
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable0_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R5,R0
        LDR      R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   61   
//   62   if(Speed_Control_Output_L > Motor_Out_Max)
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_0
//   63     Speed_Control_Output_L = Motor_Out_Max; 
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//   64   if(Speed_Control_Output_L < 0)
??Speed_Controler_0:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_1
//   65     Speed_Control_Output_L = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//   66   
//   67   if(Speed_Control_Output_R > Motor_Out_Max)
??Speed_Controler_1:
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_2
//   68     Speed_Control_Output_R = Motor_Out_Max; 
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   69   if(Speed_Control_Output_R < 0)
??Speed_Controler_2:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_3
//   70     Speed_Control_Output_R = 0;   
        MOVS     R0,#+0
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   71   
//   72   Speed_Control_Output_L_Old= Speed_Control_Output_L;
??Speed_Controler_3:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_8
        STR      R0,[R1, #+0]
//   73   Speed_Error_Last_Last_L = Speed_Error_Last_L;
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//   74   Speed_Error_Last_L = Speed_Error_L;
        LDR      R0,??DataTable0_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//   75   speed_old_L = speed_L;
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//   76   
//   77   Speed_Control_Output_R_Old= Speed_Control_Output_R;
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   78   Speed_Error_Last_Last_R = Speed_Error_Last_R;
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//   79   Speed_Error_Last_R = Speed_Error_R;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//   80   speed_old_R = speed_R;  
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//   81  
//   82 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     speed_set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Speed_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     Speed_Error_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     Speed_Control_Output_L_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     Speed_Error_Last_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     Speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     Speed_Control_Output_L
//   83 /*************************************************************************
//   84 
//   85 *****************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 void Get_CarSpeed(void)
//   87 {
Get_CarSpeed:
        PUSH     {R7,LR}
//   88   static uint8 LR_Flag = 0;
//   89   LR_Flag = !LR_Flag;//分时复用测两路
        LDR      R0,??DataTable2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Get_CarSpeed_0
        MOVS     R0,#+1
        LDR      R1,??DataTable2
        STRB     R0,[R1, #+0]
        B        ??Get_CarSpeed_1
??Get_CarSpeed_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        STRB     R0,[R1, #+0]
//   90   //开通道
//   91   if (LR_Flag)
??Get_CarSpeed_1:
        LDR      R0,??DataTable2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Get_CarSpeed_2
//   92   {
//   93      speed_measure_L= FTM_SpeedGet(FTM_SPEED_L);//在开始右通道计数前，将左通道数读出
        MOVS     R0,#+0
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//   94      
//   95      if(Direction_L==1)
        MOVS     R0,#+35
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_3
//   96      {
//   97         speed_L=speed_measure_L;//改成2ms一次的测速,速度频率太快，得重调参数,放慢节奏，用4ms
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_1
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_4
//   98 //        speed_L=speed_L*2;//4ms一次的测速,
//   99      }
//  100      else
//  101      {
//  102         speed_L=-1*speed_measure_L;
??Get_CarSpeed_3:
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_2  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_1
        STR      R0,[R1, #+0]
//  103      }
//  104      
//  105      Choose_R;//清零计数
??Get_CarSpeed_4:
        MOVS     R0,#+1
        BL       FTM_CountClean
        B        ??Get_CarSpeed_5
//  106   }   
//  107   else
//  108   {
//  109      speed_measure_R= FTM_SpeedGet(FTM_SPEED_R);//在开始右通道计数前，将左通道数读出
??Get_CarSpeed_2:
        MOVS     R0,#+1
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  110      if(Direction_R==1)
        MOVS     R0,#+33
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_6
//  111      {
//  112        speed_R=-1*speed_measure_R;
        LDR      R0,??DataTable3_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_2  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_7
//  113 //       speed_R=speed_R*2;
//  114      }
//  115      else
//  116      {
//  117       speed_R=speed_measure_R;
??Get_CarSpeed_6:
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  118      }
//  119   Choose_L;//清零计数
??Get_CarSpeed_7:
        MOVS     R0,#+0
        BL       FTM_CountClean
//  120   }
//  121 
//  122     if ((speed_L > 150) && (speed_R > 150)&&(speed_L < -150) && (speed_R < -150))
??Get_CarSpeed_5:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
//  123     {
//  124         carStatus = STOP;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//  125     }
//  126   if(speed_L<-20)
??Get_CarSpeed_8:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_8  ;; 0xc1a00000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_9
//  127     
//  128     LED_2_ON;
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       GpioSet
//  129     
//  130    speed_car=(speed_L+speed_R)/2;    
??Get_CarSpeed_9:
        LDR      R0,??DataTable3_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_9
        STR      R0,[R1, #+0]
//  131    speed_buzzer=speed_set-20;
        LDR      R0,??DataTable3_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_8  ;; 0xc1a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  132    
//  133   
//  134   if(speed_car<speed_buzzer)   BUZZER_ON;
        LDR      R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_10
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  135   if(speed_car>speed_buzzer)  BUZZER_OFF;
??Get_CarSpeed_10:
        LDR      R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_11
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  136   if(speed_L<10&&speed_R<10&&speed_L>-10&&speed_R>-10)
??Get_CarSpeed_11:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_12  ;; 0x41200000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_12
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_12  ;; 0x41200000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_12
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_13  ;; 0xc11fffff
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_12
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_13  ;; 0xc11fffff
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_12
//  137       BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  138 }
??Get_CarSpeed_12:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     Speed_Error_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Speed_Control_Output_R_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     Speed_Error_Last_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Speed_Control_Output_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Motor_Out_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     speed_old_L

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??LR_Flag:
        DS8 1
//  139 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 void Stop_zs(void)
//  141 {
Stop_zs:
        PUSH     {R4,LR}
//  142   int Stop_Flag=0;
        MOVS     R4,#+0
//  143   
//  144   if(speed_L>30&&speed_R>30)
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_14  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_0
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_14  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_0
//  145     Stop_Flag=1;
        MOVS     R0,#+1
        MOVS     R4,R0
//  146   
//  147   if(Stop_Flag==1)
??Stop_zs_0:
        CMP      R4,#+1
        BNE      ??Stop_zs_1
//  148   { 
//  149      if(speed_L>200||speed_R>200||(speed_L>150&&speed_R>150))
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_15  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BLS      ??Stop_zs_2
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_15  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BLS      ??Stop_zs_2
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_3
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_3
//  150         {
//  151           locking_L;
??Stop_zs_2:
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  152           locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//  153           PIT_DisableIrq();//关 PIT 中断
        BL       PIT_DisableIrq
//  154         }
//  155  
//  156     if(AD_inductor[0]<1&&AD_inductor[1]<1&&AD_inductor[2]<1)
??Stop_zs_3:
        LDR      R0,??DataTable3_16
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
        LDR      R0,??DataTable3_16
        LDR      R0,[R0, #+4]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
        LDR      R0,??DataTable3_16
        LDR      R0,[R0, #+8]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
//  157        {
//  158           locking_L;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  159           locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//  160           PIT_DisableIrq();//关 PIT 中断
        BL       PIT_DisableIrq
//  161        }
//  162   }
//  163 
//  164 }
??Stop_zs_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ??LR_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     speed_measure_L
//  165 
//  166 /**
//  167   * 简介
//  168   *     速度输出平滑函数
//  169   * 说明
//  170   *     将速度调整分为20个周期，防止影响稳定性
//  171   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void Speed_Controler_Output(void)
//  173 {
Speed_Controler_Output:
        PUSH     {R7,LR}
//  174   Speed_Control_Output2_L = Speed_Control_Output_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  175                          + Speed_Control_Output_Last_L; 
        LDR      R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_19  ;; 0x40a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_20
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_21
        STR      R0,[R1, #+0]
//  176  
//  177   Speed_Control_Output2_R = Speed_Control_Output_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  178                          + Speed_Control_Output_Last_R;  
        LDR      R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_19  ;; 0x40a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_24
        STR      R0,[R1, #+0]
//  179  
//  180 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     speed_old_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     speed_measure_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x43160001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0xc3160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     carStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0xc1a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     speed_buzzer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0xc11fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0x41f00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x43480001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     speed_control_period

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     Speed_Control_Output_Cha_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     Speed_Control_Output_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     Speed_Control_Output2_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     Speed_Control_Output_Cha_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     Speed_Control_Output_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     Speed_Control_Output2_R
//  181 
//  182 
//  183 ////////////////////////////////////

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  184 void KT()
//  185 {
//  186 
//  187 }
KT:
        BX       LR               ;; return
//  188 
//  189 /*---------------------NO------------速度控制参考直立-------------------------------------*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  190  float Speed_P_Up=130,Speed_P_Down=130;//速度环P选择
Speed_P_Up:
        DATA
        DC32 43020000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_P_Down:
        DATA
        DC32 43020000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  191  float Speed_P_L=0,Speed_P_R=0;//速度环P_左轮，速度环P_右轮  
Speed_P_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_P_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  192  float Speed_I_Up=0, Speed_I_Down=0;//速度环I选择
Speed_I_Up:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_Down:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  193  float Speed_Control_L=0,Speed_Control_Last_L=0;//本次和上次的左/右轮速度控制
Speed_Control_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  194  float Speed_Control_R=0,Speed_Control_Last_R=0;//目前由P,I积分累加组成。
Speed_Control_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  195  float Speed_Control_Cha_L=0;//左/右轮的速度控制差值，本次和上次的控制差
Speed_Control_Cha_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  196  float Speed_Control_Cha_R=0;
Speed_Control_Cha_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  197 uint8 add_speed_flag=1;	//起步加速过程
add_speed_flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  198 signed int Pulse_L=0,Pulse_R=0;
Pulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Pulse_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  199 float P_Speed = 0,I_Speed = 0; 
P_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
I_Speed:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  200 float P_Speed_D =10,P_Speed_G = 10;// 100;
P_Speed_D:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Speed_G:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  201 float I_Speed_D =2,I_Speed_G=2;//2;
I_Speed_D:
        DATA
        DC32 40000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
I_Speed_G:
        DATA
        DC32 40000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  202 float E_speed = 0.0;//E_speed_Last = 0.0,E_speed_Last_Last = 0.0;
E_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  203 float Speed_I_lntegral = 0;
Speed_I_lntegral:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  204 float Speed_Control = 0,Speed_Control_Last = 0;
Speed_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  205 float Speed_Control_Output = 0;
Speed_Control_Output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  206 float Speed_Control_Cha = 0;
Speed_Control_Cha:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  207 int   speed_control_period = 0;
speed_control_period:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  208 signed int podao_spd=164,podao_spd2=100;
podao_spd:
        DATA
        DC32 164

        SECTION `.data`:DATA:REORDER:NOROOT(2)
podao_spd2:
        DATA
        DC32 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  209 signed int podao_pulse_L=0, podao_pulse_R =0;
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
//  210 
//  211 
// 
//   261 bytes in section .bss
//    61 bytes in section .data
// 1 210 bytes in section .text
// 
// 1 210 bytes of CODE memory
//   322 bytes of DATA memory
//
//Errors: none
//Warnings: none
