///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:21
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_gpio.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_gpio.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\KEA128_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC GpioGet
        PUBLIC GpioInit
        PUBLIC GpioSet
        PUBLIC GpioTurn
        PUBLIC gpio_ddr

// H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_gpio.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		KEA128_gpio
//   11  * @company	   		成都逐飞科技有限公司
//   12  * @author     		逐飞科技(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 #include "KEA128_gpio.h"
//   21 
//   22 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   23 static FGPIO_Type * const GPIOX[] = FGPIO_BASES;
GPIOX:
        DATA
        DC32 0F8000000H, 0F8000040H, 0F8000080H
//   24 
//   25 
//   26 //-------------------------------------------------------------------------------------------------------------------
//   27 //  @brief      gpio 初始化
//   28 //  @param      ptx_n           选择的引脚
//   29 //  @param      ddr             引脚方向    GPI：输入 GPO：输出
//   30 //  @param      dat             引脚输出数据（如果设置为输出）
//   31 //  @return     void
//   32 //  @since      v2.0
//   33 //  Sample usage:               gpio_init(A5,GPO,0);   //初始化A5为gpio模式，设置为输出模式，初始化输出低电平
//   34 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   35 void GpioInit(PTX_n ptx_n, GPIO_MOD ddr, uint8 dat)
//   36 {
GpioInit:
        PUSH     {R3-R6,LR}
