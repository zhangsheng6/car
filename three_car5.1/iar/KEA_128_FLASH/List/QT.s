///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\QT.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\QT.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\QT.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioInit
        EXTERN GpioSet
        EXTERN OLED_MenuFlicker
        EXTERN PIT_DisableIrq
        EXTERN carStatus
        EXTERN menuSelect

        PUBLIC IoInit
        PUBLIC PlanSet
        PUBLIC c
        PUBLIC cars
        PUBLIC chice
        PUBLIC sure

// H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\QT.c
//    1 
//    2 #include "Variable.h"
//    3 #include "common.h"
//    4 #include "allHead.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8 chice = 0;    //按键使用
chice:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 c=0;
c:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 cars=0;
cars:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 sure=0;
sure:
        DS8 1
//    9 
//   10 
//   11 /**
//   12   * 简介
//   13   *     无对应模块的IO口初始化函数
//   14   * 注意
//   15   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   16 void IoInit()
//   17 {
IoInit:
        PUSH     {R7,LR}
//   18     //指示灯
//   19     GpioInit(LED_0, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+48
        BL       GpioInit
//   20     GpioInit(LED_1, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+49
        BL       GpioInit
//   21     GpioInit(LED_2, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+50
        BL       GpioInit
//   22     GpioInit(LED_3, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+51
        BL       GpioInit
//   23 
//   24     //蜂鸣器
//   25     GpioInit(BUZZER, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioInit
//   26 
//   27     //电机方向
//   28     GpioInit(ENL_L, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       GpioInit
//   29     GpioInit(ENL_R, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioInit
//   30     GpioInit(ENR_L, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioInit
//   31     GpioInit(ENR_R, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+26
        BL       GpioInit
//   32 
//   33     //测方向
//   34     GpioInit(DIR_L, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+35
        BL       GpioInit
//   35     GpioInit(DIR_R, GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+33
        BL       GpioInit
//   36 }
        POP      {R0,PC}          ;; return
//   37 
//   38 
//   39 /**
//   40   * 简介
//   41   *     小车状态设置
//   42   * 注意
//   43   */
//   44 
//   45 //void PlanSet(void)
//   46 //{
//   47 //    if(c==1)
//   48 //    {
//   49 //      c=0;
//   50 //      cars++;
//   51 //      sure=1;
//   52 //    }
//   53 //    
//   54 //    if(sure==1)
//   55 //    {
//   56 //      sure=0;
//   57 //      
//   58 //      if(cars/2==0)//车开
//   59 //      {
//   60 //         ENABLE_INTERRUPTS;  //开总中断
//   61 //         OLED_MenuFlicker();//速度控制改参数显示菜单
//   62 //         LED_3_TURN;
//   63 //      }
//   64 //    
//   65 //      if(cars/2==1)//车开
//   66 //      {
//   67 //        locking_L;
//   68 //        locking_R;
//   69 //        PIT_DisableIrq();//关 PIT 中断
//   70 //        OLED_MenuFlicker();//速度控制改参数显示菜单
//   71 //        menuSelect = LOGO;
//   72 //        OLED_MenuFlicker();
//   73 //      }
//   74 //    }
//   75 //    
//   76 //    
//   77 //
//   78 ////    
//   79 // }
//   80 //    
//   81     

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void PlanSet(void)
//   83 {
PlanSet:
        PUSH     {R7,LR}
//   84     switch (carStatus)
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PlanSet_0
        CMP      R0,#+1
        BEQ      ??PlanSet_1
        B        ??PlanSet_2
//   85     {
//   86     case NORMAL:
//   87         break;
??PlanSet_0:
        B        ??PlanSet_3
//   88 
//   89     case STOP:
//   90         locking_L;
??PlanSet_1:
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
//   91         locking_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
//   92 //        BUZZER_ON;
//   93         PIT_DisableIrq();//关 PIT 中断
        BL       PIT_DisableIrq
//   94 
//   95         menuSelect = LOGO;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_1
        STRB     R0,[R1, #+0]
//   96         OLED_MenuFlicker();
        BL       OLED_MenuFlicker
//   97         break;
        B        ??PlanSet_3
//   98 
//   99     default :
//  100         break;
//  101     }
//  102 }
??PlanSet_2:
??PlanSet_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     carStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     menuSelect

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
//   4 bytes in section .bss
// 190 bytes in section .text
// 
// 190 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
