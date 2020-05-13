///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:37:58
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\inductor_1.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\inductor_1.c -D IAR -D
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
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\inductor_1.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Once
        EXTERN AD_V
        EXTERN AD_sum
        EXTERN AD_valu
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_idiv
        EXTERN ad_valu

        PUBLIC Read_ADC
        PUBLIC SC_black_Init
        PUBLIC abs_f
        PUBLIC abs_inductor
        PUBLIC delayms

// H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\inductor_1.c
//    1 #include "inductor_1.h"
//    2 #include "Variable.h"
//    3 #include "common.h"
//    4 #include "allHead.h"
//    5 
//    6 
//    7 
//    8 //��  �� ��   ���� ���� gnd
//    9 //��  �� ��    ��   ��  ��
//   10 //��  �� ��    ��   ��  ��ɫ
//   11 //4   2  3    1    5
//   12 //1   2  3    4     5
//   13 //              �ҵ��   �е��   ����   λ��     ��ֵ
//   14 //�ҵ�����    490,97    250,50  16,1      1        -95
//   15 //�������    4,0.1    240,47  509,100    2         99
//   16 //�������ʱ     40,7    312,62   287,57    2          50      
//   17 //�������ʱ     4��0.1    194,38   287,57    2          50    
//   18                                      //          ��Χ
//   19 //ADֵ��AD_valu[3]Ϊ�ɼ��������ĵ�ADֵ          0-260(С����ʻʱ)
//   20 //��һֵsensor_to_one[5]Ϊ��ADֵ��һ��            0-1
//   21 //����ֵ��AD_inductor[5]Ϊ����һ����ֵ�Ŵ�100��    0-100
//   22 //���ߣ��źź�С�ˣ�Ȼ��Ͱ����Ҳ����ź���������
//   23 //Position_transit[i]:��¼���ɵ��һ���Ŵ���ֵ
//   24 //Position_transit[0]:�ҵ��λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
//   25 //Position_transit[1]:����λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
//   26 //��ֵ����ֵ��С���е�������ߵ����λ�þ���
//   27 //С���������ڲ�ֵΪ100���ڣ����������200���ң�ȫ������300����
//   28 
//   29 
//   30 
//   31 
//   32 
//   33 
//   34 /*************************************************************************
//   35  *  ��������   Read_ADC
//   36  *  ����˵���� AD�ɼ�
//   37  *  ����˵����
//   38  *  �������أ� ��
//   39  *  �޸�ʱ�䣺
//   40  *  ��    ע��
//   41 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 void Read_ADC(void)
//   43 {
Read_ADC:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+28
//   44       int16  i,j,k,temp;
//   45       int16  ad_valu1[5],ad_sum[5];
//   46 
//   47       for(i=0;i<5;i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_0:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_1
//   48       {
//   49 
//   50 //            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //��  ͨ��
//   51 //            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //��  ͨ��
//   52 //            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //��  ͨ��
//   53 //            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //��1 ͨ��
//   54 //            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //��2 ͨ��
//   55         
//   56                  ad_valu[0][i] = ADC_Once(ADC_5,adc12bit);  //��  ͨ��
        MOVS     R1,#+2
        MOVS     R0,#+44
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRH     R0,[R1, R2]
//   57             ad_valu[1][i] = ADC_Once(ADC_4,adc12bit);  //��  ͨ��
        MOVS     R1,#+2
        MOVS     R0,#+45
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+10]
//   58             ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //��  ͨ��
        MOVS     R1,#+2
        MOVS     R0,#+47
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+20]
//   59             ad_valu[3][i] = ADC_Once(ADC_2,adc12bit);  //��1 ͨ��
        MOVS     R1,#+2
        MOVS     R0,#+17
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+30]
//   60             ad_valu[4][i] = ADC_Once(ADC_1,adc12bit);  //��2 ͨ��
        MOVS     R1,#+2
        MOVS     R0,#+16
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+40]
//   61             
//   62 //            if(ad_valu[0][i] > 650) ad_valu[0][i]=500;
//   63 //            if(ad_valu[1][i] > 650) ad_valu[0][i]=500;
//   64 //            if(ad_valu[2][i] > 650) ad_valu[0][i]=500;
//   65 
//   66       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_0
//   67    //////////////////////ð������///////////////////////////////////
//   68       for(i=0;i<5;i++)     //5�����
??Read_ADC_1:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_2:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_3
//   69       {
//   70          for(j=0;j<4;j++)  //�����������
        MOVS     R0,#+0
        MOVS     R6,R0
