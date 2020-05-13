///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:00
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Direction_Control.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Direction_Control.c
//        -D IAR -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\Direction_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Chazhi
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN gyro_y_valu
        EXTERN speed_car

        PUBLIC D_Direction
        PUBLIC Direction_Control_Output
        PUBLIC Direction_Control_Period
        PUBLIC Direction_Controler
        PUBLIC Direction_angle
        PUBLIC Direction_flag
        PUBLIC K
        PUBLIC P_Dir_agl
        PUBLIC P_Direction
        PUBLIC P_Direction_change
        PUBLIC P_Direction_high
        PUBLIC P_Direction_low
        PUBLIC Road_Err_D
        PUBLIC gyr_offset_y
        PUBLIC turn_spd

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Direction_Control.c
//    1 #include "Direction_Control.h"
//    2 #include "Variable.h"
//    3 //---------------------------------方向控制-------------------------------------
//    4 
//    5 //----------------------------陀螺仪--------------------------------------------

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float gyr_offset_y =-4.000;//陀螺仪x,y轴偏移量
gyr_offset_y:
        DATA
        DC32 0C0800000H
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 float Direction_Control_Output = 0.0;
Direction_Control_Output:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    9 uint8 Direction_Control_Period = 0;
Direction_Control_Period:
        DS8 1
//   10 //#define DIRECTION_CONTROL_PERIOD 50

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 char Direction_flag = 0;
Direction_flag:
        DS8 1
//   12 
//   13 //float P_Direction1=40,D_Direction1=20.5;		//低速
//   14 //float P_Direction2=40,D_Direction2=20.5;		//中速
//   15 //float P_Direction3=173,D_Direction3=145.5;		//快速
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 float P_Direction = 0,D_Direction = 20.5;
P_Direction:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float turn_spd = 0.5;
turn_spd:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 float P_Direction_high = 74, P_Direction_low = 70;
P_Direction_high:
        DATA
        DC32 42940000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Direction_low:
        DATA
        DC32 428C0000H
//   20 //float P_Direction_temp = 140;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 float K = 0.85;
K:
        DATA
        DC32 3F59999AH
//   22 //float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float Direction_angle=0.0;
Direction_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 float P_Dir_agl =55;
P_Dir_agl:
        DATA
        DC32 425C0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   25 double Road_Err_D=0;	          //偏差的微分
Road_Err_D:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 float P_Direction_change;
P_Direction_change:
        DS8 4
//   27 
//   28 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   29 void Direction_Controler(void)
//   30 {
Direction_Controler:
        PUSH     {R3-R7,LR}
