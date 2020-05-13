///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:37:58
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\inductor_1.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\inductor_1.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\device\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\user\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\lib\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\inductor_1.s
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

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\inductor_1.c
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
//   12 //1   2  3    4     5
//   13 //              右电感   中电感   左电感   位置     差值
//   14 //右电感最大    490,97    250,50  16,1      1        -95
//   15 //左电感最大    4,0.1    240,47  509,100    2         99
//   16 //过左弯道时     40,7    312,62   287,57    2          50      
//   17 //过左弯道时     4，0.1    194,38   287,57    2          50    
//   18                                      //          范围
//   19 //AD值：AD_valu[3]为采集到处理后的的AD值          0-260(小车行驶时)
//   20 //归一值sensor_to_one[5]为将AD值归一化            0-1
//   21 //最终值：AD_inductor[5]为将归一化的值放大100倍    0-100
//   22 //丢线：信号很小了，然后就按照找不到信号线来处理
//   23 //Position_transit[i]:记录过渡点归一化放大后的值
//   24 //Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
//   25 //Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值
//   26 //差值：差值大小由中电感与电磁线的相对位置决定
//   27 //小车在赛道内差值为100以内，出半个赛道200左右，全出赛道300左右
//   28 
//   29 
//   30 
//   31 
//   32 
//   33 
//   34 /*************************************************************************
//   35  *  函数名称   Read_ADC
//   36  *  功能说明： AD采集
//   37  *  参数说明：
//   38  *  函数返回： 无
//   39  *  修改时间：
//   40  *  备    注：
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
//   50 //            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //左  通道
//   51 //            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //中  通道
//   52 //            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //右  通道
//   53 //            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //中1 通道
//   54 //            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //中2 通道
//   55         
//   56                  ad_valu[0][i] = ADC_Once(ADC_5,adc12bit);  //左  通道
        MOVS     R1,#+2
        MOVS     R0,#+44
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        STRH     R0,[R1, R2]
//   57             ad_valu[1][i] = ADC_Once(ADC_4,adc12bit);  //中  通道
        MOVS     R1,#+2
        MOVS     R0,#+45
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+10]
//   58             ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //右  通道
        MOVS     R1,#+2
        MOVS     R0,#+47
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+20]
//   59             ad_valu[3][i] = ADC_Once(ADC_2,adc12bit);  //中1 通道
        MOVS     R1,#+2
        MOVS     R0,#+17
        BL       ADC_Once
        LDR      R1,??DataTable1
        SXTH     R4,R4
        MOVS     R2,#+2
        MULS     R2,R4,R2
        ADDS     R1,R1,R2
        STRH     R0,[R1, #+30]
//   60             ad_valu[4][i] = ADC_Once(ADC_1,adc12bit);  //中2 通道
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
//   67    //////////////////////冒泡排序///////////////////////////////////
//   68       for(i=0;i<5;i++)     //5个电感
??Read_ADC_1:
        MOVS     R0,#+0
        MOVS     R4,R0
??Read_ADC_2:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Read_ADC_3
//   69       {
//   70          for(j=0;j<4;j++)  //五个数据排序
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
//   74                if(ad_valu[i][k] > ad_valu[i][k+1])  //前面的比后面的大  则进行交换
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
//   83       for(i=0;i<5;i++)    //求中间三项的和
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
//   88    ////////////////////////滑动平均滤波/////////////////////////////
//   89       for(i = 0;i < NM-1;i ++)  //取中间3位的值到前三位
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
//   97       for(i=0;i<5;i++)   //第三位存储平均值
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
//  101          for(i = 0;i < NM;i ++)   //得到原中间三位的值
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
//  109       for(i=0;i<5;i++)  //求平均
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
//  126 // *  函数名称   Date_analyse
//  127 // *  功能说明： 数据分析
//  128 // *  参数说明：
//  129 // *  函数返回： 无
//  130 // *  修改时间：
//  131 // *  备    注：
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
//  145 //    Inductor_Check();//电感最大最小值校验 
//  146 //     /*********************归一化处理********************/
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
//  157 //        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
//  158 //     }
//  159 //       /*******1号电感特殊归一化，用于坡道检测********/
//  160 //      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//  161 //      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//  162 //      Slope_AD_1 = 100 * sensor_1;
//  163 //   ////////////////////////////////////////////////////////////////////
//  164 //
//  165 //       for(i=0;i<3;i++)                 //找出最强的传感器
//  166 //       {
//  167 //         if(AD_inductor[max_front]<AD_inductor[i])
//  168 //           max_front=i;
//  169 //       }
//  170 //       max_value=AD_inductor[max_front];  //最大电感值
//  171 //
//  172 //    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //找后排最强电感
//  173 // //zs屏蔽      
//  174 //       //丢线时最大值取旧值
//  175 //       if(max_value < 5)           
//  176 //       {
//  177 //         max_front=max_old;
//  178 //         max_value=AD_inductor[max_front];
//  179 //       }
//  180 //       else
//  181 //         max_old=max_front;
//  182 ////       //防串道
//  183 //       if(abs_inductor(max_front - max_crosstalk) < 2)  
//  184 //       {
//  185 //            max_crosstalk = max_front;
//  186 //       }
//  187 //       else
//  188 //            max_front = max_crosstalk;
//  189 // //张盛屏蔽      
//  190 //      // AD_MAX_NUM = max_front;        //传送速度控制
//  191 //       
//  192 //        /****************位置解算，解算过程的值用归一化放大后的值************************/
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
//  206 //        if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
//  207 //       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  208 //             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//  209 // //          AD_0_max = AD_inductor[0];//zs加
//  210 //       }
//  211 //       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
//  212 //       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  213 //           //      中电感在电磁线左边                            中电感在电磁线左边
//  214 //             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
//  215 //             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
//  216 //       }
//  217 //       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
//  218 //       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  219 //        //    中电感在电磁线右边                         中电感在电磁线右边          
//  220 //             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
//  221 //             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
//  222 //       }
//  223 //       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] ))  //已经偏离3号传感器
//  224 //       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  225 //             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
//  226 //        // AD_2_max = AD_inductor[2];//zs加
//  227 //
//  228 //       }   
//  229 //         
//  230 //         
//  231 ////Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
//  232 ////Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值中电感的值
//  233 ////       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
//  234 ////       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  235 ////             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//  236 //// //          AD_0_max = AD_inductor[0];//zs加
//  237 ////       }
//  238 ////       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //左侧位置  0-1号传感器之间
//  239 ////       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  240 ////           //      中电感在电磁线左边                            中电感在电磁线左边
//  241 ////             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
//  242 ////             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
//  243 ////       }
//  244 ////       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //右侧位置  1-2号传感器之间
//  245 ////       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  246 ////        //    中电感在电磁线右边                         中电感在电磁线右边          
//  247 ////             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
//  248 ////             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
//  249 ////       }
//  250 ////       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //已经偏离3号传感器
//  251 ////       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  252 ////             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
//  253 ////        // AD_2_max = AD_inductor[2];//zs加
//  254 ////
//  255 ////       }
//  256 //       /*
//  257 //       //~~~~~~~~~~~~~~~~~~~~~~~ 后排位置解算~~~~~~~~~~~~~~~~~~~//
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
//  277 //      /*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
//  278 // //zs屏蔽      
//  279 //       if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
//  280 //       {
//  281 //            position = position_last;//此刻小车位置转变为上一次小车位置
//  282 //       }
//  283 //       else
//  284 //       {
//  285 //       position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
//  286 //       }   
//  287 ////zs屏蔽
//  288 ////////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
//  289 ///*用于小车直道太偏或过弯道时小车转弯幅度小不给力，小车不能好好的给过弯道，此时强制*/
//  290 ////当在直道整个小车太过偏左都在电磁线左边时且此时最强的右电感值<75,说明小车太偏了，进入if
//  291 ////当遇到弯道小车转弯幅度不够，可能会冲出赛道，进入if 
//  292 //       
//  293 //      //////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
//  294 ////张盛屏蔽
//  295 ////       if(position == 0 && AD_0_max < 75)
//  296 ////       {
//  297 ////           AD_0_max = 75 + abs_f(75 - AD_0_max);
//  298 ////       }
//  299 ////       else if(position == 3 && AD_2_max < 75)
//  300 ////       {
//  301 ////           AD_2_max = 75 + abs_f(75 - AD_2_max);
//  302 ////       }
//  303 ////张盛屏蔽
//  304 //  Chazhi_Last=Chazhi;
//  305 //       /*************计算偏移量*************/
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
//  320 //       if(position == 0)   //左侧丢线
//  321 //       {
//  322 //       
//  323 //            Chazhi =-60;
//  324 //       }
//  325 //       else if(position == 1 || position == 2) //处于中间位置        
//  326 //       {
//  327 //                  
//  328 //             Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  329 //             
//  330 //             
//  331 //       }
//  332 //       else if(position == 3)  //右侧丢线
//  333 //       {
//  334 //            Chazhi = 60;
//  335 //       }
//  336 //     
//  337 //
//  338 //      
//  339 //       /*
//  340 //       if(Strig  ht_Flag)
//  341 //       {
//  342 //           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //长直道用斜率控制舵机
//  343 //       }
//  344 //       if(UPhill_flag)  //上坡时 强制用两侧电感偏移量
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
//  362 //延时

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
//  368       i=12000;  //自己定义
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
//  373 ///取绝对值

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
//  392  *  函数名称   SC_black_Init
//  393  *  功能说明： AD初始化  将电感的最大值 以及 过渡点写入FLASH
//  394  *  参数说明：
//  395  *  函数返回： 无
//  396  *  修改时间：
//  397  *  备    注：
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
//  417 //            AD_valu[0] = ADC_Once(ADC_1,adc10bit);  //左  通道
//  418 //            AD_valu[1] = ADC_Once(ADC_2,adc10bit);  //中  通道
//  419 //            AD_valu[2] = ADC_Once(ADC_3,adc10bit);  //右  通道
//  420 ////            AD_valu[3] = ADC_Once(ADC_4,adc10bit);  //中1 通道
//  421 ////            AD_valu[4] = ADC_Once(ADC_5,adc10bit);  //中2 通道
//  422 //            if(AD_valu[2]>300) AD_valu[2] = 250;
//  423 //            
//  424 //            for(j=0;j<3;j++)
//  425 //            {
//  426 //                if(AD_valu[j] > max_v[j])
//  427 //                {
//  428 //                    max_v[j] = AD_valu[j];
//  429 //                    if(j==0)    Position_transit_short[0] =  AD_valu[1];  //记录过渡点 电感值
//  430 //                    if(j==2)    Position_transit_short[1] =  AD_valu[1];
//  431 ////                    if(j==3)    Position_transit_short[2] =  AD_valu[4];
//  432 ////                    if(j==4)    Position_transit_short[3] =  AD_valu[3];
//  433 //                }
//  434 //            }
//  435 //          
//  436 //        }
//  437 //        /***************              记录的过渡点归一化                     ******************/
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
//  454 //        //扩大过渡点的值
//  455 //        Position_transit[0] = (int16)(100 * sensor_1);
//  456 //        Position_transit[1] = (int16)(100 * sensor_2);
//  457 ////        Position_transit[2] = (int16)(100 * sensor_3);
//  458 ////        Position_transit[3] = (int16)(100 * sensor_4);
//  459 //
//  460 //
//  461 //        //将过渡值和最大值写到FASH里面
//  462 //    /*
//  463 //        result=LPLD_Flash_SectorErase((uint32)SECTOR_ADM);//擦除254扇区
//  464 //        if(result == FLASH_OK)printf(0,0,"Eraser successful!");
//  465 //
//  466 //
//  467 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM, (uint32*)max_v, DATA_SIZE*4); //电感标定的最大值写入扇区
//  468 //        if(result == FLASH_OK)printf(0,0,"Write max successful!");
//  469 //
//  470 //
//  471 //        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM+20, (uint32*)Position_transit, 4*4);
//  472 //        if(result == FLASH_OK)printf(0,0,"Write Position_transit successful!");
//  473 //        */
//  474 //
//  475 //
//  476 //        /*
//  477 //        for(i=0;i<4;i++)                     //过渡点归一化值写入扇区
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
//  489 ////          Ptr_flash = (float*)SECTOR_ADM;  没写ROM 报错  改
//  490 ////          */
//  491 ////           for(j=0;j<5;j++)   //读取五个电感的采样标定的最大值
//  492 ////           {
//  493 ////               max_v[j] = *(Ptr_flash+j);
//  494 ////           }
//  495 ////           for(j=0;j<4;j++)  //读取过渡点
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
