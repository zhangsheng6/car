///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:34
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\4.27_ZS\device\C\adc.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\device\C\adc.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\���ܳ�����2018\������֡���ZS\4.27_ZS\iar\KEA_128_RAM\List\adc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv

        PUBLIC ADC_Able
        PUBLIC ADC_Disable
        PUBLIC ADC_Init
        PUBLIC ADC_Once
        PUBLIC ADC_Stop
        PUBLIC Change
        PUBLIC adcHold
        PUBLIC hw_ad_ave
        PUBLIC hw_ad_mid

// H:\���ܳ�����2018\������֡���ZS\4.27_ZS\device\C\adc.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�     adc.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��
//   10   *
//   11   * ��ǰ�汾��     1.0
//   12   * ��    ��     ��־ΰ
//   13   * ʱ    �䣺     2018��1��23�� 10:55:52
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "adc.h"
//   18 
//   19 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   20 uint16 adcHold = 0;
adcHold:
        DS8 2
//   21 
//   22 /**
//   23   * ���
//   24   *     ��adc���Ž��б���
//   25   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 uint8 Change(PTX_n adcn_ch)
//   27 {
Change:
        PUSH     {LR}
        MOVS     R1,R0
//   28     uint8 shift = 0;
        MOVS     R0,#+0
//   29     switch (adcn_ch)
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??Change_0
        CMP      R1,#+1
        BEQ      ??Change_1
        CMP      R1,#+6
        BEQ      ??Change_2
        CMP      R1,#+7
        BEQ      ??Change_3
        CMP      R1,#+8
        BEQ      ??Change_4
        CMP      R1,#+9
        BEQ      ??Change_5
        CMP      R1,#+10
        BEQ      ??Change_6
        CMP      R1,#+11
        BEQ      ??Change_7
        CMP      R1,#+16
        BEQ      ??Change_8
        CMP      R1,#+17
        BEQ      ??Change_9
        CMP      R1,#+18
        BEQ      ??Change_10
        CMP      R1,#+19
        BEQ      ??Change_11
        CMP      R1,#+44
        BEQ      ??Change_12
        CMP      R1,#+45
        BEQ      ??Change_13
        CMP      R1,#+46
        BEQ      ??Change_14
        CMP      R1,#+47
        BEQ      ??Change_15
        B        ??Change_16
//   30     {
//   31       case A0:
//   32         shift = 0;
??Change_0:
        MOVS     R0,#+0
//   33         break;
        B        ??Change_17
//   34       case A1:
//   35         shift = 1;
??Change_1:
        MOVS     R0,#+1
//   36         break;
        B        ??Change_17
//   37       case A6:
//   38         shift = 2;
??Change_2:
        MOVS     R0,#+2
//   39         break;
        B        ??Change_17
//   40       case A7:
//   41         shift = 3;
??Change_3:
        MOVS     R0,#+3
//   42         break;
        B        ??Change_17
//   43 
//   44       case B0:
//   45         shift = 4;
??Change_4:
        MOVS     R0,#+4
//   46         break;
        B        ??Change_17
//   47       case B1:
//   48         shift = 5;
??Change_5:
        MOVS     R0,#+5
//   49         break;
        B        ??Change_17
//   50       case B2:
//   51         shift = 6;
??Change_6:
        MOVS     R0,#+6
//   52         break;
        B        ??Change_17
//   53       case B3:
//   54         shift = 7;
??Change_7:
        MOVS     R0,#+7
//   55         break;
        B        ??Change_17
//   56 
//   57       case C0:
//   58         shift = 8;
??Change_8:
        MOVS     R0,#+8
//   59         break;
        B        ??Change_17
//   60       case C1:
//   61         shift = 9;
??Change_9:
        MOVS     R0,#+9
//   62         break;
        B        ??Change_17
//   63       case C2:
//   64         shift = 10;
??Change_10:
        MOVS     R0,#+10
//   65         break;
        B        ??Change_17
//   66       case C3:
//   67         shift = 11;
??Change_11:
        MOVS     R0,#+11
//   68         break;
        B        ??Change_17
//   69 
//   70       case F4:
//   71         shift = 12;
??Change_12:
        MOVS     R0,#+12
//   72         break;
        B        ??Change_17
//   73       case F5:
//   74         shift = 13;
??Change_13:
        MOVS     R0,#+13
//   75         break;
        B        ??Change_17
//   76       case F6:
//   77         shift = 14;
??Change_14:
        MOVS     R0,#+14
//   78         break;
        B        ??Change_17
//   79       case F7:
//   80         shift = 15;
??Change_15:
        MOVS     R0,#+15
//   81         break;
        B        ??Change_17
//   82 
//   83       default:
//   84         shift = 0;
??Change_16:
        MOVS     R0,#+0
//   85         break;
//   86     }
//   87 
//   88     return shift;
??Change_17:
        UXTB     R0,R0
        POP      {PC}             ;; return
