///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:34
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\flash.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\flash.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FLASH_EraseSector
        EXTERN FLASH_Init
        EXTERN FLASH_WriteSector

        PUBLIC FLASH_Int32WriteOffset
        PUBLIC FLASH_UintFloatW
        PUBLIC Flash_Init

// H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\flash.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    flash.c
//    8   * 文件标识：
//    9   * 摘    要：    flash操作
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年5月7日 17:25:35
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "flash.h"
//   18 #include "KEA128_flash.h"
//   19 
//   20 /**
//   21   * @brief  flash初始化
//   22   * @param  clear 1 清除该扇区, 0 不清除
//   23   * @note   如果不清除扇区，则扇区内保存的内容永不丢失，
//   24   *         包括下载程序，也不会清除掉该扇区内容，
//   25   *         除非程序代码用到了那个扇区,但那个扇区是倒数的 512B
//   26   *         如果程序使用到了那个扇区，请修改程序，你的程序太多了
//   27   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void Flash_Init(uint8 clear)
//   29 {
Flash_Init:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   30     FLASH_Init();
        BL       FLASH_Init
//   31     if (clear)  FLASH_EraseSector(FLASH_BLOCK_0);
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??Flash_Init_0
        MOVS     R0,#+255
        BL       FLASH_EraseSector
//   32 }
??Flash_Init_0:
        POP      {R4,PC}          ;; return
//   33 
//   34 /**
//   35   * @brief  顺序写入flash
//   36   * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
//   37   *         num     写入数据
//   38   * @return offset  本次数据的偏移值
//   39   * @note   将数据的偏移值保存起来，读取数据时使用
//   40   *         一次必须要写入一个字，所以8位数据也要转换成32位
//   41   *         不要输入 double 它需要8B，此函数不适用
//   42   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 uint8 FLASH_UintFloatW(void *num)
//   44 {
FLASH_UintFloatW:
        PUSH     {R4,LR}
//   45     static uint8 time = 0;
//   46     uint8 offset = 4*time;
        LDR      R1,??DataTable0
        LDRB     R4,[R1, #+0]
        MOVS     R1,#+4
        MULS     R4,R1,R4
//   47 
//   48     FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)num, 4, 4*time++);//每一个int32造成4B偏移
        LDR      R1,??DataTable0
        LDRB     R3,[R1, #+0]
        MOVS     R1,R3
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable0
        STRB     R1,[R2, #+0]
        UXTB     R3,R3
        MOVS     R1,#+4
        MULS     R3,R1,R3
        MOVS     R2,#+4
        MOVS     R1,R0
        MOVS     R0,#+255
        BL       FLASH_WriteSector
//   49 
//   50     return offset;
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//   51 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     ??time

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??time:
        DS8 1
//   52 
//   53 /**
//   54   * @brief  定点写入flash
//   55   * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
//   56   *         num     写入数据
//   57   *         offset  偏移值
//   58   * @return
//   59   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   60 void FLASH_Int32WriteOffset(int32 num, uint8 offset)
//   61 {
FLASH_Int32WriteOffset:
        PUSH     {R0,LR}
//   62     FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)(&num), 4, offset);//每一个int32造成4B偏移
        UXTB     R1,R1
        MOVS     R3,R1
        MOVS     R2,#+4
        MOV      R1,SP
        MOVS     R0,#+255
        BL       FLASH_WriteSector
//   63 }
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
//   64 
//   65 
//   66 
//   67 
// 
//  1 byte  in section .bss
// 88 bytes in section .text
// 
// 88 bytes of CODE memory
//  1 byte  of DATA memory
//
//Errors: none
//Warnings: none
