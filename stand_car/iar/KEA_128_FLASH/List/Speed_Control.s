///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:06
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Speed_Control.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Speed_Control.c -D
//        IAR -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -lB
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -o
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\device\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\user\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\system\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\lib\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\Speed_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FTM_CountClean
        EXTERN FTM_SpeedGet
        EXTERN GpioGet
        EXTERN RUN_flag
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN speed_control_period

        PUBLIC E_speed
        PUBLIC E_speed_L
        PUBLIC E_speed_R
        PUBLIC Get_CarSpeed
        PUBLIC I_Speed
        PUBLIC P_Speed
        PUBLIC Pulse_L
        PUBLIC Pulse_R
        PUBLIC Set_Speed
        PUBLIC SpeedFilterRatio
        PUBLIC Speed_Control
        PUBLIC Speed_Control_Cha
        PUBLIC Speed_Control_Cha_L
        PUBLIC Speed_Control_Cha_R
        PUBLIC Speed_Control_L
        PUBLIC Speed_Control_Last
        PUBLIC Speed_Control_Last_L
        PUBLIC Speed_Control_Last_R
        PUBLIC Speed_Control_Max
        PUBLIC Speed_Control_Output
        PUBLIC Speed_Control_Output_L
        PUBLIC Speed_Control_Output_R
        PUBLIC Speed_Control_R
        PUBLIC Speed_Controler
        PUBLIC Speed_Controler_Output
        PUBLIC Speed_I_lntegral
        PUBLIC Speed_I_lntegral_L
        PUBLIC Speed_I_lntegral_Max
        PUBLIC Speed_I_lntegral_R
        PUBLIC Speed_temp
        PUBLIC speed_L
        PUBLIC speed_R
        PUBLIC speed_car
        PUBLIC speed_measure
        PUBLIC speed_set

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Speed_Control.c
//    1 #include "Speed_Control.h"
//    2 
//    3 //---------------------------------速度控制-------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 float speed_measure = 0,speed_L = 0,speed_R = 0,Set_Speed = 3.0,speed_car = 0;
speed_measure:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Set_Speed:
        DATA
        DC32 40400000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_car:
        DS8 4
//    5 //float carSpeedTemp = 0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 signed int Pulse_L=0,Pulse_R=0;
Pulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Pulse_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    7 float P_Speed = 15.0,I_Speed = 1;
P_Speed:
        DATA
        DC32 41700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
I_Speed:
        DATA
        DC32 3F800000H
//    8 //4,0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float E_speed = 0.0;
E_speed:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   10 float Speed_I_lntegral = 7000;
Speed_I_lntegral:
        DATA
        DC32 45DAC000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   11 float Speed_I_lntegral_Max = 15;
Speed_I_lntegral_Max:
        DATA
        DC32 41700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float Speed_Control = 0,Speed_Control_Last = 0;
Speed_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float Speed_Control_Max= 15;
Speed_Control_Max:
        DATA
        DC32 41700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 float Speed_Control_Output = 0;
Speed_Control_Output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float Speed_Control_Cha = 0;
Speed_Control_Cha:
        DS8 4
//   16 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 float SpeedFilterRatio = 0.85;
SpeedFilterRatio:
        DATA
        DC32 3F59999AH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float speed_set = 0;
speed_set:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float Speed_temp = 0;
Speed_temp:
        DS8 4
//   20 
//   21 ////分段加速
//   22 //int16 spd_move = 1000,speed_add = 580,speed_start = 540;
//   23 //float P_Speed_add = 28,P_Speed_start = 28;
//   24 //char speed_end = 0,speed_num = 0,car_start = 0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 float E_speed_L,E_speed_R,
E_speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
E_speed_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26     Speed_I_lntegral_L,Speed_I_lntegral_R,
Speed_I_lntegral_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_lntegral_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27         Speed_Control_Last_L,Speed_Control_Last_R,
Speed_Control_Last_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Last_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28     Speed_Control_L,Speed_Control_R,
Speed_Control_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29       Speed_Control_Cha_L,Speed_Control_Cha_R,
Speed_Control_Cha_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Cha_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30         Speed_Control_Output_L,Speed_Control_Output_R;
Speed_Control_Output_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Control_Output_R:
        DS8 4
//   31 /**
//   32   * 简介
//   33   *     分时复用两路测速
//   34   * 注意
//   35   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void Get_CarSpeed(void)
//   37 {
Get_CarSpeed:
        PUSH     {R7,LR}