??Read_ADC_4:
        SXTH     R6,R6
        CMP      R6,#+4
        BGE      ??Read_ADC_5
//   71          {
//   72             for(k=0;k<4-j;k++)
        MOVS     R0,#+0
        MOVS     R5,R0
??Read_ADC_6:
        SXTH     R5,R5
        MOVS     R0,#+4
        SXTH     R6,R6
        SUBS     R0,R0,R6
        CMP      R5,R0
        BGE      ??Read_ADC_7
//   73             {
//   74                if(ad_valu[i][k] > ad_valu[i][k+1])  //ǰ��ıȺ���Ĵ�  ����н���
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+10
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SXTH     R5,R5
        MOVS     R1,#+2
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+10
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        SXTH     R5,R5
        MOVS     R2,#+2
        MULS     R2,R5,R2
        LDRSH    R1,[R1, R2]
        CMP      R0,R1
        BGE      ??Read_ADC_8
//   75                {
//   76                   temp = ad_valu[i][k+1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+10
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SXTH     R5,R5
        MOVS     R1,#+2
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        LDRSH    R0,[R0, R1]
        MOVS     R7,R0
//   77                   ad_valu[i][k+1] = ad_valu[i][k];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+10
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SXTH     R5,R5
        MOVS     R1,#+2
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+10
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        SXTH     R5,R5
        MOVS     R2,#+2
        MULS     R2,R5,R2
        LDRH     R1,[R1, R2]
        STRH     R1,[R0, #+2]
//   78                   ad_valu[i][k] = temp;
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+10
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        SXTH     R5,R5
        MOVS     R1,#+2
        MULS     R1,R5,R1
        STRH     R7,[R0, R1]
//   79                }
//   80             }
??Read_ADC_8:
        ADDS     R5,R5,#+1
        B        ??Read_ADC_6
//   81          }
??Read_ADC_7:
        ADDS     R6,R6,#+1
        B        ??Read_ADC_4
//   82       }
??Read_ADC_5:
        ADDS     R4,R4,#+1
        B        ??Read_ADC_2
//   83       for(i=0;i<5;i++)    //���м�����ĺ�
??Read_ADC_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_9:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_10
//   84       {
//   85          ad_sum[i] = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+10
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDRH     R0,[R0, #+2]
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+10
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDRH     R1,[R1, #+4]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+10
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDRH     R1,[R1, #+6]
        ADDS     R0,R0,R1
        MOV      R1,SP
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRH     R0,[R1, R2]
//   86          ad_valu1[i] = ad_sum[i] / 3;
        MOV      R0,SP
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDRSH    R0,[R0, R1]
        MOVS     R1,#+3
        BL       __aeabi_idiv
        ADD      R1,SP,#+12
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRH     R0,[R1, R2]
//   87       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_9
//   88    ////////////////////////����ƽ���˲�/////////////////////////////
//   89       for(i = 0;i < NM-1;i ++)  //ȡ�м�3λ��ֵ��ǰ��λ
??Read_ADC_10:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_11:
        SXTH     R4,R4
        CMP      R4,#+2
        BGE      ??Read_ADC_12
//   90       {
//   91           AD_V[0][i] = ad_valu[0][i + 1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//   92           AD_V[1][i] = ad_valu[1][i + 1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+12
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+12]
//   93           AD_V[2][i] = ad_valu[2][i + 1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+22
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+24]
//   94           AD_V[3][i] = ad_valu[3][i + 1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+32
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+36]
//   95           AD_V[4][i] = ad_valu[4][i + 1];
        LDR      R0,??DataTable1
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+42
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+48]
//   96       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_11
//   97       for(i=0;i<5;i++)   //����λ�洢ƽ��ֵ
??Read_ADC_12:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_13:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_14
//   98       {
//   99           AD_V[i][NM-1] =  ad_valu1[i];
        ADD      R0,SP,#+12
        SXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDRSH    R0,[R0, R1]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+12
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STR      R0,[R1, #+8]
//  100       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_13
//  101          for(i = 0;i < NM;i ++)   //�õ�ԭ�м���λ��ֵ
??Read_ADC_14:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_15:
        SXTH     R4,R4
        CMP      R4,#+3
        BGE      ??Read_ADC_16
//  102       {
//  103           AD_sum[0] += AD_V[0][i];
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  104           AD_sum[1] += AD_V[1][i];
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+12]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+4]
//  105           AD_sum[2] += AD_V[2][i];
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+24]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+8]
//  106           AD_sum[3] += AD_V[3][i];
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+36]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+12]
//  107           AD_sum[4] += AD_V[4][i];
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_1
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+48]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_2
        STR      R0,[R1, #+16]
//  108       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_15
//  109       for(i=0;i<5;i++)  //��ƽ��
??Read_ADC_16:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_17:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_18
//  110       {
//  111           AD_valu[i] = AD_sum[i] / NM;
        LDR      R0,??DataTable1_2
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+3
        BL       __aeabi_idiv
        LDR      R1,??DataTable1_3
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  112           AD_sum[i] = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  113       }
        ADDS     R4,R4,#+1
        B        ??Read_ADC_17
