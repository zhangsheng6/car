///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:01
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_adc.c
//    Command line =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_adc.c -D IAR -D
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
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\KEA128_adc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC adc_init
        PUBLIC adc_once
        PUBLIC adc_stop

// I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_adc.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_adc
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
//   21 #include "KEA128_adc.h"
//   22 
//   23 
//   24 
//   25 
//   26 //-------------------------------------------------------------------------------------------------------------------
//   27 //  @brief      ADC��ʼ��
//   28 //  @param      adcn_ch         ѡ��ADCͨ��
//   29 //  @return     void
//   30 //  @since      v2.0
//   31 //  Sample usage:               adc_init(ADC0_SE8);
//   32 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 void adc_init(ADCn_Ch adcn_ch)
//   34 {
//   35     SIM->SCGC |= SIM_SCGC_ADC_MASK;         //����ADCʱ��
adc_init:
        LDR      R1,??DataTable2  ;; 0x40048014
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+22       ;; #+536870912
        ORRS     R2,R2,R1
        LDR      R1,??DataTable2  ;; 0x40048014
        STR      R2,[R1, #+0]
//   36     
//   37     ADC->APCTL1 |= 1<<adcn_ch;              //ʹ��ADC����
        LDR      R1,??DataTable2_1  ;; 0x4003b018
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??DataTable2_1  ;; 0x4003b018
        STR      R2,[R0, #+0]
//   38 }
        BX       LR               ;; return
//   39 
//   40 
//   41 //-------------------------------------------------------------------------------------------------------------------
//   42 //  @brief      ADC�ɼ�
//   43 //  @param      adcn_ch         ѡ��ADCͨ��
//   44 //  @param      bit             ѡ�񾫶�ADC_8bit��ADC_10bit��ADC_12bit
//   45 //  @return     void
//   46 //  @since      v2.0
//   47 //  Sample usage:               uint16 dat = adc_once(ADC0_SE8,ADC_12bit);//�ɼ�ADC0_SE8��ѹ������12λ
//   48 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 uint16 adc_once(ADCn_Ch adcn_ch, ADC_nbit bit)
//   50 {
adc_once:
        PUSH     {LR}
//   51     uint16 result;
//   52     ADC->SC3 = (0
//   53                 | ADC_SC3_ADIV(0)           //��Ƶϵ��
//   54                 | ADC_SC3_MODE(bit)         //�ֱ���
//   55                 | ADC_SC3_ADICLK(0)         //ʹ������ʱ����ΪADC��ʱ��Դ
//   56                 );
        UXTB     R1,R1
        LSLS     R1,R1,#+2
        MOVS     R2,#+12
        ANDS     R2,R2,R1
        LDR      R1,??DataTable2_2  ;; 0x4003b008
        STR      R2,[R1, #+0]
//   57         
//   58     
//   59     ADC->SC2 = ADC_SC2_REFSEL(0);           //��׼��ѹѡ��
        MOVS     R1,#+0
        LDR      R2,??DataTable2_3  ;; 0x4003b004
        STR      R1,[R2, #+0]
//   60 
//   61     ADC->SC1 = ADC_SC1_ADCH(adcn_ch);       //����ת��
        UXTB     R0,R0
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        LDR      R1,??DataTable2_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//   62     
//   63     while(!(ADC->SC1 & ADC_SC1_COCO_MASK)); //�ȴ�ת�����
??adc_once_0:
        LDR      R0,??DataTable2_4  ;; 0x4003b000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??adc_once_0
//   64     result = ADC->R;
        LDR      R0,??DataTable2_5  ;; 0x4003b010
        LDR      R0,[R0, #+0]
//   65     return (result & ADC_R_ADR_MASK);       //���ؽ��
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        POP      {PC}             ;; return
//   66     
//   67 }
//   68 
//   69 //-------------------------------------------------------------------------------------------------------------------
//   70 //  @brief      ADCֹͣ�ɼ�
//   71 //  @param      adcn_ch         ѡ��ADCͨ��
//   72 //  @param      bit             ѡ�񾫶�ADC_8bit��ADC_10bit��ADC_12bit
//   73 //  @return     void
//   74 //  @since      v2.0
//   75 //  Sample usage:               adc_stop(adc0);
//   76 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void adc_stop(void)
//   78 {
//   79     ADC->SC1 = ADC_SC1_ADCH(0xFF); 
adc_stop:
        MOVS     R0,#+31
        LDR      R1,??DataTable2_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//   80 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4003b018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4003b008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4003b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4003b010

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 110 bytes in section .text
// 
// 110 bytes of CODE memory
//
//Errors: none
//Warnings: none
