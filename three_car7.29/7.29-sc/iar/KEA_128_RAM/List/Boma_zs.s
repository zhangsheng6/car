///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       17/Jul/2018  09:48:29
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Boma_zs.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Boma_zs.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\Boma_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioGet

        PUBLIC BO_Scan
        PUBLIC Boma_Gear_ZS

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Boma_zs.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 #include  "Boma_zs.h"
//    5 extern int Boma_num;
//    6 
//    7 /**
//    8   * 简介
//    9   *     拨码按键检测
//   10   * 备注
//   11 0     1     2    3     4
//   12 0000 0001  0010 0011  0100
//   13 通过四个IO口的不同高低电平切换，2*2*2*2=16，共0-15，16个挡位
//   14   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 uint8 BO_Scan(void)
//   16 {
BO_Scan:
        PUSH     {R4,LR}
//   17     uint8 num = 0;
        MOVS     R4,#+0
//   18 
//   19     if (GpioGet(KEY_BO_0) == UP)    num |= ((uint8)(1<<3));//num |= 1000
        MOVS     R0,#+43
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_0
        MOVS     R0,R4
        MOVS     R4,#+8
        ORRS     R4,R4,R0
//   20     if (GpioGet(KEY_BO_1) == UP)    num |= ((uint8)(1<<2));//num |= 0100
??BO_Scan_0:
        MOVS     R0,#+56
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_1
        MOVS     R0,R4
        MOVS     R4,#+4
        ORRS     R4,R4,R0
//   21     if (GpioGet(KEY_BO_2) == UP)    num |= ((uint8)(1<<1));//num |= 0010
??BO_Scan_1:
        MOVS     R0,#+57
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_2
        MOVS     R0,R4
        MOVS     R4,#+2
        ORRS     R4,R4,R0
//   22     if (GpioGet(KEY_BO_3) == UP)    num |= ((uint8)(1<<0));//num |= 0000
??BO_Scan_2:
        MOVS     R0,#+64
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_3
        MOVS     R0,R4
        MOVS     R4,#+1
        ORRS     R4,R4,R0
//   23 
//   24     return num;
??BO_Scan_3:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//   25 }
//   26 //

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 void Boma_Gear_ZS(void)
//   28 {
Boma_Gear_ZS:
        PUSH     {R7,LR}
//   29   switch(BO_Scan())
        BL       BO_Scan
        CMP      R0,#+1
//   30   {
//   31      case 1:
//   32     
//   33     
//   34   }
//   35 }
??Boma_Gear_ZS_0:
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: 1