//   89 }
//   90 
//   91 /**
//   92   * ���
//   93   *     ADC ��ʼ��
//   94   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 void ADC_Init()
//   96 {
//   97 
//   98     SIM->SCGC |= SIM_SCGC_ADC_MASK;       //����ADCʱ��
ADC_Init:
        LDR      R0,??DataTable4  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+22       ;; #+536870912
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4  ;; 0x40048014
        STR      R1,[R0, #+0]
//   99 
//  100     ADC->APCTL1 &= 0; //�������� ����ADC����
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1  ;; 0x4003b018
        STR      R0,[R1, #+0]
//  101 
//  102     ADC->SC3 = ( 0
//  103                  | ADC_SC3_ADIV(1)           //��Ƶϵ����=����ʱ��
//  104                //| ADC_SC3_MODE(bit)         //�ֱ���
//  105                  | ADC_SC3_ADICLK(0)         //ʹ������ʱ����ΪADC��ʱ��Դ
//  106                  | ADC_SC3_ADLSMP(1)         //������
//  107                  | ADC_SC3_ADLPC(0)     //����ģʽ
//  108                 );
        MOVS     R0,#+48
        LDR      R1,??DataTable4_2  ;; 0x4003b008
        STR      R0,[R1, #+0]
//  109     ADC->SC2 = ( 0
//  110                  | ADC_SC2_REFSEL(0)       //��׼��ѹѡ��
//  111                  | ADC_SC2_ADTRG(0)        //�������
//  112                  | ADC_SC2_ACFE(0)         //�ȽϹ��ܽ���
//  113                 );
        MOVS     R0,#+0
        LDR      R1,??DataTable4_3  ;; 0x4003b004
        STR      R0,[R1, #+0]
//  114 }
        BX       LR               ;; return
//  115 
//  116 /**
//  117   * ���
//  118   *     ADC ����ʹ��
//  119   * ����
//  120   *     adcn_ch
//  121   *       ͨ����(variable.h�б༭)
//  122   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  123 void ADC_Able(PTX_n adcn_ch)
//  124 {
ADC_Able:
        PUSH     {R7,LR}
//  125     uint8 shift = 0;
        MOVS     R1,#+0
//  126 
//  127     shift = Change(adcn_ch);
        UXTB     R0,R0
        BL       Change
        MOVS     R1,R0
//  128 
//  129     ADC->APCTL1 |= 1<<shift;              //ʹ��ADC����
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R1
        ORRS     R2,R2,R0
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        STR      R2,[R0, #+0]
//  130 }
        POP      {R0,PC}          ;; return
//  131 
//  132 /**
//  133   * ���
//  134   *     �ص� ADC
//  135   * ����
//  136   *     adcn_ch
//  137   *       ͨ����(variable.h�б༭)
//  138   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  139 void ADC_Disable(PTX_n adcn_ch)
//  140 {
ADC_Disable:
        PUSH     {R7,LR}
//  141     uint8  shift = 0;
        MOVS     R1,#+0
//  142     uint16 mon = 0;
        MOVS     R2,#+0
//  143 
//  144     shift = Change(adcn_ch);
        UXTB     R0,R0
        BL       Change
        MOVS     R1,R0
//  145     mon = (uint16)(1 << shift);
        MOVS     R2,#+1
        LSLS     R2,R2,R1
//  146 
//  147     ADC->APCTL1 &= ~mon;              //��ֹADC����
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        UXTH     R2,R2
        BICS     R0,R0,R2
        LDR      R1,??DataTable4_1  ;; 0x4003b018
        STR      R0,[R1, #+0]
//  148 }
        POP      {R0,PC}          ;; return
//  149 
//  150 
//  151 /**
//  152   * ���
//  153   *     �ɼ�һ��ADC����
//  154   * ����
//  155   *     adcn_ch
//  156   *       ͨ����
//  157   *     bit
//  158   *       adc8bit
//  159   *       adc10bit
//  160   *       adc12bit
//  161   * ����ֵ
//  162   *     �޷��Ž��ֵ(��Χ:0-4095)
//  163   * ��ע
//  164   *     ����֮��Ὺ����Ӧ���ŵ� ADC���� �� ��ȥʱ�� û�йر�
//  165   *     û��ʹ������ת�����ܣ����Զ� ADC_SC1 ִ��һ��д����������һ��ת��
//  166   *
//  167   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 uint16 ADC_Once(PTX_n adcn_ch, adcBit bit)
//  169 {
ADC_Once:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  170     uint16 result;
//  171     uint8  shift = 0;
        MOVS     R6,#+0
//  172 
//  173     shift = Change(adcn_ch);
        MOVS     R0,R5
        UXTB     R0,R0
        BL       Change
        MOVS     R6,R0
//  174 
//  175     ADC_Able(adcn_ch);
        MOVS     R0,R5
        UXTB     R0,R0
        BL       ADC_Able
//  176 
//  177     ADC->SC3 |=  ADC_SC3_MODE(bit);  //�ֱ���
        LDR      R0,??DataTable4_2  ;; 0x4003b008
        LDR      R0,[R0, #+0]
        UXTB     R4,R4
        LSLS     R1,R4,#+2
        MOVS     R2,#+12
        ANDS     R2,R2,R1
        ORRS     R2,R2,R0
        LDR      R0,??DataTable4_2  ;; 0x4003b008
        STR      R2,[R0, #+0]
//  178     ADC->SC1  = ADC_SC1_ADCH(shift);       //����ת��
        UXTB     R6,R6
        LSLS     R0,R6,#+27       ;; ZeroExtS R0,R6,#+27,#+27
        LSRS     R0,R0,#+27
        LDR      R1,??DataTable4_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//  179 
//  180     //�� ADC_SC1 ִ��һ��д����������ת��
//  181     while(!(ADC->SC1 & ADC_SC1_COCO_MASK)); //�ȴ�ת�����
??ADC_Once_0:
        LDR      R0,??DataTable4_4  ;; 0x4003b000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??ADC_Once_0
//  182     result = ADC->R;
        LDR      R0,??DataTable4_5  ;; 0x4003b010
        LDR      R0,[R0, #+0]
//  183 
//  184     return (result & ADC_R_ADR_MASK);       //���ؽ��
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        POP      {R4-R6,PC}       ;; return
//  185 }
//  186 
//  187 /**
//  188   * ���
//  189   *     ADC ֹͣ�ɼ�
//  190   * ����
//  191 
//  192   * ��ע
//  193   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  194 void ADC_Stop(void)
//  195 {
//  196     ADC->SC1 = ADC_SC1_ADCH(0xFF);
ADC_Stop:
        MOVS     R0,#+31
        LDR      R1,??DataTable4_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//  197 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x4003b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4003b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x4003b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4003b010
//  198 
//  199 
//  200 /**
//  201   * ���
//  202   *     ��ֵ�˲���Ľ��(��Χ:0-4095)
//  203   * ����
//  204   *     MoudelNumber��ģ���
//  205   *     Channel��ͨ����
//  206   *     accuracy������
//  207   *     N:��ֵ�˲�����
//  208   * ����ֵ
//  209   *     �޷��Ž��ֵ(��Χ:0-4095)
//  210   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  211 uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit)
//  212 {
hw_ad_mid:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
//  213     uint16 i, j, k, tmp;
//  214 
//  215     //ȡ3��A/Dת�����
//  216     i = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
        MOVS     R4,R0
//  217     j = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
        MOVS     R5,R0
//  218     k = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
//  219 
//  220     //ȡ��ֵ ð������ �м�Ϊ��ֵ
//  221     if (i > j)
        UXTH     R5,R5
        UXTH     R4,R4
        CMP      R5,R4
        BCS      ??hw_ad_mid_0
//  222     {
//  223         tmp = i; i = j; j = tmp;
        MOVS     R1,R4
        MOVS     R4,R5
        MOVS     R5,R1
//  224     }
//  225     if (j > k)
??hw_ad_mid_0:
        UXTH     R0,R0
        UXTH     R5,R5
        CMP      R0,R5
        BCS      ??hw_ad_mid_1
//  226     {
//  227         tmp = j; j = k; k = tmp;
        MOVS     R1,R5
        MOVS     R5,R0
        MOVS     R0,R1
//  228     }
//  229     if (i > j)
??hw_ad_mid_1:
        UXTH     R5,R5
        UXTH     R4,R4
        CMP      R5,R4
        BCS      ??hw_ad_mid_2
//  230     {
//  231         tmp = i; i = j; j = tmp;
        MOVS     R1,R4
        MOVS     R4,R5
        MOVS     R5,R1
//  232     }
//  233 
//  234     return      j;
??hw_ad_mid_2:
        MOVS     R0,R5
        UXTH     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  235 }
//  236 
//  237 /**
//  238   * ���
//  239   *     ��ֵ�˲���Ľ��(��Χ:0-4095)
//  240   * ����
//  241   *     MoudelNumber��ģ���
//  242   *     Channel��ͨ����
//  243   *     accuracy������
//  244   *     N:��ֵ�˲�����
//  245   * ����ֵ
//  246   *     �޷��Ž��ֵ(��Χ:0-4095)
//  247   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  248 uint16 hw_ad_ave(PTX_n adcn_ch, adcBit bit, uint8 N)
//  249 {
hw_ad_ave:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
//  250     uint32 tmp = 0;
        MOVS     R0,#+0
//  251     uint8  i;
//  252 
//  253     for (i=0; i<N; i++)
        MOVS     R5,#+0
        B        ??hw_ad_ave_0
//  254         tmp += hw_ad_mid(adcn_ch, bit);
??hw_ad_ave_1:
        STR      R0,[SP, #+0]
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R4
        UXTB     R0,R0
        BL       hw_ad_mid
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,R1
        ADDS     R5,R5,#+1
??hw_ad_ave_0:
        UXTB     R5,R5
        UXTB     R6,R6
        CMP      R5,R6
        BCC      ??hw_ad_ave_1
//  255     tmp = tmp / N;
        UXTB     R6,R6
        MOVS     R1,R6
        BL       __aeabi_uidiv
//  256 
//  257     return (uint16)tmp;
        UXTH     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  258 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  259 
//  260 
//  261 
// 
//   2 bytes in section .bss
// 496 bytes in section .text
// 
// 496 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: none