//  114 }
??Read_ADC_18:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 
//  121 
//  122 
//  123 
//  124 
//  125 ///*************************************************************************
//  126 // *  ��������   Date_analyse
//  127 // *  ����˵���� ���ݷ���
//  128 // *  ����˵����
//  129 // *  �������أ� ��
//  130 // *  �޸�ʱ�䣺
//  131 // *  ��    ע��
//  132 //*************************************************************************/
//  133 //void Date_analyse()
//  134 //{
//  135 ////     char Chazhi_flag = 0;
//  136 ////     char Chazhi_value[11];
//  137 ////     int16  a,b;
//  138 //     int16  i,max_front=0,max_back;
//  139 //     static int16 max_old = 1,max_crosstalk = 1;
//  140 //     static int16 position_last = 2;
//  141 //     float  sensor_1;
//  142 //
//  143 //     Read_ADC();
//  144 //
//  145 //    Inductor_Check();//��������СֵУ�� 
//  146 //     /*********************��һ������********************/
//  147 //     for(i=0;i<5;i++)
//  148 //     {
//  149 //        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
//  150 //      if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
//  151 ////        if(sensor_to_one[0]<=0.0)  sensor_to_one[0]=0.001;
//  152 ////        if(sensor_to_one[0]>1.0)  sensor_to_one[0]=1.0;
//  153 ////        
//  154 ////        if(sensor_to_one[2]<=0.0)  sensor_to_one[2]=0.001;
//  155 ////        if(sensor_to_one[2]>1.0)  sensor_to_one[2]=1.0;
//  156 //
//  157 //        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
//  158 //     }
//  159 //       /*******1�ŵ�������һ���������µ����********/
//  160 //      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//  161 //      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//  162 //      Slope_AD_1 = 100 * sensor_1;
//  163 //   ////////////////////////////////////////////////////////////////////
//  164 //
//  165 //       for(i=0;i<3;i++)                 //�ҳ���ǿ�Ĵ�����
//  166 //       {
//  167 //         if(AD_inductor[max_front]<AD_inductor[i])
//  168 //           max_front=i;
//  169 //       }
//  170 //       max_value=AD_inductor[max_front];  //�����ֵ
//  171 //
//  172 //    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //�Һ�����ǿ���
//  173 // //zs����      
//  174 //       //����ʱ���ֵȡ��ֵ
//  175 //       if(max_value < 5)           
//  176 //       {
//  177 //         max_front=max_old;
//  178 //         max_value=AD_inductor[max_front];
//  179 //       }
//  180 //       else
//  181 //         max_old=max_front;
//  182 ////       //������
//  183 //       if(abs_inductor(max_front - max_crosstalk) < 2)  
//  184 //       {
//  185 //            max_crosstalk = max_front;
//  186 //       }
//  187 //       else
//  188 //            max_front = max_crosstalk;
//  189 // //��ʢ����      
//  190 //      // AD_MAX_NUM = max_front;        //�����ٶȿ���
//  191 //       
//  192 //        /****************λ�ý��㣬������̵�ֵ�ù�һ���Ŵ���ֵ************************/
//  193 ////zs1    
//  194 //       
//  195 ////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] > AD_inductor[2])  ))
//  196 ////       {
//  197 ////           position=1;         
//  198 ////       }
//  199 ////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] < AD_inductor[2])  ))
//  200 ////       {
//  201 ////           position=2;         
//  202 ////       }
//  203 ////         
//  204 ////         
//  205 ////ZS2       
//  206 //        if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //�Ѿ�ƫ��0�Ŵ�����
//  207 //       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
//  208 //             position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
//  209 // //          AD_0_max = AD_inductor[0];//zs��
//  210 //       }
//  211 //       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //���λ��  0-1�Ŵ�����֮��
//  212 //       {//�ҵ������Ҵ�ʱ�е�е�ֵ>���ɵ�0ʱ�е�е�ֵ||�е��������ҵ�е�ֵ>���е�ֵ
//  213 //           //      �е���ڵ�������                            �е���ڵ�������
//  214 //             position=1;//�е���ڵ�������,С��ƫ��(���С�����ϲ����ڵ������ߵ�����ȫ��)
//  215 //             AD_0_max = AD_inductor[0]; //��¼�´�ʱ��0�Ŵ������Ĺ�һ�Ŵ���ֵ
//  216 //       }
//  217 //       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //�Ҳ�λ��  1-2�Ŵ�����֮��
//  218 //       {//�е����������е�ֵ�����ҵ�е�ֵ||��������Ҵ�ʱ�е�е�ֵ>���ɵ�1ʱ�е�е�ֵ
//  219 //        //    �е���ڵ�����ұ�                         �е���ڵ�����ұ�          
//  220 //             position=2;//�е���ڵ�����ұ�,С��ƫ��(���С�����ϲ����ڵ�����ұߵ�����ȫ��)
//  221 //             AD_2_max = AD_inductor[2]; //��¼�´�ʱ��3�Ŵ�������һ�Ŵ���ֵ
//  222 //       }
//  223 //       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] ))  //�Ѿ�ƫ��3�Ŵ�����
//  224 //       {//��������Ҵ�ʱ���е��ֵ<=���ɵ�1ʱ�е�е�ֵ
//  225 //             position = 3;//�����ڵ�����ҷ�������С�����ڵ�����ҷ�
//  226 //        // AD_2_max = AD_inductor[2];//zs��
//  227 //
//  228 //       }   
//  229 //         
//  230 //         
//  231 ////Position_transit[0]:�ҵ��λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
//  232 ////Position_transit[1]:����λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ�е�е�ֵ
//  233 ////       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //�Ѿ�ƫ��0�Ŵ�����
//  234 ////       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
//  235 ////             position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
//  236 //// //          AD_0_max = AD_inductor[0];//zs��
//  237 ////       }
//  238 ////       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //���λ��  0-1�Ŵ�����֮��
//  239 ////       {//�ҵ������Ҵ�ʱ�е�е�ֵ>���ɵ�0ʱ�е�е�ֵ||�е��������ҵ�е�ֵ>���е�ֵ
//  240 ////           //      �е���ڵ�������                            �е���ڵ�������
//  241 ////             position=1;//�е���ڵ�������,С��ƫ��(���С�����ϲ����ڵ������ߵ�����ȫ��)
//  242 ////             AD_0_max = AD_inductor[0]; //��¼�´�ʱ��0�Ŵ������Ĺ�һ�Ŵ���ֵ
//  243 ////       }
//  244 ////       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //�Ҳ�λ��  1-2�Ŵ�����֮��
//  245 ////       {//�е����������е�ֵ�����ҵ�е�ֵ||��������Ҵ�ʱ�е�е�ֵ>���ɵ�1ʱ�е�е�ֵ
//  246 ////        //    �е���ڵ�����ұ�                         �е���ڵ�����ұ�          
//  247 ////             position=2;//�е���ڵ�����ұ�,С��ƫ��(���С�����ϲ����ڵ�����ұߵ�����ȫ��)
//  248 ////             AD_2_max = AD_inductor[2]; //��¼�´�ʱ��3�Ŵ�������һ�Ŵ���ֵ
//  249 ////       }
//  250 ////       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //�Ѿ�ƫ��3�Ŵ�����
//  251 ////       {//��������Ҵ�ʱ���е��ֵ<=���ɵ�1ʱ�е�е�ֵ
//  252 ////             position = 3;//�����ڵ�����ҷ�������С�����ڵ�����ҷ�
//  253 ////        // AD_2_max = AD_inductor[2];//zs��
//  254 ////
//  255 ////       }
//  256 //       /*
//  257 //       //~~~~~~~~~~~~~~~~~~~~~~~ ����λ�ý���~~~~~~~~~~~~~~~~~~~//
//  258 //       if(max_back == 3 && AD_inductor[4] <= Position_transit[2] - 1)
//  259 //       {
//  260 //            if(AD_inductor[4] <= Position_transit[2] - 22)
//  261 //               position_back = 0;
//  262 //            if(AD_inductor[4] >= Position_transit[2] - 20)
//  263 //               position_back = 1;
//  264 //       }
//  265 //       else  if(max_back == 3 && AD_inductor[4] > Position_transit[2] + 1 || max_back == 4 && AD_inductor[3] > Position_transit[3] + 1)
//  266 //       {
//  267 //            position_back = 2;
//  268 //       }
//  269 //       else if(max_back == 4 && AD_inductor[3] <= Position_transit[3] - 1)
//  270 //       {
//  271 //            if(AD_inductor[3] >= Position_transit[3] - 20)
//  272 //               position_back = 3;
//  273 //            if(AD_inductor[3] <= Position_transit[3] - 22)
//  274 //               position_back = 4;
//  275 //       }
//  276 //       */
//  277 //      /*λ�÷�������󣬱���ǰ1msС�����ڵ������ߣ���1msС��ƫ��*/  
//  278 // //zs����      
//  279 //       if(abs_inductor(position - position_last) > 1)  //λ���������ʱ���� 
//  280 //       {
//  281 //            position = position_last;//�˿�С��λ��ת��Ϊ��һ��С��λ��
//  282 //       }
//  283 //       else
//  284 //       {
//  285 //       position_last = position;//������¼�����������ϴ�С��λ��=�˿�С��λ��
//  286 //       }   
//  287 ////zs����
//  288 ////////����ں͵��߼нǹ����º���ת���㣬��ʱ���ɵ�ǿ������//////////////
//  289 ///*����С��ֱ��̫ƫ������ʱС��ת�����С��������С�����ܺúõĸ����������ʱǿ��*/
//  290 ////����ֱ������С��̫��ƫ���ڵ�������ʱ�Ҵ�ʱ��ǿ���ҵ��ֵ<75,˵��С��̫ƫ�ˣ�����if
//  291 ////���������С��ת����Ȳ��������ܻ�������������if 
//  292 //       
//  293 //      //////����ں͵��߼нǹ����º���ת���㣬��ʱ���ɵ�ǿ������//////////////
//  294 ////��ʢ����
//  295 ////       if(position == 0 && AD_0_max < 75)
//  296 ////       {
//  297 ////           AD_0_max = 75 + abs_f(75 - AD_0_max);
//  298 ////       }
//  299 ////       else if(position == 3 && AD_2_max < 75)
//  300 ////       {
//  301 ////           AD_2_max = 75 + abs_f(75 - AD_2_max);
//  302 ////       }
//  303 ////��ʢ����
//  304 //  Chazhi_Last=Chazhi;
//  305 //       /*************����ƫ����*************/
//  306 ////zs
//  307 ////    Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]);
//  308 ////   if(position ==1)  
//  309 ////   {
//  310 ////      if(AD_inductor[0]>50&&AD_inductor[0]>AD_inductor[1]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[2]<5)
//  311 ////        Chazhi=-70;
//  312 ////   }
//  313 ////   
//  314 ////    if(position ==2)  
//  315 ////   {
//  316 ////      if(AD_inductor[2]>50&&AD_inductor[2]>AD_inductor[1 ]&&AD_inductor[1]>AD_inductor[0]&&AD_inductor[0]<5)
//  317 ////        Chazhi=70;
//  318 ////   }
//  319 //  
//  320 //       if(position == 0)   //��ඪ��
//  321 //       {
//  322 //       
//  323 //            Chazhi =-60;
//  324 //       }
//  325 //       else if(position == 1 || position == 2) //�����м�λ��        
//  326 //       {
//  327 //                  
//  328 //             Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  329 //             
//  330 //             
//  331 //       }
//  332 //       else if(position == 3)  //�Ҳඪ��
//  333 //       {
//  334 //            Chazhi = 60;
//  335 //       }
//  336 //     
//  337 //
//  338 //      
//  339 //       /*
//  340 //       if(Strig  ht_Flag)
//  341 //       {
//  342 //           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //��ֱ����б�ʿ��ƶ��
//  343 //       }
//  344 //       if(UPhill_flag)  //����ʱ ǿ����������ƫ����
//  345 //       {
//  346 //           Chazhi = (int16)((AD_inductor[2] - AD_inductor[0]));
//  347 //       }
//  348 //       */
//  349 //       
//  350 //         
//  351 //       
//  352 //
//  353 //}
//  354 //
//  355 //
//  356 
//  357 
//  358 
//  359 
//  360 
//  361 
//  362 //��ʱ

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  363 void delayms(unsigned int time)
//  364 {
delayms:
        PUSH     {LR}
