///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:22
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_irq.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_irq.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\KEA128_irq.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC irq_init

// H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_irq.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		KEA128_irq
//   11  * @company	   		成都逐飞科技有限公司
//   12  * @author     		逐飞科技(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 
//   21 
//   22 #include "KEA128_irq.h"
//   23 
//   24 
//   25 //-------------------------------------------------------------------------------------------------------------------
//   26 //  @brief      外部中断
//   27 //  @param      void            
//   28 //  @return     void
//   29 //  @since      v2.0
//   30 //  Sample usage:               irq_init();
//   31 //								set_irq_priority(IRQ_IRQn,1);					//设置优先级,根据自己的需求设置 可设置范围为 0 - 3
//   32 //								enable_irq(IRQ_IRQn);							//打开pit0的中断开关
//   33 //								EnableInterrupts;								//打开总的中断开关  
//   34 //  @note                       在KEA128_port_cfg文件切换引脚，irq同一时刻只能对一个引脚进行检测
//   35 //                              进入中断函数后务必使用CLEAR_IRQ_FLAG宏定义清除中断标志位
//   36 //-------------------------------------------------------------------------------------------------------------------
//   37 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   38 void irq_init(void)
//   39 {
//   40     uint8 ptn;
//   41     uint32 temp;
//   42 
//   43     if(A5 == IRQ_PIN)
//   44     {
//   45         temp = SIM->PINSEL;
//   46         temp &= ~((uint32)SIM_PINSEL_IRQPS_MASK);
//   47         SIM->PINSEL = temp | SIM_PINSEL_IRQPS(0);
//   48     }
//   49     else
//   50     {
//   51         ptn = PTn(IRQ_PIN);//获取引脚号
irq_init:
        MOVS     R2,#+5
        MOVS     R0,R2
//   52         
//   53         temp = SIM->PINSEL;
        LDR      R2,??irq_init_0  ;; 0x4004800c
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
//   54          temp &= ~((uint32)SIM_PINSEL_IRQPS_MASK);
        MOVS     R2,#+7
        BICS     R1,R1,R2
//   55          SIM->PINSEL = temp | SIM_PINSEL_IRQPS(ptn+1);
        UXTB     R0,R0
        MOVS     R2,R0
        ADDS     R2,R2,#+1
        LSLS     R2,R2,#+29       ;; ZeroExtS R2,R2,#+29,#+29
        LSRS     R2,R2,#+29
        ORRS     R2,R2,R1
        LDR      R3,??irq_init_0  ;; 0x4004800c
        STR      R2,[R3, #+0]
//   56     }
//   57     
//   58     SIM->SCGC |= SIM_SCGC_IRQ_MASK;     //开启IRQ时钟
        LDR      R2,??irq_init_0+0x4  ;; 0x40048014
        LDR      R2,[R2, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+20       ;; #+134217728
        ORRS     R3,R3,R2
        LDR      R2,??irq_init_0+0x4  ;; 0x40048014
        STR      R3,[R2, #+0]
//   59     temp = (0
//   60             //| IRQ_SC_IRQPDD_MASK      //1：禁用上拉电阻 0：使能上拉电阻  注释代表0
//   61             | IRQ_SC_IRQEDG_MASK        //1：上升沿或者高电平触发 0：下降沿或者低电平触发   注释代表0
//   62             | IRQ_SC_IRQPE_MASK         //使能IRQ
//   63             | IRQ_SC_IRQIE_MASK         //开启中断
//   64             //| IRQ_SC_IRQMOD_MASK      //1：检测边沿与电平触发  0：只检测边沿触发  注释代表0
//   65             );
        MOVS     R2,#+50
        MOVS     R1,R2
//   66     IRQ->SC = temp;
        MOVS     R2,R1
        LDR      R3,??irq_init_0+0x8  ;; 0x40031000
        STRB     R2,[R3, #+0]
//   67     
//   68 }
        BX       LR               ;; return
        DATA
??irq_init_0:
        DC32     0x4004800c
        DC32     0x40048014
        DC32     0x40031000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   69 
//   70 
//   71 
//   72 
//   73 
// 
// 68 bytes in section .text
// 
// 68 bytes of CODE memory
//
//Errors: none
//Warnings: none
