///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:36
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\inductor_1.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\inductor_1.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\inductor_1.s
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

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\inductor_1.c
//    1 #include "inductor_1.h"
//    2 #include "Variable.h"
//    3 #include "common.h"
//    4 #include "allHead.h"
//    5 
//    6 
//    7 
//    8 //右  中 左   右竖 左竖 gnd
//    9 //橙  红 褐    黑   白  黄
//   10 //橙  黄 蓝    灰   紫  绿色
//   11 //4   2  3    1    5
//   12 //              右电感   中电感   左电感   位置     差值
//   13 //右电感最大    490,97    250,50  16,1      1        -95
//   14 //左电感最大    4,0.1    240,47  509,100    2         99
//   15 //过左弯道时     40,7    312,62   287,57    2          50      
//   16 //过左弯道时     4，0.1    194,38   287,57    2          50    
//   17                                      //          范围
//   18 //AD值：AD_valu[3]为采集到处理后的的AD值          0-260(小车行驶时)
//   19 //归一值sensor_to_one[5]为将AD值归一化            0-1
//   20 //最终值：AD_inductor[5]为将归一化的值放大100倍    0-100
//   21 //丢线：信号很小了，然后就按照找不到信号线来处理
//   22 //Position_transit[i]:记录过渡点归一化放大后的值
//   23 //Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
//   24 //Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值
//   25 //差值：差值大小由中电感与电磁线的相对位置决定
//   26 //小车在赛道内差值为100以内，出半个赛道200左右，全出赛道300左右
//   27 
//   28 
//   29 
//   30 
//   31 
//   32 
//   33 /*************************************************************************
//   34  *  函数名称   Read_ADC
//   35  *  功能说明： AD采集
//   36  *  参数说明：
//   37  *  函数返回： 无
//   38  *  修改时间：
//   39  *  备    注：
//   40 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   41 void Read_ADC(void)
//   42 {
Read_ADC:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
//   43       int16  i,j,k,temp;
//   44       int16  ad_valu1[5],ad_sum[5];
//   45 
//   46       for(i=0;i<5;i++)
        MOVS     R4,#+0
        B        ??Read_ADC_0
//   47       {
//   48 
//   49             ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //左  通道
??Read_ADC_1:
        MOVS     R1,#+2
        MOVS     R0,#+45
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRH     R0,[R1, R2]
//   50             ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //中  通道
        MOVS     R1,#+2
        MOVS     R0,#+17
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+10]
//   51             ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //右  通道
        MOVS     R1,#+2
        MOVS     R0,#+47
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+20]
//   52             ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //中1 通道
        MOVS     R1,#+2
        MOVS     R0,#+16
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+30]
//   53             ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //中2 通道
        MOVS     R1,#+2
        MOVS     R0,#+44
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+40]
//   54             
//   55 //            if(ad_valu[0][i] > 650) ad_valu[0][i]=500;
//   56 //            if(ad_valu[1][i] > 650) ad_valu[0][i]=500;
//   57 //            if(ad_valu[2][i] > 650) ad_valu[0][i]=500;
//   58 
//   59       }
        ADDS     R4,R4,#+1
??Read_ADC_0:
        SXTH     R4,R4
        CMP      R4,#+5
        BLT      ??Read_ADC_1
//   60    //////////////////////冒泡排序///////////////////////////////////
//   61       for(i=0;i<5;i++)     //5个电感
        MOVS     R4,#+0
        B        ??Read_ADC_2
??Read_ADC_3:
        ADDS     R4,R4,#+1
??Read_ADC_2:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_4
//   62       {
//   63          for(j=0;j<4;j++)  //五个数据排序
        MOVS     R0,#+0
        B        ??Read_ADC_5
//   64          {
//   65             for(k=0;k<4-j;k++)
//   66             {
//   67                if(ad_valu[i][k] > ad_valu[i][k+1])  //前面的比后面的大  则进行交换
??Read_ADC_6:
        LDR      R2,??DataTable1
        SXTH     R4,R4
        MOVS     R3,#+10
        MULS     R3,R4,R3
        ADDS     R2,R2,R3
        SXTH     R1,R1
        MOVS     R3,#+2
        MULS     R3,R1,R3
        ADDS     R2,R2,R3
        MOVS     R3,#+2
        LDRSH    R2,[R2, R3]
        LDR      R3,??DataTable1
        SXTH     R4,R4
        MOVS     R5,#+10
        MULS     R5,R4,R5
        ADDS     R3,R3,R5
        SXTH     R1,R1
        MOVS     R5,#+2
        MULS     R5,R1,R5
        LDRSH    R3,[R3, R5]
        CMP      R2,R3
        BGE      ??Read_ADC_7
