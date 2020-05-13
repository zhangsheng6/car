///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\5.1\device\C\spi.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\device\C\spi.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\spi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_uidiv
        EXTERN abs
        EXTERN bus_clk_khz

        PUBLIC SPIN
        PUBLIC spi_init
        PUBLIC spi_mosi
        PUBLIC spi_mosi_cmd

// H:\���ܳ�����2018\������֡���ZS\5.1\device\C\spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�    spi.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��
//   10   *
//   11   * ��ǰ�汾��     1.0
//   12   * ��    ��     ��־ΰ
//   13   * ʱ    �䣺     2018��1��23�� 10:55:52
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "spi.h"
//   18 
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 SPI_Type* SPIN[2] = SPI_BASES; //��������ָ�����鱣�� SPIx �ĵ�ַ
SPIN:
        DATA
        DC32 40076000H, 40077000H
//   21 
//   22 
//   23 
//   24 #define SPI_TX_WAIT(SPIn)	while( !( SPIN[SPIn]->S & SPI_S_SPTEF_MASK ) )  //�ȴ��������
//   25 #define SPI_RX_WAIT(SPIn)   while( !( SPIN[SPIn]->S & SPI_S_SPRF_MASK ) )   //�ȴ���������
//   26 
//   27 
//   28 //-------------------------------------------------------------------------------------------------------------------
//   29 //  @brief      SPI��ʼ��
//   30 //  @param      spin            ѡ��SPIģ��   ��spi0 spi1
//   31 //  @param      pcs             ѡ��Ƭѡ����
//   32 //  @param      master          ѡ������ģʽ
//   33 //  @param      baud            ѡ��ͨ������
//   34 //  @return     				������ʵ������
//   35 //  @since      v2.0
//   36 //  Sample usage:       		uint32 baud = spi_init(spi0,USE_PCS,MASTER,1*1000*1000);              //��ʼ��SPI,����ģʽ, ������Ϊ1M ,������ʵ�����ʵ�baud����
//   37 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   38 uint32 spi_init(SPIn_e spin, SPI_PCSn_e pcs, SPI_CFG master,uint32 baud)
//   39 {
spi_init:
        PUSH     {R0-R7,LR}
        SUB      SP,SP,#+52
//   40     uint8 i,j;
//   41     uint8 sppr,spr;
//   42     uint32 Scaler[] = {2,4,8,16,32,64,128,256,512};
        ADD      R0,SP,#+12
        LDR      R1,??DataTable1
        MOVS     R2,#+36
        BL       __aeabi_memcpy4