//   31   float road_err_D_Tmp;
//   32   static float Chazhi_last;
//   33  
//   34   road_err_D_Tmp =Chazhi_last -  Chazhi;
        LDR      R0,??Direction_Controler_0+0x40
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_Controler_0+0x3C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
//   35   Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Direction_Controler_0+0x4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR      R2,??Direction_Controler_0+0x30
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??Direction_Controler_0+0x4
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        LDR      R2,??Direction_Controler_0+0x30
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//   36   
//   37 //  if(Direction_angle <= 0) Direction_angle = -Direction_angle;
//   38 //  P_Direction = 110 + speed_car*15 + Direction_angle*0.5;
//   39   
//   40   if( speed_car>turn_spd )     P_Direction = P_Direction_high;
        LDR      R0,??Direction_Controler_0+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_Controler_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_1
        LDR      R0,??Direction_Controler_0+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_Controler_0+0x14
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_2
//   41   else                         P_Direction = P_Direction_low;
??Direction_Controler_1:
        LDR      R0,??Direction_Controler_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_Controler_0+0x14
        STR      R0,[R1, #+0]
//   42   
//   43 //  P_Direction = P_Direction_temp;
//   44   Direction_angle = (gyro_y_valu - gyr_offset_y) * gyr_ratio;		//转角
??Direction_Controler_2:
        LDR      R0,??Direction_Controler_0+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??Direction_Controler_0+0x20
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??Direction_Controler_0+0x24
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??Direction_Controler_0+0x34
        STR      R0,[R1, #+0]
//   45   Direction_Control_Output=( -P_Direction * Chazhi)  + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
        LDR      R0,??Direction_Controler_0+0x14
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R1,R1,R0
        LDR      R0,??Direction_Controler_0+0x3C
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Direction_Controler_0+0x2C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR      R2,??Direction_Controler_0+0x30
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Direction_Controler_0+0x34
        LDR      R1,[R0, #+0]
        LDR      R0,??Direction_Controler_0+0x38
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??Direction_Controler_0
        STR      R0,[R1, #+0]
//   46   Chazhi_last = Chazhi;
        LDR      R0,??Direction_Controler_0+0x3C
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_Controler_0+0x40
        STR      R0,[R1, #+0]
//   47   if(Direction_flag == 0) Direction_Control_Output = 0;
        LDR      R0,??Direction_Controler_0+0x44
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Direction_Controler_3
        MOVS     R0,#+0
        LDR      R1,??Direction_Controler_0
        STR      R0,[R1, #+0]
//   48 //  uart_sendware_float(P_Direction,Chazhi,speed_car,0);
//   49 }
??Direction_Controler_3:
        POP      {R0,R4-R7,PC}    ;; return
        Nop      
        DATA
??Direction_Controler_0:
        DC32     Direction_Control_Output
        DC32     K
        DC32     turn_spd
        DC32     speed_car
        DC32     P_Direction_high
        DC32     P_Direction
        DC32     P_Direction_low
        DC32     gyro_y_valu
        DC32     gyr_offset_y
        DC32     0xB22D0E56,0xBFA7EF9D
        DC32     D_Direction
        DC32     Road_Err_D
        DC32     Direction_angle
        DC32     P_Dir_agl
        DC32     Chazhi
        DC32     ??Chazhi_last
        DC32     Direction_flag

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Chazhi_last:
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
//   50 
//   51 
//   52 //void Direction_Controler(void)
//   53 //{
//   54 //    double road_err_D_Tmp = 0.0;	//偏差微分中间变量
//   55 //    float  Chazhi_last;
//   56 //    
//   57 //    //一阶滤波
//   58 //    road_err_D_Tmp =Chazhi - Chazh
//   59 //    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//   60 //
//   61 //    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//   62 //    else                         P_Direction = P_Direction_low;
//   63 //
//   64 ////    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//   65 //    Direction_Control_Output = P_Direction * Chazhi+ D_Direction*Road_Err_D ;//+ Direction_angle*P_Dir_agl;
//   66 //    
//   67 //    Chazhi_last = Chazhi;
//   68 //    
//   69 //    
//   70 ////#if 0
//   71 ////    //周期性控制方向
//   72 ////    Direction_Control_Period++;
//   73 ////    //---------------------------------------------------------------------------------------------------------------------
//   74 ////    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
//   75 ////    {
//   76 ////        Direction_Control_Period = 0;
//   77 ////        Direction_Control_Last = Direction_Control;
//   78 ////        //一阶滤波
//   79 ////        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
//   80 ////        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//   81 ////
//   82 ////        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//   83 ////
//   84 ////        Direction_Control = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//   85 ////        Direction_Control_Err = Direction_Control - Direction_Control_Last;
//   86 ////    }
//   87 ////    //---------------------------------------------------------------------------------------------------------------------
//   88 ////
//   89 ////    Direction_Control_Output = Direction_Control_Last + Direction_Control_Err*(Direction_Control_Period+1)/DIRECTION_CONTROL_PERIOD ;
//   90 ////#endif
//   91 //}
//   92 
// 
//  30 bytes in section .bss
//  28 bytes in section .data
// 324 bytes in section .text
// 
// 324 bytes of CODE memory
//  58 bytes of DATA memory
//
//Errors: none
//Warnings: none
