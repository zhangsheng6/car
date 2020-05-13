///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:07
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\system\system_SKEAZ1284.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\system\system_SKEAZ1284.c -D
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\system_SKEAZ1284.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC Start
        PUBLIC disable_wdog

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\system\system_SKEAZ1284.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		system
//   11  * @company	   		成都逐飞科技有限公司
//   12  * @author     		逐飞科技(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 #include <stdint.h>
//   21 #include "SKEAZ1284.h"
//   22 #include "system_SKEAZ1284.h"
//   23 #include "common.h"
//   24 
//   25 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void disable_wdog(void)
//   27 {
//   28     /* WDOG->TOVAL: TOVAL=0xE803 */
//   29     WDOG->TOVAL = WDOG_TOVAL_TOVAL(0xE803); /* Timeout value */
disable_wdog:
        LDR      R0,??DataTable1  ;; 0xe803
        LDR      R1,??DataTable1_1  ;; 0x40052004
        STRH     R0,[R1, #+0]
//   30     /* WDOG->CS2: WIN=0,FLG=0,??=0,PRES=0,??=0,??=0,CLK=1 */
//   31     WDOG->CS2 = WDOG_CS2_CLK(0x01);       /* 1-kHz clock source */
        MOVS     R0,#+1
        LDR      R1,??DataTable1_2  ;; 0x40052001
        STRB     R0,[R1, #+0]
//   32     /* WDOG->CS1: EN=0,INT=0,UPDATE=1,TST=0,DBG=0,WAIT=1,STOP=1 */
//   33     WDOG->CS1 = WDOG_CS1_UPDATE_MASK |
//   34                 WDOG_CS1_TST(0x00) |
//   35                 WDOG_CS1_WAIT_MASK |
//   36                 WDOG_CS1_STOP_MASK;
        MOVS     R0,#+35
        LDR      R1,??DataTable1_3  ;; 0x40052000
        STRB     R0,[R1, #+0]
//   37 }
        BX       LR               ;; return
//   38 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   39 void Start (void)
//   40 {
Start:
        PUSH     {R7,LR}
//   41     disable_wdog();
        BL       disable_wdog
//   42 
//   43     if(2 == KEA128_CLOCK)
//   44     {
//   45         SIM->CLKDIV = SIM_CLKDIV_OUTDIV1(0x00) | SIM_CLKDIV_OUTDIV2_MASK; //设置预分频系数
//   46 
//   47         ICS->C2 = ICS_C2_BDIV(0x00) | ICS_C2_LP_MASK;
//   48         ICS->C1 = ICS_C1_CLKS(0x00) | ICS_C1_IREFS_MASK | ICS_C1_IRCLKEN_MASK | ICS_C1_IREFSTEN_MASK;
//   49         while((ICS->S & ICS_S_IREFST_MASK) == 0x00U) {};    //等待内部时钟被选择为基准时钟
//   50         while((ICS->S & ICS_S_LOCK_MASK) == 0x00U){};       //等待FLL锁定
//   51         while((ICS->S & 0x0CU) != 0x00U) {};                //等待选择FLL输出
//   52     }
//   53     else
//   54     {
//   55         SIM->CLKDIV = SIM_CLKDIV_OUTDIV1(0x00) | SIM_CLKDIV_OUTDIV2_MASK; //设置预分频系数
        MOVS     R0,#+128
        LSLS     R0,R0,#+17       ;; #+16777216
        LDR      R1,??DataTable1_4  ;; 0x40048024
        STR      R0,[R1, #+0]
//   56         //切换到PEE模式
//   57         ICS->C2 = ICS_C2_BDIV(0x00) | ICS_C2_LP_MASK;
        MOVS     R0,#+16
        LDR      R1,??DataTable1_5  ;; 0x40064001
        STRB     R0,[R1, #+0]
//   58         OSC->CR = OSC_CR_OSCEN_MASK | OSC_CR_OSCOS_MASK | OSC_CR_RANGE_MASK | OSC_CR_HGO_MASK;
        MOVS     R0,#+150
        LDR      R1,??DataTable1_6  ;; 0x40065000
        STRB     R0,[R1, #+0]
//   59         ICS->C1 = ICS_C1_CLKS(0x00) | ICS_C1_RDIV(0x04-KEA128_CLOCK) | ICS_C1_IRCLKEN_MASK;
        MOVS     R0,#+26
        LDR      R1,??DataTable1_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   60         while((ICS->S & ICS_S_IREFST_MASK) != 0x00U) {};    //等待外部时钟被选择为基准时钟
??Start_0:
        LDR      R0,??DataTable1_8  ;; 0x40064004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI      ??Start_0
//   61         while((ICS->S & ICS_S_LOCK_MASK) == 0x00U){};       //等待FLL锁定
??Start_1:
        LDR      R0,??DataTable1_8  ;; 0x40064004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL      ??Start_1
//   62         while((ICS->S & 0x0CU) != 0x00U) {};                //等待选择FLL输出
??Start_2:
        LDR      R0,??DataTable1_8  ;; 0x40064004
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+12
        TST      R0,R1
        BNE      ??Start_2
//   63     }
//   64     //SIM->SOPT0 |= SIM_SOPT0_CLKOE_MASK;                 //H2输出总线时钟
//   65 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xe803

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x40052004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40052001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40048024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x40064004

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   66 
// 
// 116 bytes in section .text
// 
// 116 bytes of CODE memory
//
//Errors: none
//Warnings: none
