///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:05
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Motor_Control.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Motor_Control.c -D
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\Motor_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_Out
        EXTERN FTM_PwmDuty
        EXTERN GpioSet
        EXTERN Speed_Control_Output
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fsub
        EXTERN __aeabi_ui2f
        EXTERN car_angle

        PUBLIC DEAD_L
        PUBLIC DEAD_R
        PUBLIC Motor_Max
        PUBLIC Motor_Out_L
        PUBLIC Motor_Out_R
        PUBLIC Motor_control

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Motor_Control.c
//    1 #include "Motor_Control.h"
//    2 
//    3 //电机

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 9000;
Motor_Out_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Max:
        DATA
        DC32 460CA000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 unsigned int DEAD_L = 1700; //2120
DEAD_L:
        DATA
        DC32 1700

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 unsigned int DEAD_R = 2000;  //2120
DEAD_R:
        DATA
        DC32 2000
//    7 extern  float Speed_Control_Output_L,Speed_Control_Output_R;
//    8 /**
//    9   * 简介
//   10   *     电机控制程序
//   11   * 备注
//   12   *
//   13   */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   14 void Motor_control(void)
//   15 {
Motor_control:
        PUSH     {R7,LR}
//   16 
//   17 //    Motor_Out_L = Angle_Out - Direction_Control_Output ;//+ Speed_Control_Output ;
//   18 //    Motor_Out_R = Angle_Out + Direction_Control_Output ;//+ Speed_Control_Output ;  
//   19  
//   20 //    Motor_Out_L = Angle_Out  + Speed_Control_Output_L ;
//   21 //    Motor_Out_R = Angle_Out  + Speed_Control_Output_R ;  
//   22     Motor_Out_L = Angle_Out  + Speed_Control_Output;
        LDR      R0,??Motor_control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   23     Motor_Out_R = Angle_Out  + Speed_Control_Output ; 
        LDR      R0,??Motor_control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   24     
//   25 //            Motor_Out_L = Angle_Out  ;
//   26 //    Motor_Out_R = Angle_Out   ; 
//   27           
//   28     /* 电机启动PWM控制 ------------------------------------------------------- */
//   29     //左电机控制
//   30     if (Motor_Out_L > 0)
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_1
//   31     {
//   32         Motor_Out_L += DEAD_L; //加上启动基数
        LDR      R0,??Motor_control_0+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??Motor_control_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   33         if (Motor_Out_L > Motor_Max)
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_2
//   34             Motor_Out_L = Motor_Max;
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
        B        ??Motor_control_2
//   35     }
//   36     else if (Motor_Out_L < 0)
??Motor_control_1:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_2
//   37     {
//   38         Motor_Out_L -= DEAD_L;
        LDR      R0,??Motor_control_0+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   39         if (Motor_Out_L < -Motor_Max)
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x14
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_2
//   40             Motor_Out_L = -Motor_Max;
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   41     }
//   42 
//   43     //右电机控制
//   44     if (Motor_Out_R > 0)
??Motor_control_2:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_3
//   45     {
//   46         Motor_Out_R += DEAD_R;
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??Motor_control_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   47         if (Motor_Out_R > Motor_Max)
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_4
//   48             Motor_Out_R = Motor_Max;
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
        B        ??Motor_control_4
//   49     }
//   50     else if (Motor_Out_R < 0)
??Motor_control_3:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_4
//   51     {
//   52         Motor_Out_R -= DEAD_R;
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   53         if (Motor_Out_R < -Motor_Max)
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x14
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_4
//   54             Motor_Out_R = -Motor_Max;
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   55     }
//   56     /* 电机启动PWM控制 -------- END ------------------------------------------ */
//   57 
//   58 
//   59         /* 电机正反转控制 -------------------------------------------- */
//   60         //左正反转控制
//   61         if (Motor_Out_L > 0)
??Motor_control_4:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_5
//   62         {
//   63             forward_L;//正转
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       GpioSet
        B        ??Motor_control_6
//   64         }
//   65         else
//   66         {
//   67             Motor_Out_L = -Motor_Out_L;
??Motor_control_5:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   68             reversal_L;//反转
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//   69         }
//   70 
//   71         //右正反转控制
//   72         if (Motor_Out_R > 0)
??Motor_control_6:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_7
//   73         {
//   74             forward_R;
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+26
        BL       GpioSet
        B        ??Motor_control_8
//   75         }
//   76         else
//   77         {
//   78             Motor_Out_R = -Motor_Out_R;
??Motor_control_7:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   79             reversal_R;
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//   80         }
//   81         /* 电机正反转控制 -------- END ------------------------------- */
//   82 
//   83         if(car_angle>=80)
??Motor_control_8:
        LDR      R0,??Motor_control_0+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x20  ;; 0x42a00000
        BL       __aeabi_cfrcmple
        BHI      ??Motor_control_9
//   84         {
//   85         change_L((uint32)Motor_Out_L);
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   86         change_R((uint32)Motor_Out_R);
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
        B        ??Motor_control_10
//   87         }
//   88         else
//   89         {
//   90         change_L(0);
??Motor_control_9:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   91         change_R(0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   92         }
//   93 }
??Motor_control_10:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??Motor_control_0:
        DC32     Angle_Out
        DC32     Speed_Control_Output
        DC32     Motor_Out_L
        DC32     Motor_Out_R
        DC32     DEAD_L
        DC32     Motor_Max
        DC32     DEAD_R
        DC32     car_angle
        DC32     0x42a00000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   8 bytes in section .bss
//  12 bytes in section .data
// 512 bytes in section .text
// 
// 512 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
