///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:47
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\7.17\device\C\uart.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\7.17\device\C\uart.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\7.17\iar\KEA_128_RAM\List\uart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN OLED_HEXACSII
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod
        EXTERN uart

        PUBLIC UART_GetData
        PUBLIC UART_Int16
        PUBLIC UART_SendArray
        PUBLIC UART_SendFloat
        PUBLIC UART_Send_Byte
        PUBLIC UART_Send_Enter
        PUBLIC UART_Send_Hex
        PUBLIC UART_Send_String
        PUBLIC UART_Uint16

// H:\���ܳ�����2018\������֡���ZS\7.17\device\C\uart.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�    uart.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��
//   10   *
//   11   * ��ǰ�汾��     1.0
//   12   * ��    ��     ��־ΰ
//   13   * ʱ    �䣺     2018��1��7�� 20:47:48
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "uart.h"
//   18 #include "stdio.h"
//   19 #include "stdarg.h"
//   20 
//   21 //char UART_SendFloatArray[FLOAT_ARRAY_NUM];//ʹ��UART_SendFloat()����ʱ����
//   22 
//   23 
//   24 /**
//   25   * ���
//   26   *     ����һ�� �ֽ�
//   27   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void UART_Send_Byte(char ch)
//   29 {
UART_Send_Byte:
        PUSH     {LR}