//  365    unsigned int i=0;
        MOVS     R1,#+0
//  366    while(time--)
??delayms_0:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        CMP      R2,#+0
        BEQ      ??delayms_1
//  367    {
//  368       i=12000;  //�Լ�����
        LDR      R2,??DataTable1_4  ;; 0x2ee0
        MOVS     R1,R2
//  369       while(i--);
??delayms_2:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        CMP      R2,#+0
        BNE      ??delayms_2
        B        ??delayms_0
//  370    }
//  371 }
??delayms_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ad_valu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     AD_V

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     AD_sum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     AD_valu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x2ee0
//  372 
//  373 ///ȡ����ֵ

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  374 uint16 abs_inductor(int value)
//  375 {
abs_inductor:
        PUSH     {LR}
//  376     if(value<0)
        CMP      R0,#+0
        BPL      ??abs_inductor_0
//  377       value=-value;
        RSBS     R1,R0,#+0
        MOVS     R0,R1
//  378     return value;
??abs_inductor_0:
        UXTH     R0,R0
        POP      {PC}             ;; return
//  379 }
//  380 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  381 float abs_f(float value)
//  382 {
abs_f:
        PUSH     {R7,LR}
//  383     if(value<0)
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??abs_f_0
//  384       value=-value;
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
//  385     return value;
??abs_f_0:
        POP      {R1,PC}          ;; return
