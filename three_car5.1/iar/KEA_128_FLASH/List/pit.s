///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\5.1\device\C\pit.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\device\C\pit.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\pit.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv
        EXTERN bus_clk_khz

        PUBLIC PIT_DisableIrq
        PUBLIC PIT_EnableIrq
        PUBLIC PIT_Init

// H:\���ܳ�����2018\������֡���ZS\5.1\device\C\pit.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�     pit.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��     �����ж϶�ʱ��
//   10   *
//   11   * ��ǰ�汾��     1.0
//   12   * ��    ��     ��־ΰ
//   13   * ʱ    �䣺     2018��1��23�� 16:45:38
//   14   ******************************************************************************
//   15   */
//   16 #include "pit.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        LSLS     R2,R0,#+27       ;; ZeroExtS R2,R0,#+27,#+27
        LSRS     R2,R2,#+27
        LSLS     R1,R1,R2
        LDR      R2,??DataTable4  ;; 0xe000e100
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        LSLS     R2,R0,#+27       ;; ZeroExtS R2,R0,#+27,#+27
        LSRS     R2,R2,#+27
        LSLS     R1,R1,R2
        LDR      R2,??DataTable4_1  ;; 0xe000e180
        STR      R1,[R2, #+0]
        BX       LR               ;; return
//   17 
//   18 /**
//   19   * ���
//   20   *     PIT0��ʼ��
//   21   * ����
//   22   *     pitn  ֻ��PIT0��Ч
//   23   *     us����ʾ��ʱ�����ʼ�ݼ���ֵ
//   24   * ע��
//   25   *     LDVALд��ֵ =����ʱ����/ʱ�����ڣ�-1
//   26   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 void PIT_Init(uint8 pitn, uint16 us)
//   28 {
PIT_Init:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   29 //    get_clk();
//   30 
//   31     uint32 cnt = 0;
        MOVS     R6,#+0
//   32     cnt = us * (bus_clk_khz/1000) - 1;
        UXTH     R5,R5
        LDR      R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_uidiv
        MULS     R0,R5,R0
        SUBS     R0,R0,#+1
        MOVS     R6,R0
//   33 
//   34 	SIM->SCGC       |= SIM_SCGC_PIT_MASK;       //ʹ��PITʱ��
        LDR      R0,??DataTable4_3  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_3  ;; 0x40048014
        STR      R1,[R0, #+0]
//   35 
//   36 	PIT->MCR        &= ~PIT_MCR_MDIS_MASK;      //������ִ���κ���������֮ǰʹ�ܸ��ֶ�
        LDR      R0,??DataTable4_4  ;; 0x40037000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable4_4  ;; 0x40037000
        STR      R0,[R1, #+0]
//   37 	PIT->MCR        |= PIT_MCR_FRZ_MASK;	    //����ģʽ�½�ֹ����
        LDR      R0,??DataTable4_4  ;; 0x40037000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_4  ;; 0x40037000
        STR      R1,[R0, #+0]
//   38 //    PIT->MCR        &= ~PIT_MCR_FRZ_MASK;	    //����ģʽ����������
//   39 	PIT->CHANNEL[pitn].LDVAL  = cnt;            //��������ж�ʱ��
        LDR      R0,??DataTable4_5  ;; 0x40037100
        UXTB     R4,R4
        MOVS     R1,#+16
        MULS     R1,R4,R1
        STR      R6,[R0, R1]
//   40 	PIT_CLEAR;								    //����жϱ�־λ
        LDR      R0,??DataTable4_6  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_6  ;; 0x4003710c
        STR      R1,[R0, #+0]
//   41 	PIT->CHANNEL[pitn].TCTRL &= ~ PIT_TCTRL_TEN_MASK;       //��ֹPITn��ʱ����������ռ���ֵ��
        LDR      R0,??DataTable4_5  ;; 0x40037100
        UXTB     R4,R4
        MOVS     R1,#+16
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable4_5  ;; 0x40037100
        UXTB     R4,R4
        MOVS     R2,#+16
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+8]
//   42     PIT->CHANNEL[pitn].TCTRL  = ( 0
//   43 								| PIT_TCTRL_TEN_MASK        //ʹ�� PITn��ʱ��
//   44 								& (~PIT_TCTRL_TIE_MASK)     //��PITn�ж�
//   45 								);
        MOVS     R0,#+1
        LDR      R1,??DataTable4_5  ;; 0x40037100
        UXTB     R4,R4
        MOVS     R2,#+16
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+8]
//   46 }
        POP      {R4-R6,PC}       ;; return
//   47 
//   48 /**
//   49   * ���
//   50   *     ʹ��PIT0�ж�
//   51   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void PIT_EnableIrq()
//   53 {
PIT_EnableIrq:
        PUSH     {R7,LR}
//   54     PIT_CLEAR;   //���жϱ�־
        LDR      R0,??DataTable4_6  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_6  ;; 0x4003710c
        STR      R1,[R0, #+0]
//   55     PIT->CHANNEL[PIT0].TCTRL |= PIT_TCTRL_TIE_MASK; //��pit�ж�
        LDR      R0,??DataTable4_7  ;; 0x40037108
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4_7  ;; 0x40037108
        STR      R1,[R0, #+0]
//   56     enable_irq(PIT0_IRQ);
        MOVS     R0,#+22
        BL       NVIC_EnableIRQ
//   57 }
        POP      {R0,PC}          ;; return
//   58 
//   59 /**
//   60   * ���
//   61   *     ��ֹPIT0�ж�
//   62   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   63 void PIT_DisableIrq()
//   64 {
PIT_DisableIrq:
        PUSH     {R7,LR}
//   65     PIT->CHANNEL[PIT0].TCTRL &= (~PIT_TCTRL_TIE_MASK); //��pit�ж�
        LDR      R0,??DataTable4_7  ;; 0x40037108
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable4_7  ;; 0x40037108
        STR      R0,[R1, #+0]
//   66     disable_irq(PIT0_IRQ);
        MOVS     R0,#+22
        BL       NVIC_DisableIRQ
//   67 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x40037108

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   68 
//   69 
// 
// 246 bytes in section .text
// 
// 246 bytes of CODE memory
//
//Errors: none
//Warnings: none
