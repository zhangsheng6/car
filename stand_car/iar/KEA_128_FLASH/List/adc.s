///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:57:59
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\adc.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\adc.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -lB
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -o
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\device\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\user\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\system\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\lib\H\ -I
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\adc.s
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

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\adc.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：     adc.c
//    8   * 文件标识：
//    9   * 摘    要：
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1月23日 10:55:52
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
//   23   * 简介
//   24   *     对adc引脚进行编码
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
//   43       case B0:
//   44         shift = 4;
??Change_4:
        MOVS     R0,#+4
//   45         break;
        B        ??Change_17
//   46       case B1:
//   47         shift = 5;
??Change_5:
        MOVS     R0,#+5
//   48         break;
        B        ??Change_17
//   49       case B2:
//   50         shift = 6;
??Change_6:
        MOVS     R0,#+6
//   51         break;
        B        ??Change_17
//   52       case B3:
//   53         shift = 7;
??Change_7:
        MOVS     R0,#+7
//   54         break;
        B        ??Change_17
//   55 
//   56       case C0:
//   57         shift = 8;
??Change_8:
        MOVS     R0,#+8
//   58         break;
        B        ??Change_17
//   59       case C1:
//   60         shift = 9;
??Change_9:
        MOVS     R0,#+9
//   61         break;
        B        ??Change_17
//   62       case C2:
//   63         shift = 10;
??Change_10:
        MOVS     R0,#+10
//   64         break;
        B        ??Change_17
//   65       case C3:
//   66         shift = 11;
??Change_11:
        MOVS     R0,#+11
//   67         break;
        B        ??Change_17
//   68 
//   69       case F4:
//   70         shift = 12;
??Change_12:
        MOVS     R0,#+12
//   71         break;
        B        ??Change_17
//   72       case F5:
//   73         shift = 13;
??Change_13:
        MOVS     R0,#+13
//   74         break;
        B        ??Change_17
//   75       case F6:
//   76         shift = 14;
??Change_14:
        MOVS     R0,#+14
//   77         break;
        B        ??Change_17
//   78       case F7:
//   79         shift = 15;
??Change_15:
        MOVS     R0,#+15
//   80         break;
        B        ??Change_17
//   81 
//   82       default:
//   83         shift = 0;
??Change_16:
        MOVS     R0,#+0
//   84         break;
//   85     }
//   86 
//   87     return shift;
??Change_17:
        UXTB     R0,R0
        POP      {PC}             ;; return
