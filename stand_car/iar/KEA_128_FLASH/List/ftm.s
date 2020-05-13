///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:00
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\ftm.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\ftm.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ftm.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv
        EXTERN ftm_clk_khz
        EXTERN prot_pull

        PUBLIC FTM_CountClean
        PUBLIC FTM_PwmDuty
        PUBLIC FTM_PwmInit
        PUBLIC FTM_PwmMux
        PUBLIC FTM_SpeedGet
        PUBLIC FTM_SpeedInit
        PUBLIC FTM_SpeedMux
        PUBLIC g_mod

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\ftm.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：     ftm.c
//    8   * 文件标识：
//    9   * 摘    要：     PWM波配置
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1           月8日 16:43:36
//   14   * 备    注：     FtmPwmMux函数被KEA128_ftm.c中初始化函数调用
//   15   ******************************************************************************
//   16   */
//   17 #include "ftm.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// static __absolute struct <unnamed> *const FTMX[3]
FTMX:
        DATA
        DC32 40038000H, 40039000H, 4003A000H
//   18 
//   19 //全局变量定义
//   20 //uint32_t LPLD_FTM1_MOD;
//   21 //uint32_t LPLD_FTM2_MOD;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   22 uint16 g_mod; //PWM周期置入值
g_mod:
        DS8 2
//   23 
//   24 
//   25 /**
//   26   * 简介
//   27   *     FTM 引脚复用 时钟开启
//   28   * 参数
//   29   *     ftmn --- FTM模块
//   30   *       ftm0
//   31   *       ftm1
//   32   *       ftm2
//   33   *     ch --- 通道
//   34   *       ch0
//   35   *       ch0,
//   36   *       ch1,
//   37   *       ch2,
//   38   *       ch3,
//   39   *       ch4,
//   40   *       ch5,
//   41   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 void FTM_PwmMux(ftmX ftmn, ftmCh ch)
//   43 {
FTM_PwmMux:
        PUSH     {LR}
//   44     switch (ftmn)
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??FTM_PwmMux_0
        CMP      R0,#+2
        BEQ      ??FTM_PwmMux_1
        BCC      ??FTM_PwmMux_2
        B        ??FTM_PwmMux_3
