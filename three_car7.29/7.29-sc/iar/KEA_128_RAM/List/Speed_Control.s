///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:45
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Speed_Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Speed_Control.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\Speed_Control.s
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

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Speed_Control.c
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
//   53 //  float Speed_Error_L_Temp1=0,Speed_Error_L_Temp2=0,
//   54 //        Speed_Error_R_Temp1=0,Speed_Error_R_Temp2=0;
//   55 //弯道有利于转弯，目前认为跟那个之前方向环P一样，会弯道稳速，减速，加速？
//   56 //  Speed_Error_L = speed_set_L_2- speed_L; 
//   57 //  Speed_Error_R = speed_set_R_2 - speed_R; 
//   58   
//   59   Speed_Error_L = speed_set_L- speed_L; 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_2
        STR      R0,[R1, #+0]
//   60   Speed_Error_R = speed_set_R - speed_R;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   61  
//   62 //    Speed_Error_L = speed_set- speed_L; 
//   63 //  Speed_Error_R = speed_set - speed_R;  
//   64 
//   65   
//   66 //  Speed_Error_L = speed_set- speed_car; 
//   67 //  Speed_Error_R = speed_set - speed_car; 
//   68 
//   69 //  Speed_Error_L=Speed_Error_L/2;
//   70 //  Speed_Error_R=Speed_Error_R/2;
//   71 
//   72 //  Speed_Error_L1 = speed_set- speed_L; 
//   73 //  Speed_Error_R1 = speed_set - speed_R;
//   74 //  
//   75 //  Speed_Error_L2 = speed_set- speed_car; 
//   76 //  Speed_Error_R2 = speed_set - speed_car;
//   77 //  
//   78 //  Error_Weight=1.0;
//   79 //  
//   80 //  Speed_Error_L = Speed_Error_L1*Error_Weight+Speed_Error_L2*(1-Error_Weight); 
//   81 //  Speed_Error_R = Speed_Error_R1*Error_Weight+Speed_Error_R2*(1-Error_Weight); //:\I:1以下
//   82 
//   83 //  Speed_Error_L/=2;
//   84 //  Speed_Error_R/=2;
//   85 
//   86 //  Speed_Error_L_Temp1 = speed_set_L- speed_L; 
//   87 //  Speed_Error_R_Temp1 = speed_set_R - speed_R;
//   88 //  Speed_Error_L_Temp2 = speed_set- speed_L; 
//   89 //  Speed_Error_R_Temp2 = speed_set - speed_R; 
//   90 //  
//   91 //  Speed_Error_L=(Speed_Error_L_Temp1+Speed_Error_L_Temp2)/2;
//   92 //  Speed_Error_R=(Speed_Error_R_Temp1+Speed_Error_R_Temp2)/2;
//   93 
//   94 //Speed_Control_Output_L=(uint32)(Speed_Control_Output_L_Old - Speed_P*(Speed_Error_L-Speed_Error_Last_L) + Speed_I*Speed_Error_L + Speed_D*(Speed_Error_L+Speed_Error_Last_Last_L-2*Speed_Error_Last_L));
//   95 //Speed_Control_Output_R=(uint32)(Speed_Control_Output_R_Old - Speed_P*(Speed_Error_R-Speed_Error_Last_R) + Speed_I*Speed_Error_R + Speed_D*(Speed_Error_R+Speed_Error_Last_Last_R-2*Speed_Error_Last_R));  
//   96 Speed_Control_Output_L=Speed_Control_Output_L_Old - Speed_P*(Speed_Error_L-Speed_Error_Last_L) + Speed_I*Speed_Error_L + Speed_D*(Speed_Error_L+Speed_Error_Last_Last_L-2*Speed_Error_Last_L);
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
//   97 Speed_Control_Output_R=Speed_Control_Output_R_Old - Speed_P*(Speed_Error_R-Speed_Error_Last_R) + Speed_I*Speed_Error_R + Speed_D*(Speed_Error_R+Speed_Error_Last_Last_R-2*Speed_Error_Last_R);  
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
//   98   
//   99   if(Speed_Control_Output_L > Motor_Out_Max)
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_0
//  100     Speed_Control_Output_L = Motor_Out_Max; 
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//  101   if(Speed_Control_Output_L < 0)
??Speed_Controler_0:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_1
//  102     Speed_Control_Output_L = 0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//  103   
//  104   if(Speed_Control_Output_R > Motor_Out_Max)
??Speed_Controler_1:
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_2
//  105     Speed_Control_Output_R = Motor_Out_Max; 
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  106   if(Speed_Control_Output_R < 0)
??Speed_Controler_2:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_3
//  107     Speed_Control_Output_R = 0;   
        MOVS     R0,#+0
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  108   
//  109   Speed_Control_Output_L_Old= Speed_Control_Output_L;
??Speed_Controler_3:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_8
        STR      R0,[R1, #+0]
//  110   Speed_Error_Last_Last_L = Speed_Error_Last_L;
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//  111   Speed_Error_Last_L = Speed_Error_L;
        LDR      R0,??DataTable0_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//  112   speed_old_L = speed_L;
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  113   
//  114   Speed_Control_Output_R_Old= Speed_Control_Output_R;
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  115   Speed_Error_Last_Last_R = Speed_Error_Last_R;
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  116   Speed_Error_Last_R = Speed_Error_R;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//  117   speed_old_R = speed_R;  
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  118  
//  119 }
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
//  120 
//  121 
//  122 
//  123 /*************************************************************************
//  124 获取车速：分时复用两路测速
//  125 (PACNT/200)*(编码器齿数/连接轮齿数)*连接轮周长/测速周期==speed
//  126 
//  127  Distance+=(qd1_result+qd2_result)/6100.0;  //转化为距离
//  128   CarSpeed=(qd1_result+qd2_result)*250.0/6100.0;    //求出车速转换为M/S
//  129    if(CarSpeed>3.5)CarSpeed=3.5;
//  130 *****************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void Get_CarSpeed(void)
//  132 {
Get_CarSpeed:
        PUSH     {R7,LR}
//  133   static uint8 LR_Flag = 0;
//  134   LR_Flag = !LR_Flag;//分时复用测两路
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
//  135   //开通道
//  136   if (LR_Flag)
??Get_CarSpeed_1:
        LDR      R0,??DataTable2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Get_CarSpeed_2
//  137   {
//  138      speed_measure_L= FTM_SpeedGet(FTM_SPEED_L);//在开始右通道计数前，将左通道数读出
        MOVS     R0,#+0
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_1
        STR      R0,[R1, #+0]
//  139      
//  140      if(Direction_L==1)
        MOVS     R0,#+35
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_3
//  141      {
//  142         speed_L=speed_measure_L;//改成2ms一次的测速,速度频率太快，得重调参数,放慢节奏，用4ms
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_4
//  143 //        speed_L=speed_L*2;//4ms一次的测速,
//  144      }
//  145      else
//  146      {
//  147         speed_L=-1*speed_measure_L;
??Get_CarSpeed_3:
        LDR      R0,??DataTable3_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_3  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//  148      }
//  149      
//  150      Choose_R;//清零计数
??Get_CarSpeed_4:
        MOVS     R0,#+1
        BL       FTM_CountClean
        B        ??Get_CarSpeed_5
//  151   }   
//  152   else
//  153   {
//  154      speed_measure_R= FTM_SpeedGet(FTM_SPEED_R);//在开始右通道计数前，将左通道数读出
??Get_CarSpeed_2:
        MOVS     R0,#+1
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  155      if(Direction_R==1)
        MOVS     R0,#+33
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??Get_CarSpeed_6
//  156      {
//  157        speed_R=-1*speed_measure_R;
        LDR      R0,??DataTable3_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_3  ;; 0xbf800000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_5
        STR      R0,[R1, #+0]
        B        ??Get_CarSpeed_7
//  158 //       speed_R=speed_R*2;
//  159      }
//  160      else
//  161      {
//  162       speed_R=speed_measure_R;
??Get_CarSpeed_6:
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_5
        STR      R0,[R1, #+0]
//  163      }
//  164   Choose_L;//清零计数
??Get_CarSpeed_7:
        MOVS     R0,#+0
        BL       FTM_CountClean
//  165   }
//  166 //    if ( (Pulse_L>7)   && (Pulse_R>7)
//  167 //      || (Pulse_L>2)   && (Pulse_L<7) && (Pulse_R>12)
//  168 //      || (Pulse_L>127) && (Pulse_R>2) && (Pulse_R<7) )
//  169 //    {
//  170 //        Pulse_L = 0;
//  171 //        Pulse_R = 0;
//  172 //        forward_flag = 1;
//  173 //        Runing_Distance++;
//  174 //    }
//  175 //    else
//  176 //        forward_flag = 0;
//  177     if ((speed_L > 150) && (speed_R > 150)&&(speed_L < -150) && (speed_R < -150))
??Get_CarSpeed_5:
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_7  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_7  ;; 0xc3160000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_8
//  178     {
//  179         carStatus = STOP;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_8
        STRB     R0,[R1, #+0]
//  180     }
//  181    speed_car=(speed_L+speed_R)/2;    
??Get_CarSpeed_8:
        LDR      R0,??DataTable3_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_9
        STR      R0,[R1, #+0]
//  182    speed_buzzer=speed_set-20;
        LDR      R0,??DataTable3_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_11  ;; 0xc1a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_12
        STR      R0,[R1, #+0]
//  183    
//  184   
//  185   if(speed_car<speed_buzzer)   BUZZER_ON;
        LDR      R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_9
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  186   if(speed_car>speed_buzzer)  BUZZER_OFF;
??Get_CarSpeed_9:
        LDR      R0,??DataTable3_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_10
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  187   if(speed_L<10&&speed_R<10&&speed_L>-10&&speed_R>-10)
??Get_CarSpeed_10:
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_13  ;; 0x41200000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_11
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_13  ;; 0x41200000
        BL       __aeabi_cfcmple
        BCS      ??Get_CarSpeed_11
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_14  ;; 0xc11fffff
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_11
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_14  ;; 0xc11fffff
        BL       __aeabi_cfrcmple
        BHI      ??Get_CarSpeed_11
//  188       BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  189 }
??Get_CarSpeed_11:
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
//  190 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  191 void Stop_zs(void)
//  192 {
Stop_zs:
        PUSH     {R7,LR}
//  193   int Stop_Flag=0;
        MOVS     R2,#+0
//  194   
//  195   if(speed_L>30&&speed_R>30)
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_15  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_0
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_15  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_0
//  196     Stop_Flag=1;
        MOVS     R2,#+1
//  197   
//  198   if(Stop_Flag==1)
??Stop_zs_0:
        CMP      R2,#+1
        BNE      ??Stop_zs_1
//  199   { 
//  200      if(speed_L>200||speed_R>200||(speed_L>150&&speed_R>150))
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_16  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BLS      ??Stop_zs_2
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_16  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BLS      ??Stop_zs_2
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_3
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_6  ;; 0x43160001
        BL       __aeabi_cfrcmple
        BHI      ??Stop_zs_3
//  201         {
//  202           locking_L;
??Stop_zs_2:
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  203           locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//  204           PIT_DisableIrq();//关 PIT 中断
        BL       PIT_DisableIrq
//  205         }
//  206  
//  207     if(AD_inductor[0]<1&&AD_inductor[1]<1&&AD_inductor[2]<1)
??Stop_zs_3:
        LDR      R0,??DataTable3_17
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
        LDR      R0,??DataTable3_17
        LDR      R0,[R0, #+4]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
        LDR      R0,??DataTable3_17
        LDR      R0,[R0, #+8]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Stop_zs_1
//  208        {
//  209           locking_L;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//  210           locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//  211           PIT_DisableIrq();//关 PIT 中断
        BL       PIT_DisableIrq
//  212        }
//  213   }
//  214 
//  215 }
??Stop_zs_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     ??LR_Flag
//  216 
//  217 /**
//  218   * 简介
//  219   *     速度输出平滑函数
//  220   * 说明
//  221   *     将速度调整分为20个周期，防止影响稳定性
//  222   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  223 void Speed_Controler_Output(void)
//  224 {
Speed_Controler_Output:
        PUSH     {R7,LR}
//  225   Speed_Control_Output2_L = Speed_Control_Output_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  226                          + Speed_Control_Output_Last_L; 
        LDR      R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_20  ;; 0x40a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_21
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_22
        STR      R0,[R1, #+0]
//  227  
//  228   Speed_Control_Output2_R = Speed_Control_Output_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  229                          + Speed_Control_Output_Last_R;  
        LDR      R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_20  ;; 0x40a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable3_24
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_25
        STR      R0,[R1, #+0]
//  230 //  Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  231 //                         + Speed_Control_Last;
//  232 //    
//  233 }
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
        DC32     speed_measure_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     speed_measure_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x43160001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0xc3160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     carStatus

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
        DC32     0xc1a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     speed_buzzer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0xc11fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x41f00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x43480001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     speed_control_period

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     Speed_Control_Output_Cha_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     Speed_Control_Output_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     Speed_Control_Output2_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     Speed_Control_Output_Cha_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     Speed_Control_Output_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     Speed_Control_Output2_R
//  234 
//  235 
//  236 
//  237 /*可在角速度大于2的绝对值时蜂鸣器向测试*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  238 void KT()
//  239 {
//  240 //  if(gyr_angle_speed_up>gyr_angle_speed_up_kt)
//  241 //     KT_Flag=1;
//  242 //  if(KT_Flag==1)
//  243 //  { //KT输出=P*
//  244 ////     Kt_Output_L=Angle_Kt_P*gyr_angle_speed_up
//  245 //  }
//  246    
//  247 }
KT:
        BX       LR               ;; return
//  248 
//  249 
//  250 
//  251 
//  252 
//  253 
//  254 
//  255 
//  256 
//  257 
//  258 
//  259 
//  260 
//  261 
//  262 
//  263 
//  264 
//  265 
//  266 
//  267 
//  268 
//  269 
//  270 
//  271 
//  272 
//  273 
//  274 
//  275 
//  276 
//  277 
//  278 
//  279 
//  280 
//  281 
//  282 
//  283 
//  284 
//  285 
//  286 
//  287 
//  288 
//  289 
//  290 
//  291 
//  292 
//  293 
//  294 
//  295 
//  296 ///*******************************************************************************
//  297 //简介：速度输出平滑函数，参考直立
//  298 //说明：将速度调整分为20个周期，防止影响稳定性
//  299 //*********************************************************************************/
//  300 //void Speed_Controler_Output(void)
//  301 //{
//  302 ////  Speed_Control_Cha_L=0;
//  303 ////    Speed_Control_Cha_R=0;
//  304 //// Speed_Control_Output_L=Speed_Control_Cha_L * (speed_control_period+1)/SPEED_CONTROL_PERIOD + Speed_Control_L;
//  305 //// Speed_Control_Output_R=Speed_Control_Cha_R * (speed_control_period+1)/SPEED_CONTROL_PERIOD + Speed_Control_R;
//  306 ////    
//  307 //}
//  308 ///**
//  309 //  * 简介
//  310 //  *     速度控制
//  311 //  * 注意
//  312 //  *     转换进制：脉冲数量 / (s转换 * 编码盘)
//  313 //    调节  P_Speed_D         P_Speed_G
//  314 //  */
//  315 
//  316 //void Speed_Controler(void)
//  317 //{
//  318 //    //Speed_I_lntegral_Max = Speed_I_lntegral_Max_Temp;
//  319 //    speed_car = (speed_R+speed_L) / 2;
//  320 //    speed_R = 0;
//  321 //    speed_L = 0;
//  322 ////    speed_car = speed_car / (10*);//转换进制
//  323 ////    E_speed = speed_set - speed_car;
//  324 //
//  325 //    //Speed_I_lntegral_Max = 7000;
//  326 //
//  327 //    if (E_speed > 0)
//  328 //    {
//  329 //        P_Speed = P_Speed_D;   ///调
//  330 //        Speed_I_lntegral += I_Speed_D*E_speed;
//  331 //    }
//  332 //    else if(E_speed < 0)
//  333 //    {
//  334 //        P_Speed = P_Speed_G;    ///调
//  335 //        Speed_I_lntegral += I_Speed_G*E_speed;
//  336 //    }
//  337 //
//  338 //    if (Speed_I_lntegral < -Speed_I_lntegral_Max)
//  339 //        Speed_I_lntegral = -Speed_I_lntegral_Max;
//  340 //    if (Speed_I_lntegral >  Speed_I_lntegral_Max)
//  341 //        Speed_I_lntegral =  Speed_I_lntegral_Max;
//  342 //
//  343 //    Speed_Control_Last = Speed_Control;
//  344 //    Speed_Control = P_Speed*E_speed + Speed_I_lntegral;   //记为位置式
//  345 //
//  346 ////    if (Runing_Distance < 60)
//  347 ////    {
//  348 ////        if (Speed_Control > 15000)
//  349 ////            Speed_Control = 15000;
//  350 ////        //else if(Speed_Control<-30000)
//  351 ////        //  Speed_Control=-30000;
//  352 ////    }
//  353 ////    else
//  354 ////    {
//  355 ////        if (Speed_Control > Motor_Max)
//  356 ////            Speed_Control = Motor_Max;
//  357 ////        else if (Speed_Control < -Motor_Max)
//  358 ////            Speed_Control = -Motor_Max;
//  359 ////    }
//  360 //    
//  361 //    
//  362 //    //速度控制输出量的变化（增量）   当前时刻减去前一时刻的输出量
//  363 //    Speed_Control_Cha = Speed_Control - Speed_Control_Last;
//  364 //      //Speed_I_lntegral_Max = 7000;
//  365   //   if (Speed_Error_L > 0)
//  366   //   {
//  367   //       Speed_P_L = Speed_P_Down;   ///调
//  368 //       Speed_I_lntegral_L += Speed_I_D*Speed_Error_L;
//  369     //   }
//  370     //    else if(Speed_Error_L < 0)
//  371     //    {
//  372     //        Speed_P_L = Speed_P_Up;   ///调
//  373     //        Speed_I_lntegral_L += Speed_I_Up*Speed_Error_L;
//  374   //    }
//  375   //    
//  376    //   if (Speed_Error_R> 0)
//  377   //    {
//  378   //        Speed_P_R = Speed_P_Down;   ///调
//  379 //        Speed_I_lntegral_R += Speed_I_D*Speed_Error_R;
//  380   //    }
//  381   //    else if(Speed_Error_R < 0)
//  382   //    {
//  383   //        Speed_P_R = Speed_P_Up;   ///调
//  384   //        Speed_I_lntegral_R += Speed_I_Up*Speed_Error_R;
//  385   //    }
//  386 
//  387 //    
//  388 //}
//  389 ///**
//  390 //  * 简介
//  391 //  *     速度输出平滑函数
//  392 //  * 说明
//  393 //  *     将速度调整分为20个周期，防止影响稳定性
//  394 //  */
//  395 //void Speed_Controler_Output(void)
//  396 //{
//  397 //    Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_CONTROL_PERIOD
//  398 //                         + Speed_Control_Last;
//  399 //    
//  400 //}
//  401 
//  402 /*---------------------NO------------速度控制参考直立-------------------------------------*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  403  float Speed_P_Up=130,Speed_P_Down=130;//速度环P选择
Speed_P_Up:
        DATA
        DC32 43020000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_P_Down:
        DATA
        DC32 43020000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  404  float Speed_P_L=0,Speed_P_R=0;//速度环P_左轮，速度环P_右轮  
Speed_P_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_P_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  405  float Speed_I_Up=0, Speed_I_Down=0;//速度环I选择
Speed_I_Up:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_Down:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  406  float Speed_Control_L=0,Speed_Control_Last_L=0;//本次和上次的左/右轮速度控制
Speed_Control_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  407  float Speed_Control_R=0,Speed_Control_Last_R=0;//目前由P,I积分累加组成。
Speed_Control_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  408  float Speed_Control_Cha_L=0;//左/右轮的速度控制差值，本次和上次的控制差
Speed_Control_Cha_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  409  float Speed_Control_Cha_R=0;
Speed_Control_Cha_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  410 uint8 add_speed_flag=1;	//起步加速过程
add_speed_flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  411 signed int Pulse_L=0,Pulse_R=0;
Pulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Pulse_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  412 float P_Speed = 0,I_Speed = 0; 
P_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
I_Speed:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  413 float P_Speed_D =10,P_Speed_G = 10;// 100;
P_Speed_D:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Speed_G:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  414 float I_Speed_D =2,I_Speed_G=2;//2;
I_Speed_D:
        DATA
        DC32 40000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
I_Speed_G:
        DATA
        DC32 40000000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  415 float E_speed = 0.0;//E_speed_Last = 0.0,E_speed_Last_Last = 0.0;
E_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  416 float Speed_I_lntegral = 0;
Speed_I_lntegral:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  417 float Speed_Control = 0,Speed_Control_Last = 0;
Speed_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  418 float Speed_Control_Output = 0;
Speed_Control_Output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  419 float Speed_Control_Cha = 0;
Speed_Control_Cha:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  420 int   speed_control_period = 0;
speed_control_period:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  421 signed int podao_spd=164,podao_spd2=100;
podao_spd:
        DATA
        DC32 164

        SECTION `.data`:DATA:REORDER:NOROOT(2)
podao_spd2:
        DATA
        DC32 100

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  422 signed int podao_pulse_L=0, podao_pulse_R =0;
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
//  423 
//  424 
// 
//   261 bytes in section .bss
//    61 bytes in section .data
// 1 188 bytes in section .text
// 
// 1 188 bytes of CODE memory
//   322 bytes of DATA memory
//
//Errors: none
//Warnings: none
