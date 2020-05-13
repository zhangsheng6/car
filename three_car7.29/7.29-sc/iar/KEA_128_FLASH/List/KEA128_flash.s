///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:37:58
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_flash.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_flash.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\device\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\user\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\KEA128_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv
        EXTERN bus_clk_khz

        PUBLIC FLASH_EraseSector
        PUBLIC FLASH_GetSectorSize
        PUBLIC FLASH_Init
        PUBLIC FLASH_WriteSector
        PUBLIC FlashCmdStart
        PUBLIC s_flash_command_run
        PUBLIC s_flash_run_entry

// H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_flash.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_flash
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
//   21 #include "KEA128_flash.h"
//   22 
//   23 
//   24 
//   25 // flash commands
//   26 #define ERASE_VERITF_ALL_BLOCKS             0x01  // ����������������
//   27 #define ERASE_VERITF_BLOCKS                 0x02  // �����������ݿ�
//   28 #define ERASE_VERITF_FLASH_SECTION          0x03  // ��������Flash ��
//   29 #define READ_ONCE                           0x04  // ��ȡһ��
//   30 #define PROGRAM_FLASH                       0x06  // ���Flash
//   31 #define PROGRAM_ONCE                        0x07  // ���һ��
//   32 #define ERASE_ALL_BLOCKS                    0x08  // ������������
//   33 #define ERASE_FLASH_BLOCKS                  0x09  // ����Flash ����
//   34 #define ERASE_FLASH_SECTOR                  0x0A  // ����Flash ����
//   35 #define UNSECURE_FLASH                      0x0B  // ���ܵ�Flash
//   36 #define VERITF_BACKDOOR_ACCESS_KEY          0x0C  // ������ŷ�����Կ
//   37 #define SET_USER_MARGIN_LEVEL               0x0D  // �����û�ԣ��ˮƽ
//   38 #define SET_FACTORY_MARGIN_LEVEL            0x0E  // ���ó���ԣ��ˮƽ
//   39 #define CONFIGURE_NVM                       0x0F  // ����NVM
//   40 
//   41 
//   42 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   43 volatile uint8 s_flash_command_run[] = {0x00, 0xB5, 0x80, 0x21, 0x01, 0x70, 0x01, 0x78, 0x09, 0x06, 0xFC, 0xD5,0x00, 0xBD};
s_flash_command_run:
        DATA
        DC8 0, 181, 128, 33, 1, 112, 1, 120, 9, 6, 252, 213, 0, 189, 0, 0
//   44 typedef void (*flash_run_entry_t)(volatile uint8 *reg);

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 flash_run_entry_t s_flash_run_entry;
s_flash_run_entry:
        DS8 4
//   46 
//   47 //�ڲ�ʹ��

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 uint8 FlashCmdStart(void)
//   49 {
FlashCmdStart:
        PUSH     {R7,LR}
//   50     DISABLE_INTERRUPTS;
        CPSID    I
//   51 
//   52     FTF->FSTAT = FTMRE_FSTAT_FPVIOL_MASK | FTMRE_FSTAT_ACCERR_MASK;
        MOVS     R0,#+48
        LDR      R1,??DataTable3  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   53 
//   54     s_flash_run_entry = (flash_run_entry_t)((uint32)s_flash_command_run + 1);
        LDR      R0,??DataTable3_1
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   55     s_flash_run_entry(&FTF->FSTAT);
        LDR      R0,??DataTable3  ;; 0x40020005
        LDR      R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        BLX      R1
//   56 
//   57     ENABLE_INTERRUPTS;
        CPSIE    I
//   58 
//   59     if(FTF->FSTAT & (FTMRE_FSTAT_ACCERR_MASK | FTMRE_FSTAT_FPVIOL_MASK | FTMRE_FSTAT_MGSTAT_MASK)) return 1;	//���ִ���
        LDR      R0,??DataTable3  ;; 0x40020005
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+51
        TST      R0,R1
        BEQ      ??FlashCmdStart_0
        MOVS     R0,#+1
        B        ??FlashCmdStart_1
//   60     return 0;												//�ɹ�
??FlashCmdStart_0:
        MOVS     R0,#+0