//   88 }
//   89 
//   90 /**
//   91   * 简介
//   92   *     ADC 初始化
//   93   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 void ADC_Init()
//   95 {
//   96 
//   97     SIM->SCGC |= SIM_SCGC_ADC_MASK;       //开启ADC时钟
ADC_Init:
        LDR      R0,??DataTable4  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+22       ;; #+536870912
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4  ;; 0x40048014
        STR      R1,[R0, #+0]
//   98 
//   99     ADC->APCTL1 &= 0; //所有引脚 禁用ADC功能
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1  ;; 0x4003b018
        STR      R0,[R1, #+0]
//  100 
//  101     ADC->SC3 = ( 0
//  102                  | ADC_SC3_ADIV(1)           //分频系数，=输入时钟
//  103                //| ADC_SC3_MODE(bit)         //分辨率
//  104                  | ADC_SC3_ADICLK(0)         //使用总线时钟最为ADC得时钟源
//  105                  | ADC_SC3_ADLSMP(1)         //长采样
//  106                  | ADC_SC3_ADLPC(0)     //高速模式
//  107                 );
        MOVS     R0,#+48
        LDR      R1,??DataTable4_2  ;; 0x4003b008
        STR      R0,[R1, #+0]
//  108     ADC->SC2 = ( 0
//  109                  | ADC_SC2_REFSEL(0)       //基准电压选择
//  110                  | ADC_SC2_ADTRG(0)        //软件触发
//  111                  | ADC_SC2_ACFE(0)         //比较功能禁用
//  112                 );
        MOVS     R0,#+0
        LDR      R1,??DataTable4_3  ;; 0x4003b004
        STR      R0,[R1, #+0]
//  113 }
        BX       LR               ;; return
//  114 
//  115 /**
//  116   * 简介
//  117   *     ADC 引脚使能
//  118   * 参数
//  119   *     adcn_ch
//  120   *       通道号(variable.h中编辑)
//  121   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 void ADC_Able(PTX_n adcn_ch)
//  123 {
ADC_Able:
        PUSH     {R7,LR}
//  124     uint8 shift = 0;
        MOVS     R1,#+0
//  125 
//  126     shift = Change(adcn_ch);
        UXTB     R0,R0
        BL       Change
        MOVS     R1,R0
//  127 
//  128     ADC->APCTL1 |= 1<<shift;              //使能ADC引脚
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R1
        ORRS     R2,R2,R0
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        STR      R2,[R0, #+0]
//  129 }
        POP      {R0,PC}          ;; return
//  130 
//  131 /**
//  132   * 简介
//  133   *     关掉 ADC
//  134   * 参数
//  135   *     adcn_ch
//  136   *       通道号(variable.h中编辑)
//  137   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  138 void ADC_Disable(PTX_n adcn_ch)
//  139 {
ADC_Disable:
        PUSH     {R7,LR}
//  140     uint8  shift = 0;
        MOVS     R1,#+0
//  141     uint16 mon = 0;
        MOVS     R2,#+0
//  142 
//  143     shift = Change(adcn_ch);
        UXTB     R0,R0
        BL       Change
        MOVS     R1,R0
//  144     mon = (uint16)(1 << shift);
        MOVS     R2,#+1
        LSLS     R2,R2,R1
//  145 
//  146     ADC->APCTL1 &= ~mon;              //禁止ADC引脚
        LDR      R0,??DataTable4_1  ;; 0x4003b018
        LDR      R0,[R0, #+0]
        UXTH     R2,R2
        BICS     R0,R0,R2
        LDR      R1,??DataTable4_1  ;; 0x4003b018
        STR      R0,[R1, #+0]
//  147 }
        POP      {R0,PC}          ;; return
//  148 
//  149 
//  150 /**
//  151   * 简介
//  152   *     采集一次ADC数据
//  153   * 参数
//  154   *     adcn_ch
//  155   *       通道号
//  156   *     bit
//  157   *       adc8bit
//  158   *       adc10bit
//  159   *       adc12bit
//  160   * 返回值
//  161   *     无符号结果值(范围:0-4095)
//  162   * 备注
//  163   *     进入之后会开启对应引脚的 ADC功能 但 出去时候 没有关闭
//  164   *     没有使能连续转换功能，所以对 ADC_SC1 执行一次写操作将启动一次转换
//  165   *
//  166   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  167 uint16 ADC_Once(PTX_n adcn_ch, adcBit bit)
//  168 {
ADC_Once:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  169       uint16 result;
//  170       uint8  shift = 0;
        MOVS     R6,#+0
//  171 
//  172     shift = Change(adcn_ch);
        MOVS     R0,R5
        UXTB     R0,R0
        BL       Change
        MOVS     R6,R0
//  173 
//  174     ADC_Able(adcn_ch);
        MOVS     R0,R5
        UXTB     R0,R0
        BL       ADC_Able
//  175 
//  176     ADC->SC3 |=  ADC_SC3_MODE(bit);  //分辨率
        LDR      R0,??DataTable4_2  ;; 0x4003b008
        LDR      R0,[R0, #+0]
        UXTB     R4,R4
        LSLS     R1,R4,#+2
        MOVS     R2,#+12
        ANDS     R2,R2,R1
        ORRS     R2,R2,R0
        LDR      R0,??DataTable4_2  ;; 0x4003b008
        STR      R2,[R0, #+0]
//  177     ADC->SC1  = ADC_SC1_ADCH(shift);       //启动转换
        UXTB     R6,R6
        LSLS     R0,R6,#+27       ;; ZeroExtS R0,R6,#+27,#+27
        LSRS     R0,R0,#+27
        LDR      R1,??DataTable4_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//  178 
//  179     //对 ADC_SC1 执行一次写操作将启动转换
//  180     while(!(ADC->SC1 & ADC_SC1_COCO_MASK)); //等待转换完成
??ADC_Once_0:
        LDR      R0,??DataTable4_4  ;; 0x4003b000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??ADC_Once_0
//  181     result = ADC->R;
        LDR      R0,??DataTable4_5  ;; 0x4003b010
        LDR      R0,[R0, #+0]
//  182 
//  183     return (result & ADC_R_ADR_MASK);       //返回结果
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        POP      {R4-R6,PC}       ;; return
//  184 }
//  185 
//  186 /**
//  187   * 简介
//  188   *     ADC 停止采集
//  189   * 参数
//  190 
//  191   * 备注
//  192   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  193 void ADC_Stop(void)
//  194 {
//  195     ADC->SC1 = ADC_SC1_ADCH(0xFF);
ADC_Stop:
        MOVS     R0,#+31
        LDR      R1,??DataTable4_4  ;; 0x4003b000
        STR      R0,[R1, #+0]
//  196 }
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
//  197 
//  198 
//  199 /**
//  200   * 简介
//  201   *     中值滤波后的结果(范围:0-4095)
//  202   * 参数
//  203   *     MoudelNumber：模块号
//  204   *     Channel：通道号
//  205   *     accuracy：精度
//  206   *     N:均值滤波次数
//  207   * 返回值
//  208   *     无符号结果值(范围:0-4095)
//  209   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  210 uint16 hw_ad_mid(PTX_n adcn_ch, adcBit bit)
//  211 {
hw_ad_mid:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
//  212     uint16 i, j, k, tmp;
//  213 
//  214     //取3次A/D转换结果
//  215     i = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
        MOVS     R4,R0
//  216     j = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
        MOVS     R5,R0
//  217     k = ADC_Once(adcn_ch, bit);
        MOVS     R1,R7
        UXTB     R1,R1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       ADC_Once
//  218 
//  219     //取中值 冒泡排序 中间为中值
//  220     if (i > j)
        UXTH     R5,R5
        UXTH     R4,R4
        CMP      R5,R4
        BCS      ??hw_ad_mid_0
//  221     {
//  222         tmp = i; i = j; j = tmp;
        MOVS     R1,R4
        MOVS     R4,R5
        MOVS     R5,R1
//  223     }
//  224     if (j > k)
??hw_ad_mid_0:
        UXTH     R0,R0
        UXTH     R5,R5
        CMP      R0,R5
        BCS      ??hw_ad_mid_1
//  225     {
//  226         tmp = j; j = k; k = tmp;
        MOVS     R1,R5
        MOVS     R5,R0
        MOVS     R0,R1
//  227     }
//  228     if (i > j)
??hw_ad_mid_1:
        UXTH     R5,R5
        UXTH     R4,R4
        CMP      R5,R4
        BCS      ??hw_ad_mid_2
//  229     {
//  230         tmp = i; i = j; j = tmp;
        MOVS     R1,R4
        MOVS     R4,R5
        MOVS     R5,R1
//  231     }
//  232 
//  233     return      j;
??hw_ad_mid_2:
        MOVS     R0,R5
        UXTH     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  234 }
//  235 
//  236 /**
//  237   * 简介
//  238   *     均值滤波后的结果(范围:0-4095)
//  239   * 参数
//  240   *     MoudelNumber：模块号
//  241   *     Channel：通道号
//  242   *     accuracy：精度
//  243   *     N:均值滤波次数
//  244   * 返回值
//  245   *     无符号结果值(范围:0-4095)
//  246   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  247 uint16 hw_ad_ave(PTX_n adcn_ch, adcBit bit, uint8 N)
//  248 {
hw_ad_ave:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
//  249     uint32 tmp = 0;
        MOVS     R0,#+0
//  250     uint8  i;
//  251 
//  252     for (i=0; i<N; i++)
        MOVS     R5,#+0
        B        ??hw_ad_ave_0
//  253         tmp += hw_ad_mid(adcn_ch, bit);
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
//  254     tmp = tmp / N;
        UXTB     R6,R6
        MOVS     R1,R6
        BL       __aeabi_uidiv
//  255 
//  256     return (uint16)tmp;
        UXTH     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  257 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  258 
//  259 
//  260 
// 
//   2 bytes in section .bss
// 496 bytes in section .text
// 
// 496 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: none