//  386 }
//  387 
//  388 
//  389 
//  390 
//  391 /*************************************************************************
//  392  *  ��������   SC_black_Init
//  393  *  ����˵���� AD��ʼ��  ����е����ֵ �Լ� ���ɵ�д��FLASH
//  394  *  ����˵����
//  395  *  �������أ� ��
//  396  *  �޸�ʱ�䣺
//  397  *  ��    ע��
//  398 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void SC_black_Init(void)
//  400 {
//  401 //    uint16  i,j;
//  402 //    float  *Ptr_flash=NULL;
//  403 //    int16   Position_transit_short[4];
//  404 //    float  sensor_1,sensor_2,sensor_3,sensor_4;
//  405 //    flag_1 = 1;
//  406 //
//  407 //    if(inductor_flag)
//  408 //    {
//  409 //     inductor_flag = 0;
//  410 ////     UART_Send_String("Collecting");
//  411 ////     UART_Send_String("samples...");
//  412 //
//  413 //        max_v[0] = max_v[1] = max_v[2] = max_v[3] = max_v[4] = 0;
//  414 //        for(i=0;i<100;i++)
//  415 //        {
//  416 //
//  417 //            AD_valu[0] = ADC_Once(ADC_1,adc10bit);  //��  ͨ��
//  418 //            AD_valu[1] = ADC_Once(ADC_2,adc10bit);  //��  ͨ��
//  419 //            AD_valu[2] = ADC_Once(ADC_3,adc10bit);  //��  ͨ��
//  420 ////            AD_valu[3] = ADC_Once(ADC_4,adc10bit);  //��1 ͨ��
//  421 ////            AD_valu[4] = ADC_Once(ADC_5,adc10bit);  //��2 ͨ��
//  422 //            if(AD_valu[2]>300) AD_valu[2] = 250;
//  423 //            
//  424 //            for(j=0;j<3;j++)
//  425 //            {
//  426 //                if(AD_valu[j] > max_v[j])
//  427 //                {
//  428 //                    max_v[j] = AD_valu[j];
//  429 //                    if(j==0)    Position_transit_short[0] =  AD_valu[1];  //��¼���ɵ� ���ֵ
//  430 //                    if(j==2)    Position_transit_short[1] =  AD_valu[1];
//  431 ////                    if(j==3)    Position_transit_short[2] =  AD_valu[4];
//  432 ////                    if(j==4)    Position_transit_short[3] =  AD_valu[3];
//  433 //                }
//  434 //            }
//  435 //          
//  436 //        }
//  437 //        /***************              ��¼�Ĺ��ɵ��һ��                     ******************/
//  438 //        sensor_1 = (float)(Position_transit_short[0] - min_v[1])/(float)(max_v[1] - min_v[1]);
//  439 //        if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//  440 //        if(sensor_1 >= 1.0)  sensor_1 = 1.0;
//  441 //
//  442 //        sensor_2 = (float)(Position_transit_short[1] - min_v[1])/(float)(max_v[1] - min_v[1]);
//  443 //        if(sensor_2 <= 0.0)  sensor_2 = 0.001;
//  444 //        if(sensor_2 >= 1.0)  sensor_2 = 1.0;
//  445 //
//  446 ////        sensor_3 = (float)(Position_transit_short[2] - min_v[4])/(float)(max_v[4] - min_v[4]);
//  447 ////        if(sensor_3 <= 0.0)  sensor_3 = 0.001;/
//  448 ////        if(sensor_3 >= 1.0)  sensor_3 = 1.0;
//  449 ////
//  450 ////        sensor_4 = (float)(Position_transit_short[3] - min_v[3])/(float)(max_v[3] - min_v[3]);
//  451 ////        if(sensor_4 <= 0.0)  sensor_4 = 0.001;
//  452 ////        if(sensor_4 >= 1.0)  sensor_4 = 1.0;
//  453 //
//  454 //        //������ɵ��ֵ
//  455 //        Position_transit[0] = (int16)(100 * sensor_1);
//  456 //        Position_transit[1] = (int16)(100 * sensor_2);
//  457 ////        Position_transit[2] = (int16)(100 * sensor_3);
//  458 ////        Position_transit[3] = (int16)(100 * sensor_4);
//  459 //
//  460 //
//  461 //        //������ֵ�����ֵд��FASH����
//  462 //    /*
//  463 //        result=LPLD_Flash_SectorErase((uint32)SECTOR_ADM);//����254����
//  464 //        if(result == FLASH_OK)printf(0,0,"Eraser successful!");
//  465 //
//  466 //
//  467 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM, (uint32*)max_v, DATA_SIZE*4); //��б궨�����ֵд������
//  468 //        if(result == FLASH_OK)printf(0,0,"Write max successful!");
//  469 //
//  470 //
//  471 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM+20, (uint32*)Position_transit, 4*4);
//  472 //        if(result == FLASH_OK)printf(0,0,"Write Position_transit successful!");
//  473 //        */
//  474 //
//  475 //
//  476 //        /*
//  477 //        for(i=0;i<4;i++)                     //���ɵ��һ��ֵд������
//  478 //        {
//  479 //           LPLD_Flash_ByteProgram(SECTOR_ADM,20+i*4,Position_transit[i]);
//  480 //        }
//  481 //        */
//  482 ////    }
//  483 //    
//  484 ////    else
//  485 ////    {
//  486 ////        for(i=0;i<3;i++)
//  487 ////        {
//  488 ////          /*
//  489 ////          Ptr_flash = (float*)SECTOR_ADM;  ûдROM ����  ��
//  490 ////          */
//  491 ////           for(j=0;j<5;j++)   //��ȡ�����еĲ����궨�����ֵ
//  492 ////           {
//  493 ////               max_v[j] = *(Ptr_flash+j);
//  494 ////           }
//  495 ////           for(j=0;j<4;j++)  //��ȡ���ɵ�
//  496 ////           {
//  497 ////              Position_transit[j] = *(Ptr_flash+20+j);
//  498 ////           }
//  499 ////
//  500 ////           UART_Send_String("Reading");
//  501 ////           UART_Send_String("samples...");
//  502 ////          // delayms(10);
//  503 ////        }
//  504 //    }
//  505 
//  506 
//  507  }
SC_black_Init:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  508 
//  509 
//  510 
//  511 
//  512 
//  513 
//  514 
//  515 
// 
// 816 bytes in section .text
// 
// 816 bytes of CODE memory
//
//Errors: none
//Warnings: none