//   45     {
//   46       case ftm0:
//   47         SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //开时钟
??FTM_PwmMux_0:
        LDR      R0,??DataTable2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R2,#+32
        ORRS     R2,R2,R0
        LDR      R0,??DataTable2  ;; 0x40048014
        STR      R2,[R0, #+0]
//   48         switch(ch)
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??FTM_PwmMux_4
        CMP      R1,#+1
        BEQ      ??FTM_PwmMux_5
        B        ??FTM_PwmMux_6
//   49         {
//   50           case ch0:
//   51             if(FTM0_CH0_PIN == A0)
//   52             {
//   53                 SIM->PINSEL &= ~SIM_PINSEL_FTM0PS0_MASK;
??FTM_PwmMux_4:
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0xfffffeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        STR      R1,[R0, #+0]
//   54             }
//   55             else if(FTM0_CH0_PIN == B2)
//   56             {
//   57                 SIM->PINSEL |= SIM_PINSEL_FTM0PS0_MASK;
//   58             }
//   59             break;
        B        ??FTM_PwmMux_7
//   60           case ch1:
//   61             if(FTM0_CH1_PIN == A1)
//   62             {
//   63                 SIM->PINSEL &= ~SIM_PINSEL_FTM0PS1_MASK;
??FTM_PwmMux_5:
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_3  ;; 0xfffffdff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        STR      R1,[R0, #+0]
//   64             }
//   65             else if(FTM0_CH1_PIN == B3)
//   66             {
//   67                 SIM->PINSEL |= SIM_PINSEL_FTM0PS1_MASK;
//   68             }
//   69             break;
        B        ??FTM_PwmMux_7
//   70 
//   71           default :
//   72             break;
//   73         }
//   74         break;
??FTM_PwmMux_6:
??FTM_PwmMux_7:
        B        ??FTM_PwmMux_8
//   75 
//   76       case ftm1:
//   77         SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //开时钟
??FTM_PwmMux_2:
        LDR      R0,??DataTable2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R2,#+64
        ORRS     R2,R2,R0
        LDR      R0,??DataTable2  ;; 0x40048014
        STR      R2,[R0, #+0]
//   78         switch(ch)
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??FTM_PwmMux_9
        CMP      R1,#+1
        BEQ      ??FTM_PwmMux_10
        B        ??FTM_PwmMux_11
//   79         {
//   80           case ch0:
//   81             if(FTM1_CH0_PIN == C4)
//   82             {
//   83                 SIM->PINSEL &= ~SIM_PINSEL_FTM1PS0_MASK;
//   84             }
//   85             else if(FTM1_CH0_PIN == H2)
//   86             {
//   87                 SIM->PINSEL |= SIM_PINSEL_FTM1PS0_MASK;
??FTM_PwmMux_9:
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        STR      R1,[R0, #+0]
//   88             }
//   89             break;
        B        ??FTM_PwmMux_12
//   90           case ch1:
//   91             if(FTM1_CH1_PIN == C5)
//   92             {
//   93                 SIM->PINSEL &= ~SIM_PINSEL_FTM1PS1_MASK;
??FTM_PwmMux_10:
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4  ;; 0xfffff7ff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x4004800c
        STR      R1,[R0, #+0]
//   94             }
//   95             else if(FTM1_CH1_PIN == E7)
//   96             {
//   97                 SIM->PINSEL |= SIM_PINSEL_FTM1PS1_MASK;
//   98             }
//   99             break;
        B        ??FTM_PwmMux_12
//  100           default :
//  101             break;
//  102         }
//  103         break;
??FTM_PwmMux_11:
??FTM_PwmMux_12:
        B        ??FTM_PwmMux_8
//  104 
//  105       case ftm2:
//  106         SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //开启FTM外设时钟
??FTM_PwmMux_1:
        LDR      R0,??DataTable2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R2,#+128
        ORRS     R2,R2,R0
        LDR      R0,??DataTable2  ;; 0x40048014
        STR      R2,[R0, #+0]
//  107         switch(ch)
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??FTM_PwmMux_13
        CMP      R1,#+2
        BEQ      ??FTM_PwmMux_14
        BCC      ??FTM_PwmMux_15
        CMP      R1,#+4
        BEQ      ??FTM_PwmMux_16
        BCC      ??FTM_PwmMux_17
        CMP      R1,#+5
        BEQ      ??FTM_PwmMux_18
        B        ??FTM_PwmMux_19
//  108         {
//  109           case ch0:
//  110             SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS0_MASK;
??FTM_PwmMux_13:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+3
        BICS     R0,R0,R1
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  111             if(FTM2_CH0_PIN == C0)
//  112             {
//  113                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(0);
//  114             }
//  115             else if(FTM2_CH0_PIN == H0)
//  116             {
//  117                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(1);
//  118             }
//  119             else if(FTM2_CH0_PIN == F0)
//  120             {
//  121                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(2);
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6  ;; 0x40048010
        STR      R1,[R0, #+0]
//  122             }
//  123             break;
        B        ??FTM_PwmMux_20
//  124 
//  125           case ch1:
//  126             SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS1_MASK;
??FTM_PwmMux_15:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+12
        BICS     R0,R0,R1
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  127             if(FTM2_CH1_PIN == C1)
//  128             {
//  129                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(0);
//  130             }
//  131             else if(FTM2_CH1_PIN == H1)
//  132             {
//  133                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(1);
//  134             }
//  135             else if(FTM2_CH1_PIN == F1)
//  136             {
//  137                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(2);
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6  ;; 0x40048010
        STR      R1,[R0, #+0]
//  138             }
//  139             break;
        B        ??FTM_PwmMux_20
//  140 
//  141           case ch2:
//  142             SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS2_MASK;
??FTM_PwmMux_14:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+48
        BICS     R0,R0,R1
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  143             if(FTM2_CH2_PIN == C2)
//  144             {
//  145                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(0);
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  146             }
//  147             else if(FTM2_CH2_PIN == D0)
//  148             {
//  149                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(1);
//  150             }
//  151             else if(FTM2_CH2_PIN == G4)
//  152             {
//  153                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(2);
//  154             }
//  155             break;
        B        ??FTM_PwmMux_20
//  156 
//  157           case ch3:
//  158             SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS3_MASK;
??FTM_PwmMux_17:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+192
        BICS     R0,R0,R1
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  159             if(FTM2_CH3_PIN == C3)
//  160             {
//  161                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(0);
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6  ;; 0x40048010
        STR      R0,[R1, #+0]
//  162             }
//  163             else if(FTM2_CH3_PIN == D1)
//  164             {
//  165                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(1);
//  166             }
//  167             else if(FTM2_CH3_PIN == G5)
//  168             {
//  169                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(2);
//  170             }
//  171             break;
        B        ??FTM_PwmMux_20
//  172 
//  173           case ch4:
//  174             if(FTM2_CH4_PIN == B4)
//  175             {
//  176                 SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS4_MASK;
??FTM_PwmMux_16:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0xfffffeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable6  ;; 0x40048010
        STR      R1,[R0, #+0]
//  177             }
//  178             else if(FTM2_CH4_PIN == G6)
//  179             {
//  180                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS4_MASK;
//  181             }
//  182             break;
        B        ??FTM_PwmMux_20
//  183 
//  184           case ch5:
//  185             if(FTM2_CH5_PIN == B5)
//  186             {
//  187                 SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS5_MASK;
??FTM_PwmMux_18:
        LDR      R0,??DataTable6  ;; 0x40048010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_3  ;; 0xfffffdff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable6  ;; 0x40048010
        STR      R1,[R0, #+0]
//  188             }
//  189             else if(FTM2_CH5_PIN == G7)
//  190             {
//  191                 SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS5_MASK;
//  192             }
//  193             break;
        B        ??FTM_PwmMux_20
//  194 
//  195           default :
//  196             break;
//  197         }
//  198         break;
??FTM_PwmMux_19:
??FTM_PwmMux_20:
        B        ??FTM_PwmMux_8
//  199 
//  200       default :
//  201         break;
//  202     }
//  203 }
??FTM_PwmMux_3:
??FTM_PwmMux_8:
        POP      {PC}             ;; return
//  204 
//  205 /**
//  206   * 简介
//  207   *     PWM初始化
//  208   * 参数
//  209   *     ftmn --- FTM模块
//  210   *       ftm0
//  211   *       ftm1
//  212   *       ftm2
//  213   *     ch --- 通道
//  214   *       ch0,
//  215   *       ch0,
//  216   *       ch1,
//  217   *       ch2,
//  218   *       ch3,
//  219   *       ch4,
//  220   *       ch5,
//  221   *     freqKhz
//  222   *       计数值 = 系统频率 / 分频系数 / 频率
//  223   *     duty --- 占空比
//  224   *       0-8000
//  225   * 备注
//  226   *     故障控制 未使能，POL未配置
//  227   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  228 void FTM_PwmInit(ftmX ftmn, ftmCh ch, uint8 freqKhz, uint32 duty)
//  229 {
FTM_PwmInit:
        PUSH     {R2,R4-R7,LR}
        MOVS     R5,R0
        MOVS     R7,R1
        MOVS     R4,R3
//  230     uint32 clk_hz;
//  231     uint16 cv;
//  232 
//  233     FTM_PwmMux(ftmn, ch);  //开时钟，引脚复用
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R5
        UXTB     R0,R0
        BL       FTM_PwmMux
//  234 
//  235     //频率
//  236     clk_hz = ftm_clk_khz*1000;
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
//  237     g_mod = clk_hz / 1 / (freqKhz*1000);
        MOVS     R1,#+1
        BL       __aeabi_uidiv
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+250
        LSLS     R2,R2,#+2        ;; #+1000
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable6_2
        STRH     R0,[R1, #+0]
//  238     g_mod = g_mod - 1;
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable6_2
        STRH     R0,[R1, #+0]
//  239 
//  240     //占空比
//  241     switch (ftmn)
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??FTM_PwmInit_0
        CMP      R5,#+2
        BEQ      ??FTM_PwmInit_1
        BCC      ??FTM_PwmInit_2
        B        ??FTM_PwmInit_3
//  242     {
//  243       case ftm0:
//  244         cv = (duty * (g_mod + 1)) / FTM0_PRECISON;
??FTM_PwmInit_0:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R4,R0,R4
        MOVS     R0,R4
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
        MOVS     R6,R0
//  245         break;
        B        ??FTM_PwmInit_4
//  246 
//  247       case ftm1:
//  248         cv = (duty * (g_mod + 1)) / FTM1_PRECISON;
??FTM_PwmInit_2:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R4,R0,R4
        MOVS     R0,R4
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
        MOVS     R6,R0
//  249         break;
        B        ??FTM_PwmInit_4
//  250 
//  251       case ftm2:
//  252         cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON精度
??FTM_PwmInit_1:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R4,R0,R4
        MOVS     R0,R4
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
        MOVS     R6,R0
//  253         break;
        B        ??FTM_PwmInit_4
//  254       default:
//  255         break;
//  256     }
//  257 
//  258 
//  259 //    FTMX[ftmn]->MODE |= FTM_MODE_WPDIS_MASK; //关写保护
//  260 
//  261     FTMX[ftmn]->MOD = g_mod;                  //设置PWM周期
??FTM_PwmInit_3:
??FTM_PwmInit_4:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+8]
//  262 
//  263     //边沿对齐，匹配时输出低
//  264     FTMX[ftmn]->CONTROLS[ch].CnSC &= ~FTM_CnSC_ELSA_MASK;
        LDR      R0,??DataTable6_3
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        UXTB     R7,R7
        MOVS     R1,#+8
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        UXTB     R7,R7
        MOVS     R2,#+8
        MULS     R2,R7,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+12]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        STR      R1,[R0, #+12]
//  265     FTMX[ftmn]->CONTROLS[ch].CnSC |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
        LDR      R0,??DataTable6_3
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        UXTB     R7,R7
        MOVS     R1,#+8
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        UXTB     R7,R7
        MOVS     R2,#+8
        MULS     R2,R7,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+12]
        MOVS     R2,#+40
        ORRS     R2,R2,R1
        STR      R2,[R0, #+12]
//  266 
//  267     // set FTM clock to system clock
//  268     FTMX[ftmn]->SC = ( 0
//  269                        //| FTM_SC_CPWMS_MASK       //0：边沿对齐 ，1： 中心对齐 （注释了表示 0）
//  270                        | FTM_SC_PS(0)              //分频因子，分频系数 = 2^ps
//  271                        | FTM_SC_CLKS(1)            //时钟选择， 0：没选择时钟，禁用； 1：系统时钟； 2：固定时钟； 3：外部时钟
//  272                        //| FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断）
//  273                      );
        MOVS     R0,#+8
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+0]
//  274 
//  275     FTMX[ftmn]->CNTIN = 0;                         //计数器初值
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+76]
//  276     FTMX[ftmn]->CONTROLS[ch].CnV = cv;             //设置占空比
        LDR      R0,??DataTable6_3
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        UXTB     R7,R7
        MOVS     R1,#+8
        MULS     R7,R1,R7
        ADDS     R0,R0,R7
        UXTH     R6,R6
        STR      R6,[R0, #+16]
//  277     FTMX[ftmn]->CNT = 0;                           //计数器，写任意值都会加载CNTIN的值
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R5,R2,R5
        LDR      R1,[R1, R5]
        STR      R0,[R1, #+4]
//  278 
//  279 //    FTMX[ftmn]->FMS |= FTM_FMS_WPEN_MASK;          //开写保护
//  280 
//  281 }
        POP      {R0,R4-R7,PC}    ;; return
//  282 
//  283 /**
//  284   * 简介
//  285   *     占空比修改
//  286   * 参数
//  287   *     ftmn --- 只有ftm2有效
//  288   *       ftmX0
//  289   *       ftmX1
//  290   *       ftmX2
//  291   *     ch --- 只配置了ch0和ch1
//  292   *       ch0
//  293   *       ch1
//  294   *     freqKhz
//  295   *       计数值 = 总线频率 / 分频系数 / 频率
//  296   *     duty --- 占空比
//  297   *       0-6000
//  298   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  299 void FTM_PwmDuty(ftmX ftmn, ftmCh ch, uint32 duty)
//  300 {
FTM_PwmDuty:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  301     uint16 cv;
//  302 
//  303     switch (ftmn)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??FTM_PwmDuty_0
        CMP      R4,#+2
        BEQ      ??FTM_PwmDuty_1
        BCC      ??FTM_PwmDuty_2
        B        ??FTM_PwmDuty_3
//  304     {
//  305       case ftm0:
//  306         cv = (duty * (g_mod + 1)) / FTM0_PRECISON;
??FTM_PwmDuty_0:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R2,R0,R2
        MOVS     R0,R2
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
//  307         break;
        B        ??FTM_PwmDuty_4
//  308 
//  309       case ftm1:
//  310         cv = (duty * (g_mod + 1)) / FTM1_PRECISON;
??FTM_PwmDuty_2:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R2,R0,R2
        MOVS     R0,R2
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
//  311         break;
        B        ??FTM_PwmDuty_4
//  312 
//  313       case ftm2:
//  314         cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON精度
??FTM_PwmDuty_1:
        LDR      R0,??DataTable6_2
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        MULS     R2,R0,R2
        MOVS     R0,R2
        MOVS     R1,#+250
        LSLS     R1,R1,#+5        ;; #+8000
        BL       __aeabi_uidiv
//  315         break;
        B        ??FTM_PwmDuty_4
//  316       default:
//  317         break;
//  318     }
//  319 
//  320     FTMX[ftmn]->CONTROLS[ch].CnV = cv;       //设置占空比
??FTM_PwmDuty_3:
??FTM_PwmDuty_4:
        LDR      R1,??DataTable6_3
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R1,[R1, R4]
        UXTB     R5,R5
        MOVS     R2,#+8
        MULS     R5,R2,R5
        ADDS     R1,R1,R5
        UXTH     R0,R0
        STR      R0,[R1, #+16]
//  321 }
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4004800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xfffffeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xfffffdff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xfffff7ff
//  322 
//  323 
//  324 /**
//  325   * 简介
//  326   *     测速引脚复用
//  327   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  328 void FTM_SpeedMux(ftmX ftmn)
//  329 {
FTM_SpeedMux:
        PUSH     {R7,LR}
//  330     switch(ftmn)
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??FTM_SpeedMux_0
        CMP      R0,#+2
        BEQ      ??FTM_SpeedMux_1
        BCC      ??FTM_SpeedMux_2
        B        ??FTM_SpeedMux_3
//  331     {
//  332         case ftm0:
//  333         {
//  334             SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //开时钟
??FTM_SpeedMux_0:
        LDR      R0,??DataTable6_4  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_4  ;; 0x40048014
        STR      R1,[R0, #+0]
//  335             SIM->PINSEL &= ~SIM_PINSEL_FTM0CLKPS_MASK;
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_6  ;; 0xfcffffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        STR      R1,[R0, #+0]
//  336             if(FTM0_COUNT_PIN == A5)
//  337             {
//  338                 prot_pull(A5);
//  339                 SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(0);     //选择外部时钟输入引脚 A5
//  340             }
//  341 
//  342             else if(FTM0_COUNT_PIN == E0)
//  343             {
//  344                 prot_pull(E0);
//  345                 SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(1);     //选择外部时钟输入引脚 E0
//  346             }
//  347 
//  348             else if(FTM0_COUNT_PIN == E7)
//  349             {
//  350                 prot_pull(E7);
        MOVS     R0,#+39
        BL       prot_pull
//  351                 SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(2);     //选择外部时钟输入引脚 E7
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+18       ;; #+33554432
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        STR      R1,[R0, #+0]
//  352             }
//  353         }break;
        B        ??FTM_SpeedMux_3
//  354 
//  355         case ftm1:
//  356         {
//  357             SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //开启FTM外设时钟
??FTM_SpeedMux_2:
        LDR      R0,??DataTable6_4  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_4  ;; 0x40048014
        STR      R1,[R0, #+0]
//  358             SIM->PINSEL &= ~SIM_PINSEL_FTM1CLKPS_MASK;      //清除外部时钟引脚选择
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_7  ;; 0xf3ffffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        STR      R1,[R0, #+0]
//  359             if(FTM1_COUNT_PIN == A5)
//  360             {
//  361                 prot_pull(A5);
//  362                 SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(0);     //选择外部时钟输入引脚 A5
//  363             }
//  364 
//  365             else if(FTM1_COUNT_PIN == E0)
//  366             {
//  367                 prot_pull(E0);
        MOVS     R0,#+32
        BL       prot_pull
//  368                 SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(1);     //选择外部时钟输入引脚 E0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+19       ;; #+67108864
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        STR      R1,[R0, #+0]
//  369             }
//  370 
//  371             else if(FTM1_COUNT_PIN == E7)
//  372             {
//  373                 prot_pull(E7);
//  374                 SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(2);     //选择外部时钟输入引脚 E7
//  375             }
//  376         }break;
        B        ??FTM_SpeedMux_3
//  377 
//  378         case ftm2:
//  379         {
//  380             SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //开启FTM外设时钟
??FTM_SpeedMux_1:
        LDR      R0,??DataTable6_4  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_4  ;; 0x40048014
        STR      R1,[R0, #+0]
//  381             SIM->PINSEL &= ~SIM_PINSEL_FTM2CLKPS_MASK;      //清除外部时钟引脚选择
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_8  ;; 0xcfffffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        STR      R1,[R0, #+0]
//  382             FTM2->CNTIN = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable6_9  ;; 0x4003a04c
        STR      R0,[R1, #+0]
//  383             if(FTM2_COUNT_PIN == A5)
//  384             {
//  385                 prot_pull(A5);
        MOVS     R0,#+5
        BL       prot_pull
//  386                 SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(0);     //选择外部时钟输入引脚 A5
        LDR      R0,??DataTable6_5  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_5  ;; 0x4004800c
        STR      R0,[R1, #+0]
//  387             }
//  388 
//  389             else if(FTM2_COUNT_PIN == E0)
//  390             {
//  391                 prot_pull(E0);
//  392                 SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(1);     //选择外部时钟输入引脚 E0
//  393             }
//  394 
//  395             else if(FTM2_COUNT_PIN == E7)
//  396             {
//  397                 prot_pull(E7);
//  398                 SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(2);     //选择外部时钟输入引脚 E7
//  399             }
//  400         }break;
//  401 
//  402     }
//  403 }
??FTM_SpeedMux_3:
        POP      {R0,PC}          ;; return
//  404 
//  405 /**
//  406   * 简介
//  407   *     测速初始化
//  408   * 参数
//  409   *     ftmn --- FTM模块
//  410   *       ftm0
//  411   *       ftm1
//  412   *       ftm2
//  413   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  414 void FTM_SpeedInit(ftmX ftmn)
//  415 {
FTM_SpeedInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  416     FTM_SpeedMux(ftmn);                                    //引脚复用 开启上拉 开启对应外设时钟
        MOVS     R0,R4
        UXTB     R0,R0
        BL       FTM_SpeedMux
//  417 
//  418     FTMX[ftmn]->SC |= FTM_SC_PS(0);	                        //分频系数
        LDR      R0,??DataTable6_3
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_3
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+0]
//  419     FTMX[ftmn]->SC |= FTM_SC_CLKS(3);                       //选择外部时钟作为FTM输入时钟
        LDR      R0,??DataTable6_3
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+24
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_3
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STR      R1,[R0, #+0]
//  420 
//  421     FTMX[ftmn]->CNT = 0;                                    //加载初始化值
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R1,[R1, R4]
        STR      R0,[R1, #+4]
//  422 }
        POP      {R4,PC}          ;; return
//  423 
//  424 /**
//  425   * 简介
//  426   *     获取速度值
//  427   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  428 uint16 FTM_SpeedGet(ftmX ftmn)
//  429 {
//  430     return FTMX[ftmn]->CNT ;
FTM_SpeedGet:
        LDR      R1,??DataTable6_3
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R0,[R1, R0]
        LDR      R0,[R0, #+4]
        UXTH     R0,R0
        BX       LR               ;; return
//  431 }
//  432 
//  433 /**
//  434   * 简介
//  435   *     测速 计数清0
//  436   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  437 void FTM_CountClean(ftmX ftmn)
//  438 {
//  439     FTMX[ftmn]->CNT = 0;
FTM_CountClean:
        MOVS     R1,#+0
        LDR      R2,??DataTable6_3
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R2, R0]
        STR      R1,[R0, #+4]
//  440 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40048010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ftm_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     g_mod

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     FTMX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x4004800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0xfcffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0xf3ffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0xcfffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x4003a04c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  441 
//  442 
//  443 
//  444 
// 
//     2 bytes in section .bss
//    12 bytes in section .rodata
// 1 034 bytes in section .text
// 
// 1 034 bytes of CODE  memory
//    12 bytes of CONST memory
//     2 bytes of DATA  memory
//
//Errors: none
//Warnings: none