//   38     static uint8 LR_Flag = 0;
//   39 
//   40     LR_Flag = !LR_Flag;//分时复用测两路
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Get_CarSpeed_0
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??Get_CarSpeed_1
??Get_CarSpeed_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//   41 
//   42     //开通道
//   43     if (LR_Flag)
??Get_CarSpeed_1:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Get_CarSpeed_2
//   44     {
//   45         speed_measure = FTM_SpeedGet(FTM_SPEED_L);//在开始右通道计数前，将左通道数读出
        MOVS     R0,#+0
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//   46 //        speed_L += speed_measure;
//   47 
//   48         speed_L += (speed_measure * (SPEED_DIR_L?-1:1));//正转
        MOVS     R0,#+35
        BL       GpioGet
        CMP      R0,#+0
        BEQ      ??Get_CarSpeed_3
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??Get_CarSpeed_4
??Get_CarSpeed_3:
        MOVS     R0,#+1
??Get_CarSpeed_4:
        BL       __aeabi_i2f
        LDR      R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   49  //       Pulse_L += (speed_measure * (direction_L?0:1));		//只计正转脉冲
//   50         Choose_R;//清零计数
        MOVS     R0,#+1
        BL       FTM_CountClean
        B        ??Get_CarSpeed_5
//   51     }
//   52     else
//   53     {
//   54         speed_measure = FTM_SpeedGet(FTM_SPEED_R);
??Get_CarSpeed_2:
        MOVS     R0,#+1
        BL       FTM_SpeedGet
        BL       __aeabi_ui2f
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//   55  //       speed_R += speed_measure;//不检测方向
//   56 
//   57         speed_R += (speed_measure * (SPEED_DIR_R?-1:1));
        MOVS     R0,#+33
        BL       GpioGet
        CMP      R0,#+0
        BNE      ??Get_CarSpeed_6
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        B        ??Get_CarSpeed_7
??Get_CarSpeed_6:
        MOVS     R0,#+1
??Get_CarSpeed_7:
        BL       __aeabi_i2f
        LDR      R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//   58   //      Pulse_R += (speed_measure * (direction_R?0:1));
//   59 
//   60         Choose_L;//清零计数
        MOVS     R0,#+0
        BL       FTM_CountClean
//   61     }
//   62 }
??Get_CarSpeed_5:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     ??LR_Flag

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??LR_Flag:
        DS8 1
//   63 
//   64 /**
//   65   * 简介
//   66   *     速度控制
//   67   * 注意
//   68   *     转换进制：脉冲数量 / (s转换 * 编码盘)
//   69   *     1r大约0.19m
//   70   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 void Speed_Controler(void)
//   72 { 
Speed_Controler:
        PUSH     {R7,LR}
//   73 //    speed_car = (speed_R speed_L) / (550);  //参数可调
//   74     speed_car = (speed_R+speed_L) / (2);  //参数可调
        LDR      R0,??DataTable2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//   75         speed_R = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//   76     speed_L = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   77     
