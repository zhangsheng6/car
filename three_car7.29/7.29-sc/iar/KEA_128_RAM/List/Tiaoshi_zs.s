///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:47
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Tiaoshi_zs.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Tiaoshi_zs.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\Tiaoshi_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_inductor
        EXTERN FTM_PwmDuty
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN man
        EXTERN speed_L
        EXTERN speed_R

        PUBLIC Back_Car
        PUBLIC man_zs

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Tiaoshi_zs.c
//    1 #include "Tiaoshi_zs.h"
//    2 #include "Variable.h"
//    3 #include "common.h"
//    4 #include "allHead.h"
//    5 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void man_zs(void)
//    7 {
man_zs:
        PUSH     {R7,LR}
//    8   if(speed_L>20||speed_R>20)
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1  ;; 0x41a00001
        BL       __aeabi_cfrcmple
        BLS      ??man_zs_0
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1  ;; 0x41a00001
        BL       __aeabi_cfrcmple
        BHI      ??man_zs_1
//    9     man=2;
??man_zs_0:
        MOVS     R0,#+2
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   10 }
??man_zs_1:
        POP      {R0,PC}          ;; return
//   11 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   12 void Back_Car()
//   13 
//   14 {
Back_Car:
        PUSH     {R7,LR}
//   15    if(man>1)
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BLT      ??Back_Car_0
//   16    {
//   17      if(AD_inductor[0]<1&&AD_inductor[1]<1&&AD_inductor[2]<1)
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Back_Car_0
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+4]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Back_Car_0
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+8]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Back_Car_0
//   18      {
//   19 //     speed_set_L=-30;
//   20 //     speed_set_R=-30;
//   21         change_L(0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   22   change_R(0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   23      }
//   24    }
//   25 }
??Back_Car_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x41a00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     man

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     AD_inductor

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
// 128 bytes in section .text
// 
// 128 bytes of CODE memory
//
//Errors: none
//Warnings: none
