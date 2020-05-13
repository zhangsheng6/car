///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\7.17\lib\C\KEA128_kbi.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\7.17\lib\C\KEA128_kbi.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\KEA128_kbi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN prot_pull

        PUBLIC kbi
        PUBLIC kbi_init

// H:\���ܳ�����2018\������֡���ZS\7.17\lib\C\KEA128_kbi.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_kbi
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
//   21 #include "KEA128_kbi.h"
//   22 
//   23 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 KBI_Type * kbi[2] = KBI_BASES;
kbi:
        DATA
        DC32 40079000H, 4007A000H
//   25 
//   26 
//   27 //-------------------------------------------------------------------------------------------------------------------
//   28 //  @brief      KBI�����жϳ�ʼ��
//   29 //  @param      chn             ѡ��kbiͨ��   ��ѡ��Χ �ο�KBI_CHnö��
//   30 //  @return     void
//   31 //  @since      v2.0
//   32 //  Sample usage:               kbi_init(KBI1_P0,IRQ_RISING);		            //ͨ��ѡ��ΪKBI1_P0�������ش���
//   33 //								set_irq_priority(KBI1_IRQn,1);					//�������ȼ�,�����Լ����������� �����÷�ΧΪ 0 - 3
//   34 //								enable_irq(KBI1_IRQn);							//��KBI1_IRQn���жϿ���
//   35 //								EnableInterrupts;								//���ܵ��жϿ���
//   36 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   37 void kbi_init(KBI_CHn chn, TRIG_CFG cfg)
//   38 {
kbi_init:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
//   39     uint8 kbi_x,kbi_n;
//   40     
//   41     kbi_x = KBIx(chn);      //��ȡģ���
        MOVS     R5,R0
        UXTB     R5,R5
        LSRS     R5,R5,#+5
//   42     kbi_n = KBIn(chn);      //��ȡ���ź�
        LSLS     R6,R0,#+27       ;; ZeroExtS R6,R0,#+27,#+27
        LSRS     R6,R6,#+27
