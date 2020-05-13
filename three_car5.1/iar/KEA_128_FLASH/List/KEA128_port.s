///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:22
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_port.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_port.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\KEA128_port.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC prot_pull

// H:\智能车程序2018\电磁三轮——ZS\5.1\lib\C\KEA128_port.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		KEA128_port
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
//   21 #include "KEA128_port.h"
//   22 
//   23 
//   24 
//   25 #define PTX(PTX_n)  (PTX_n>>5)  //获取模块号 PTX_n/32
//   26 #define PTn(PTX_n)  (PTX_n&0x1f)//获取引脚号 PTX_n%32
//   27 
//   28 //-------------------------------------------------------------------------------------------------------------------
//   29 //  @brief      IO上拉
//   30 //  @param      ptx_n           选择端口
//   31 //  @return     void
//   32 //  @since      v2.0
//   33 //  Sample usage:               prot_pull(E0);			//E0 上拉电阻开启
//   34 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   35 void prot_pull(PTX_n ptx_n)
//   36 {
prot_pull:
        PUSH     {R4,LR}
//   37     uint8 ptx,ptn;
//   38     ptx = PTX(ptx_n);//记录模块号    //A,B......
        MOVS     R3,R0
        UXTB     R3,R3
        LSRS     R3,R3,#+5
        MOVS     R1,R3
//   39     ptn = PTn(ptx_n);//记录引脚号    //0,1,2,3......
        LSLS     R3,R0,#+27       ;; ZeroExtS R3,R0,#+27,#+27
        LSRS     R3,R3,#+27
        MOVS     R2,R3
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
        LDR      R3,??prot_pull_4  ;; 0x40049008
        LDR      R3,[R3, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        ORRS     R4,R4,R3
        LDR      R3,??prot_pull_4  ;; 0x40049008
        STR      R4,[R3, #+0]
//   46         }break;
        B        ??prot_pull_3
//   47         
//   48         case 1:
//   49         {
//   50             PORT->PUE1 |= (uint32)(1<<ptn);
??prot_pull_2:
        LDR      R3,??prot_pull_4+0x4  ;; 0x4004900c
        LDR      R3,[R3, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        ORRS     R4,R4,R3
        LDR      R3,??prot_pull_4+0x4  ;; 0x4004900c
        STR      R4,[R3, #+0]
//   51         }break;
        B        ??prot_pull_3
//   52         
//   53         case 2:
//   54         {
//   55             PORT->PUE2 |= (uint32)(1<<ptn);
??prot_pull_1:
        LDR      R3,??prot_pull_4+0x8  ;; 0x40049010
        LDR      R3,[R3, #+0]
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        ORRS     R4,R4,R3
        LDR      R3,??prot_pull_4+0x8  ;; 0x40049010
        STR      R4,[R3, #+0]
//   56         }break;
//   57     }
//   58 }
??prot_pull_3:
        POP      {R4,PC}          ;; return
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
// 92 bytes in section .text
// 
// 92 bytes of CODE memory
//
//Errors: none
//Warnings: none
