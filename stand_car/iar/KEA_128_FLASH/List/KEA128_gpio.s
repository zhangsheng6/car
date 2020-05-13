///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:02
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\lib\C\KEA128_gpio.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\lib\C\KEA128_gpio.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\KEA128_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC GpioGet
        PUBLIC GpioInit
        PUBLIC GpioSet
        PUBLIC GpioTurn
        PUBLIC gpio_ddr

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\lib\C\KEA128_gpio.c
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
        PUSH     {R3,R4,LR}
//   37     vuint8 ptx,ptn;
//   38     uint32 temp;
//   39 
//   40     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R3,R0
        UXTB     R3,R3
        LSRS     R3,R3,#+5
        MOV      R4,SP
        STRB     R3,[R4, #+0]
//   41     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R3,SP
        STRB     R0,[R3, #+1]
//   42 
//   43     if(dat) dat = 1; //修正dat的值;
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??GpioInit_0
        MOVS     R2,#+1
//   44 
//   45 
//   46     if(GPI == ddr)
??GpioInit_0:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??GpioInit_1
//   47     {
//   48         temp = GPIOX[ptx]->PIDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+24]
//   49         temp &= ~((uint32)1<<ptn);
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
//   50         GPIOX[ptx]->PIDR = temp;    //取消输入禁用
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+24]
//   51 
//   52         temp = GPIOX[ptx]->PDDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+20]
//   53         temp &= ~((uint32)1<<ptn);
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
//   54         GPIOX[ptx]->PDDR = temp;    //设置为输入模式
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+20]
        B        ??GpioInit_2
//   55     }
//   56     else
//   57     {
//   58         temp = GPIOX[ptx]->PIDR;
??GpioInit_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+24]
//   59         temp |= ((uint32)1<<ptn);
        MOVS     R3,R0
        MOVS     R0,#+1
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R0,R0,R1
        ORRS     R0,R0,R3
//   60         GPIOX[ptx]->PIDR = temp;    //输入禁用
        LDR      R1,??DataTable4
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R1,[R1, R3]
        STR      R0,[R1, #+24]
//   61 
//   62         temp = GPIOX[ptx]->PDDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+20]
//   63         temp |= ((uint32)1<<ptn);
        MOVS     R3,R0
        MOVS     R0,#+1
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R0,R0,R1
        ORRS     R0,R0,R3
//   64         GPIOX[ptx]->PDDR = temp;    //设置为输出模式
        LDR      R1,??DataTable4
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R1,[R1, R3]
        STR      R0,[R1, #+20]
//   65 
//   66         temp = GPIOX[ptx]->PDOR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+0]
//   67         temp &= ~((uint32)1<<ptn);
        MOVS     R1,#+1
        MOV      R3,SP
        LDRB     R3,[R3, #+1]
        LSLS     R1,R1,R3
        BICS     R0,R0,R1
//   68         temp |=  (uint32)dat<<ptn;
        UXTB     R2,R2
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R2,R2,R1
        ORRS     R2,R2,R0
        MOVS     R0,R2
//   69         GPIOX[ptx]->PDOR = temp;    //设置端口状态
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+0]
//   70     }
//   71 }
??GpioInit_2:
        POP      {R0,R4,PC}       ;; return
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
        PUSH     {R7,LR}
//   83     vuint8 ptx,ptn;
//   84     uint32 temp;
//   85 
//   86     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R2,R0
        UXTB     R2,R2
        LSRS     R2,R2,#+5
        MOV      R3,SP
        STRB     R2,[R3, #+0]
//   87     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R2,SP
        STRB     R0,[R2, #+1]
//   88 
//   89     if(GPI == ddr)
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??gpio_ddr_0
//   90     {
//   91         temp = GPIOX[ptx]->PIDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+24]
//   92         temp &= ~((uint32)1<<ptn);
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
//   93         GPIOX[ptx]->PIDR = temp;    //取消输入禁用
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+24]
//   94 
//   95         temp = GPIOX[ptx]->PDDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+20]
//   96         temp &= ~((uint32)1<<ptn);
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
//   97         GPIOX[ptx]->PDDR = temp;    //设置为输入模式
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+20]
        B        ??gpio_ddr_1
//   98     }
//   99     else
//  100     {
//  101         temp = GPIOX[ptx]->PIDR;
??gpio_ddr_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+24]
//  102         temp |= ((uint32)1<<ptn);
        MOVS     R2,R0
        MOVS     R0,#+1
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R0,R0,R1
        ORRS     R0,R0,R2
//  103         GPIOX[ptx]->PIDR = temp;    //输入禁用
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+24]
//  104 
//  105         temp = GPIOX[ptx]->PDDR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+20]
//  106         temp |= ((uint32)1<<ptn);
        MOVS     R2,R0
        MOVS     R0,#+1
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R0,R0,R1
        ORRS     R0,R0,R2
