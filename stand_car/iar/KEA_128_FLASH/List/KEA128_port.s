///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:03
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_port.c
//    Command line =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_port.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -lB
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -o
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\device\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\user\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\system\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\lib\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\KEA128_port.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC prot_pull

// I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_port.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_port
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
//   21 #include "KEA128_port.h"
//   22 
//   23 
//   24 
//   25 #define PTX(PTX_n)  (PTX_n>>5)  //��ȡģ��� PTX_n/32
//   26 #define PTn(PTX_n)  (PTX_n&0x1f)//��ȡ���ź� PTX_n%32
//   27 
//   28 //-------------------------------------------------------------------------------------------------------------------
//   29 //  @brief      IO����
//   30 //  @param      ptx_n           ѡ��˿�
//   31 //  @return     void
//   32 //  @since      v2.0
//   33 //  Sample usage:               prot_pull(E0);			//E0 �������迪��
//   34 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   35 void prot_pull(PTX_n ptx_n)
//   36 {
prot_pull:
        PUSH     {LR}
//   37     uint8 ptx,ptn;
//   38     ptx = PTX(ptx_n);//��¼ģ���    //A,B......
        MOVS     R1,R0
        UXTB     R1,R1
        LSRS     R1,R1,#+5
//   39     ptn = PTn(ptx_n);//��¼���ź�    //0,1,2,3......
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
//   40     
//   41     switch(ptx)
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??prot_pull_0
        CMP      R1,#+2
        BEQ      ??prot_pull_1
        BCC      ??prot_pull_2
        B        ??prot_pull_3
//   42     {
//   43         case 0:
//   44         {
//   45             PORT->PUE0 |= (uint32)(1<<ptn);
??prot_pull_0:
        LDR      R1,??prot_pull_4  ;; 0x40049008
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??prot_pull_4  ;; 0x40049008
        STR      R2,[R0, #+0]
//   46         }break;
        B        ??prot_pull_3
//   47         
//   48         case 1:
//   49         {
//   50             PORT->PUE1 |= (uint32)(1<<ptn);
??prot_pull_2:
        LDR      R1,??prot_pull_4+0x4  ;; 0x4004900c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??prot_pull_4+0x4  ;; 0x4004900c
        STR      R2,[R0, #+0]
//   51         }break;
        B        ??prot_pull_3
//   52         
//   53         case 2:
//   54         {
//   55             PORT->PUE2 |= (uint32)(1<<ptn);
??prot_pull_1:
        LDR      R1,??prot_pull_4+0x8  ;; 0x40049010
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??prot_pull_4+0x8  ;; 0x40049010
        STR      R2,[R0, #+0]
//   56         }break;
//   57     }
//   58 }
??prot_pull_3:
        POP      {PC}             ;; return
        Nop      
        DATA
??prot_pull_4:
        DC32     0x40049008
        DC32     0x4004900c
        DC32     0x40049010

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   59 
// 
// 88 bytes in section .text
// 
// 88 bytes of CODE memory
//
//Errors: none
//Warnings: none
