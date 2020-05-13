///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\common.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\common.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\common.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_uidiv

        PUBLIC bus_clk_khz
        PUBLIC core_clk_khz
        PUBLIC ftm_clk_khz
        PUBLIC get_clk
        PUBLIC ics_clk_khz
        PUBLIC write_vtor

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\common.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		common
//   11  * @company	   		成都逐飞科技有限公司
//   12  * @author     		逐飞科技(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 #include "common.h"
//   21 #include "system_SKEAZ1284.h"
//   22 
//   23 #define EX_REF_CLK  16000 //(定义外部参考时钟为16000KHZ)

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 uint32 ics_clk_khz;
ics_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 uint32 ftm_clk_khz;
ftm_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 uint32 core_clk_khz;
core_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 uint32 bus_clk_khz;
bus_clk_khz:
        DS8 4
//   28 
//   29 
//   30 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void get_clk(void)
//   32 {
get_clk:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   33     uint16 prescaler_factor[]={1,2,4,8,16,32,64,128,256,512,1024};
        MOV      R0,SP
        LDR      R1,??DataTable1
        MOVS     R2,#+24
        BL       __aeabi_memcpy4
//   34 
//   35     if(2 == KEA128_CLOCK)   //内部时钟
//   36     {
//   37         ics_clk_khz = 48000;
//   38         ftm_clk_khz = 48000;
//   39         core_clk_khz = 48000;
//   40         bus_clk_khz = 24000;
//   41     }
//   42     else                    //外部时钟
//   43     {
//   44         ics_clk_khz  = EX_REF_CLK * 1280 ;
        LDR      R0,??DataTable1_1  ;; 0x1388000
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//   45         ics_clk_khz = ics_clk_khz / prescaler_factor[((ICS->C1&ICS_C1_RDIV_MASK) >> ICS_C1_RDIV_SHIFT) + 5];    //计算FLL输出频率
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOV      R1,SP
        LDR      R2,??DataTable1_3  ;; 0x40064000
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2
        LSRS     R2,R2,#+3
        LSLS     R2,R2,#+29       ;; ZeroExtS R2,R2,#+29,#+29
        LSRS     R2,R2,#+29
        MOVS     R3,#+2
        MULS     R2,R3,R2
        ADDS     R1,R1,R2
        LDRH     R1,[R1, #+10]
        BL       __aeabi_uidiv
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//   46         ics_clk_khz = ics_clk_khz / prescaler_factor[(ICS->C2&ICS_C2_BDIV_MASK) >> ICS_C2_BDIV_SHIFT];          //计算ICSCLKOUT
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOV      R1,SP
        LDR      R2,??DataTable1_4  ;; 0x40064001
        LDRB     R2,[R2, #+0]
        UXTB     R2,R2
        LSRS     R2,R2,#+5
        MOVS     R3,#+2
        MULS     R2,R3,R2
        LDRH     R1,[R1, R2]
        BL       __aeabi_uidiv
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//   47 
//   48         core_clk_khz = ics_clk_khz  / (((SIM->CLKDIV&SIM_CLKDIV_OUTDIV1_MASK) >> SIM_CLKDIV_OUTDIV1_SHIFT) + 1);
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5  ;; 0x40048024
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+28
        LSLS     R1,R1,#+30       ;; ZeroExtS R1,R1,#+30,#+30
        LSRS     R1,R1,#+30
        ADDS     R1,R1,#+1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   49         bus_clk_khz  = core_clk_khz / (((SIM->CLKDIV&SIM_CLKDIV_OUTDIV2_MASK) >> SIM_CLKDIV_OUTDIV2_SHIFT) + 1);
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5  ;; 0x40048024
        LDR      R2,[R1, #+0]
        MOVS     R1,R2
        LSLS     R1,R1,#+7        ;; ZeroExtS R1,R1,#+7,#+31
        LSRS     R1,R1,#+31
        ADDS     R1,R1,#+1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   50         ftm_clk_khz  = ics_clk_khz  / (((SIM->CLKDIV&SIM_CLKDIV_OUTDIV3_MASK) >> SIM_CLKDIV_OUTDIV3_SHIFT) + 1);
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5  ;; 0x40048024
        LDR      R2,[R1, #+0]
        MOVS     R1,R2
        LSLS     R1,R1,#+11       ;; ZeroExtS R1,R1,#+11,#+31
        LSRS     R1,R1,#+31
        ADDS     R1,R1,#+1
        BL       __aeabi_uidiv
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//   51     }
//   52 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//   53 
//   54 
//   55 //-------------------------------------------------------------------------------------------------------------------
//   56 //  @brief      设置中断向量表地址
//   57 //  @param      vtor            新的中断向量表地址
//   58 //  @return     void
//   59 //  @since      v1.0
//   60 //  Sample usage:               write_vtor(0x1fff0000);;
//   61 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62 void write_vtor (int vtor)
//   63 {
//   64     // Write the VTOR with the new value
//   65     SCB->VTOR = vtor;
write_vtor:
        LDR      R1,??DataTable1_9  ;; 0xe000ed08
        STR      R0,[R1, #+0]
//   66 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x1388000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     ics_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40048024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     ftm_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0xe000ed08

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC16 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024
        DC8 0, 0

        END
//   67 
//   68 
//   69 
//   70 
// 
//  16 bytes in section .bss
//  24 bytes in section .rodata
// 204 bytes in section .text
// 
// 204 bytes of CODE  memory
//  24 bytes of CONST memory
//  16 bytes of DATA  memory
//
//Errors: none
//Warnings: none
