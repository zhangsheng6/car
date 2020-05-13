///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:38:00
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_systick.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_systick.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\device\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\user\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\KEA128_systick.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN core_clk_khz
        EXTERN get_clk

        PUBLIC SystickDelay
        PUBLIC SystickDelayMs
        PUBLIC systick_getval
        PUBLIC systick_timing

// H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_systick.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_systick
//   11  * @company	   		�ɶ���ɿƼ����޹�˾
//   12  * @author     		��ɿƼ�(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 
//   21 #include "KEA128_systick.h"
//   22 
//   23 
//   24 
//   25 //-------------------------------------------------------------------------------------------------------------------
//   26 //  @brief      systick��ʱ����
//   27 //  @param      time            ��Ҫ��ʱ��ʱ��
//   28 //  @return     void
//   29 //  @since      v2.0
//   30 //  Sample usage:               systick_delay(1000);   //��ʱ1000���ں�ʱ������
//   31 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void SystickDelay(uint32 time)
//   33 {
SystickDelay:
        PUSH     {LR}
//   34     if(time == 0)   return;
        CMP      R0,#+0
        BEQ      ??SystickDelay_0
//   35 
//   36     SysTick->CTRL = 0x00;//�ȹ��� systick ,���־λ
??SystickDelay_1:
        MOVS     R1,#+0
        LDR      R2,??DataTable3  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   37     SysTick->LOAD = time;//������ʱʱ��
        LDR      R1,??DataTable3_1  ;; 0xe000e014
        STR      R0,[R1, #+0]
//   38     SysTick->VAL = 0x00;//��ռ�����
        MOVS     R1,#+0
        LDR      R2,??DataTable3_2  ;; 0xe000e018
        STR      R1,[R2, #+0]
//   39     SysTick->CTRL = ( 0 | SysTick_CTRL_ENABLE_Msk     //ʹ�� systick
//   40                   //| SysTick_CTRL_TICKINT_Msk        //ʹ���ж� (ע���˱�ʾ�ر��ж�)
//   41                     | SysTick_CTRL_CLKSOURCE_Msk      //ʱ��Դѡ�� (core clk)
//   42                 );
        MOVS     R1,#+5
        LDR      R2,??DataTable3  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   43     while( !(SysTick->CTRL & SysTick_CTRL_COUNTFLAG_Msk));//�ȴ�ʱ�䵽
??SystickDelay_2:
        LDR      R1,??DataTable3  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+15
        BPL      ??SystickDelay_2
//   44 }
??SystickDelay_0:
        POP      {PC}             ;; return
//   45 
//   46 //-------------------------------------------------------------------------------------------------------------------
//   47 //  @brief      ���뼶systick��ʱ����
//   48 //  @param      ms              ��ʱ���ٺ���
//   49 //  @return     void
//   50 //  @since      v2.0
//   51 //  Sample usage:               systick_delay_ms(1000);   //��ʱ1000����
//   52 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 void SystickDelayMs(uint32 ms)
//   54 {
SystickDelayMs:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   55     get_clk();//��ȡ�ں�ʱ�ӱ��ں�������
        BL       get_clk
//   56 	while(ms--) SystickDelay(core_clk_khz);
??SystickDelayMs_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BEQ      ??SystickDelayMs_1
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       SystickDelay
        B        ??SystickDelayMs_0
//   57 }
??SystickDelayMs_1:
        POP      {R4,PC}          ;; return
//   58 
//   59 //-------------------------------------------------------------------------------------------------------------------
//   60 //  @brief      systick��ʱ��
//   61 //  @param      time            ��ʱʱ��(0-0x00ffffff)
//   62 //  @return     void
//   63 //  @since      v2.0
//   64 //  Sample usage:               systick_timing(1000);   //��ʱ1000���ں�ʱ������
//   65 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   66 void systick_timing(uint32 time)
//   67 {
//   68     time &= 0x00ffffff;     	//����ǿ�Ʊ任Ϊ24λ
systick_timing:
        LSLS     R0,R0,#+8        ;; ZeroExtS R0,R0,#+8,#+8
        LSRS     R0,R0,#+8
//   69     SysTick->LOAD = time;       //������ʱʱ��
        LDR      R1,??DataTable3_1  ;; 0xe000e014
        STR      R0,[R1, #+0]
//   70     SysTick->VAL = 0x00;       	//��ռ�����
        MOVS     R1,#+0
        LDR      R2,??DataTable3_2  ;; 0xe000e018
        STR      R1,[R2, #+0]
//   71     SysTick->CTRL = ( 0
//   72 					| SysTick_CTRL_ENABLE_Msk       //ʹ�� systick
//   73                     | SysTick_CTRL_TICKINT_Msk      //ʹ���ж�
//   74                     | SysTick_CTRL_CLKSOURCE_Msk    //ʱ��Դѡ�� (core clk)
//   75                 );
        MOVS     R1,#+7
        LDR      R2,??DataTable3  ;; 0xe000e010
        STR      R1,[R2, #+0]
//   76 }
        BX       LR               ;; return
//   77 
//   78 //-------------------------------------------------------------------------------------------------------------------
//   79 //  @brief      ��õ�ǰSystem tick timer��ֵ
//   80 //  @return     ���ص�ǰSystem tick timer��ֵ
//   81 //  @since      v2.0
//   82 //  Sample usage:               uint32 tim = systick_getval();
//   83 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 uint32 systick_getval(void)
//   85 {
//   86     return SysTick->VAL;
systick_getval:
        LDR      R0,??DataTable3_2  ;; 0xe000e018
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
//   87 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     core_clk_khz

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   88 
// 
// 110 bytes in section .text
// 
// 110 bytes of CODE memory
//
//Errors: none
//Warnings: none
