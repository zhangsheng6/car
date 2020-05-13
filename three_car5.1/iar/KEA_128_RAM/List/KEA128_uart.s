///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:38
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\lib\C\KEA128_uart.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\lib\C\KEA128_uart.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\KEA_128_RAM\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\KEA_128_RAM\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\KEA_128_RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h -I
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\KEA_128_RAM\List\KEA128_uart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN UART_Send_Byte
        EXTERN __aeabi_uidiv
        EXTERN bus_clk_khz

        PUBLIC UART_Init
        PUBLIC fputc
        PUBLIC uart
        PUBLIC uart_getchar
        PUBLIC uart_mux
        PUBLIC uart_putbuff
        PUBLIC uart_putchar
        PUBLIC uart_putstr
        PUBLIC uart_rx_irq_dis
        PUBLIC uart_rx_irq_en
        PUBLIC uart_txc_irq_dis
        PUBLIC uart_txc_irq_en

// H:\���ܳ�����2018\������֡���ZS\4.27_ZS\lib\C\KEA128_uart.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_uart
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
//   21 #include "KEA128_uart.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable9  ;; 0xe000e100
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LSLS     R1,R1,R0
        LDR      R0,??DataTable9_1  ;; 0xe000e180
        STR      R1,[R0, #+0]
        BX       LR               ;; return
//   22 
//   23 
//   24 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   25 UART_Type * uart[3] = UART_BASES;
uart:
        DATA
        DC32 4006A000H, 4006B000H, 4006C000H
//   26 
//   27 
//   28 /**
//   29   * ���
//   30   *     ʹ�ܴ���ʱ�ӣ����Ÿ���
//   31   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void uart_mux(UARTn uartn)
//   33 {
uart_mux:
        PUSH     {LR}
//   34     switch(uartn)
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??uart_mux_0
        CMP      R0,#+2
        BEQ      ??uart_mux_1
        BCC      ??uart_mux_2
        B        ??uart_mux_3
//   35     {
//   36       case uart0:
//   37         SIM->SCGC |= SIM_SCGC_UART0_MASK;               //ʹ�ܴ���0ʱ��
??uart_mux_0:
        LDR      R0,??DataTable9_2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+13       ;; #+1048576
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_2  ;; 0x40048014
        STR      R1,[R0, #+0]
//   38         if(B0 == UART0_RX_PIN)
//   39         {
//   40             SIM->PINSEL &= ~SIM_PINSEL_UART0PS_MASK;
        LDR      R0,??DataTable9_3  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        BICS     R0,R0,R1
        LDR      R1,??DataTable9_3  ;; 0x4004800c
        STR      R0,[R1, #+0]
//   41         }
//   42         else
//   43         {
//   44             SIM->PINSEL |= SIM_PINSEL_UART0PS_MASK;
//   45         }
//   46         break;
        B        ??uart_mux_4
//   47 
//   48       case uart1:
//   49         SIM->SCGC |= SIM_SCGC_UART1_MASK;               //ʹ�ܴ���0ʱ��
??uart_mux_2:
        LDR      R0,??DataTable9_2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+14       ;; #+2097152
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_2  ;; 0x40048014
        STR      R1,[R0, #+0]
//   50         if(C6 == UART1_RX_PIN)
//   51         {
//   52             SIM->PINSEL1 &= ~SIM_PINSEL1_UART1PS_MASK;
//   53         }
//   54         else
//   55         {
//   56             SIM->PINSEL1 |= SIM_PINSEL1_UART1PS_MASK;
        LDR      R0,??DataTable9_4  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_4  ;; 0x40048010
        STR      R1,[R0, #+0]
//   57         }
//   58         break;
        B        ??uart_mux_4
//   59 
//   60       case uart2:
//   61         SIM->SCGC |= SIM_SCGC_UART2_MASK;               //ʹ�ܴ���0ʱ��
??uart_mux_1:
        LDR      R0,??DataTable9_2  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+15       ;; #+4194304
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_2  ;; 0x40048014
        STR      R1,[R0, #+0]
//   62         if(D6 == UART2_RX_PIN)
//   63         {
//   64             SIM->PINSEL1 &= ~SIM_PINSEL1_UART2PS_MASK;
        LDR      R0,??DataTable9_4  ;; 0x40048010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable9_5  ;; 0xffffdfff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable9_4  ;; 0x40048010
        STR      R1,[R0, #+0]
//   65         }
//   66         else
//   67         {
//   68             SIM->PINSEL1 |= SIM_PINSEL1_UART2PS_MASK;
//   69         }
//   70         break;
        B        ??uart_mux_4
//   71       default :
//   72         break;
//   73 
//   74     }
//   75 }
??uart_mux_3:
??uart_mux_4:
        POP      {PC}             ;; return
//   76 
//   77 //-------------------------------------------------------------------------------------------------------------------
//   78 //  @brief      uart ��ʼ��
//   79 //  @param      uartn           ѡ�񴮿�(uart0,uart1,uart2)
//   80 //  @param      baud            ���ڲ�����
//   81 //  @return     uint32          ʵ�����õò�����
//   82 //  @since      v1.0
//   83 //  Sample usage:               uart_init(uart1,9600);   //��ʼ������1Ϊ1λ��ʼλ��8λ����λ��1λֹͣλ��������9600
//   84 //  @note                       ����KEA128û�в�����΢���Ĵ�������������õò����ʽϸߵ���������Ƚϴ���˷���ʵ�ʲ���������У��
//   85 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 uint32 UART_Init(UARTn uartn, uint32 baud)
//   87 {
UART_Init:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   88     vuint32 uart_input_clk;
//   89     uint32 sbr;
//   90 
//   91     uart_mux(uartn);
        MOVS     R0,R4
        UXTB     R0,R0
        BL       uart_mux
//   92 
//   93     //���õ�ʱ��Ӧ�ý�ֹ���ͺͽ���
//   94     uart[uartn]->C2 &= ~(0
//   95                          | UART_C2_TE_MASK
//   96                          | UART_C2_RE_MASK);
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+3]
        MOVS     R1,#+243
        ANDS     R1,R1,R0
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+3]
//   97 
//   98     //���ó�8λ��У��ģʽ
//   99     //���� UART ���ݸ�ʽ��У�鷽ʽ��ֹͣλλ����ͨ������ UART ģ����ƼĴ��� C1 ʵ�֣�
//  100     uart[uartn]->C1 |= (0
//  101                         //| UART_C1_M_MASK                      //9 λ�� 8 λģʽѡ�� : 0 Ϊ 8λ ��1 Ϊ 9λ��ע���˱�ʾ0����8λ�� �������9λ��λ8��UARTx_C3�
//  102                         //| UART_C1_PE_MASK                     //��żУ��ʹ�ܣ�ע���˱�ʾ���ã�
//  103                         //| UART_C1_PT_MASK                     //У��λ���� : 0 Ϊ żУ�� ��1 Ϊ ��У��
//  104                        );
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable9_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  105 
//  106     //���㲨����
//  107     uart_input_clk = bus_clk_khz * 1000;   //busʱ��
        LDR      R0,??DataTable9_7
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        STR      R0,[SP, #+0]
//  108 
//  109     //UART ������ = UART ģ��ʱ�� / (16 �� SBR[12:0])
//  110     //SBR = UART ģ��ʱ�� / (16 * UART ������)
//  111     sbr = uart_input_clk / (16 * baud); //�������Ҫ�� 0.04���ڣ�����᲻�ȶ������16384
        LDR      R0,[SP, #+0]
        MOVS     R1,#+16
        MULS     R5,R1,R5
        MOVS     R1,R5
        BL       __aeabi_uidiv
        MOVS     R1,R0
//  112     sbr += 1;/* 115200��abr=21.7,0.04�����0.808�����Խ�sbr����Ϊ22,��С��� */
        ADDS     R1,R1,#+1
//  113 //    sbr = ((uart_input_clk>>4)*10 / baud + 5)/10;               //��������
//  114 //    if(sbr > 0x1FFF)sbr = 0x1FFF;                               //SBR �� 13bit�����Ϊ 0x1FFF
//  115 
//  116     //д SBR
//  117     uart[uartn]->BDH &= ~UART_BDH_SBR_MASK;                     //���ԭ��������
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        LDRB     R0,[R0, #+0]
        MOVS     R2,#+224
        ANDS     R2,R2,R0
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R3,R4,R3
        LDR      R0,[R0, R3]
        STRB     R2,[R0, #+0]
//  118     uart[uartn]->BDH |= UART_BDH_SBR(sbr>>8);                   //��д��SBR��λ
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        LDRB     R0,[R0, #+0]
        MOVS     R2,R1
        LSRS     R2,R2,#+8
        LSLS     R2,R2,#+27       ;; ZeroExtS R2,R2,#+27,#+27
        LSRS     R2,R2,#+27
        ORRS     R2,R2,R0
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R3,R4,R3
        LDR      R0,[R0, R3]
        STRB     R2,[R0, #+0]
//  119     uart[uartn]->BDL  = UART_BDL_SBR((uint8)sbr);               //��д��SBR��λ
        MOVS     R0,R1
        LDR      R2,??DataTable9_6
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        STRB     R0,[R2, #+1]
//  120 
//  121     // �����ͺͽ���
//  122     uart[uartn]->C2 |= (0
//  123                         | UART_C2_TE_MASK                       //����ʹ��
//  124                         | UART_C2_RE_MASK                       //����ʹ��
//  125                         //| UART_C2_TIE_MASK                    //�����жϻ�DMA��������ʹ�ܣ�ע���˱�ʾ���ã�
//  126                         //| UART_C2_TCIE_MASK                   //��������ж�ʹ�ܣ�ע���˱�ʾ���ã�
//  127                         //| UART_C2_RIE_MASK                    //�������жϻ�DMA��������ʹ�ܣ�ע���˱�ʾ���ã�
//  128                         );
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        LDRB     R0,[R0, #+3]
        MOVS     R2,#+12
        ORRS     R2,R2,R0
        LDR      R0,??DataTable9_6
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R4,R3,R4
        LDR      R0,[R0, R4]
        STRB     R2,[R0, #+3]
//  129     //����KEA128û�в�����΢���Ĵ�������������õò����ʽϸߵ���������Ƚϴ���˷���ʵ�ʲ���������У��
//  130     return ((uart_input_clk>>4)/sbr);                           //����ʵ�ʲ�����
        LDR      R0,[SP, #+0]
        LSRS     R0,R0,#+4
        BL       __aeabi_uidiv
        POP      {R1,R4,R5,PC}    ;; return
//  131 }
//  132 
//  133 //-------------------------------------------------------------------------------------------------------------------
//  134 //  @brief      ���ڷ���һ���ֽ�
//  135 //  @param      uartn           ѡ�񴮿�
//  136 //  @param      ch              Ҫ���͵��ַ�
//  137 //  @return     void
//  138 //  @since      v1.0
//  139 //  Sample usage:               uart_putchar(uart2,0x5a);
//  140 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  141 void uart_putchar(UARTn uartn, uint8 ch)
//  142 {
uart_putchar:
        PUSH     {LR}
//  143     while( !((uart[uartn]->S1) & UART_S1_TDRE_MASK) );  //�ȴ����ͻ�������
??uart_putchar_0:
        LDR      R2,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R2,[R2, R3]
        LDRB     R2,[R2, #+4]
        LSLS     R2,R2,#+24
        BPL      ??uart_putchar_0
//  144     uart[uartn]->D = (uint8)ch;                         //��������
        LDR      R2,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R2, R0]
        STRB     R1,[R0, #+7]
//  145 }
        POP      {PC}             ;; return
//  146 
//  147 //-------------------------------------------------------------------------------------------------------------------
//  148 //  @brief      ���ڷ�������
//  149 //  @param      uartn           ѡ�񴮿�
//  150 //  @param      *buff           Ҫ���͵������ַ
//  151 //  @param      len             ���ͳ���
//  152 //  @return     void
//  153 //  @since      v1.0
//  154 //  Sample usage:               uart_putbuff(uart2,&a[0],sizeof(a));
//  155 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  156 void uart_putbuff (UARTn uartn, uint8 *buff, uint32 len)
//  157 {
uart_putbuff:
        PUSH     {R4-R6,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,R2
        B        ??uart_putbuff_0
//  158     while(len--)
//  159     {
//  160         uart_putchar(uartn, *buff);
??uart_putbuff_1:
        LDRB     R1,[R4, #+0]
        MOVS     R0,R6
        UXTB     R0,R0
        BL       uart_putchar
//  161         buff++;
        ADDS     R4,R4,#+1
//  162     }
??uart_putbuff_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BNE      ??uart_putbuff_1
//  163 }
        POP      {R4-R6,PC}       ;; return
//  164 
//  165 //-------------------------------------------------------------------------------------------------------------------
//  166 //  @brief      ���ڷ����ַ���
//  167 //  @param      uartn           ѡ�񴮿�
//  168 //  @param      *str            Ҫ���͵��ַ�����ַ
//  169 //  @return     void
//  170 //  @since      v1.0
//  171 //  Sample usage:               uart_putstr(uart2,"i lvoe you");
//  172 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 void uart_putstr (UARTn uartn, const uint8 *str)
//  174 {
uart_putstr:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        B        ??uart_putstr_0
//  175     while(*str)
//  176     {
//  177         uart_putchar(uartn, *str++);
??uart_putstr_1:
        LDRB     R1,[R5, #+0]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       uart_putchar
        ADDS     R5,R5,#+1
//  178     }
??uart_putstr_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BNE      ??uart_putstr_1
//  179 }
        POP      {R0,R4,R5,PC}    ;; return
//  180 
//  181 //-------------------------------------------------------------------------------------------------------------------
//  182 //  @brief      ���ڵȴ�����1���ַ�
//  183 //  @param      uartn           ѡ�񴮿�
//  184 //  @param      *str            ���յĵ�ַ
//  185 //  @return     void
//  186 //  @since      v1.0
//  187 //  Sample usage:               uart_getchar(uart2,&dat);
//  188 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  189 void uart_getchar (UARTn uartn, uint8 *ch)
//  190 {
uart_getchar:
        PUSH     {LR}
//  191     while(!(uart[uartn]->S1 & UART_S1_RDRF_MASK));  //�ȴ���������
??uart_getchar_0:
        LDR      R2,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R2,[R2, R3]
        LDRB     R2,[R2, #+4]
        LSLS     R2,R2,#+26
        BPL      ??uart_getchar_0
//  192     *ch =  uart[uartn]->D;                          // ��ȡ���յ���8λ����
        LDR      R2,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R0,R3,R0
        LDR      R0,[R2, R0]
        LDRB     R0,[R0, #+7]
        STRB     R0,[R1, #+0]
//  193     // ��ȡ 9λ����ʱch Ӧ����uint16 *���͵ķ������ݻ������
//  194     // *ch =   ((( UARTx_C3_REG(UARTN[uartn]) & UART_C3_R8_MASK ) >> UART_C3_R8_SHIFT ) << 8)   |   UART_D_REG(UARTN[uartn]);  //����9bit
//  195 }
        POP      {PC}             ;; return
//  196 
//  197 
//  198 //-------------------------------------------------------------------------------------------------------------------
//  199 //  @brief      ���������ж�
//  200 //  @param      uartn           ѡ�񴮿�
//  201 //  @return     void
//  202 //  @since      v1.0
//  203 //  Sample usage:               uart_rx_irq_en(uart2);
//  204 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void uart_rx_irq_en(UARTn uartn)
//  206 {
uart_rx_irq_en:
        PUSH     {R7,LR}
//  207     uart[uartn]->C2 |= UART_C2_RIE_MASK;                                        //ʹ��UART�����ж�
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        MOVS     R2,#+32
        ORRS     R2,R2,R1
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R1,[R1, R3]
        STRB     R2,[R1, #+3]
//  208     enable_irq((IRQn_Type)((uint8)uartn + UART0_IRQn));                                //ʹ��IRQ�ж�
        ADDS     R0,R0,#+12
        SXTB     R0,R0
        BL       NVIC_EnableIRQ
//  209 }
        POP      {R0,PC}          ;; return
//  210 
//  211 //-------------------------------------------------------------------------------------------------------------------
//  212 //  @brief      ������������ж�
//  213 //  @param      uartn           ѡ�񴮿�
//  214 //  @return     void
//  215 //  @since      v1.0
//  216 //  Sample usage:               uart_txc_irq_en(uart2);
//  217 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 void uart_txc_irq_en(UARTn uartn)
//  219 {
uart_txc_irq_en:
        PUSH     {R7,LR}
//  220     uart[uartn]->C2 |= UART_C2_TCIE_MASK;                                       //ʹ��UART��������ж�
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        MOVS     R2,#+64
        ORRS     R2,R2,R1
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R1,[R1, R3]
        STRB     R2,[R1, #+3]
//  221     enable_irq((IRQn_Type)((uint8)uartn + UART0_IRQn));                                //ʹ��IRQ�ж�
        ADDS     R0,R0,#+12
        SXTB     R0,R0
        BL       NVIC_EnableIRQ
//  222 }
        POP      {R0,PC}          ;; return
//  223 
//  224 //-------------------------------------------------------------------------------------------------------------------
//  225 //  @brief      ��ֹ�����ж�
//  226 //  @param      uartn           ѡ�񴮿�
//  227 //  @return     void
//  228 //  @since      v1.0
//  229 //  Sample usage:               uart_rx_irq_dis(uart2);
//  230 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  231 void uart_rx_irq_dis(UARTn uartn)
//  232 {
uart_rx_irq_dis:
        PUSH     {R7,LR}
//  233     uart[uartn]->C2 &= ~UART_C2_RIE_MASK;                                       //��ֹUART�����ж�
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        MOVS     R2,#+223
        ANDS     R2,R2,R1
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R1,[R1, R3]
        STRB     R2,[R1, #+3]
//  234 
//  235     //��������жϻ�û�йأ��򲻹ر�IRQ
//  236     if(!(uart[uartn]->C2 & (UART_C2_TIE_MASK | UART_C2_TCIE_MASK)) )
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        MOVS     R2,#+192
        TST      R1,R2
        BNE      ??uart_rx_irq_dis_0
//  237     {
//  238         disable_irq((IRQn_Type)((uint8)uartn + UART0_IRQn));                           //��IRQ�ж�
        ADDS     R0,R0,#+12
        SXTB     R0,R0
        BL       NVIC_DisableIRQ
//  239     }
//  240 }
??uart_rx_irq_dis_0:
        POP      {R0,PC}          ;; return
//  241 
//  242 //-------------------------------------------------------------------------------------------------------------------
//  243 //  @brief      ��ֹ��������ж�
//  244 //  @param      uartn           ѡ�񴮿�
//  245 //  @return     void
//  246 //  @since      v1.0
//  247 //  Sample usage:               uart_txc_irq_dis(uart2);
//  248 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  249 void uart_txc_irq_dis(UARTn uartn)
//  250 {
uart_txc_irq_dis:
        PUSH     {R7,LR}
//  251     uart[uartn]->C2 &= ~UART_C2_TCIE_MASK;                                      //��ֹUART��������ж�
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        MOVS     R2,#+191
        ANDS     R2,R2,R1
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        LDR      R1,[R1, R3]
        STRB     R2,[R1, #+3]
//  252 
//  253     //��������жϻ�û�йأ��򲻹ر�IRQ
//  254     if(!(uart[uartn]->C2 & UART_C2_RIE_MASK) )
        LDR      R1,??DataTable9_6
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        LDRB     R1,[R1, #+3]
        LSLS     R1,R1,#+26
        BMI      ??uart_txc_irq_dis_0
//  255     {
//  256         disable_irq((IRQn_Type)((uint8)uartn + UART0_IRQn));              //��IRQ�ж�
        ADDS     R0,R0,#+12
        SXTB     R0,R0
        BL       NVIC_DisableIRQ
//  257     }
//  258 }
??uart_txc_irq_dis_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x4004800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x40048010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     0xffffdfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     uart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     bus_clk_khz
//  259 
//  260 //�����жϺ����뵽isr.c�ļ��ο�
//  261 
//  262 
//  263 
//  264 //-------------------------------------------------------------------------------------------------------------------
//  265 //  @brief      �ض���printf ������
//  266 //  @param      ch      ��Ҫ��ӡ���ֽ�
//  267 //  @param      stream  ������
//  268 //  @since      v1.0
//  269 //  @note       �˺����ɱ������Դ������printf������
//  270 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  271 int fputc(int ch, FILE *stream)
//  272 {
fputc:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  273 //    uart_putchar(DEBUG_PORT, (char)ch);
//  274     UART_Send_Byte((char)ch);
        MOVS     R0,R4
        UXTB     R0,R0
        BL       UART_Send_Byte
//  275     return(ch);
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  276 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  277 
//  278 
//  279 
//  280 
//  281 
//  282 
//  283 
//  284 
//  285 
//  286 
//  287 
//  288 
// 
//  12 bytes in section .data
// 708 bytes in section .text
// 
// 708 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