//   37     vuint8 ptx,ptn;
//   38     uint32 temp;
//   39 
//   40     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R4,R0
        UXTB     R4,R4
        LSRS     R4,R4,#+5
        MOV      R5,SP
        STRB     R4,[R5, #+0]
//   41     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R4,R0,#+27       ;; ZeroExtS R4,R0,#+27,#+27
        LSRS     R4,R4,#+27
        MOV      R5,SP
        STRB     R4,[R5, #+1]
//   42 
//   43     if(dat) dat = 1; //修正dat的值;
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??GpioInit_0
        MOVS     R4,#+1
        MOVS     R2,R4
//   44 
//   45 
//   46     if(GPI == ddr)
??GpioInit_0:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??GpioInit_1
//   47     {
//   48         temp = GPIOX[ptx]->PIDR;
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LDR      R5,??DataTable4
        UXTB     R4,R4
        MOVS     R6,#+4
        MULS     R4,R6,R4
        LDR      R4,[R5, R4]
        LDR      R4,[R4, #+24]
        MOVS     R3,R4
//   49         temp &= ~((uint32)1<<ptn);
        MOVS     R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+1]
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
//   50         GPIOX[ptx]->PIDR = temp;    //取消输入禁用
        LDR      R4,??DataTable4
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        STR      R3,[R4, #+24]
//   51 
//   52         temp = GPIOX[ptx]->PDDR;
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LDR      R5,??DataTable4
        UXTB     R4,R4
        MOVS     R6,#+4
        MULS     R4,R6,R4
        LDR      R4,[R5, R4]
        LDR      R4,[R4, #+20]
        MOVS     R3,R4
//   53         temp &= ~((uint32)1<<ptn);
        MOVS     R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+1]
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
//   54         GPIOX[ptx]->PDDR = temp;    //设置为输入模式
        LDR      R4,??DataTable4
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        STR      R3,[R4, #+20]
        B        ??GpioInit_2
//   55     }
//   56     else
//   57     {
//   58         temp = GPIOX[ptx]->PIDR;
??GpioInit_1:
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LDR      R5,??DataTable4
        UXTB     R4,R4
        MOVS     R6,#+4
        MULS     R4,R6,R4
        LDR      R4,[R5, R4]
        LDR      R4,[R4, #+24]
        MOVS     R3,R4
//   59         temp |= ((uint32)1<<ptn);
        MOVS     R5,R3
        MOVS     R3,#+1
        MOV      R4,SP
        LDRB     R4,[R4, #+1]
        LSLS     R3,R3,R4
        ORRS     R3,R3,R5
//   60         GPIOX[ptx]->PIDR = temp;    //输入禁用
        LDR      R4,??DataTable4
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        STR      R3,[R4, #+24]
//   61 
//   62         temp = GPIOX[ptx]->PDDR;
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LDR      R5,??DataTable4
        UXTB     R4,R4
        MOVS     R6,#+4
        MULS     R4,R6,R4
        LDR      R4,[R5, R4]
        LDR      R4,[R4, #+20]
        MOVS     R3,R4
//   63         temp |= ((uint32)1<<ptn);
        MOVS     R5,R3
        MOVS     R3,#+1
        MOV      R4,SP
        LDRB     R4,[R4, #+1]
        LSLS     R3,R3,R4
        ORRS     R3,R3,R5
//   64         GPIOX[ptx]->PDDR = temp;    //设置为输出模式
        LDR      R4,??DataTable4
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        STR      R3,[R4, #+20]
//   65 
//   66         temp = GPIOX[ptx]->PDOR;
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LDR      R5,??DataTable4
        UXTB     R4,R4
        MOVS     R6,#+4
        MULS     R4,R6,R4
        LDR      R4,[R5, R4]
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
//   67         temp &= ~((uint32)1<<ptn);
        MOVS     R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+1]
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
//   68         temp |=  (uint32)dat<<ptn;
        MOVS     R5,R3
        UXTB     R2,R2
        MOV      R3,SP
        LDRB     R4,[R3, #+1]
        MOVS     R3,R2
        LSLS     R3,R3,R4
        ORRS     R3,R3,R5
//   69         GPIOX[ptx]->PDOR = temp;    //设置端口状态
        LDR      R4,??DataTable4
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LDR      R4,[R4, R5]
        STR      R3,[R4, #+0]
//   70     }
//   71 }
??GpioInit_2:
        POP      {R0,R4-R6,PC}    ;; return
//   72 
//   73 //-------------------------------------------------------------------------------------------------------------------
//   74 //  @brief      设置引脚方向
//   75 //  @param      ptx_n           选择的引脚
//   76 //  @param      ddr             引脚方向    GPI：输入 GPO：输出
//   77 //  @return     void
//   78 //  @since      v2.0
//   79 //  Sample usage:               gpio_ddr(A5,GPO);   //设置A5为输出模式
//   80 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 void gpio_ddr(PTX_n ptx_n, GPIO_MOD ddr)
//   82 {
gpio_ddr:
        PUSH     {R3-R5,LR}
//   83     vuint8 ptx,ptn;
//   84     uint32 temp;
//   85 
//   86     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R3,R0
        UXTB     R3,R3
        LSRS     R3,R3,#+5
        MOV      R4,SP
        STRB     R3,[R4, #+0]
//   87     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R3,R0,#+27       ;; ZeroExtS R3,R0,#+27,#+27
        LSRS     R3,R3,#+27
        MOV      R4,SP
        STRB     R3,[R4, #+1]
//   88 
//   89     if(GPI == ddr)
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??gpio_ddr_0
//   90     {
//   91         temp = GPIOX[ptx]->PIDR;
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        LDR      R4,??DataTable4
        UXTB     R3,R3
        MOVS     R5,#+4
        MULS     R3,R5,R3
        LDR      R3,[R4, R3]
        LDR      R3,[R3, #+24]
        MOVS     R2,R3
//   92         temp &= ~((uint32)1<<ptn);
        MOVS     R3,#+1
        MOV      R4,SP
        LDRB     R4,[R4, #+1]
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
//   93         GPIOX[ptx]->PIDR = temp;    //取消输入禁用
        LDR      R3,??DataTable4
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R3,[R3, R4]
        STR      R2,[R3, #+24]
//   94 
//   95         temp = GPIOX[ptx]->PDDR;
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        LDR      R4,??DataTable4
        UXTB     R3,R3
        MOVS     R5,#+4
        MULS     R3,R5,R3
        LDR      R3,[R4, R3]
        LDR      R3,[R3, #+20]
        MOVS     R2,R3
//   96         temp &= ~((uint32)1<<ptn);
        MOVS     R3,#+1
        MOV      R4,SP
        LDRB     R4,[R4, #+1]
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
//   97         GPIOX[ptx]->PDDR = temp;    //设置为输入模式
        LDR      R3,??DataTable4
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R3,[R3, R4]
        STR      R2,[R3, #+20]
        B        ??gpio_ddr_1
//   98     }
//   99     else
//  100     {
//  101         temp = GPIOX[ptx]->PIDR;
??gpio_ddr_0:
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        LDR      R4,??DataTable4
        UXTB     R3,R3
        MOVS     R5,#+4
        MULS     R3,R5,R3
        LDR      R3,[R4, R3]
        LDR      R3,[R3, #+24]
        MOVS     R2,R3
//  102         temp |= ((uint32)1<<ptn);
        MOVS     R4,R2
        MOVS     R2,#+1
        MOV      R3,SP
        LDRB     R3,[R3, #+1]
        LSLS     R2,R2,R3
        ORRS     R2,R2,R4
//  103         GPIOX[ptx]->PIDR = temp;    //输入禁用
        LDR      R3,??DataTable4
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R3,[R3, R4]
        STR      R2,[R3, #+24]
//  104 
//  105         temp = GPIOX[ptx]->PDDR;
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        LDR      R4,??DataTable4
        UXTB     R3,R3
        MOVS     R5,#+4
        MULS     R3,R5,R3
        LDR      R3,[R4, R3]
        LDR      R3,[R3, #+20]
        MOVS     R2,R3
//  106         temp |= ((uint32)1<<ptn);
        MOVS     R4,R2
        MOVS     R2,#+1
        MOV      R3,SP
        LDRB     R3,[R3, #+1]
        LSLS     R2,R2,R3
        ORRS     R2,R2,R4
//  107         GPIOX[ptx]->PDDR = temp;    //设置为输出模式
        LDR      R3,??DataTable4
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R3,[R3, R4]
        STR      R2,[R3, #+20]
//  108     }
//  109 }
??gpio_ddr_1:
        POP      {R0,R4,R5,PC}    ;; return
//  110 
//  111 //-------------------------------------------------------------------------------------------------------------------
//  112 //  @brief      读取引脚状态
//  113 //  @param      ptx_n           选择的引脚
//  114 //  @return     管脚的状态      1为高电平，0为低电平
//  115 //  @since      v2.0
//  116 //  Sample usage:               uint8 status = gpio_get(A5);   //读取A5为状态
//  117 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  118 uint8 GpioGet(PTX_n ptx_n)
//  119 {
GpioGet:
        PUSH     {R3,R4}
        MOVS     R1,R0
//  120     vuint8 ptx,ptn;
//  121     uint32 temp;
//  122 
//  123     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R0,R1
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        MOV      R3,SP
        STRB     R0,[R3, #+1]
//  124     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R1,#+27       ;; ZeroExtS R0,R1,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R3,SP
        STRB     R0,[R3, #+0]
//  125 
//  126     //设置端口状态
//  127     temp = GPIOX[ptx]->PDIR;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R3,??DataTable4
        UXTB     R0,R0
        MOVS     R4,#+4
        MULS     R0,R4,R0
        LDR      R0,[R3, R0]
        LDR      R0,[R0, #+16]
        MOVS     R2,R0
//  128     return ( (temp >> ptn) & 0x1 );
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSRS     R2,R2,R0
        MOVS     R0,R2
        LSLS     R0,R0,#+31       ;; ZeroExtS R0,R0,#+31,#+31
        LSRS     R0,R0,#+31
        POP      {R1,R4}
        BX       LR               ;; return
//  129 }
//  130 
//  131 //-------------------------------------------------------------------------------------------------------------------
//  132 //  @brief      设置引脚状态
//  133 //  @param      ptx_n           选择的引脚
//  134 //  @param      dat             1为高电平，0为低电平
//  135 //  @return     void
//  136 //  @since      v2.0
//  137 //  Sample usage:               gpio_set(A5,0);   //设置A5为低电平
//  138 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 void GpioSet(PTX_n ptx_n, uint8 dat)
//  140 {
GpioSet:
        PUSH     {R3-R5,LR}
//  141     vuint8 ptx,ptn;
//  142     uint32 temp;
//  143 
//  144     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R3,R0
        UXTB     R3,R3
        LSRS     R3,R3,#+5
        MOV      R4,SP
        STRB     R3,[R4, #+1]
//  145     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R3,R0,#+27       ;; ZeroExtS R3,R0,#+27,#+27
        LSRS     R3,R3,#+27
        MOV      R4,SP
        STRB     R3,[R4, #+0]
//  146 
//  147     if(dat) dat = 1; //修正dat的值;
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??GpioSet_0
        MOVS     R3,#+1
        MOVS     R1,R3
//  148     //设置端口状态
//  149     temp = GPIOX[ptx]->PDOR;
??GpioSet_0:
        MOV      R3,SP
        LDRB     R3,[R3, #+1]
        LDR      R4,??DataTable4
        UXTB     R3,R3
        MOVS     R5,#+4
        MULS     R3,R5,R3
        LDR      R3,[R4, R3]
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
//  150     temp &= ~((uint32)1<<ptn);
        MOVS     R3,#+1
        MOV      R4,SP
        LDRB     R4,[R4, #+0]
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
//  151     temp |=  (uint32)dat<<ptn;
        MOVS     R4,R2
        UXTB     R1,R1
        MOV      R2,SP
        LDRB     R3,[R2, #+0]
        MOVS     R2,R1
        LSLS     R2,R2,R3
        ORRS     R2,R2,R4
//  152     GPIOX[ptx]->PDOR = temp;
        LDR      R3,??DataTable4
        MOV      R4,SP
        LDRB     R4,[R4, #+1]
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R3,[R3, R4]
        STR      R2,[R3, #+0]
//  153 }
        POP      {R0,R4,R5,PC}    ;; return
//  154 
//  155 //-------------------------------------------------------------------------------------------------------------------
//  156 //  @brief      翻转引脚状态
//  157 //  @param      ptx_n           选择的引脚
//  158 //  @return     void
//  159 //  @since      v2.0
//  160 //  Sample usage:               gpio_turn(A5);   //翻转A5
//  161 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  162 void GpioTurn(PTX_n ptx_n)
//  163 {
GpioTurn:
        PUSH     {R3,R4}
//  164     vuint8 ptx,ptn;
//  165     uint32 temp;
//  166 
//  167     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R2,R0
        UXTB     R2,R2
        LSRS     R2,R2,#+5
        MOV      R3,SP
        STRB     R2,[R3, #+0]
//  168     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R2,R0,#+27       ;; ZeroExtS R2,R0,#+27,#+27
        LSRS     R2,R2,#+27
        MOV      R3,SP
        STRB     R2,[R3, #+1]
//  169 
//  170     //设置端口状态
//  171     temp = GPIOX[ptx]->PTOR;
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        LDR      R3,??DataTable4
        UXTB     R2,R2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R2,[R3, R2]
        LDR      R2,[R2, #+12]
        MOVS     R1,R2
//  172     temp |= (uint32)(1<<ptn);
        MOVS     R3,R1
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        ORRS     R1,R1,R3
//  173     GPIOX[ptx]->PTOR = temp;
        LDR      R2,??DataTable4
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        STR      R1,[R2, #+12]
//  174 }
        POP      {R0,R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     GPIOX

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  175 
// 
//  12 bytes in section .rodata
// 686 bytes in section .text
// 
// 686 bytes of CODE  memory
//  12 bytes of CONST memory
//
//Errors: none
//Warnings: none