//   43     uint8  Prescaler[] = {1,2,3,4,5,6,7,8};
        ADD      R0,SP,#+4
        LDR      R1,??DataTable1_1
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//   44     uint32 min_diff, diff;
//   45 
//   46     if(spi0 == spin)
        ADD      R0,SP,#+52
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??spi_init_0
//   47     {
//   48         SIM->SCGC |= SIM_SCGC_SPI0_MASK;    //����ʱ��
        LDR      R0,??DataTable1_2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+11       ;; #+262144
        ORRS     R1,R1,R0
        LDR      R0,??DataTable1_2  ;; 0x40048014
        STR      R1,[R0, #+0]
//   49         //���Ÿ���
//   50         if(B2 == SPI0_SCK_PIN)
//   51         {
//   52             SIM->PINSEL &= ~(uint32)SIM_PINSEL_SPI0PS_MASK;
        LDR      R0,??DataTable1_3  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        BICS     R0,R0,R1
        LDR      R1,??DataTable1_3  ;; 0x4004800c
        STR      R0,[R1, #+0]
        B        ??spi_init_1
//   53         }
//   54         else
//   55         {
//   56             SIM->PINSEL |= SIM_PINSEL_SPI0PS_MASK;
//   57         }
//   58     }
//   59     else
//   60     {
//   61         SIM->SCGC |= SIM_SCGC_SPI1_MASK;    //����ʱ��
??spi_init_0:
        LDR      R0,??DataTable1_2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+12       ;; #+524288
        ORRS     R1,R1,R0
        LDR      R0,??DataTable1_2  ;; 0x40048014
        STR      R1,[R0, #+0]
//   62         //���Ÿ���
//   63         if(D0 == SPI1_SCK_PIN)
//   64         {
//   65             SIM->PINSEL1 &= ~(uint32)SIM_PINSEL1_SPI1PS_MASK;
//   66         }
//   67         else
//   68         {
//   69             SIM->PINSEL1 |= SIM_PINSEL1_SPI1PS_MASK;
        LDR      R0,??DataTable1_4  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        ORRS     R1,R1,R0
        LDR      R0,??DataTable1_4  ;; 0x40048010
        STR      R1,[R0, #+0]
//   70         }
//   71     }
//   72     //�������ӻ�ģʽ���ù���ģʽ �������Ϊ����ʱ�ӵĶ���֮һ
//   73     if(master == MASTER)
??spi_init_1:
        ADD      R0,SP,#+60
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??spi_init_2
//   74     {
//   75         min_diff = ~0;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        MOVS     R6,R0
//   76         for(i=0; i<9; i++)
        MOVS     R0,#+0
        MOVS     R5,R0
??spi_init_3:
        UXTB     R5,R5
        CMP      R5,#+9
        BGE      ??spi_init_4
//   77         {
//   78             for(j=0; j<8; j++)
        MOVS     R0,#+0
        MOVS     R4,R0
??spi_init_5:
        UXTB     R4,R4
        CMP      R4,#+8
        BGE      ??spi_init_6
//   79             {
//   80                 diff = abs(bus_clk_khz*1000/(Prescaler[j]*Scaler[i]) - baud);
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        ADD      R1,SP,#+4
        UXTB     R4,R4
        LDRB     R1,[R1, R4]
        ADD      R2,SP,#+12
        UXTB     R5,R5
        MOVS     R3,#+4
        MULS     R3,R5,R3
        LDR      R2,[R2, R3]
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        LDR      R1,[SP, #+64]
        SUBS     R0,R0,R1
        BL       abs
        MOVS     R7,R0
//   81                 if(min_diff > diff)
        CMP      R7,R6
        BCS      ??spi_init_7
//   82                 {
//   83                     //������Ѳ���
//   84                     sppr = j;
        MOV      R0,SP
        STRB     R4,[R0, #+1]
//   85                     spr = i;
        MOV      R0,SP
        STRB     R5,[R0, #+0]
//   86                     min_diff = diff;
        MOVS     R6,R7
//   87 
//   88                     if(min_diff == 0)	break;//�պ�ƥ��
        CMP      R6,#+0
        BEQ      ??spi_init_6
//   89                 }
//   90             }
??spi_init_7:
        ADDS     R4,R4,#+1
        B        ??spi_init_5
//   91         }
??spi_init_6:
        ADDS     R5,R5,#+1
        B        ??spi_init_3
//   92 
//   93         SPIN[spin]->C1 = (0
//   94                           | (pcs << SPI_C1_SSOE_SHIFT)          //���C2_MODFENλѡ��Ƭѡ���ŵĹ���
//   95                           | SPI_C1_SPE_MASK                     //SPI ϵͳʹ��
//   96                           | SPI_C1_MSTR_MASK                    //SPI ģ������ΪSPI ����
//   97                           //| SPI_C1_SPIE_MASK                  //SPRF ��MODF Ϊ1 ʱ����Ӳ���ж�
//   98                           //| SPI_C1_SPTIE_MASK                 //SPTEF Ϊ1 ʱ������Ӳ���жϡ�
//   99                           | SPI_C1_CPOL_MASK                  //0���ߵ�ƽ��ЧSPI ʱ�ӣ�����ʱΪ�͵�ƽ�� 1���͵�ƽ��ЧSPI ʱ�ӣ�����ʱΪ�ߵ�ƽ��
//  100                           | SPI_C1_CPHA_MASK                            //0:SPSCK �ϵĵ�һ�����س��������ݴ���ĵ�һ�����ڵ��м� 1:SPSCK �ϵĵ�һ�����س��������ݴ���ĵ�һ�����ڵĿ�ʼ
//  101                           //| SPI_C1_LSBFE_MASK                 //1:SPI �������ݴ���������Чλ��ʼ
//  102                           );
??spi_init_4:
        ADD      R0,SP,#+56
        LDRB     R0,[R0, #+0]
        LSLS     R1,R0,#+1
        MOVS     R0,#+92
        ORRS     R0,R0,R1
        LDR      R1,??DataTable1_6
        ADD      R2,SP,#+52
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+0]
//  103         SPIN[spin]->C2 = pcs << SPI_C2_MODFEN_SHIFT;            //���C1_SSOEλѡ��Ƭѡ���ŵĹ���
        ADD      R0,SP,#+56
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+4
        LDR      R1,??DataTable1_6
        ADD      R2,SP,#+52
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+1]
//  104         SPIN[spin]->BR = SPI_BR_SPR(spr) | SPI_BR_SPPR(sppr);   //���ò����ʲ���
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R1,R0,#+28       ;; ZeroExtS R1,R0,#+28,#+28
        LSRS     R1,R1,#+28
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R2,R0,#+4
        MOVS     R0,#+112
        ANDS     R0,R0,R2
        ORRS     R0,R0,R1
        LDR      R1,??DataTable1_6
        ADD      R2,SP,#+52
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  105     }
//  106     else{}
//  107     return (bus_clk_khz*1000/Prescaler[sppr]/Scaler[spr]);      //����ʵ�ʲ�����
??spi_init_2:
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        ADD      R1,SP,#+4
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LDRB     R1,[R1, R2]
        BL       __aeabi_uidiv
        ADD      R1,SP,#+12
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_uidiv
        ADD      SP,SP,#+68
        POP      {R4-R7,PC}       ;; return
//  108 }
//  109 
//  110 //-------------------------------------------------------------------------------------------------------------------
//  111 //  @brief      SPI���ͽ��պ���
//  112 //  @param      spin            ѡ��SPIģ��   ��spi0 spi1
//  113 //  @param      modata          ���͵����ݻ�������ַ(����Ҫ������ NULL)
//  114 //  @param      midata          ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
//  115 //  @param      len             ���͵��ֽ���
//  116 //  @return     void
//  117 //  @since      v2.0
//  118 //  Sample usage:       		spi_mosi(spi0,buf,buf,1);    //����buff�����ݣ������յ�buf�����Ϊ1�ֽ�
//  119 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void spi_mosi(SPIn_e spin, SPI_PCSn_e pcs, uint8 *modata, uint8 *midata, uint32 len)
//  121 {
spi_mosi:
        PUSH     {R4-R7,LR}
        LDR      R4,[SP, #+20]
//  122     while(len)
??spi_mosi_0:
        CMP      R4,#+0
        BEQ      ??spi_mosi_1
//  123     {
//  124         SPI_TX_WAIT(spin);
??spi_mosi_2:
        LDR      R5,??DataTable1_6
        UXTB     R0,R0
        MOVS     R6,#+4
        MULS     R6,R0,R6
        LDR      R5,[R5, R6]
        LDRB     R5,[R5, #+3]
        LSLS     R5,R5,#+26
        BPL      ??spi_mosi_2
//  125         SPIN[spin]->D = *modata;
        LDRB     R5,[R2, #+0]
        LDR      R6,??DataTable1_6
        UXTB     R0,R0
        MOVS     R7,#+4
        MULS     R7,R0,R7
        LDR      R6,[R6, R7]
        STRB     R5,[R6, #+5]
//  126         SPI_RX_WAIT(spin);
??spi_mosi_3:
        LDR      R5,??DataTable1_6
        UXTB     R0,R0
        MOVS     R6,#+4
        MULS     R6,R0,R6
        LDR      R5,[R5, R6]
        LDRB     R5,[R5, #+3]
        LSLS     R5,R5,#+24
        BPL      ??spi_mosi_3
//  127         if(midata != NULL)  *midata = SPIN[spin]->D;
        CMP      R3,#+0
        BEQ      ??spi_mosi_4
        LDR      R5,??DataTable1_6
        UXTB     R0,R0
        MOVS     R6,#+4
        MULS     R6,R0,R6
        LDR      R5,[R5, R6]
        LDRB     R5,[R5, #+5]
        STRB     R5,[R3, #+0]
        B        ??spi_mosi_5
//  128         else                SPIN[spin]->D;
??spi_mosi_4:
        LDR      R5,??DataTable1_6
        UXTB     R0,R0
        MOVS     R6,#+4
        MULS     R6,R0,R6
        LDR      R5,[R5, R6]
        LDRB     R5,[R5, #+5]
//  129         len--;
??spi_mosi_5:
        SUBS     R4,R4,#+1
//  130         modata++;
        ADDS     R2,R2,#+1
//  131         if(midata != NULL)  midata++;
        CMP      R3,#+0
        BEQ      ??spi_mosi_0
        ADDS     R3,R3,#+1
        B        ??spi_mosi_0
//  132     }
//  133 }
??spi_mosi_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x40048010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     SPIN
//  134 
//  135 //-------------------------------------------------------------------------------------------------------------------
//  136 //  @brief      SPI���ͽ��պ���
//  137 //  @param      spin            ѡ��SPIģ��   ��spi0 spi1
//  138 //  @param      mocmd           ���͵����������ַ(����Ҫ������ NULL)
//  139 //  @param      micmd           ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
//  140 //  @param      modata          ���͵����ݻ�������ַ(����Ҫ������ NULL)
//  141 //  @param      midata          ��������ʱ���յ������ݵĴ洢��ַ(����Ҫ������ NULL)
//  142 //  @param      cmdlen          ����������ֽ���
//  143 //  @param      len             �������ݵ��ֽ���
//  144 //  @return     void
//  145 //  @since      v2.0
//  146 //  Sample usage:       		spi_mosi_cmd(spi0,cmd,NULL,buff,buff,1,2);    //����cmd/buff�����ݣ�������cmd����ʱ�����ݣ�����buff����ʱ�����ݵ�buff����ȷֱ�Ϊ1��2�ֽ�
//  147 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  148 void spi_mosi_cmd(SPIn_e spin, SPI_PCSn_e pcs, uint8 *mocmd , uint8 *micmd , uint8 *modata , uint8 *midata, uint32 cmdlen , uint32 len)
//  149 {
spi_mosi_cmd:
        PUSH     {R1-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        LDR      R7,[SP, #+44]
        LDR      R6,[SP, #+48]
        LDR      R5,[SP, #+52]
//  150     spi_mosi(spin,pcs,mocmd,micmd,cmdlen);
        STR      R6,[SP, #+0]
        LDR      R3,[SP, #+16]
        LDR      R2,[SP, #+12]
        MOV      R0,SP
        LDRB     R1,[R0, #+8]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       spi_mosi
//  151     spi_mosi(spin,pcs,modata,midata,len);
        STR      R5,[SP, #+0]
        MOVS     R3,R7
        LDR      R2,[SP, #+40]
        MOV      R0,SP
        LDRB     R1,[R0, #+8]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       spi_mosi
//  152 }
        ADD      SP,SP,#+20
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
?_0:
        DATA
        DC32 2, 4, 8, 16, 32, 64, 128, 256, 512

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 1, 2, 3, 4, 5, 6, 7, 8

        END
//  153 
//  154 
// 
//   8 bytes in section .data
//  44 bytes in section .rodata
// 492 bytes in section .text
// 
// 492 bytes of CODE  memory
//  44 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