??FlashCmdStart_1:
        POP      {R1,PC}          ;; return
//   61 }
//   62 
//   63 
//   64 //-------------------------------------------------------------------------------------------------------------------
//   65 //  @brief      FLASH��ʼ��
//   66 //  @return     				����һ�������Ĵ�С
//   67 //  @since      v1.0
//   68 //  Sample usage:               uint32 dat = FLASH_GetSectorSize();
//   69 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   70 uint32 FLASH_GetSectorSize(void)
//   71 {
//   72     return SECTOR_SIZE;
FLASH_GetSectorSize:
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BX       LR               ;; return
//   73 }
//   74 
//   75 //-------------------------------------------------------------------------------------------------------------------
//   76 //  @brief      FLASH��ʼ��
//   77 //  @return     void
//   78 //  @since      v1.0
//   79 //  Sample usage:
//   80 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   81 void FLASH_Init(void)
//   82 {
FLASH_Init:
        PUSH     {R4,LR}
//   83     uint16 clk;
//   84 
//   85     SIM->SCGC |= SIM_SCGC_FLASH_MASK;                                   //����flashʱ��
        LDR      R0,??DataTable3_3  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_3  ;; 0x40048014
        STR      R1,[R0, #+0]
//   86 
//   87     while(!(FTF->FSTAT & FTMRE_FSTAT_CCIF_MASK));                       //�ȴ�֮ǰ�������
??FLASH_Init_0:
        LDR      R0,??DataTable3  ;; 0x40020005
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??FLASH_Init_0
//   88 
//   89     clk = bus_clk_khz/1000-1;
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_uidiv
        SUBS     R0,R0,#+1
        MOVS     R4,R0
//   90 
//   91     FTF->FCLKDIV = FTMRE_FCLKDIV_FDIV(clk) | FTMRE_FCLKDIV_FDIVLCK_MASK;//����flash��Ƶϵ��
        MOVS     R0,R4
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_5  ;; 0x40020003
        STRB     R1,[R0, #+0]
//   92 
//   93     FTF->FSTAT = FTMRE_FSTAT_FPVIOL_MASK | FTMRE_FSTAT_ACCERR_MASK;     //���״̬��ʶ
        MOVS     R0,#+48
        LDR      R1,??DataTable3  ;; 0x40020005
        STRB     R0,[R1, #+0]
//   94 }
        POP      {R4,PC}          ;; return
//   95 
//   96 //-------------------------------------------------------------------------------------------------------------------
//   97 //  @brief      FLASH��������
//   98 //  @param      SectorNum 		��Ҫ�������������
//   99 //  @return     				����1����ʧ�ܣ�����0�����ɹ�
//  100 //  @since      v1.0
//  101 //  Sample usage:               uint32 dat = FLASH_GetSectorSize(10);
//  102 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  103 uint8 FLASH_EraseSector(uint32 SectorNum)
//  104 {
FLASH_EraseSector:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  105     uint32 addr;
//  106 
//  107 	addr = (uint32)SectorNum*SECTOR_SIZE;
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        MULS     R0,R4,R0
        MOVS     R5,R0
//  108 
//  109     FTF->FCCOBIX = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  110     FTF->FCCOBHI = ERASE_FLASH_SECTOR;
        MOVS     R0,#+10
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  111     FTF->FCCOBLO = addr>>16;
        MOVS     R0,R5
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable3_8  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  112 
//  113     FTF->FCCOBIX = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  114     FTF->FCCOBHI = (addr&0xffff)>>8;
        MOVS     R0,R5
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  115     FTF->FCCOBLO = addr&0xff;
        MOVS     R0,R5
        LDR      R1,??DataTable3_8  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  116 
//  117     FlashCmdStart();
        BL       FlashCmdStart
//  118 
//  119     return 0;
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return
//  120 }
//  121 
//  122 //-------------------------------------------------------------------------------------------------------------------
//  123 //  @brief      FLASH����д�뵽����
//  124 //  @param      SectorNum 		��Ҫд����������
//  125 //  @param      *buf	 		�����׵�ַ
//  126 //  @param      len		 		д����ֽ��� �ر�����һ��uint16�����������ֽ� һ��uint32�������ĸ��ֽ� ÿ��д��ó��ȱ���Ϊ4�ñ���
//  127 //  @param      offset		 	����Ϊ4��������
//  128 //  @return     				����1д��ʧ�ܣ�����0д��ɹ�
//  129 //  @since      v1.0
//  130 //  Sample usage:               FLASH_WriteSector(10,(const uint8 *)buf,4,0);//��buf���������ǰ��λ����д�뵽10������(ÿһλ��uint8����)
//  131 //  @note                       ʹ��flashʱ����ô����һ��������ʼʹ�ã����һ��������Ϊ255
//  132 //-------------------------------------------------------------------------------------------------------------------
//  133 
//  134 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 uint8 FLASH_WriteSector(uint32 SectorNum, const uint8 *buf, uint32 len, uint32 offset)
//  136 {
FLASH_WriteSector:
        PUSH     {R0,R2-R7,LR}
        MOVS     R4,R1
//  137     uint16 step, i;
//  138     uint32 addr;
//  139 
//  140 	addr = (uint32)SectorNum*SECTOR_SIZE + offset;
        LDR      R0,[SP, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        MULS     R0,R1,R0
        LDR      R1,[SP, #+8]
        ADDS     R0,R0,R1
        MOVS     R6,R0
//  141 
//  142     step = 4;
        MOVS     R0,#+4
        MOVS     R7,R0
//  143 
//  144 	for(i=0; i<len; i+=step)
        MOVS     R0,#+0
        MOVS     R5,R0
??FLASH_WriteSector_0:
        UXTH     R5,R5
        LDR      R0,[SP, #+4]
        CMP      R5,R0
        BCS      ??FLASH_WriteSector_1
//  145 	{
//  146         FTF->FCCOBIX = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  147         FTF->FCCOBHI = PROGRAM_FLASH;
        MOVS     R0,#+6
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  148         FTF->FCCOBLO = addr>>16;
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable3_8  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  149 
//  150         FTF->FCCOBIX = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  151         FTF->FCCOBHI = (addr&0xFFFF)>>8;
        MOVS     R0,R6
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  152         FTF->FCCOBLO = addr&0xFC;
        MOVS     R0,R6
        MOVS     R1,#+252
        ANDS     R1,R1,R0
        LDR      R0,??DataTable3_8  ;; 0x40020008
        STRB     R1,[R0, #+0]
//  153 
//  154         FTF->FCCOBIX = 2;
        MOVS     R0,#+2
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  155         FTF->FCCOBLO = buf[0];
        LDRB     R0,[R4, #+0]
        LDR      R1,??DataTable3_8  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  156         FTF->FCCOBHI = buf[1];
        LDRB     R0,[R4, #+1]
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  157 
//  158         FTF->FCCOBIX = 3;
        MOVS     R0,#+3
        LDR      R1,??DataTable3_6  ;; 0x40020001
        STRB     R0,[R1, #+0]
//  159         FTF->FCCOBLO = buf[2];
        LDRB     R0,[R4, #+2]
        LDR      R1,??DataTable3_8  ;; 0x40020008
        STRB     R0,[R1, #+0]
//  160         FTF->FCCOBHI = buf[3];
        LDRB     R0,[R4, #+3]
        LDR      R1,??DataTable3_7  ;; 0x40020009
        STRB     R0,[R1, #+0]
//  161 
//  162         buf += step;
        UXTH     R7,R7
        ADDS     R4,R4,R7
//  163         addr += step;
        UXTH     R7,R7
        ADDS     R6,R6,R7
//  164 
//  165         FlashCmdStart();
        BL       FlashCmdStart
//  166     }
        ADDS     R5,R5,R7
        B        ??FLASH_WriteSector_0
//  167     return 0;
??FLASH_WriteSector_1:
        MOVS     R0,#+0
        POP      {R1-R7,PC}       ;; return
//  168 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     s_flash_command_run+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     s_flash_run_entry

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40020003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x40020001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x40020008

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  169 
//  170 
//  171 
// 
//   4 bytes in section .bss
//  16 bytes in section .data
// 342 bytes in section .text
// 
// 342 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