//   43     
//   44     //����KBIʱ��
//   45     if(0 == kbi_x)  SIM->SCGC |= SIM_SCGC_KBI0_MASK;
        UXTB     R5,R5
        CMP      R5,#+0
        BNE      ??kbi_init_0
        LDR      R1,??kbi_init_1  ;; 0x40048014
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+17       ;; #+16777216
        ORRS     R2,R2,R1
        LDR      R1,??kbi_init_1  ;; 0x40048014
        STR      R2,[R1, #+0]
        B        ??kbi_init_2
//   46     else            SIM->SCGC |= SIM_SCGC_KBI1_MASK;
??kbi_init_0:
        LDR      R1,??kbi_init_1  ;; 0x40048014
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+18       ;; #+33554432
        ORRS     R2,R2,R1
        LDR      R1,??kbi_init_1  ;; 0x40048014
        STR      R2,[R1, #+0]
//   47     
//   48     //����KBI�ж�
//   49     kbi[kbi_x]->SC &= ~(uint32)KBI_SC_KBIE_MASK;
??kbi_init_2:
        LDR      R1,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        LDR      R1,[R1, #+8]
        MOVS     R2,#+2
        BICS     R1,R1,R2
        LDR      R2,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R3,#+4
        MULS     R3,R5,R3
        LDR      R2,[R2, R3]
        STR      R1,[R2, #+8]
//   50 
//   51     //���ô���ģʽ
//   52     if((IRQ_FALLING == cfg) || (IRQ_FALLING_LOW == cfg))
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??kbi_init_3
        UXTB     R4,R4
        CMP      R4,#+2
        BNE      ??kbi_init_4
//   53         kbi[kbi_x]->ES &= ~((uint32)1<<kbi_n);
??kbi_init_3:
        LDR      R1,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        LDR      R1,[R1, #+4]
        MOVS     R2,#+1
        LSLS     R2,R2,R6
        BICS     R1,R1,R2
        LDR      R2,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R3,#+4
        MULS     R3,R5,R3
        LDR      R2,[R2, R3]
        STR      R1,[R2, #+4]
        B        ??kbi_init_5
//   54     else
//   55         kbi[kbi_x]->ES |= ((uint32)1<<kbi_n);
??kbi_init_4:
        LDR      R1,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        LDR      R2,[R1, #+4]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        ORRS     R1,R1,R2
        LDR      R2,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R3,#+4
        MULS     R3,R5,R3
        LDR      R2,[R2, R3]
        STR      R1,[R2, #+4]
//   56     
//   57     //��������
//   58     prot_pull((PTX_n)((uint8)(chn)));
??kbi_init_5:
        UXTB     R0,R0
        BL       prot_pull
//   59     
//   60     //ʹ��KBI����
//   61     kbi[kbi_x]->PE |= (1<<kbi_n);
        LDR      R0,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        ORRS     R1,R1,R0
        LDR      R0,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R0,[R0, R2]
        STR      R1,[R0, #+0]
//   62     
//   63     if(0 == kbi_x)  CLEAN_KBI0_FLAG;                         //�����־λ
        UXTB     R5,R5
        CMP      R5,#+0
        BNE      ??kbi_init_6
        LDR      R0,??kbi_init_1+0x8  ;; 0x40079008
        LDR      R0,[R0, #+0]
        MOVS     R1,#+36
        ORRS     R1,R1,R0
        LDR      R0,??kbi_init_1+0x8  ;; 0x40079008
        STR      R1,[R0, #+0]
        B        ??kbi_init_7
//   64     else            CLEAN_KBI1_FLAG;                         //�����־λ
??kbi_init_6:
        LDR      R0,??kbi_init_1+0xC  ;; 0x4007a008
        LDR      R0,[R0, #+0]
        MOVS     R1,#+36
        ORRS     R1,R1,R0
        LDR      R0,??kbi_init_1+0xC  ;; 0x4007a008
        STR      R1,[R0, #+0]
//   65     
//   66     //���ô���ģʽ
//   67     if((IRQ_FALLING == cfg) || (IRQ_RISING == cfg))
??kbi_init_7:
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??kbi_init_8
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??kbi_init_9
//   68     {
//   69         kbi[kbi_x]->SC = 0;                                 //���ش���ģʽ 0�����ش���   1����ƽ����
??kbi_init_8:
        MOVS     R0,#+0
        LDR      R1,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+8]
        B        ??kbi_init_10
//   70     }
//   71     else
//   72     {
//   73         kbi[kbi_x]->SC = KBI_SC_KBMOD_MASK;                 //���ش���ģʽ 0�����ش���   1����ƽ����
??kbi_init_9:
        MOVS     R0,#+1
        LDR      R1,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STR      R0,[R1, #+8]
//   74     }
//   75     
//   76     
//   77     
//   78     kbi[kbi_x]->SC |= ( 0
//   79                         | KBI_SC_KBIE_MASK    //KBI�ж�ʹ��
//   80                         | KBI_SC_RSTKBSP_MASK
//   81                         //| KBI_SC_KBMOD_MASK   //���ش���ģʽ 0�����ش���   1����ƽ����
//   82                         | KBI_SC_KBSPEN_MASK  //ʹ��KBI_SP�Ĵ���
//   83                         );
??kbi_init_10:
        LDR      R0,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R0,[R0, #+8]
        MOVS     R1,#+50
        ORRS     R1,R1,R0
        LDR      R0,??kbi_init_1+0x4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R5,R2,R5
        LDR      R0,[R0, R5]
        STR      R1,[R0, #+8]
//   84 }
        POP      {R4-R6,PC}       ;; return
        DATA
??kbi_init_1:
        DC32     0x40048014
        DC32     kbi
        DC32     0x40079008
        DC32     0x4007a008

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   85 
//   86 
//   87 
//   88 
// 
//   8 bytes in section .data
// 308 bytes in section .text
// 
// 308 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none