//   68                {
//   69                   temp = ad_valu[i][k+1];
        LDR      R2,??DataTable1
        SXTH     R4,R4
        MOVS     R3,#+10
        MULS     R3,R4,R3
        ADDS     R2,R2,R3
        SXTH     R1,R1
        MOVS     R3,#+2
        MULS     R3,R1,R3
        ADDS     R2,R2,R3
        MOVS     R3,#+2
        LDRSH    R2,[R2, R3]
//   70                   ad_valu[i][k+1] = ad_valu[i][k];
        LDR      R3,??DataTable1
        SXTH     R4,R4
        MOVS     R5,#+10
        MULS     R5,R4,R5
        ADDS     R3,R3,R5
        SXTH     R1,R1
        MOVS     R5,#+2
        MULS     R5,R1,R5
        ADDS     R3,R3,R5
        LDR      R5,??DataTable1
        SXTH     R4,R4
        MOVS     R6,#+10
        MULS     R6,R4,R6
        ADDS     R5,R5,R6
        SXTH     R1,R1
        MOVS     R6,#+2
        MULS     R6,R1,R6
        LDRH     R5,[R5, R6]
        STRH     R5,[R3, #+2]
//   71                   ad_valu[i][k] = temp;
        LDR      R3,??DataTable1
        SXTH     R4,R4
        MOVS     R5,#+10
        MULS     R5,R4,R5
        ADDS     R3,R3,R5
        SXTH     R1,R1
        MOVS     R5,#+2
        MULS     R5,R1,R5
        STRH     R2,[R3, R5]
//   72                }
//   73             }
??Read_ADC_7:
        ADDS     R1,R1,#+1
??Read_ADC_8:
        SXTH     R1,R1
        MOVS     R2,#+4
        SXTH     R0,R0
        SUBS     R2,R2,R0
        CMP      R1,R2
        BLT      ??Read_ADC_6
        ADDS     R0,R0,#+1
??Read_ADC_5:
        SXTH     R0,R0
        CMP      R0,#+4
        BGE      ??Read_ADC_3
        MOVS     R1,#+0
        B        ??Read_ADC_8
//   74          }
//   75       }
//   76       for(i=0;i<5;i++)    //求中间三项的和
??Read_ADC_4:
        MOVS     R4,#+0
        B        ??Read_ADC_9
//   77       {
//   78          ad_sum[i] = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
??Read_ADC_10:
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
//   79          ad_valu1[i] = ad_sum[i] / 3;
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
//   80       }
        ADDS     R4,R4,#+1
??Read_ADC_9:
        SXTH     R4,R4
        CMP      R4,#+5
        BLT      ??Read_ADC_10
//   81    ////////////////////////滑动平均滤波/////////////////////////////
//   82       for(i = 0;i < NM-1;i ++)  //取中间3位的值到前三位
        MOVS     R4,#+0
        B        ??Read_ADC_11
//   83       {
//   84           AD_V[0][i] = ad_valu[0][i + 1];
??Read_ADC_12:
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
//   85           AD_V[1][i] = ad_valu[1][i + 1];
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
//   86           AD_V[2][i] = ad_valu[2][i + 1];
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
//   87           AD_V[3][i] = ad_valu[3][i + 1];
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
//   88           AD_V[4][i] = ad_valu[4][i + 1];
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
//   89       }
        ADDS     R4,R4,#+1
??Read_ADC_11:
        SXTH     R4,R4
        CMP      R4,#+2
        BLT      ??Read_ADC_12
//   90       for(i=0;i<5;i++)   //第三位存储平均值
        MOVS     R4,#+0
        B        ??Read_ADC_13
//   91       {
//   92           AD_V[i][NM-1] =  ad_valu1[i];
??Read_ADC_14:
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
//   93       }
        ADDS     R4,R4,#+1
??Read_ADC_13:
        SXTH     R4,R4
        CMP      R4,#+5
        BLT      ??Read_ADC_14
//   94          for(i = 0;i < NM;i ++)   //得到原中间三位的值
        MOVS     R4,#+0
        B        ??Read_ADC_15
//   95       {
//   96           AD_sum[0] += AD_V[0][i];
??Read_ADC_16:
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
//   97           AD_sum[1] += AD_V[1][i];
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
//   98           AD_sum[2] += AD_V[2][i];
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
//   99           AD_sum[3] += AD_V[3][i];
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
//  100           AD_sum[4] += AD_V[4][i];
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
//  101       }
        ADDS     R4,R4,#+1
??Read_ADC_15:
        SXTH     R4,R4
        CMP      R4,#+3
        BLT      ??Read_ADC_16
//  102       for(i=0;i<5;i++)  //求平均
        MOVS     R4,#+0
        B        ??Read_ADC_17
//  103       {
//  104           AD_valu[i] = AD_sum[i] / NM;
??Read_ADC_18:
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
//  105           AD_sum[i] = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  106       }
        ADDS     R4,R4,#+1
??Read_ADC_17:
        SXTH     R4,R4
        CMP      R4,#+5
        BLT      ??Read_ADC_18
//  107 }
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return
//  108 
//  109 
//  110 
//  111 
//  112 
//  113 
//  114 
//  115 
//  116 
//  117 
//  118 ///*************************************************************************
//  119 // *  函数名称   Date_analyse
//  120 // *  功能说明： 数据分析
//  121 // *  参数说明：
//  122 // *  函数返回： 无
//  123 // *  修改时间：
//  124 // *  备    注：
//  125 //*************************************************************************/
//  126 //void Date_analyse()
//  127 //{
//  128 ////     char Chazhi_flag = 0;
//  129 ////     char Chazhi_value[11];
//  130 ////     int16  a,b;
//  131 //     int16  i,max_front=0,max_back;
//  132 //     static int16 max_old = 1,max_crosstalk = 1;
//  133 //     static int16 position_last = 2;
//  134 //     float  sensor_1;
//  135 //
//  136 //     Read_ADC();
//  137 //
//  138 //    Inductor_Check();//电感最大最小值校验 
//  139 //     /*********************归一化处理********************/
//  140 //     for(i=0;i<5;i++)
//  141 //     {
//  142 //        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
//  143 //      if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
//  144 ////        if(sensor_to_one[0]<=0.0)  sensor_to_one[0]=0.001;
//  145 ////        if(sensor_to_one[0]>1.0)  sensor_to_one[0]=1.0;
//  146 ////        
//  147 ////        if(sensor_to_one[2]<=0.0)  sensor_to_one[2]=0.001;
//  148 ////        if(sensor_to_one[2]>1.0)  sensor_to_one[2]=1.0;
//  149 //
//  150 //        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
//  151 //     }
//  152 //       /*******1号电感特殊归一化，用于坡道检测********/
//  153 //      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//  154 //      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//  155 //      Slope_AD_1 = 100 * sensor_1;
//  156 //   ////////////////////////////////////////////////////////////////////
//  157 //
//  158 //       for(i=0;i<3;i++)                 //找出最强的传感器
//  159 //       {
//  160 //         if(AD_inductor[max_front]<AD_inductor[i])
//  161 //           max_front=i;
//  162 //       }
//  163 //       max_value=AD_inductor[max_front];  //最大电感值
//  164 //
//  165 //    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //找后排最强电感
//  166 // //zs屏蔽      
//  167 //       //丢线时最大值取旧值
//  168 //       if(max_value < 5)           
//  169 //       {
//  170 //         max_front=max_old;
//  171 //         max_value=AD_inductor[max_front];
//  172 //       }
//  173 //       else
//  174 //         max_old=max_front;
//  175 ////       //防串道
//  176 //       if(abs_inductor(max_front - max_crosstalk) < 2)  
//  177 //       {
//  178 //            max_crosstalk = max_front;
//  179 //       }
//  180 //       else
//  181 //            max_front = max_crosstalk;
//  182 // //张盛屏蔽      
//  183 //      // AD_MAX_NUM = max_front;        //传送速度控制
//  184 //       
//  185 //        /****************位置解算，解算过程的值用归一化放大后的值************************/
//  186 ////zs1    
//  187 //       
//  188 ////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] > AD_inductor[2])  ))
//  189 ////       {
//  190 ////           position=1;         
//  191 ////       }
//  192 ////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] < AD_inductor[2])  ))
//  193 ////       {
//  194 ////           position=2;         
//  195 ////       }
//  196 ////         
//  197 ////         
//  198 ////ZS2       
//  199 //        if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
//  200 //       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  201 //             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//  202 // //          AD_0_max = AD_inductor[0];//zs加
//  203 //       }
//  204 //       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
//  205 //       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  206 //           //      中电感在电磁线左边                            中电感在电磁线左边
//  207 //             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
//  208 //             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
//  209 //       }
//  210 //       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
//  211 //       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  212 //        //    中电感在电磁线右边                         中电感在电磁线右边          
//  213 //             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
//  214 //             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
//  215 //       }
//  216 //       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] ))  //已经偏离3号传感器
//  217 //       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  218 //             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
//  219 //        // AD_2_max = AD_inductor[2];//zs加
//  220 //
//  221 //       }   
//  222 //         
//  223 //         
//  224 ////Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
//  225 ////Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值中电感的值
//  226 ////       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
//  227 ////       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  228 ////             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//  229 //// //          AD_0_max = AD_inductor[0];//zs加
//  230 ////       }
//  231 ////       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //左侧位置  0-1号传感器之间
//  232 ////       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  233 ////           //      中电感在电磁线左边                            中电感在电磁线左边
//  234 ////             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
//  235 ////             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
//  236 ////       }
//  237 ////       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //右侧位置  1-2号传感器之间
//  238 ////       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  239 ////        //    中电感在电磁线右边                         中电感在电磁线右边          
//  240 ////             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
//  241 ////             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
//  242 ////       }
//  243 ////       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //已经偏离3号传感器
//  244 ////       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  245 ////             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
//  246 ////        // AD_2_max = AD_inductor[2];//zs加
//  247 ////
//  248 ////       }
//  249 //       /*
//  250 //       //~~~~~~~~~~~~~~~~~~~~~~~ 后排位置解算~~~~~~~~~~~~~~~~~~~//
//  251 //       if(max_back == 3 && AD_inductor[4] <= Position_transit[2] - 1)
//  252 //       {
//  253 //            if(AD_inductor[4] <= Position_transit[2] - 22)
//  254 //               position_back = 0;
//  255 //            if(AD_inductor[4] >= Position_transit[2] - 20)
//  256 //               position_back = 1;
//  257 //       }
//  258 //       else  if(max_back == 3 && AD_inductor[4] > Position_transit[2] + 1 || max_back == 4 && AD_inductor[3] > Position_transit[3] + 1)
//  259 //       {
//  260 //            position_back = 2;
//  261 //       }
//  262 //       else if(max_back == 4 && AD_inductor[3] <= Position_transit[3] - 1)
//  263 //       {
//  264 //            if(AD_inductor[3] >= Position_transit[3] - 20)
//  265 //               position_back = 3;
//  266 //            if(AD_inductor[3] <= Position_transit[3] - 22)
//  267 //               position_back = 4;
//  268 //       }
//  269 //       */
//  270 //      /*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
//  271 // //zs屏蔽      
//  272 //       if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
//  273 //       {
//  274 //            position = position_last;//此刻小车位置转变为上一次小车位置
//  275 //       }
//  276 //       else
//  277 //       {
//  278 //       position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
//  279 //       }   
//  280 ////zs屏蔽
//  281 ////////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
//  282 ///*用于小车直道太偏或过弯道时小车转弯幅度小不给力，小车不能好好的给过弯道，此时强制*/
//  283 ////当在直道整个小车太过偏左都在电磁线左边时且此时最强的右电感值<75,说明小车太偏了，进入if
//  284 ////当遇到弯道小车转弯幅度不够，可能会冲出赛道，进入if 
//  285 //       
//  286 //      //////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
//  287 ////张盛屏蔽
//  288 ////       if(position == 0 && AD_0_max < 75)
//  289 ////       {
//  290 ////           AD_0_max = 75 + abs_f(75 - AD_0_max);
//  291 ////       }
//  292 ////       else if(position == 3 && AD_2_max < 75)
//  293 ////       {
//  294 ////           AD_2_max = 75 + abs_f(75 - AD_2_max);
//  295 ////       }
//  296 ////张盛屏蔽
//  297 //  Chazhi_Last=Chazhi;
//  298 //       /*************计算偏移量*************/
//  299 ////zs
//  300 ////    Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]);
//  301 ////   if(position ==1)  
//  302 ////   {
//  303 ////      if(AD_inductor[0]>50&&AD_inductor[0]>AD_inductor[1]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[2]<5)
//  304 ////        Chazhi=-70;
//  305 ////   }
//  306 ////   
//  307 ////    if(position ==2)  
//  308 ////   {
//  309 ////      if(AD_inductor[2]>50&&AD_inductor[2]>AD_inductor[1 ]&&AD_inductor[1]>AD_inductor[0]&&AD_inductor[0]<5)
//  310 ////        Chazhi=70;
//  311 ////   }
//  312 //  
//  313 //       if(position == 0)   //左侧丢线
//  314 //       {
//  315 //       
//  316 //            Chazhi =-60;
//  317 //       }
//  318 //       else if(position == 1 || position == 2) //处于中间位置        
//  319 //       {
//  320 //                  
//  321 //             Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  322 //             
//  323 //             
//  324 //       }
//  325 //       else if(position == 3)  //右侧丢线
//  326 //       {
//  327 //            Chazhi = 60;
//  328 //       }
//  329 //     
//  330 //
//  331 //      
//  332 //       /*
//  333 //       if(Strig  ht_Flag)
//  334 //       {
//  335 //           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //长直道用斜率控制舵机
//  336 //       }
//  337 //       if(UPhill_flag)  //上坡时 强制用两侧电感偏移量
//  338 //       {
//  339 //           Chazhi = (int16)((AD_inductor[2] - AD_inductor[0]));
//  340 //       }
//  341 //       */
//  342 //       
//  343 //         
//  344 //       
//  345 //
//  346 //}
//  347 //
//  348 //
//  349 
//  350 
//  351 
//  352 
//  353 
//  354 
//  355 //延时

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  356 void delayms(unsigned int time)
//  357 {
delayms:
        PUSH     {LR}
//  358    unsigned int i=0;
        MOVS     R1,#+0
//  359    while(time--)
??delayms_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BEQ      ??delayms_1
//  360    {
//  361       i=12000;  //自己定义
        LDR      R1,??DataTable1_4  ;; 0x2ee0
//  362       while(i--);
??delayms_2:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        CMP      R2,#+0
        BNE      ??delayms_2
        B        ??delayms_0
//  363    }
//  364 }
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
//  365 
//  366 ///取绝对值

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  367 uint16 abs_inductor(int value)
//  368 {
abs_inductor:
        PUSH     {LR}
//  369     if(value<0)
        CMP      R0,#+0
        BPL      ??abs_inductor_0
//  370       value=-value;
        RSBS     R1,R0,#+0
        MOVS     R0,R1
//  371     return value;
??abs_inductor_0:
        UXTH     R0,R0
        POP      {PC}             ;; return
//  372 }
//  373 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  374 float abs_f(float value)
//  375 {
abs_f:
        PUSH     {R7,LR}
//  376     if(value<0)
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??abs_f_0
//  377       value=-value;
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
//  378     return value;
??abs_f_0:
        POP      {R1,PC}          ;; return
//  379 }
//  380 
//  381 
//  382 
//  383 
//  384 /*************************************************************************
//  385  *  函数名称   SC_black_Init
//  386  *  功能说明： AD初始化  将电感的最大值 以及 过渡点写入FLASH
//  387  *  参数说明：
//  388  *  函数返回： 无
//  389  *  修改时间：
//  390  *  备    注：
//  391 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  392 void SC_black_Init(void)
//  393 {
//  394 //    uint16  i,j;
//  395 //    float  *Ptr_flash=NULL;
//  396 //    int16   Position_transit_short[4];
//  397 //    float  sensor_1,sensor_2,sensor_3,sensor_4;
//  398 //    flag_1 = 1;
//  399 //
//  400 //    if(inductor_flag)
//  401 //    {
//  402 //     inductor_flag = 0;
//  403 ////     UART_Send_String("Collecting");
//  404 ////     UART_Send_String("samples...");
//  405 //
//  406 //        max_v[0] = max_v[1] = max_v[2] = max_v[3] = max_v[4] = 0;
//  407 //        for(i=0;i<100;i++)
//  408 //        {
//  409 //
//  410 //            AD_valu[0] = ADC_Once(ADC_1,adc10bit);  //左  通道
//  411 //            AD_valu[1] = ADC_Once(ADC_2,adc10bit);  //中  通道
//  412 //            AD_valu[2] = ADC_Once(ADC_3,adc10bit);  //右  通道
//  413 ////            AD_valu[3] = ADC_Once(ADC_4,adc10bit);  //中1 通道
//  414 ////            AD_valu[4] = ADC_Once(ADC_5,adc10bit);  //中2 通道
//  415 //            if(AD_valu[2]>300) AD_valu[2] = 250;
//  416 //            
//  417 //            for(j=0;j<3;j++)
//  418 //            {
//  419 //                if(AD_valu[j] > max_v[j])
//  420 //                {
//  421 //                    max_v[j] = AD_valu[j];
//  422 //                    if(j==0)    Position_transit_short[0] =  AD_valu[1];  //记录过渡点 电感值
//  423 //                    if(j==2)    Position_transit_short[1] =  AD_valu[1];
//  424 ////                    if(j==3)    Position_transit_short[2] =  AD_valu[4];
//  425 ////                    if(j==4)    Position_transit_short[3] =  AD_valu[3];
//  426 //                }
//  427 //            }
//  428 //          
//  429 //        }
//  430 //        /***************              记录的过渡点归一化                     ******************/
//  431 //        sensor_1 = (float)(Position_transit_short[0] - min_v[1])/(float)(max_v[1] - min_v[1]);
//  432 //        if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//  433 //        if(sensor_1 >= 1.0)  sensor_1 = 1.0;
//  434 //
//  435 //        sensor_2 = (float)(Position_transit_short[1] - min_v[1])/(float)(max_v[1] - min_v[1]);
//  436 //        if(sensor_2 <= 0.0)  sensor_2 = 0.001;
//  437 //        if(sensor_2 >= 1.0)  sensor_2 = 1.0;
//  438 //
//  439 ////        sensor_3 = (float)(Position_transit_short[2] - min_v[4])/(float)(max_v[4] - min_v[4]);
//  440 ////        if(sensor_3 <= 0.0)  sensor_3 = 0.001;/
//  441 ////        if(sensor_3 >= 1.0)  sensor_3 = 1.0;
//  442 ////
//  443 ////        sensor_4 = (float)(Position_transit_short[3] - min_v[3])/(float)(max_v[3] - min_v[3]);
//  444 ////        if(sensor_4 <= 0.0)  sensor_4 = 0.001;
//  445 ////        if(sensor_4 >= 1.0)  sensor_4 = 1.0;
//  446 //
//  447 //        //扩大过渡点的值
//  448 //        Position_transit[0] = (int16)(100 * sensor_1);
//  449 //        Position_transit[1] = (int16)(100 * sensor_2);
//  450 ////        Position_transit[2] = (int16)(100 * sensor_3);
//  451 ////        Position_transit[3] = (int16)(100 * sensor_4);
//  452 //
//  453 //
//  454 //        //将过渡值和最大值写到FASH里面
//  455 //    /*
//  456 //        result=LPLD_Flash_SectorErase((uint32)SECTOR_ADM);//擦除254扇区
//  457 //        if(result == FLASH_OK)printf(0,0,"Eraser successful!");
//  458 //
//  459 //
//  460 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM, (uint32*)max_v, DATA_SIZE*4); //电感标定的最大值写入扇区
//  461 //        if(result == FLASH_OK)printf(0,0,"Write max successful!");
//  462 //
//  463 //
//  464 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM+20, (uint32*)Position_transit, 4*4);
//  465 //        if(result == FLASH_OK)printf(0,0,"Write Position_transit successful!");
//  466 //        */
//  467 //
//  468 //
//  469 //        /*
//  470 //        for(i=0;i<4;i++)                     //过渡点归一化值写入扇区
//  471 //        {
//  472 //           LPLD_Flash_ByteProgram(SECTOR_ADM,20+i*4,Position_transit[i]);
//  473 //        }
//  474 //        */
//  475 ////    }
//  476 //    
//  477 ////    else
//  478 ////    {
//  479 ////        for(i=0;i<3;i++)
//  480 ////        {
//  481 ////          /*
//  482 ////          Ptr_flash = (float*)SECTOR_ADM;  没写ROM 报错  改
//  483 ////          */
//  484 ////           for(j=0;j<5;j++)   //读取五个电感的采样标定的最大值
//  485 ////           {
//  486 ////               max_v[j] = *(Ptr_flash+j);
//  487 ////           }
//  488 ////           for(j=0;j<4;j++)  //读取过渡点
//  489 ////           {
//  490 ////              Position_transit[j] = *(Ptr_flash+20+j);
//  491 ////           }
//  492 ////
//  493 ////           UART_Send_String("Reading");
//  494 ////           UART_Send_String("samples...");
//  495 ////          // delayms(10);
//  496 ////        }
//  497 //    }
//  498 
//  499 
//  500  }
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
//  501 
//  502 
//  503 
//  504 
//  505 
//  506 
//  507 
//  508 
// 
// 794 bytes in section .text
// 
// 794 bytes of CODE memory
//
//Errors: none
//Warnings: none
