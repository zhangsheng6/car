///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:05
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\outputdata.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\outputdata.c -D IAR
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\outputdata.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN UART_Send_Byte
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_uidivmod

        PUBLIC CRC_CHECK
        PUBLIC OutPut_Data

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\outputdata.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    outputdata.c
//    8   * 文件标识：
//    9   * 摘    要：    VisualScope_V090206破解版 虚拟示波器 通信协议
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年2月28日 17:05:44
//   14   ******************************************************************************
//   15   */
//   16 #include "outputdata.h"
//   17 #include "uart.h"
//   18 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT)
//   20 {
CRC_CHECK:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
//   21     unsigned short CRC_Temp;
//   22     unsigned char i,j;
//   23     CRC_Temp = 0xffff;
        LDR      R0,??DataTable0  ;; 0xffff
//   24 
//   25     for (i=0;i<CRC_CNT; i++){
        MOVS     R3,#+0
        B        ??CRC_CHECK_0
??CRC_CHECK_1:
        ADDS     R3,R3,#+1
??CRC_CHECK_0:
        UXTB     R3,R3
        UXTB     R1,R1
        CMP      R3,R1
        BCS      ??CRC_CHECK_2
//   26         CRC_Temp ^= Buf[i];
        UXTB     R3,R3
        LDRB     R4,[R2, R3]
        EORS     R0,R0,R4
//   27         for (j=0;j<8;j++) {
        MOVS     R4,#+0
        B        ??CRC_CHECK_3
//   28             if (CRC_Temp & 0x01)
//   29                 CRC_Temp = (CRC_Temp >>1 ) ^ 0xa001;
//   30             else
//   31                 CRC_Temp = CRC_Temp >> 1;
??CRC_CHECK_4:
        UXTH     R0,R0
        LSRS     R0,R0,#+1
??CRC_CHECK_5:
        ADDS     R4,R4,#+1
??CRC_CHECK_3:
        UXTB     R4,R4
        CMP      R4,#+8
        BGE      ??CRC_CHECK_1
        LSLS     R5,R0,#+31
        BPL      ??CRC_CHECK_4
        MOVS     R5,R0
        UXTH     R5,R5
        LSRS     R5,R5,#+1
        LDR      R0,??DataTable0_1  ;; 0xa001
        EORS     R0,R0,R5
        B        ??CRC_CHECK_5
//   32         }
//   33     }
//   34     return(CRC_Temp);
??CRC_CHECK_2:
        UXTH     R0,R0
        POP      {R4,R5,PC}       ;; return
//   35 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0xa001
//   36 
//   37 
//   38 /**
//   39   * 简介
//   40   *     发送函数
//   41   * 注意
//   42   *     x, y, z, w -> 通道 1 2 3 4
//   43   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void OutPut_Data(float x, float y, float z, float w)
//   45 {
OutPut_Data:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+48
        MOVS     R6,R1
        MOVS     R4,R2
        MOVS     R5,R3
//   46   int temp[4] = {0};
        ADD      R0,SP,#+12
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   47   unsigned int temp1[4] = {0};
        ADD      R0,SP,#+28
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   48   unsigned char databuf[10] = {0};
        MOV      R0,SP
        MOVS     R1,#+12
        BL       __aeabi_memclr4
//   49   unsigned char i;
//   50   unsigned short CRC16 = 0;
        MOVS     R7,#+0
//   51 
//   52   temp[0] = (int)x;
        LDR      R0,[SP, #+48]
        BL       __aeabi_f2iz
        STR      R0,[SP, #+12]
//   53   temp[1] = (int)y;
        MOVS     R0,R6
        BL       __aeabi_f2iz
        STR      R0,[SP, #+16]
//   54   temp[2] = (int)z;
        MOVS     R0,R4
        BL       __aeabi_f2iz
        STR      R0,[SP, #+20]
//   55   temp[3] = (int)w;
        MOVS     R0,R5
        BL       __aeabi_f2iz
        STR      R0,[SP, #+24]
//   56 
//   57   for(i=0;i<4;i++)
        MOVS     R4,#+0
        B        ??OutPut_Data_0
//   58    {
//   59     temp1[i] = (unsigned int)temp[i];
??OutPut_Data_1:
        ADD      R0,SP,#+12
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        ADD      R1,SP,#+28
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//   60    }
        ADDS     R4,R4,#+1
??OutPut_Data_0:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OutPut_Data_1
//   61 
//   62   for(i=0;i<4;i++)
        MOVS     R4,#+0
        B        ??OutPut_Data_2
//   63   {
//   64     databuf[i*2]   = (unsigned char)(temp1[i]%256);
??OutPut_Data_3:
        ADD      R0,SP,#+28
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_uidivmod
        MOV      R0,SP
        UXTB     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRB     R1,[R0, R2]
//   65     databuf[i*2+1] = (unsigned char)(temp1[i]/256);
        ADD      R0,SP,#+28
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LSRS     R0,R0,#+8
        MOV      R1,SP
        UXTB     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRB     R0,[R1, #+1]
//   66   }
        ADDS     R4,R4,#+1
??OutPut_Data_2:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OutPut_Data_3
//   67 
//   68   CRC16 = CRC_CHECK(databuf,8);
        MOVS     R1,#+8
        MOV      R0,SP
        BL       CRC_CHECK
        MOVS     R7,R0
//   69   databuf[8] = CRC16%256;
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idivmod
        MOV      R0,SP
        STRB     R1,[R0, #+8]
//   70   databuf[9] = CRC16/256;
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        MOV      R1,SP
        STRB     R0,[R1, #+9]
//   71 
//   72   for(i=0;i<10;i++)
        MOVS     R4,#+0
        B        ??OutPut_Data_4
//   73     UART_Send_Byte((char)databuf[i]);
??OutPut_Data_5:
        MOV      R0,SP
        UXTB     R4,R4
        LDRB     R0,[R0, R4]
        BL       UART_Send_Byte
        ADDS     R4,R4,#+1
??OutPut_Data_4:
        UXTB     R4,R4
        CMP      R4,#+10
        BLT      ??OutPut_Data_5
//   74 }
        ADD      SP,SP,#+52
        POP      {R4-R7,PC}       ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
// 
//  44 bytes in section .rodata
// 302 bytes in section .text
// 
// 302 bytes of CODE  memory
//  44 bytes of CONST memory
//
//Errors: none
//Warnings: none