//   78 //    carSpeedTemp = 0.19*(speed_car*1000) / (50*OPTICAL_ENCODE_CONSTANT);//转换进制,m/s
//   79 //    UART_SendFloat(carSpeedTemp, 1);
//   80     if(RUN_flag == 1)Speed_temp = Set_Speed;
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Speed_Controler_0
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   81     
//   82     //速度滤波，防止因为速度变化过大而车身晃动
//   83     
//   84     Speed_temp=1;//ZS
??Speed_Controler_0:
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   85     
//   86    
//   87 //    speed_set = Speed_temp*(1-SpeedFilterRatio)+speed_set*SpeedFilterRatio;
//   88 //   
//   89 //   speed_set=0;
//   90 //    E_speed = speed_set - speed_car;
//   91     E_speed = speed_car - speed_set;
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_6
        STR      R0,[R1, #+0]
//   92     
//   93     E_speed_L = speed_L -speed_set ;
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_7
        STR      R0,[R1, #+0]
//   94     E_speed_R = speed_R -speed_set ;
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//   95     ///起步速度与行进速度不一样
//   96    
//   97 //    if(car_start == 1)
//   98 //    {
//   99 //    if(speed_car >= spd_move && speed_end == 0)
//  100 //    {
//  101 //      speed_num++;
//  102 //    }
//  103 //    if(speed_num >= 10)
//  104 //    {
//  105 //      speed_num = 0;
//  106 //      speed_end = 1;
//  107 //    }
//  108 //    if(speed_end == 1) {speed_set = speed_add;P_Speed = P_Speed_add;BUZZER_ON}
//  109 //    else              {speed_set = speed_start;P_Speed = P_Speed_start;}
//  110 //    }
//  111 //    else speed_set = 0;
//  112     
//  113     
//  114     Speed_I_lntegral_L += I_Speed*E_speed_L;
        LDR      R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  115     Speed_I_lntegral_R += I_Speed*E_speed_R;
        LDR      R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+0]
//  116     
//  117     Speed_I_lntegral += I_Speed*E_speed;
        LDR      R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//  118     
//  119     
//  120     if (Speed_I_lntegral < -Speed_I_lntegral_Max)
        LDR      R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_1
//  121         Speed_I_lntegral = -Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//  122     if (Speed_I_lntegral >  Speed_I_lntegral_Max)
??Speed_Controler_1:
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_2
//  123         Speed_I_lntegral =  Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//  124     
//  125     if (Speed_I_lntegral_L < -Speed_I_lntegral_Max)
??Speed_Controler_2:
        LDR      R0,??DataTable2_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_3
//  126         Speed_I_lntegral_L = -Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  127     if (Speed_I_lntegral_L >  Speed_I_lntegral_Max)
??Speed_Controler_3:
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_4
//  128         Speed_I_lntegral_L =  Speed_I_lntegral_Max;   
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  129     
//  130     if (Speed_I_lntegral_R < -Speed_I_lntegral_Max)
??Speed_Controler_4:
        LDR      R0,??DataTable2_11
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_13
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_5
//  131         Speed_I_lntegral_R = -Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+0]
//  132     if (Speed_I_lntegral_R >  Speed_I_lntegral_Max)
??Speed_Controler_5:
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Speed_Controler_6
//  133         Speed_I_lntegral_R =  Speed_I_lntegral_Max;   
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+0]
//  134     
//  135     
//  136     
//  137     
//  138 
//  139         
//  140         
//  141     Speed_Control_Last = Speed_Control;
??Speed_Controler_6:
        LDR      R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_15
        STR      R0,[R1, #+0]
//  142     
//  143     Speed_Control_Last_L = Speed_Control_L;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_17
        STR      R0,[R1, #+0]
//  144     Speed_Control_Last_R = Speed_Control_R;
        LDR      R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_19
        STR      R0,[R1, #+0]
//  145     
//  146     
//  147     Speed_Control = P_Speed*E_speed + Speed_I_lntegral;
        LDR      R0,??DataTable2_20
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_14
        STR      R0,[R1, #+0]
//  148     Speed_Control_L = P_Speed*E_speed_L + Speed_I_lntegral_L;
        LDR      R0,??DataTable2_20
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_16
        STR      R0,[R1, #+0]
//  149     Speed_Control_R = P_Speed*E_speed_R + Speed_I_lntegral_R;
        LDR      R0,??DataTable2_20
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  150 
//  151     Speed_Control_Cha = Speed_Control - Speed_Control_Last;
        LDR      R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_15
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_21
        STR      R0,[R1, #+0]
//  152     Speed_Control_Cha_L = Speed_Control_L - Speed_Control_Last_L;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_22
        STR      R0,[R1, #+0]
//  153     Speed_Control_Cha_R = Speed_Control_R - Speed_Control_Last_R;
        LDR      R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_23
        STR      R0,[R1, #+0]
//  154     
//  155 
//  156 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     speed_measure

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     speed_L
//  157 
//  158 /**
//  159   * 简介
//  160   *     速度输出平滑函数
//  161   * 说明
//  162   *     将速度调整分为20个周期，防止影响稳定性
//  163   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  164 void Speed_Controler_Output(void)
//  165 {
Speed_Controler_Output:
        PUSH     {R7,LR}
//  166   
//  167     Speed_Control_Output = Speed_Control_Cha * (speed_control_period+1)/SPEED_TIME_OUT
//  168                          + Speed_Control_Last; 
        LDR      R0,??DataTable2_24
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_21
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_25  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_15
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_26
        STR      R0,[R1, #+0]
//  169     
//  170 Speed_Control_Output_L = Speed_Control_Cha_L * (speed_control_period+1)/SPEED_TIME_OUT
//  171                          + Speed_Control_Last_L;
        LDR      R0,??DataTable2_24
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_25  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_27
        STR      R0,[R1, #+0]
//  172 Speed_Control_Output_R = Speed_Control_Cha_R * (speed_control_period+1)/SPEED_TIME_OUT
//  173                          + Speed_Control_Last_R; 
        LDR      R0,??DataTable2_24
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_25  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_28
        STR      R0,[R1, #+0]
//  174     
//  175     
//  176     
//  177 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     RUN_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     Set_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     Speed_temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     E_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     E_speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     E_speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     I_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Speed_I_lntegral_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     Speed_I_lntegral_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     Speed_I_lntegral

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     Speed_I_lntegral_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     Speed_Control

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     Speed_Control_Last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     Speed_Control_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     Speed_Control_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     Speed_Control_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     Speed_Control_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     P_Speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     Speed_Control_Cha

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     Speed_Control_Cha_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     Speed_Control_Cha_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     speed_control_period

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     Speed_Control_Output

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     Speed_Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     Speed_Control_Output_R

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  178 
//  179 
//  180 
//  181 
//  182 
//  183 
//  184 
// 
// 101 bytes in section .bss
//  28 bytes in section .data
// 896 bytes in section .text
// 
// 896 bytes of CODE memory
// 129 bytes of DATA memory
//
//Errors: none
//Warnings: none