//  107         GPIOX[ptx]->PDDR = temp;    //设置为输出模式
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+20]
//  108     }
//  109 }
??gpio_ddr_1:
        POP      {R0,PC}          ;; return
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
        SUB      SP,SP,#+4
//  120     vuint8 ptx,ptn;
//  121     uint32 temp;
//  122 
//  123     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R1,R0
        UXTB     R1,R1
        LSRS     R1,R1,#+5
        MOV      R2,SP
        STRB     R1,[R2, #+1]
//  124     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  125 
//  126     //设置端口状态
//  127     temp = GPIOX[ptx]->PDIR;
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R1,[R0, #+16]
//  128     return ( (temp >> ptn) & 0x1 );
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSRS     R1,R1,R0
        MOVS     R0,R1
        LSLS     R0,R0,#+31       ;; ZeroExtS R0,R0,#+31,#+31
        LSRS     R0,R0,#+31
        ADD      SP,SP,#+4
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
        PUSH     {R7,LR}
//  141     vuint8 ptx,ptn;
//  142     uint32 temp;
//  143 
//  144     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R2,R0
        UXTB     R2,R2
        LSRS     R2,R2,#+5
        MOV      R3,SP
        STRB     R2,[R3, #+1]
//  145     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R2,SP
        STRB     R0,[R2, #+0]
//  146 
//  147     if(dat) dat = 1; //修正dat的值;
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??GpioSet_0
        MOVS     R1,#+1
//  148     //设置端口状态
//  149     temp = GPIOX[ptx]->PDOR;
??GpioSet_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R2,??DataTable4
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R2, R0]
        LDR      R0,[R0, #+0]
//  150     temp &= ~((uint32)1<<ptn);
        MOVS     R2,#+1
        MOV      R3,SP
        LDRB     R3,[R3, #+0]
        LSLS     R2,R2,R3
        BICS     R0,R0,R2
//  151     temp |=  (uint32)dat<<ptn;
        UXTB     R1,R1
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        LSLS     R1,R1,R2
        ORRS     R1,R1,R0
        MOVS     R0,R1
//  152     GPIOX[ptx]->PDOR = temp;
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+0]
//  153 }
        POP      {R0,PC}          ;; return
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
        SUB      SP,SP,#+4
//  164     vuint8 ptx,ptn;
//  165     uint32 temp;
//  166 
//  167     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R1,R0
        UXTB     R1,R1
        LSRS     R1,R1,#+5
        MOV      R2,SP
        STRB     R1,[R2, #+0]
//  168     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        MOV      R1,SP
        STRB     R0,[R1, #+1]
//  169 
//  170     //设置端口状态
//  171     temp = GPIOX[ptx]->PTOR;
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+12]
//  172     temp |= (uint32)(1<<ptn);
        MOVS     R2,R0
        MOVS     R0,#+1
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R0,R0,R1
        ORRS     R0,R0,R2
//  173     GPIOX[ptx]->PTOR = temp;
        LDR      R1,??DataTable4
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+12]
//  174 }
        ADD      SP,SP,#+4
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
// 652 bytes in section .text
// 
// 652 bytes of CODE  memory
//  12 bytes of CONST memory
//
//Errors: none
//Warnings: none