//   30     //�ȴ����ͻ�������
//   31     while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
??UART_Send_Byte_0:
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??UART_Send_Byte_0
//   32     //��������
//   33     uart[UART_PART]->D = (uint8)ch;
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        STRB     R0,[R1, #+7]
//   34 }
        POP      {PC}             ;; return
//   35 
//   36 /**
//   37   * ���
//   38   *     ����һ�� �س�
//   39   * ע��
//   40   *         ���� - ASCII - ʮ������ - ����
//   41   *     �س� CR  -   \r  -  0x0d   - �ƶ���������е���ʼλ��
//   42   *     ���� LF  -   \n  -  0x0a   - ��������һ��������ʼλ��
//   43   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void UART_Send_Enter(void)
//   45 {
UART_Send_Enter:
        PUSH     {R7,LR}
//   46     UART_Send_Byte(0x0d);//��������
        MOVS     R0,#+13
        BL       UART_Send_Byte
//   47     UART_Send_Byte(0x0a);//ת��
        MOVS     R0,#+10
        BL       UART_Send_Byte
//   48 }
        POP      {R0,PC}          ;; return
//   49 
//   50 /**
//   51   * ���
//   52   *     ����һ�� �ַ���
//   53   * ע��
//   54   *     1
//   55   *       ��ֹ������û�з�������ʱ����ѭ��
//   56   *     2
//   57   *       ��������ʱ�����̫Ƶ�������´󲿷�ʱ�䶼��ѭ���У�ʹ�����޷��ж�
//   58   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 void UART_Send_String(char *str)
//   60 {
UART_Send_String:
        PUSH     {LR}
        B        ??UART_Send_String_0
//   61 //    uint16 i = 0;
//   62 
//   63     while (*str != '\0')
//   64     {
//   65         //�ȴ����ͻ�������
//   66         while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
??UART_Send_String_1:
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??UART_Send_String_1
//   67 //        {
//   68 //            if (++i >= 65530)   //��ֹû�����ݷ���ʱ��������ѭ��
//   69 //                break;
//   70 //        }
//   71         //��������
//   72         uart[UART_PART]->D = (uint8)(*str++);
        LDRB     R1,[R0, #+0]
        LDR      R2,??DataTable3
        LDR      R2,[R2, #+8]
        STRB     R1,[R2, #+7]
        ADDS     R0,R0,#+1
//   73     }
??UART_Send_String_0:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BNE      ??UART_Send_String_1
//   74 }
        POP      {PC}             ;; return
//   75 
//   76 
//   77 
//   78 ///**
//   79 //  * ���
//   80 //  *     ��������
//   81 //  * ����
//   82 //  *     array   ������
//   83 //  *     len     �ֽ���
//   84 //  */
//   85 //void UART_SendArray(char *array, uint8 len)
//   86 //{
//   87 //    while (len--)
//   88 //    {
//   89 //        UART_Send_Byte(*array++);
//   90 //    }
//   91 //}
//   92 /**
//   93   * ���
//   94   *     ��������
//   95   * ����
//   96   *     array   ������
//   97   *     len     �ֽ���
//   98   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 void UART_SendArray(uint8 *array, uint32 len)
//  100 {
UART_SendArray:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        B        ??UART_SendArray_0
//  101     while (len--)
//  102     {
//  103         UART_Send_Byte(*array);
??UART_SendArray_1:
        LDRB     R0,[R5, #+0]
        BL       UART_Send_Byte
//  104         array++;
        ADDS     R5,R5,#+1
//  105     }
??UART_SendArray_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE      ??UART_SendArray_1
//  106 }
        POP      {R0,R4,R5,PC}    ;; return
//  107 
//  108 //��һ��8λ������ASCII����ʽ����

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 void UART_Send_Hex(uint8 data)
//  110 {
UART_Send_Hex:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  111     uint8 temp;
//  112     temp=data>>4;
        MOVS     R0,R4
        UXTB     R0,R0
        LSRS     R0,R0,#+4
//  113     if(temp>=10)
        UXTB     R0,R0
        CMP      R0,#+10
        BLT      ??UART_Send_Hex_0
//  114         UART_Send_Byte(temp-10+'A');
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_1
//  115     else
//  116         UART_Send_Byte(temp+'0');
??UART_Send_Hex_0:
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  117     temp=data&0x0F;
??UART_Send_Hex_1:
        LSLS     R0,R4,#+28       ;; ZeroExtS R0,R4,#+28,#+28
        LSRS     R0,R0,#+28
//  118     if(temp>=10)
        UXTB     R0,R0
        CMP      R0,#+10
        BLT      ??UART_Send_Hex_2
//  119         UART_Send_Byte(temp-10+'A');
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_3
//  120     else
//  121         UART_Send_Byte(temp+'0');
??UART_Send_Hex_2:
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  122 }
??UART_Send_Hex_3:
        POP      {R4,PC}          ;; return
//  123 
//  124 /**
//  125   * ���
//  126   *     UART �����޷�����
//  127   * ����
//  128   *     num         �޷�����
//  129   * ��ע
//  130   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void UART_Uint16(uint16 num, uint8 enter)
//  132 {
UART_Uint16:
        PUSH     {R0-R4,LR}
        MOVS     R4,R1
//  133 	uint8 *ch1,ch[7], m[7];
//  134     uint8 i = 0;
        MOVS     R1,#+0
//  135 
//  136     if (num == 0)
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??UART_Uint16_0
//  137     {
//  138         m[0] = '0';
        MOVS     R0,#+48
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  139         m[1] = '\0';
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??UART_Uint16_1
//  140     }
//  141     else
//  142 	{
//  143         OLED_HEXACSII(num,ch);
??UART_Uint16_0:
        ADD      R1,SP,#+8
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  144         ch1 =&ch[1];
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+1
        B        ??UART_Uint16_2
//  145         while (*ch1 == '0')
//  146         {
//  147             ch1++;
??UART_Uint16_3:
        ADDS     R0,R0,#+1
//  148         }
??UART_Uint16_2:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+48
        BEQ      ??UART_Uint16_3
//  149         for (i=0; *ch1 != '\0'; i++)
        MOVS     R1,#+0
        B        ??UART_Uint16_4
//  150         {
//  151             m[i] = *ch1;
??UART_Uint16_5:
        LDRB     R2,[R0, #+0]
        MOV      R3,SP
        UXTB     R1,R1
        STRB     R2,[R3, R1]
//  152             ch1++;
        ADDS     R0,R0,#+1
//  153         }
        ADDS     R1,R1,#+1
??UART_Uint16_4:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BNE      ??UART_Uint16_5
//  154         m[i] = '\0';
        MOVS     R0,#+0
        MOV      R2,SP
        UXTB     R1,R1
        STRB     R0,[R2, R1]
//  155     }
//  156 
//  157     UART_Send_String((char *)m);	//��ʾ����
??UART_Uint16_1:
        MOV      R0,SP
        BL       UART_Send_String
//  158 
//  159     if (enter)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??UART_Uint16_6
//  160     {
//  161         UART_Send_Enter();
        BL       UART_Send_Enter
//  162     }
//  163 }
??UART_Uint16_6:
        POP      {R0-R4,PC}       ;; return
//  164 
//  165 /**
//  166   * ���
//  167   *     UART���� �з����� (-32768 ~ 32767)
//  168   * ����
//  169   *     num         �� ������
//  170   * ��ע
//  171   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void UART_Int16(int16 num, uint8 enter)
//  173 {
UART_Int16:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  174 	if (num < 0)
        SXTH     R5,R5
        CMP      R5,#+0
        BPL      ??UART_Int16_0
//  175     {
//  176         num = -num;
        MOVS     R0,R5
        SXTH     R0,R0
        RSBS     R5,R0,#+0
//  177         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  178     }
//  179     UART_Uint16(num, 0);
??UART_Int16_0:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTH     R0,R0
        BL       UART_Uint16
//  180 
//  181     if (enter)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??UART_Int16_1
//  182     {
//  183         UART_Send_Enter();
        BL       UART_Send_Enter
//  184     }
//  185 }
??UART_Int16_1:
        POP      {R0,R4,R5,PC}    ;; return
//  186 
//  187 /**
//  188   * ���
//  189   *     ���� float
//  190   * ����
//  191   *     data    ����
//  192   *     enter
//  193   *         0   �����ͻس�
//  194   *         1   ���ͻس�
//  195   * ��ע
//  196   *     float ��Χ -3.40E+38 ~ 3.40E+38
//  197   *     ��������������������float��������С���ܳ���uint32��С��ע�⾫��
//  198   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  199 void UART_SendFloat(float data, uint8 enter)
//  200 {
UART_SendFloat:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
//  201     uint8 temp = 3;//С����ʾλ��
        MOVS     R5,#+3
//  202     uint32 integer;//�洢����
//  203     float decimals;//�洢С��
//  204     uint8 decimalsInterger;//С��ת��Ϊ����
//  205 
//  206     if (data < 0)
        MOVS     R0,R6
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??UART_SendFloat_0
//  207     {
//  208         data = -data;
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R6,R6,R0
//  209         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  210     }
//  211 
//  212     integer = (uint32)data;
??UART_SendFloat_0:
        MOVS     R0,R6
        BL       __aeabi_f2uiz
        STR      R0,[SP, #+0]
//  213     decimals = data - (float)integer;
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fsub
        MOVS     R4,R0
//  214 
//  215     //��������
//  216     if (data > 9999)
        MOVS     R0,R6
        LDR      R1,??DataTable3_1  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI      ??UART_SendFloat_1
//  217     {
//  218         UART_Uint16(integer/10000, 0);
        MOVS     R1,#+0
        MOVS     R6,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidiv
        MOVS     R1,R6
        UXTH     R0,R0
        BL       UART_Uint16
//  219     }
//  220     UART_Uint16(integer%10000, 0);
??UART_SendFloat_1:
        MOVS     R1,#+0
        MOVS     R6,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidivmod
        MOVS     R0,R1
        MOVS     R1,R6
        UXTH     R0,R0
        BL       UART_Uint16
//  221 
//  222     //����С��
//  223     UART_Send_Byte('.');
        MOVS     R0,#+46
        BL       UART_Send_Byte
        B        ??UART_SendFloat_2
//  224     while (temp)
//  225     {
//  226         temp --;
??UART_SendFloat_3:
        SUBS     R5,R5,#+1
//  227         decimals *= 10;
        LDR      R0,??DataTable3_3  ;; 0x41200000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  228         decimalsInterger = (uint8)decimals + 0x30;
        MOVS     R0,R4
        BL       __aeabi_f2iz
        MOVS     R6,R0
        ADDS     R6,R6,#+48
//  229         UART_Send_Byte((char)decimalsInterger);
        MOVS     R0,R6
        UXTB     R0,R0
        BL       UART_Send_Byte
//  230         decimals = decimals - (float)(decimalsInterger-0x30);
        UXTB     R6,R6
        SUBS     R6,R6,#+48
        MOVS     R0,R6
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
//  231     }
??UART_SendFloat_2:
        UXTB     R5,R5
        CMP      R5,#+0
        BNE      ??UART_SendFloat_3
//  232 
//  233     if (enter)
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??UART_SendFloat_4
//  234     {
//  235         UART_Send_Enter();
        BL       UART_Send_Enter
//  236     }
//  237 }
??UART_SendFloat_4:
        POP      {R0,R4-R7,PC}    ;; return
//  238 
//  239 /**
//  240   * ���
//  241   *     ��ȡ��������
//  242   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 uint8 UART_GetData()
//  244 {
UART_GetData:
        PUSH     {LR}
//  245     uint8 temp = 0;
        MOVS     R0,#+0
//  246 
//  247     if ( uart[UART_PART]->S1 & UART_S1_RDRF_MASK)
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+26
        BPL      ??UART_GetData_0
//  248     {
//  249 
//  250         temp =  uart[UART_PART]->D;
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+8]
        LDRB     R0,[R0, #+7]
//  251     }
//  252 
//  253     return temp;
??UART_GetData_0:
        UXTB     R0,R0
        POP      {PC}             ;; return
//  254 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     uart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x461c3c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x41200000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  255 
//  256 
//  257 
//  258 
//  259 /* -------------------------------------------------------------- δ��ɵĺ��� */
//  260 
//  261 
//  262 /* ------------------------------------------------  δ��ɵĺ��� -------- END */
//  263 
//  264 
//  265 
//  266 /* -------------------------------------- ��BUG�ĺ��� �����򲻵��� ǧ��Ҫʹ�� */
//  267 
//  268 
//  269 /**
//  270   * ���
//  271   *     printf���ڴ�ӡ
//  272   * ��ע
//  273   *     �����ں��ṩ
//  274   *     �˺�������ɿ�������ļ����޸Ķ��޷�ʹ�ã����ź����������Ƕѻ�����
//  275   *     ������ײ�printf�Ѿ�����ָ���ˣ����Կ�ֱ��ʹ��printf
//  276   *     printf�Ķ˿��� DEBUG_PORT�궨��������������� DEBUG_BAUD ����
//  277   *     ���������ԣ���ɶ���� printf �޷����� %f ����
//  278   */
//  279 //void UART_Send_Printf(const char *fmt,...)
//  280 //{
//  281 //    va_list ap;             //���������ַ
//  282 //    char string[64] = {0}; //���ý��ͺõ��ַ���
//  283 //
//  284 //    //���ַ���ת���ɴ��ڿɷ��͵�
//  285 //    va_start(ap, fmt);      //�������һ��ʵ�ʲ����ĵ�ַ
//  286 //    vsnprintf(string, 64, fmt, ap); //������ĸ�ʽ�ַ������н���
//  287 //    va_end(ap);                     //apָ�����
//  288 //
//  289 //    //���ͽ��ͺõ��ַ���
//  290 //    UART_Send_String(string);
//  291 //}
//  292 
//  293 /**
//  294   * ���
//  295   *     ���� float ����
//  296   * ����
//  297   *     date    ����
//  298   *     len     ��ʾ����
//  299   *     enter   �Ƿ��ͻس�
//  300   *       0  ������
//  301   *       1  ����
//  302   * ��ע
//  303   *     �˺���ǧ��Ҫ�����������嶼��Ҫ����������ɿ��printf
//  304   *     �˺��������sprintf��һ������bug����ʱ��ֻ�Ƕ����һ�£�
//  305   *     ��һ����������������ͻῨ��
//  306   */
//  307 //void UART_SendFloat(float date,  uint8 len, uint8 enter)
//  308 //{
//  309 //
//  310 ////    uint8 i = 0;
//  311 ////
//  312 ////    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  313 ////    {
//  314 ////        UART_FloatArray[i] = 0;
//  315 ////    }
//  316 ////
//  317 ////    sprintf(UART_FloatArray, "%f", date);
//  318 ////
//  319 ////    //����ʹ�÷����ַ����ĺ�����ԭ��������֮�����
//  320 //////    UART_FloatArray[len] = '\0';
//  321 //////    UART_Send_String(UART_FloatArray);
//  322 //
//  323 //    uint8 i = 0;
//  324 //
//  325 //    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  326 //    {
//  327 //        UART_SendFloatArray[i] = 0;
//  328 //    }
//  329 //
//  330 //    sprintf(UART_SendFloatArray, "%f", date);
//  331 //
//  332 //    for (i=0; i<len; i++)
//  333 //    {
//  334 //        UART_Send_Byte(UART_SendFloatArray[i]);
//  335 //    }
//  336 //
//  337 //    if (enter)
//  338 //    {
//  339 //        UART_Send_Enter();
//  340 //    }
//  341 //}
//  342 
//  343 
//  344 /* -----------------------  ��BUG�ĺ��� �����򲻵��� ǧ��Ҫʹ��  -------- END */
//  345 
// 
// 522 bytes in section .text
// 
// 522 bytes of CODE memory
//
//Errors: none
//Warnings: none
