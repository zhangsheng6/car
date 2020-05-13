///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:38:03
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\device\C\outputdata_zs.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\device\C\outputdata_zs.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\device\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\user\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\lib\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\outputdata_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN UART_SendArray

        PUBLIC uart_sendware_float

// H:\智能车程序2018\三轮比赛\7.29-sc\device\C\outputdata_zs.c
//    1 #include "uart.h"
//    2 #include "outputdata_zs.h"
//    3 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    4 void uart_sendware_float(float x,float y,float z,float w)
//    5 {
uart_sendware_float:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R6,R3
//    6 #define CMD_WARE 3
//    7   
//    8   float var[4];
//    9   
//   10   var[0] = x;
        STR      R5,[SP, #+4]
//   11   var[1] = y;
        STR      R4,[SP, #+8]
//   12   var[2] = z;
        STR      R7,[SP, #+12]
//   13   var[3] = w;
        STR      R6,[SP, #+16]
//   14   
//   15    uint8 cmdf[2] = {CMD_WARE, ~CMD_WARE};    //串口调试 使用的前命令
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        LDR      R1,??uart_sendware_float_0
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//   16    uint8 cmdr[2] = {~CMD_WARE, CMD_WARE};    //串口调试 使用的后命令
        MOV      R0,SP
        LDR      R1,??uart_sendware_float_0+0x4
        LDRH     R2,[R1, #0]
        STRH     R2,[R0, #0]
//   17 
//   18    UART_SendArray( cmdf,sizeof(cmdf));    //先发送前命令
        MOVS     R1,#+2
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        BL       UART_SendArray
//   19    UART_SendArray( (uint8_t *)var,sizeof(var));    //发送数据
        MOVS     R1,#+16
        ADD      R0,SP,#+4
        BL       UART_SendArray
//   20    UART_SendArray( cmdr,sizeof(cmdr));    //发送后命令
        MOVS     R1,#+2
        MOV      R0,SP
        BL       UART_SendArray
//   21 
//   22 }
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return
        DATA
??uart_sendware_float_0:
        DC32     ?_0
        DC32     ?_1

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
?_0:
        DATA
        DC8 3, 252

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
?_1:
        DATA
        DC8 252, 3

        END
//   23 
//   24 
//   25 
//   26 
//   27 
// 
//  4 bytes in section .rodata
// 76 bytes in section .text
// 
// 76 bytes of CODE  memory
//  4 bytes of CONST memory
//
//Errors: none
//Warnings: none
