///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:06
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\device\C\spi.c
//    Command line =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\device\C\spi.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
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
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\spi.s
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

// I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\device\C\spi.c
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
        PUSH     {R1,R3-R7,LR}
        SUB      SP,SP,#+52
        MOVS     R7,R0
        MOVS     R4,R2
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
        UXTB     R7,R7
        CMP      R7,#+0
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
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??spi_init_2
//   74     {
//   75         min_diff = ~0;
        MOVS     R5,#+0
        MVNS     R5,R5            ;; #-1
//   76         for(i=0; i<9; i++)
        MOVS     R6,#+0
        B        ??spi_init_3
//   77         {
//   78             for(j=0; j<8; j++)
??spi_init_4:
        ADDS     R4,R4,#+1
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
        UXTB     R6,R6
        MOVS     R3,#+4
        MULS     R3,R6,R3
        LDR      R2,[R2, R3]
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        LDR      R1,[SP, #+56]
        SUBS     R0,R0,R1
        BL       abs
//   81                 if(min_diff > diff)
        CMP      R0,R5
        BCS      ??spi_init_4
//   82                 {
//   83                     //������Ѳ���
//   84                     sppr = j;
        MOV      R1,SP
        STRB     R4,[R1, #+1]
//   85                     spr = i;
        MOV      R1,SP
        STRB     R6,[R1, #+0]
//   86                     min_diff = diff;
        MOVS     R5,R0
//   87 
//   88                     if(min_diff == 0)	break;//�պ�ƥ��
        CMP      R5,#+0
        BNE      ??spi_init_4
//   89                 }
//   90             }
??spi_init_6:
        ADDS     R6,R6,#+1
??spi_init_3:
        UXTB     R6,R6
        CMP      R6,#+9
        BGE      ??spi_init_7
        MOVS     R4,#+0
        B        ??spi_init_5
//   91         }
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
??spi_init_7:
        ADD      R0,SP,#+52
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+1
        MOVS     R1,#+92
        ORRS     R1,R1,R0
        LDR      R0,??DataTable1_6
        UXTB     R7,R7
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+0]
//  103         SPIN[spin]->C2 = pcs << SPI_C2_MODFEN_SHIFT;            //���C1_SSOEλѡ��Ƭѡ���ŵĹ���
        ADD      R0,SP,#+52
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+4
        LDR      R1,??DataTable1_6
        UXTB     R7,R7
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+1]
//  104         SPIN[spin]->BR = SPI_BR_SPR(spr) | SPI_BR_SPPR(sppr);   //���ò����ʲ���
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        LSLS     R1,R1,#+4
        MOVS     R2,#+112
        ANDS     R2,R2,R1
        ORRS     R2,R2,R0
        LDR      R0,??DataTable1_6
        UXTB     R7,R7
        MOVS     R1,#+4
        MULS     R7,R1,R7
        LDR      R0,[R0, R7]
        STRB     R2,[R0, #+2]
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
        ADD      SP,SP,#+60
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
        PUSH     {R4-R6,LR}
        LDR      R1,[SP, #+16]
        B        ??spi_mosi_0
//  122     while(len)
//  123     {
//  124         SPI_TX_WAIT(spin);
//  125         SPIN[spin]->D = *modata;
//  126         SPI_RX_WAIT(spin);
//  127         if(midata != NULL)  *midata = SPIN[spin]->D;
//  128         else                SPIN[spin]->D;
??spi_mosi_1:
        LDR      R4,??DataTable1_6
        UXTB     R0,R0
        MOVS     R5,#+4
        MULS     R5,R0,R5
        LDR      R4,[R4, R5]
        LDRB     R4,[R4, #+5]
//  129         len--;
??spi_mosi_2:
        SUBS     R1,R1,#+1
//  130         modata++;
        ADDS     R2,R2,#+1
//  131         if(midata != NULL)  midata++;
        CMP      R3,#+0
        BEQ      ??spi_mosi_0
        ADDS     R3,R3,#+1
??spi_mosi_0:
        CMP      R1,#+0
        BEQ      ??spi_mosi_3
??spi_mosi_4:
        LDR      R4,??DataTable1_6
        UXTB     R0,R0
        MOVS     R5,#+4
        MULS     R5,R0,R5
        LDR      R4,[R4, R5]
        LDRB     R4,[R4, #+3]
        LSLS     R4,R4,#+26
        BPL      ??spi_mosi_4
        LDRB     R4,[R2, #+0]
        LDR      R5,??DataTable1_6
        UXTB     R0,R0
        MOVS     R6,#+4
        MULS     R6,R0,R6
        LDR      R5,[R5, R6]
        STRB     R4,[R5, #+5]
??spi_mosi_5:
        LDR      R4,??DataTable1_6
        UXTB     R0,R0
        MOVS     R5,#+4
        MULS     R5,R0,R5
        LDR      R4,[R4, R5]
        LDRB     R4,[R4, #+3]
        LSLS     R4,R4,#+24
        BPL      ??spi_mosi_5
        CMP      R3,#+0
        BEQ      ??spi_mosi_1
        LDR      R4,??DataTable1_6
        UXTB     R0,R0
        MOVS     R5,#+4
        MULS     R5,R0,R5
        LDR      R4,[R4, R5]
        LDRB     R4,[R4, #+5]
        STRB     R4,[R3, #+0]
        B        ??spi_mosi_2
//  132     }
//  133 }
??spi_mosi_3:
        POP      {R4-R6,PC}       ;; return

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
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  150     spi_mosi(spin,pcs,mocmd,micmd,cmdlen);
        LDR      R0,[SP, #+24]
        STR      R0,[SP, #+0]
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,R4
        UXTB     R0,R0
        BL       spi_mosi
//  151     spi_mosi(spin,pcs,modata,midata,len);
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+20]
        LDR      R2,[SP, #+16]
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,R4
        UXTB     R0,R0
        BL       spi_mosi
//  152 }
        POP      {R0,R4,R5,PC}    ;; return

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
// 470 bytes in section .text
// 
// 470 bytes of CODE  memory
//  44 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
