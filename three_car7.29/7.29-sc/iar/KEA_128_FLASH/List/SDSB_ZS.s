///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  15:41:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\SDSB_ZS.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\SDSB_ZS.c -D IAR -D
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
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\SDSB_ZS.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Once
        EXTERN Chazhi_Rate
        EXTERN GpioSet
        EXTERN Read_ADC
        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_ui2f
        EXTERN abs_f
        EXTERN abs_inductor

        PUBLIC AD_0_max
        PUBLIC AD_1_max
        PUBLIC AD_2_max
        PUBLIC AD_3_max
        PUBLIC AD_MAX_NUM
        PUBLIC AD_V
        PUBLIC AD_hall
        PUBLIC AD_inductor
        PUBLIC AD_inductor_Huan
        PUBLIC AD_inductor_Last
        PUBLIC AD_inductor_Shuzhi_Max
        PUBLIC AD_inductor_Shuzhi_Min
        PUBLIC AD_sum
        PUBLIC AD_valu
        PUBLIC Abs_new_Chazhi
        PUBLIC Abs_old_Chazhi
        PUBLIC Abs_sum_Chazhi
        PUBLIC Add_AD_value
        PUBLIC Alg_new_Chazhi
        PUBLIC Alg_old_Chazhi
        PUBLIC Alg_sum_Chazhi
        PUBLIC Chazhi
        PUBLIC Chazhi_Chucun
        PUBLIC Chazhi_Last
        PUBLIC Chazhi_Max
        PUBLIC Chazhi_Max_New
        PUBLIC Chazhi_Min
        PUBLIC Chazhi_Old
        PUBLIC Circle_Chazhi
        PUBLIC Circle_Count
        PUBLIC Circle_Count2
        PUBLIC Circle_Count2_Max
        PUBLIC Circle_Count3
        PUBLIC Circle_Count3_Max
        PUBLIC Circle_Count4
        PUBLIC Circle_Count4_Max
        PUBLIC Circle_Count5
        PUBLIC Circle_Count5_Max
        PUBLIC Circle_Count6
        PUBLIC Circle_Count6_Max
        PUBLIC Circle_Count_Max
        PUBLIC Circle_Count_Out
        PUBLIC Circle_Count_Out_Flag
        PUBLIC Circle_Count_Out_Max
        PUBLIC Circle_Error_Count
        PUBLIC Circle_Error_Count_Max
        PUBLIC Circle_Error_Flag
        PUBLIC Circle_Finish_Count_Max
        PUBLIC Circle_Flag
        PUBLIC Circle_Inductor_LR1
        PUBLIC Circle_Inductor_M1
        PUBLIC Circle_Inductor_M2
        PUBLIC Circle_Inductor_M3
        PUBLIC Circle_Inductor_value2
        PUBLIC Circle_Inductor_value3
        PUBLIC Circle_Inductor_value4
        PUBLIC Circle_Inductor_value5
        PUBLIC Circle_Inductor_value6
        PUBLIC Circle_L_Count
        PUBLIC Circle_L_Finish_Count
        PUBLIC Circle_L_Flag
        PUBLIC Circle_R_Count
        PUBLIC Circle_R_Finish_Count
        PUBLIC Circle_R_Flag
        PUBLIC Circle_Turn_Again_Counter
        PUBLIC Circle_Turn_Again_Counter_Max
        PUBLIC Circle_Turn_Again_Prevent_Flag
        PUBLIC Circle_Turn_Count
        PUBLIC Circle_Turn_Count2
        PUBLIC Circle_Turn_Old_Flag
        PUBLIC Circle_inductor_Max
        PUBLIC Circle_inductor_Max2
        PUBLIC Circle_inductor_Mid
        PUBLIC Circle_inductor_Mid2
        PUBLIC Circle_inductor_Min
        PUBLIC Circle_inductor_Min2
        PUBLIC Hall
        PUBLIC Inductor_Check
        PUBLIC Inductor_analyse
        PUBLIC Position_transit
        PUBLIC Rate_Count
        PUBLIC Rate_Flag
        PUBLIC RefAd
        PUBLIC Road_Remember
        PUBLIC Road_Remember2
        PUBLIC Slope_AD_1
        PUBLIC Small_S
        PUBLIC Stop_Flag
        PUBLIC Stop_OK
        PUBLIC Stop_Plan_Flag
        PUBLIC Stop_ms
        PUBLIC StraightRoad
        PUBLIC StraightRoad2
        PUBLIC StraightRoad_Flag
        PUBLIC StraightRoad_Old
        PUBLIC Test_Huandao
        PUBLIC Test_RoadInfo
        PUBLIC Test_RoadInfo_Shuzhi
        PUBLIC WindingRoad
        PUBLIC WindingRoad_Flag
        PUBLIC WindingRoad_Left
        PUBLIC WindingRoad_Left_Flag
        PUBLIC WindingRoad_Right
        PUBLIC WindingRoad_Right_Flag
        PUBLIC abs_i
        PUBLIC ad_valu
        PUBLIC chazhi_old
        PUBLIC max_v
        PUBLIC max_value
        PUBLIC min_v
        PUBLIC position
        PUBLIC position_back
        PUBLIC sensor_to_one
        PUBLIC sensor_to_one_Huan

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\SDSB_ZS.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 #include "SDSB_ZS.h"
//    5 /******************电感分析变量******************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float  max_v[5] = {2000,2000,2000,2000,2000};
max_v:
        DATA
        DC32 44FA0000H, 44FA0000H, 44FA0000H, 44FA0000H, 44FA0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    7 float  min_v[5] = {47,47,47,47,47};  //电感标定 采集值      ？？？？待测？？？？
min_v:
        DATA
        DC32 423C0000H, 423C0000H, 423C0000H, 423C0000H, 423C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    8 int   Position_transit[4] = {30,30} ;  //记录过渡点归一化的值  ???待测？？？？32,38
Position_transit:
        DATA
        DC32 30, 30, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float Chazhi_Chucun[20]={0},Chazhi_Old=0,Rate_Count=0,Rate_Flag=0;
Chazhi_Chucun:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Chazhi_Old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Rate_Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Rate_Flag:
        DS8 4
//   10 /******************电感分析变量2******************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int16 ad_valu[5][5];
ad_valu:
        DS8 52

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   12 char position=1;
position:
        DATA
        DC8 1
//   13 #define NM   3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int AD_valu[5],AD_V[5][NM],chazhi_old,RefAd=20, Add_AD_value = 20;
AD_valu:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_V:
        DS8 60

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
chazhi_old:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
RefAd:
        DATA
        DC32 20

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Add_AD_value:
        DATA
        DC32 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float  Chazhi,Chazhi_Last,Chazhi_Max=60,Chazhi_Min=-60,Chazhi_Max_New=200;//此为1,2位置的最大差值
Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Chazhi_Last:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Max:
        DATA
        DC32 42700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Min:
        DATA
        DC32 0C2700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Max_New:
        DATA
        DC32 43480000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float  AD_inductor_Last[5]={0};
AD_inductor_Last:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 float  AD_inductor[5],sensor_to_one[5],AD_inductor_Huan,sensor_to_one_Huan;
AD_inductor:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
sensor_to_one:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_inductor_Huan:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
sensor_to_one_Huan:
        DS8 4
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float  Slope_AD_1;  // 用于坡道检测
Slope_AD_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int  AD_sum[5];
AD_sum:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int  AD_MAX_NUM;   
AD_MAX_NUM:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 int  position_back = 1;
position_back:
        DATA
        DC32 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
max_value:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_0_max:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_1_max:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_2_max:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_3_max:
        DS8 4
//   24 /*------------------------------------------------------------------------------------------*/
//   25 /**************判断道路信息变量1****************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 int StraightRoad=0,StraightRoad2=0,StraightRoad_Old=0;//小车直走次数
StraightRoad:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
StraightRoad2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
StraightRoad_Old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 int WindingRoad_Left = 0,WindingRoad_Right = 0,WindingRoad=0;//小车左转,右转次数
WindingRoad_Left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad:
        DS8 4
//   28 
//   29 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 float Road_Remember[P]={0};//差值储存，用于判断道路信息
Road_Remember:
        DS8 200

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 int StraightRoad_Flag = 0;//直道标志
StraightRoad_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0,WindingRoad_Flag=0;//左转,右转标志 
WindingRoad_Left_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Right_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Flag:
        DS8 4
//   33 /*             判断道路信息变量2                   */
//   34 //Road_Remember2[M]:[]里面的数越大，值的状态越新

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 float Road_Remember2[M]={0},//差值储存，用于判断道路信息
Road_Remember2:
        DS8 200

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36       Abs_sum_Chazhi=0,//50个差值的绝对值总和
Abs_sum_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37       Alg_sum_Chazhi=0,//50个差值的代数总和
Alg_sum_Chazhi:
        DS8 4
//   38       

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39       Abs_new_Chazhi=0,//最新20个差值的绝对值和，用于检测进弯
Abs_new_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40       Alg_new_Chazhi=0,//最新20个差值的代数和
Alg_new_Chazhi:
        DS8 4
//   41       

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42       Abs_old_Chazhi=0,
Abs_old_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43       Alg_old_Chazhi=0; 
Alg_old_Chazhi:
        DS8 4
//   44 /*******************END*************************************************************************************/
//   45 /******************环岛变量2*************************************************/
//   46 //  100,0.5s  
//   47 int 
//   48 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   49     Circle_Flag=0,//  圆环进入标志，=1圆环双线识别结束，=2识别到转弯时刻
Circle_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   50     Circle_L_Flag,Circle_R_Flag,//圆环左/右转标志
Circle_L_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   51     Circle_Turn_Old_Flag=0,
Circle_Turn_Old_Flag:
        DS8 4
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53     Circle_Count=0,//  进入圆环双线计数
Circle_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   54     Circle_Count_Max=5,//30,0.25s， 圆环双线计数最大值  
Circle_Count_Max:
        DATA
        DC32 5

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   55     Circle_Count2=0,// 出圆环双线转弯前计数
Circle_Count2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   56     Circle_Count2_Max=2,//30,0.25s， 圆环双线计数最大值
Circle_Count2_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   57     Circle_Count3=0,//圆环转弯时刻计数
Circle_Count3:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   58     Circle_Count3_Max=2,//圆环转弯时刻计数最大值
Circle_Count3_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   59     Circle_Count4=0,//圆环转弯时刻计数
Circle_Count4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   60     Circle_Count4_Max=20,//圆环转弯时刻计数最大值 
Circle_Count4_Max:
        DATA
        DC32 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61     Circle_Count5=0,//出环双线计数
Circle_Count5:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   62     Circle_Count5_Max=2,//出环双线计数最大值
Circle_Count5_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63     Circle_Count6=0,//出环后直道计数
Circle_Count6:
        DS8 4
//   64     
//   65     

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   66     Circle_Count_Out_Flag=0,
Circle_Count_Out_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   67     Circle_Count_Out=0,//避免进环迟后,圆环强制转弯结束后保护时间，避免出赛道
Circle_Count_Out:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   68     Circle_Count_Out_Max=400,//800，2s
Circle_Count_Out_Max:
        DATA
        DC32 400
//   69 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   70     Circle_L_Count=0,Circle_R_Count=0,//圆环左/右转计数 
Circle_L_Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   71     Circle_Turn_Count=20,//圆环左/右转计数最大值20
Circle_Turn_Count:
        DATA
        DC32 20

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   72     Circle_Turn_Count2=5,//圆环左/右转计数最大值20
Circle_Turn_Count2:
        DATA
        DC32 5

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   73     Circle_Error_Count=0,
Circle_Error_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   74     Circle_Error_Count_Max=10000,
Circle_Error_Count_Max:
        DATA
        DC32 10000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   75     Circle_Error_Flag=0,
Circle_Error_Flag:
        DS8 4
//   76     

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   77     Circle_L_Finish_Count=0,Circle_R_Finish_Count=0;// 圆环左/右转结束计数
Circle_L_Finish_Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Finish_Count:
        DS8 4
//   78 float  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   79         Circle_Inductor_value2=172,//圆环开始转弯计数值 3550，3500
Circle_Inductor_value2:
        DATA
        DC32 432C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   80         Circle_Inductor_value3=150,//不用了,圆环强制转弯值
Circle_Inductor_value3:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   81         Circle_Inductor_value4=100,//圆环行驶值
Circle_Inductor_value4:
        DATA
        DC32 42C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   82         Circle_Inductor_value5=160,//出圆环双线值
Circle_Inductor_value5:
        DATA
        DC32 43200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   83         Circle_Inductor_value6=100,//出圆环进入单线值，解除本次圆环，进入下次圆环状态
Circle_Inductor_value6:
        DATA
        DC32 42C80000H
//   84        

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   85         Circle_Turn_Again_Counter=0,//防止再次进弯计数
Circle_Turn_Again_Counter:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   86         Circle_Turn_Again_Counter_Max=400,//1s防止再次进弯计数最大值
Circle_Turn_Again_Counter_Max:
        DATA
        DC32 43C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   87         Circle_Turn_Again_Prevent_Flag=1,//防止再次进弯标志
Circle_Turn_Again_Prevent_Flag:
        DATA
        DC32 3F800000H
//   88         
//   89         

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   90        Circle_inductor_Max=165,Circle_inductor_Max2=175,//190
Circle_inductor_Max:
        DATA
        DC32 43250000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Max2:
        DATA
        DC32 432F0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   91         Circle_inductor_Mid=150, Circle_inductor_Mid2=170,
Circle_inductor_Mid:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Mid2:
        DATA
        DC32 432A0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   92         Circle_inductor_Min=105,Circle_inductor_Min2=120;
Circle_inductor_Min:
        DATA
        DC32 42D20000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Min2:
        DATA
        DC32 42F00000H
//   93 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   94   float AD_hall,Stop_Plan_Flag=0,Stop_OK=0,Stop_Flag=0;
AD_hall:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Stop_Plan_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Stop_OK:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Stop_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   95   int Stop_ms=0;
Stop_ms:
        DS8 4
//   96   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void Hall(void)
//   98 {
Hall:
        PUSH     {R7,LR}
//   99     AD_hall = ADC_Once(ADC_6,adc12bit);  //中2 通道
        MOVS     R1,#+2
        MOVS     R0,#+46
        BL       ADC_Once
        BL       __aeabi_ui2f
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  100     if(Stop_Plan_Flag==0)
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_0
//  101     {
//  102        if(AD_hall<2500) 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_2  ;; 0x451c4000
        BL       __aeabi_cfcmple
        BCS      ??Hall_0
//  103        {
//  104            Stop_Plan_Flag=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  105        }
//  106     }
//  107     if(Stop_Plan_Flag==1)
??Hall_0:
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_1
//  108     {
//  109        Stop_ms++;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  110        if(Stop_ms>10000)
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x2711
        CMP      R0,R1
        BLT      ??Hall_1
//  111          Stop_OK=1;       
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  112     }
//  113     
//  114     if(Stop_OK==1)
??Hall_1:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_2
//  115     {
//  116        if(AD_hall<2500) 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_2  ;; 0x451c4000
        BL       __aeabi_cfcmple
        BCS      ??Hall_2
//  117        {
//  118            Stop_Flag=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//  119        }  
//  120     }      
//  121 }
??Hall_2:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     AD_hall

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     Stop_Plan_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x451c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     Stop_ms

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x2711

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Stop_OK
//  122 /******************环岛变量END*************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  123 int     Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
Circle_Count6_Max:
        DATA
        DC32 5000
//  124 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  125 int   Circle_Inductor_M1=172,//进圆环双线值
Circle_Inductor_M1:
        DATA
        DC32 172

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  126          Circle_Inductor_M2=175,//测转弯值
Circle_Inductor_M2:
        DATA
        DC32 175

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  127          Circle_Inductor_M3=160,//转弯值
Circle_Inductor_M3:
        DATA
        DC32 160

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  128          Circle_Inductor_LR1=50;
Circle_Inductor_LR1:
        DATA
        DC32 50
//  129                  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  130 int   AD_inductor_Shuzhi_Max=40,AD_inductor_Shuzhi_Min=1;
AD_inductor_Shuzhi_Max:
        DATA
        DC32 40

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AD_inductor_Shuzhi_Min:
        DATA
        DC32 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  131 int   Circle_Finish_Count_Max=300;//400:1s,// 圆环左/右转结束计数最大值
Circle_Finish_Count_Max:
        DATA
        DC32 300

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  132 int   Circle_Chazhi=100;
Circle_Chazhi:
        DATA
        DC32 100

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  133 void Test_Huandao()
//  134 {
Test_Huandao:
        PUSH     {R4,LR}
//  135 /*检测进弯*/
//  136 if(Circle_Flag==0)//处于检测圆环双线状态
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Test_Huandao_0
//  137 { 
//  138       if(AD_inductor[1]>Circle_Inductor_M1&&(AD_inductor[0]+AD_inductor[2]>Circle_Inductor_LR1))//&&(AD_inductor[3]>30||AD_inductor[4]>30)
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_0
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+8]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R4
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_0
//  139       {
//  140           Circle_Count++;//环岛双线计数   
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  141           if(Circle_Count>Circle_Count_Max)
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_0
//  142           {
//  143                Circle_Flag=2; //进入环岛双线
        MOVS     R0,#+2
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  144                Circle_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  145           }
//  146       }
//  147 }
//  148 /*检测转弯计数***************************************************************/
//  149 if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
??Test_Huandao_0:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      .+4
        B        ??Test_Huandao_1
//  150 {
//  151      if(AD_inductor[3]>AD_inductor[4]+40) //100       
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+16]
        LDR      R0,??DataTable1_7  ;; 0x42200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_2
//  152           Circle_R_Count++; 
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  153      if(AD_inductor[4]>AD_inductor[3]+40) //100       
??Test_Huandao_2:
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+12]
        LDR      R0,??DataTable1_7  ;; 0x42200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_3
//  154           Circle_L_Count++;   
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  155        
//  156      if(AD_inductor[1]<Circle_Inductor_M2)
??Test_Huandao_3:
        LDR      R0,??DataTable1_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_4
//  157      {
//  158          
//  159        if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_5
        LDR      R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_5
//  160          Circle_R_Count++; 
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  161      if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
??Test_Huandao_5:
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_6
        LDR      R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_6
//  162          Circle_L_Count++; 
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  163          
//  164        if(AD_inductor[3]>AD_inductor[4]&&AD_inductor[4]<20) //100       
??Test_Huandao_6:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_7
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_13  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_7
//  165           Circle_R_Count++; 
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  166        if(AD_inductor[4]>AD_inductor[3]&&AD_inductor[3]<20) //100       
??Test_Huandao_7:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_4
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_13  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_4
//  167           Circle_L_Count++;   
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  168      }      
//  169 //同上解释，可通过计算速度时间路程来使用
//  170         if(AD_inductor[1]<Circle_Inductor_M3)//150转弯
??Test_Huandao_4:
        LDR      R0,??DataTable1_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_1
//  171         {
//  172 
//  173             Circle_Flag=3;//转弯识别结束该转弯了
        MOVS     R0,#+3
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  174          }
//  175 }
//  176 /*开始强制转弯**************************************************************/   
//  177 if(Circle_Flag==3)//开始转弯
??Test_Huandao_1:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??Test_Huandao_8
//  178 {      
//  179       if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
        LDR      R0,??DataTable1_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Test_Huandao_8
//  180       {
//  181          if(Circle_L_Count>Circle_R_Count)
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_9
//  182          {
//  183           Circle_L_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  184           Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  185           
//  186            Circle_L_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_16
        STR      R0,[R1, #+0]
//  187            
//  188            Circle_Turn_Old_Flag=2;
        MOVS     R0,#+2
        LDR      R1,??DataTable1_17
        STR      R0,[R1, #+0]
//  189            
//  190            Circle_Error_Flag=2;
        MOVS     R0,#+2
        LDR      R1,??DataTable1_15
        STR      R0,[R1, #+0]
        B        ??Test_Huandao_8
//  191          }
//  192          else
//  193          {
//  194             Circle_L_Count=0;
??Test_Huandao_9:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  195             Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  196           
//  197             Circle_R_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//  198             
//  199              Circle_Turn_Old_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_17
        STR      R0,[R1, #+0]
//  200             
//  201             Circle_Error_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_15
        STR      R0,[R1, #+0]
//  202          }           
//  203       }
//  204    }
//  205       if(Circle_L_Flag==1)
??Test_Huandao_8:
        LDR      R0,??DataTable1_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Test_Huandao_10
//  206       {
//  207           Chazhi = Circle_Chazhi;
        LDR      R0,??DataTable1_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_20
        STR      R0,[R1, #+0]
//  208           
//  209           Circle_L_Finish_Count++;
        LDR      R0,??DataTable1_21
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_21
        STR      R0,[R1, #+0]
//  210           BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  211       }
//  212       if(Circle_R_Flag==1)
??Test_Huandao_10:
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Test_Huandao_11
//  213       {
//  214            Chazhi =-Circle_Chazhi;//47=70度,43.5=65
        LDR      R0,??DataTable1_19
        LDR      R1,[R0, #+0]
        RSBS     R0,R1,#+0
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_20
        STR      R0,[R1, #+0]
//  215            Circle_R_Finish_Count++;      
        LDR      R0,??DataTable1_22
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_22
        STR      R0,[R1, #+0]
//  216                      BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  217 
//  218 }
//  219     
//  220 
//  221     if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
??Test_Huandao_11:
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_21
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??Test_Huandao_12
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_22
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_13
//  222     {
//  223       Circle_Count=0;
??Test_Huandao_12:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  224       Circle_Count2=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_24
        STR      R0,[R1, #+0]
//  225       Circle_L_Finish_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_21
        STR      R0,[R1, #+0]
//  226       Circle_R_Finish_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_22
        STR      R0,[R1, #+0]
//  227       Circle_L_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  228       Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  229       
//  230       Circle_L_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_16
        STR      R0,[R1, #+0]
//  231       Circle_R_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//  232      Circle_Flag=6;
        MOVS     R0,#+6
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  233                           BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  234      Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道
        MOVS     R0,#+1
        LDR      R1,??DataTable1_25
        STR      R0,[R1, #+0]
//  235 
//  236     }
//  237   
//  238 /*下一个环岛等待*/
//  239 if(Circle_Flag==6)
??Test_Huandao_13:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??Test_Huandao_14
//  240   {
//  241       if(AD_inductor[1]<100)
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_26  ;; 0x42c80000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_14
//  242       {
//  243         Circle_Count6++;
        LDR      R0,??DataTable1_27
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_27
        STR      R0,[R1, #+0]
//  244         if(Circle_Count6>Circle_Count6_Max)
        LDR      R0,??DataTable1_28
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_27
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_14
//  245         {
//  246           Circle_Count6=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_27
        STR      R0,[R1, #+0]
//  247         Circle_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  248         Circle_Error_Flag=0;//转弯误判解除
        MOVS     R0,#+0
        LDR      R1,??DataTable1_15
        STR      R0,[R1, #+0]
//  249         }
//  250       }
//  251   }
//  252 
//  253 }
??Test_Huandao_14:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     Stop_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Circle_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     Circle_Inductor_M1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     Circle_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     Circle_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x42200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     Circle_R_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     Circle_L_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     AD_inductor_Shuzhi_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     AD_inductor_Shuzhi_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     Circle_Inductor_M3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     Circle_Error_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     Circle_L_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     Circle_Turn_Old_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     Circle_R_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     Circle_L_Finish_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     Circle_R_Finish_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_24:
        DC32     Circle_Count2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_25:
        DC32     Circle_Count_Out_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_26:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     Circle_Count6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_28:
        DC32     Circle_Count6_Max
//  254 /*************************************************************************
//  255 电感数据分析
//  256 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  257 void Inductor_analyse()
//  258 {
Inductor_analyse:
        PUSH     {R3-R7,LR}
//  259      int16  i,max_front=0;//max_back
        MOVS     R5,#+0
//  260      static int16 max_old = 1,max_crosstalk = 1;
//  261      static int16 position_last = 1;
//  262      float  sensor_1;
//  263 
//  264      Read_ADC();
        BL       Read_ADC
//  265 
//  266      Inductor_Check();//电感最大最小值校验 
        BL       Inductor_Check
//  267      
//  268 /*********************归一化处理********************/
//  269      for(i=0;i<5;i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??Inductor_analyse_0:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Inductor_analyse_1
//  270      {
//  271         sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
        LDR      R0,??Inductor_analyse_2
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fsub
        MOVS     R7,R0
        LDR      R0,??Inductor_analyse_2+0x8
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x4
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        LDR      R1,??Inductor_analyse_2+0xC
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  272         if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        LDR      R0,??Inductor_analyse_2+0xC
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI      ??Inductor_analyse_3
        LDR      R0,??Inductor_analyse_2+0x10  ;; 0x3a83126f
        LDR      R1,??Inductor_analyse_2+0xC
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  273      }   
??Inductor_analyse_3:
        ADDS     R4,R4,#+1
        B        ??Inductor_analyse_0
//  274           sensor_to_one_Huan=sensor_to_one[1];
??Inductor_analyse_1:
        LDR      R0,??Inductor_analyse_2+0xC
        LDR      R0,[R0, #+4]
        LDR      R1,??Inductor_analyse_2+0x14
        STR      R0,[R1, #+0]
//  275 
//  276        for(i=0;i<5;i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??Inductor_analyse_4:
        SXTH     R4,R4
        CMP      R4,#+5
        BGE      ??Inductor_analyse_5
//  277      {
//  278       
//  279         AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
        LDR      R0,??Inductor_analyse_2+0xC
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x18  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x1C
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  280      }
        ADDS     R4,R4,#+1
        B        ??Inductor_analyse_4
//  281      AD_inductor_Huan=100*sensor_to_one_Huan;
??Inductor_analyse_5:
        LDR      R0,??Inductor_analyse_2+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??Inductor_analyse_2+0x18  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x20
        STR      R0,[R1, #+0]
//  282 /*******1号电感特殊归一化，用于坡道检测********/
//  283       sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R7,R0
        LDR      R0,??Inductor_analyse_2+0x24
        MOVS     R1,#+10
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        MOVS     R6,R0
//  284       if(sensor_1 <= 0.0)  sensor_1 = 0.001;
        MOVS     R0,R6
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI      ??Inductor_analyse_6
        LDR      R0,??Inductor_analyse_2+0x10  ;; 0x3a83126f
        MOVS     R6,R0
//  285       Slope_AD_1 = 100 * sensor_1;
??Inductor_analyse_6:
        LDR      R0,??Inductor_analyse_2+0x18  ;; 0x42c80000
        MOVS     R1,R6
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x28
        STR      R0,[R1, #+0]
//  286 /***********找出最强的传感器**********************/
//  287        for(i=0;i<3;i++)                 
        MOVS     R0,#+0
        MOVS     R4,R0
??Inductor_analyse_7:
        SXTH     R4,R4
        CMP      R4,#+3
        BGE      ??Inductor_analyse_8
//  288        {
//  289          if(AD_inductor[max_front]<AD_inductor[i])
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x1C
        SXTH     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_9
//  290            max_front=i;
        MOVS     R5,R4
//  291        }
??Inductor_analyse_9:
        ADDS     R4,R4,#+1
        B        ??Inductor_analyse_7
//  292        max_value=AD_inductor[max_front];  //最大电感值
??Inductor_analyse_8:
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x2C
        STR      R0,[R1, #+0]
//  293 /**************丢线时最大值取旧值***************/
//  294        if(max_value < 5)//?           
        LDR      R0,??Inductor_analyse_2+0x2C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10  ;; 0x40a00000
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_11
//  295        {
//  296          max_front=max_old;
        LDR      R0,??Inductor_analyse_10+0x4
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        MOVS     R5,R0
//  297          max_value=AD_inductor[max_front];
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x2C
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_12
//  298        }
//  299        else
//  300          max_old=max_front;
??Inductor_analyse_11:
        LDR      R0,??Inductor_analyse_10+0x4
        STRH     R5,[R0, #+0]
//  301 /********防串道***************/
//  302 
//  303 /****************位置解算，解算过程的值用归一化放大后的值************************/
//  304        position_last = position;
??Inductor_analyse_12:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        STRH     R0,[R1, #+0]
//  305        
//  306         if(max_front==0 && (AD_inductor[1] <= Position_transit[0]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[0]>1)&&AD_valu[1]>AD_valu[2])  //已经偏离0号传感器
        SXTH     R5,R5
        CMP      R5,#+0
        BNE      ??Inductor_analyse_13
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_13
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_13
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_14  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_13
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_2
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BGE      ??Inductor_analyse_13
//  307        {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  308                position=0;//右电感在电磁线左方，整个小车都在电磁线左方
        MOVS     R0,#+0
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_15
//  309 //              LED_1_ON;
//  310  //          AD_0_max = AD_inductor[0];//zs加
//  311        }
//  312        else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
??Inductor_analyse_13:
        SXTH     R5,R5
        CMP      R5,#+0
        BNE      ??Inductor_analyse_16
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCC      ??Inductor_analyse_17
??Inductor_analyse_16:
        SXTH     R5,R5
        CMP      R5,#+1
        BNE      ??Inductor_analyse_18
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_18
//  313        {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  314            //      中电感在电磁线左边                            中电感在电磁线左边
//  315            
//  316              position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
??Inductor_analyse_17:
        MOVS     R0,#+1
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  317              AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_14+0x4
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_15
//  318             
//  319        }
//  320        else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
??Inductor_analyse_18:
        SXTH     R5,R5
        CMP      R5,#+1
        BNE      ??Inductor_analyse_19
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCC      ??Inductor_analyse_20
??Inductor_analyse_19:
        SXTH     R5,R5
        CMP      R5,#+2
        BNE      ??Inductor_analyse_21
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_21
//  321        {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  322         //    中电感在电磁线右边                         中电感在电磁线右边          
//  323              position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
??Inductor_analyse_20:
        MOVS     R0,#+2
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  324              AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_15
//  325        }
//  326        else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] &&AD_inductor[1]>AD_inductor[0]&&AD_inductor[2]>1)&&AD_valu[1]>AD_valu[0]) //已经偏离3号传感器
??Inductor_analyse_21:
        SXTH     R5,R5
        CMP      R5,#+2
        BNE      ??Inductor_analyse_22
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_22
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_22
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_14  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_22
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_2
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BGE      ??Inductor_analyse_22
//  327        {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  328             
//  329                position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
        MOVS     R0,#+3
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_15
//  330             
//  331                //                          LED_2_ON;
//  332         // AD_2_max = AD_inductor[2];//zs加
//  333        }   
//  334        else 
//  335        {
//  336          position=position_last;
??Inductor_analyse_22:
        LDR      R0,??Inductor_analyse_10+0xC
        LDRH     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  337        }
//  338 /*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
//  339        if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
??Inductor_analyse_15:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        MOVS     R2,#+0
        LDRSH    R1,[R1, R2]
        SUBS     R0,R0,R1
        BL       abs_inductor
        CMP      R0,#+2
        BLT      ??Inductor_analyse_23
//  340        {
//  341             position = position_last;//此刻小车位置转变为上一次小车位置
        LDR      R0,??Inductor_analyse_10+0xC
        LDRH     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_24
//  342        }
//  343        else
//  344        {
//  345        position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
??Inductor_analyse_23:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        STRH     R0,[R1, #+0]
//  346        }   
//  347 
//  348 
//  349 
//  350 
//  351        Chazhi_Last=Chazhi;
??Inductor_analyse_24:
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  352 
//  353  switch (max_front)  //最大电感序列号
        SXTH     R5,R5
        CMP      R5,#+0
        BEQ      ??Inductor_analyse_25
        CMP      R5,#+2
        BNE      .+4
        B        ??Inductor_analyse_26
        BCC      ??Inductor_analyse_27
        B        ??Inductor_analyse_28
        DATA
??Inductor_analyse_2:
        DC32     AD_valu
        DC32     min_v
        DC32     max_v
        DC32     sensor_to_one
        DC32     0x3a83126f
        DC32     sensor_to_one_Huan
        DC32     0x42c80000
        DC32     AD_inductor
        DC32     AD_inductor_Huan
        DC32     ad_valu
        DC32     Slope_AD_1
        DC32     max_value
        THUMB
//  354   {
//  355   /*********** 车离开导线偏左，分3种情况************/
//  356   case 0:   // 右侧电感最大
//  357     {
//  358       if(AD_inductor[0] > RefAd)     //右侧电感> RefAd=20 【RefAd参考值视情况改动】
??Inductor_analyse_25:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_29
//  359       {
//  360                           
//  361         if(AD_inductor[1] > RefAd)  //中间电感> RefAd=20   16
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_30
//  362         {
//  363          Chazhi = -30 - 30*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable2_6  ;; 0xc1f00000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_31
//  364         }
//  365         else 
//  366         {
//  367           Chazhi=-100 +40*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
??Inductor_analyse_30:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_7  ;; 0x42200000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_8  ;; 0xc2c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_31
//  368         }
//  369       }
//  370      else  
//  371        	Chazhi = -100;      //丢信号
??Inductor_analyse_29:
        LDR      R0,??DataTable2_8  ;; 0xc2c80000
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  372     } break;
??Inductor_analyse_31:
        B        ??Inductor_analyse_28
//  373 
//  374   case 1://中间电感最大
//  375      {
//  376         if(AD_inductor[1] > RefAd)   //已5修改  中间电感
??Inductor_analyse_27:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_32
//  377         {  
//  378           if(AD_inductor[2] > AD_inductor[0])       //  左边大于右边偏右            
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_33
//  379            
//  380 Chazhi =  30 - 30*(AD_inductor[1]-AD_inductor[2])/(AD_inductor[1]-AD_inductor[0]);
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_32
//  381           else	                          //  右边大于左边偏左                    
//  382 //          Chazhi = -34 + 34*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
//  383 Chazhi = -30 + 30*(AD_inductor[1]-AD_inductor[0])/(AD_inductor[1]-AD_inductor[2]);
??Inductor_analyse_33:
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_6  ;; 0xc1f00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  384         }                                                                          
//  385      }  break;
??Inductor_analyse_32:
        B        ??Inductor_analyse_28
//  386 
//  387 
//  388   case 2:
//  389     {
//  390 //2电感>参考电感
//  391       if(AD_inductor[2] > RefAd)
??Inductor_analyse_26:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_34
//  392 	{
//  393 //1电感>参考电感：车越偏,分数越小，差值越大，
//  394 //最大差值50
//  395           if(AD_inductor[1] > RefAd)
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_35
//  396 //        Chazhi = 25 + 25*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
//  397           Chazhi = 30 + 30*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_36
        Nop      
        DATA
??Inductor_analyse_10:
        DC32     0x40a00000
        DC32     ??max_old
        DC32     position
        DC32     ??position_last
        DC32     Position_transit
        THUMB
//  398           else 
//  399 //参考电感>1电感:车越偏,分数越小，差值越大，
//  400 //        Chazhi = 100 - 34*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
//  401           Chazhi = 100 - 40*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
??Inductor_analyse_35:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_7  ;; 0x42200000
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable3  ;; 0x42c80000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_36
        DATA
??Inductor_analyse_14:
        DC32     0x3f800001
        DC32     AD_0_max
        THUMB
//  402         }                                                                        
//  403        else
//  404       	  Chazhi = 100;	                 //丢信号3
??Inductor_analyse_34:
        LDR      R0,??DataTable3  ;; 0x42c80000
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  405     }  break;
//  406    }
//  407 //     
//  408 // if(AD_inductor[3]>40&&AD_inductor[4]>40)
//  409 //   Chazhi=Chazhi/3;
//  410        
//  411      if(Chazhi>Chazhi_Max_New)
??Inductor_analyse_36:
??Inductor_analyse_28:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_37
//  412        Chazhi=Chazhi_Max_New;
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  413      if(Chazhi<-Chazhi_Max_New)
??Inductor_analyse_37:
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_1
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_38
//  414        Chazhi=-Chazhi_Max_New;
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  415    
//  416      Chazhi*=1;
??Inductor_analyse_38:
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  417   for(uint8 i=0;i<19;i++)
        MOVS     R0,#+0
??Inductor_analyse_39:
        UXTB     R0,R0
        CMP      R0,#+19
        BGE      ??Inductor_analyse_40
//  418     {
//  419         Chazhi_Chucun[i]=Chazhi_Chucun[i+1];
        LDR      R1,??DataTable3_2
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable3_2
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  420          
//  421     }
        ADDS     R0,R0,#+1
        B        ??Inductor_analyse_39
//  422         Chazhi_Chucun[19]=Chazhi;
??Inductor_analyse_40:
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_2
        STR      R0,[R1, #+76]
//  423 
//  424     Chazhi_Old=Chazhi_Chucun[0];
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
//  425      Chazhi_Rate=Chazhi_Old-Chazhi;//D
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
//  426 
//  427 //     if(Rate_Count++>19)
//  428 //     {
//  429 //        Rate_Count=0;
//  430 //        Chazhi_Old=Chazhi;
//  431 //     }
//  432 //      Chazhi_Rate=Chazhi_Old-Chazhi;//D
//  433 
//  434      
//  435 //     Chazhi_Rate=Chazhi-Chazhi_Old;//P
//  436      
//  437 }
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     AD_2_max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     Chazhi_Last

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     RefAd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0xc1f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x42200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0xc2c80000

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??max_old:
        DATA
        DC16 1

        SECTION `.data`:DATA:REORDER:NOROOT(1)
??position_last:
        DATA
        DC16 1
//  438 /*   差值 竖直电感   差值 竖直电感
//  439 直道      15,20
//  440 
//  441 弯道   1     20      0       10
//  442       15     35      10      22
//  443       30     51      20      29
//  444       49     49      30      31
//  445       60     34      40      28
//  446       68     23      50      18
//  447       78     11      59      0.1
//  448       94     2
//  449 右竖直电感，差值负
//  450 
//  451 
//  452 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  453 void Small_S(void)
//  454 {
Small_S:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+404
//  455 float Road_Remember_SZ[100]={0}; 
        ADD      R0,SP,#+4
        MOVS     R1,#+200
        LSLS     R1,R1,#+1        ;; #+400
        BL       __aeabi_memclr4
//  456 int XS=0,XS_NO=0,XS_Flag=0,
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R7,#+0
//  457 //  StraightRoad=0,//小车直走次数
//  458   WindingRoad = 0,
        MOVS     R6,#+0
//  459     WindingRoad_Flag;//小车左转,右转次数
//  460   
//  461 
//  462    
//  463   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
??Small_S_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BGE      ??Small_S_1
//  464   {
//  465       Road_Remember[i] = Road_Remember[i+1];
        LDR      R1,??DataTable4_2
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable4_2
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  466   }
        ADDS     R0,R0,#+1
        B        ??Small_S_0
//  467   Road_Remember[P-1] = abs_f(Chazhi);	//该值为电感检测值-100~100
??Small_S_1:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
//  468   
//  469   StraightRoad=0;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  470   WindingRoad = 0;//小车左转,右转次数
        MOVS     R0,#+0
        MOVS     R6,R0
//  471   
//  472   for(int8_t i = 0;i < P; i++)
        MOVS     R2,#+0
??Small_S_2:
        SXTB     R2,R2
        CMP      R2,#+50
        BGE      ??Small_S_3
//  473   {        
//  474     if(Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
        LDR      R0,??DataTable4_2
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable4_6  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_4
//  475     {
//  476        StraightRoad++;		//判断直道稳定性，分别列出一百组信号
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
        B        ??Small_S_5
//  477     }		
//  478     else 
//  479       WindingRoad++;		//判断弯道稳定性---右转累   
??Small_S_4:
        ADDS     R6,R6,#+1
//  480   }
??Small_S_5:
        ADDS     R2,R2,#+1
        B        ??Small_S_2
//  481   StraightRoad_Flag = 0;//直道标志
??Small_S_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  482   WindingRoad_Flag = 0;//左转,右转标志                 
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  483   if(StraightRoad >= 90)
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+90
        BLT      ??Small_S_6
//  484   {
//  485   StraightRoad_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  486   }
//  487   if(WindingRoad_Left >= 30)
??Small_S_6:
        LDR      R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+30
        BLT      ??Small_S_7
//  488   {
//  489     WindingRoad_Flag = 1;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  490   }
//  491  
//  492   
//  493 
//  494   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
??Small_S_7:
        MOVS     R0,#+0
??Small_S_8:
        SXTB     R0,R0
        CMP      R0,#+49
        BGE      ??Small_S_9
//  495   {
//  496       Road_Remember_SZ[i] = Road_Remember_SZ[i+1];
        ADD      R1,SP,#+4
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        ADD      R2,SP,#+4
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  497   }
        ADDS     R0,R0,#+1
        B        ??Small_S_8
//  498   
//  499   if(AD_inductor[3]>AD_inductor[4])
??Small_S_9:
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable4_9
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Small_S_10
//  500      Road_Remember[P-1] = AD_inductor[3];	
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
        B        ??Small_S_11
//  501   else
//  502      Road_Remember[P-1] = AD_inductor[4];	
??Small_S_10:
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
//  503   
//  504   XS=0; 
??Small_S_11:
        MOVS     R0,#+0
        MOVS     R4,R0
//  505       XS_NO=0;
        MOVS     R0,#+0
        MOVS     R5,R0
//  506         XS_Flag=0;
        MOVS     R0,#+0
        MOVS     R7,R0
//  507 
//  508   if(WindingRoad_Flag==1&&AD_inductor[1]<110)
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE      ??Small_S_12
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable4_10  ;; 0x42dc0000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_12
//  509   { 
//  510        for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R2,#+0
??Small_S_13:
        SXTB     R2,R2
        CMP      R2,#+49
        BGE      ??Small_S_14
//  511       {
//  512          if(Road_Remember_SZ[i]<35)
        ADD      R0,SP,#+4
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable4_11  ;; 0x420c0000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_15
//  513             XS++; 
        ADDS     R4,R4,#+1
//  514          if(Road_Remember_SZ[i]>40)
??Small_S_15:
        ADD      R0,SP,#+4
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable5  ;; 0x42200001
        BL       __aeabi_cfrcmple
        BHI      ??Small_S_16
//  515             XS_NO++;
        ADDS     R5,R5,#+1
//  516       }
??Small_S_16:
        ADDS     R2,R2,#+1
        B        ??Small_S_13
//  517       if(XS>95)
??Small_S_14:
        CMP      R4,#+96
        BLT      ??Small_S_17
//  518         XS_Flag=1;
        MOVS     R0,#+1
        MOVS     R7,R0
//  519       if(XS_NO>1)
??Small_S_17:
        CMP      R5,#+2
        BLT      ??Small_S_12
//  520         XS_Flag=0;
        MOVS     R0,#+0
        MOVS     R7,R0
//  521   }
//  522   if(XS_Flag==1)  
??Small_S_12:
        CMP      R7,#+1
        BNE      ??Small_S_18
//  523   {
//  524 //     Chazhi=Chazhi/3;
//  525      BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  526   }
//  527          
//  528       
//  529       
//  530   }
??Small_S_18:
        ADD      SP,SP,#+404
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     Chazhi_Max_New

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     Chazhi_Chucun

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//  531 
//  532 
//  533 /*************************************************************************************************************
//  534 检测弯道还是直道
//  535 ******************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  536 void Test_RoadInfo(void) 
//  537 {
Test_RoadInfo:
        PUSH     {R4,LR}
//  538   StraightRoad_Old = StraightRoad;
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  539    
//  540   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
??Test_RoadInfo_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BGE      ??Test_RoadInfo_1
//  541   {
//  542       Road_Remember[i] = Road_Remember[i+1];
        LDR      R1,??DataTable4_2
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable4_2
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  543   }
        ADDS     R0,R0,#+1
        B        ??Test_RoadInfo_0
//  544   Road_Remember[P-1] = Chazhi;	//该值为电感检测值-100~100
??Test_RoadInfo_1:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
//  545   
//  546   StraightRoad=0;;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  547   WindingRoad=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  548   WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  549   
//  550 //  for(int8_t i = 0;i < P; i++)
//  551 //  {        
//  552 //    if(Road_Remember[i] > -20 && Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
//  553 //    {
//  554 //      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//  555 //    }
//  556 //		
//  557 //    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -20)//100,38
//  558 //   {
//  559 //     WindingRoad_Right++;		//判断弯道稳定性---右转累加
//  560 //   }
//  561 //   else if(Road_Remember[i] >= 20 && Road_Remember[i] <= 300)
//  562 //   {
//  563 //      WindingRoad_Left++;		//判断弯道稳定性---左转累加
//  564 //   }
//  565     
//  566 //  }
//  567   
//  568   for(int8_t i = 0;i < P; i++)
        MOVS     R4,#+0
??Test_RoadInfo_2:
        SXTB     R4,R4
        CMP      R4,#+50
        BGE      ??Test_RoadInfo_3
//  569   {        
//  570     if(abs_f(Road_Remember[i])< 15)	//在-35~35范围内，保证差值与位置的线性关系
        LDR      R0,??DataTable4_2
        SXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        BL       abs_f
        LDR      R1,??DataTable5_4  ;; 0x41700000
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_4
//  571     {
//  572       WindingRoad--;		//判断直道稳定性，分别列出一百组信号
        LDR      R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_5
//  573     }		
//  574     else 
//  575     {
//  576       WindingRoad++;		//判断弯道稳定性---左转累加
??Test_RoadInfo_4:
        LDR      R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  577     }
//  578    
//  579   StraightRoad_Flag = 0;//直道标志
??Test_RoadInfo_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  580   WindingRoad_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  581   WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
        MOVS     R0,#+0
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  582   if(WindingRoad <10)
        LDR      R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE      ??Test_RoadInfo_6
//  583   {
//  584   StraightRoad_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  585        WindingRoad_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_7
//  586 
//  587   }
//  588 else
//  589 {
//  590      WindingRoad_Flag=1;
??Test_RoadInfo_6:
        MOVS     R0,#+1
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  591        StraightRoad_Flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_7
        STR      R0,[R1, #+0]
//  592 
//  593   }  
//  594 }
??Test_RoadInfo_7:
        ADDS     R4,R4,#+1
        B        ??Test_RoadInfo_2
//  595 
//  596 }
??Test_RoadInfo_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     Chazhi_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     Chazhi_Rate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     Road_Remember

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     Road_Remember+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     StraightRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     WindingRoad_Left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x42dc0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x420c0000
//  597 /*************************************************************************************************************
//  598 检测弯道还是直道:利用两个竖直电感
//  599 ******************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  600 void Test_RoadInfo_Shuzhi(void) 
//  601 {
Test_RoadInfo_Shuzhi:
        PUSH     {LR}
        SUB      SP,SP,#+404
//  602   StraightRoad_Old = StraightRoad;
        LDR      R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable5_1
        STR      R0,[R1, #+0]
//  603 #define SZ 50
//  604 float Road_Remember_RI[SZ]={0},Road_Remember_LI[SZ]={0}; 
        ADD      R0,SP,#+200
        MOVS     R1,#+200
        BL       __aeabi_memclr4
        MOV      R0,SP
        MOVS     R1,#+200
        BL       __aeabi_memclr4
//  605 
//  606   for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
??Test_RoadInfo_Shuzhi_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BGE      ??Test_RoadInfo_Shuzhi_1
//  607   {
//  608       Road_Remember_RI[i] = Road_Remember_RI[i+1];
        ADD      R1,SP,#+200
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        ADD      R2,SP,#+200
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  609   }
        ADDS     R0,R0,#+1
        B        ??Test_RoadInfo_Shuzhi_0
//  610   Road_Remember[SZ-1] = AD_inductor[3];	
??Test_RoadInfo_Shuzhi_1:
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  611   
//  612    for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
??Test_RoadInfo_Shuzhi_2:
        SXTB     R0,R0
        CMP      R0,#+49
        BGE      ??Test_RoadInfo_Shuzhi_3
//  613   {
//  614       Road_Remember_LI[i] = Road_Remember_LI[i+1];
        MOV      R1,SP
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        MOV      R2,SP
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  615   }
        ADDS     R0,R0,#+1
        B        ??Test_RoadInfo_Shuzhi_2
//  616   Road_Remember[SZ-1] = AD_inductor[4];	
??Test_RoadInfo_Shuzhi_3:
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  617   
//  618   StraightRoad=0;;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  619   WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  620   
//  621   for(int8_t i = 0;i < SZ; i++)
        MOVS     R2,#+0
??Test_RoadInfo_Shuzhi_4:
        SXTB     R2,R2
        CMP      R2,#+50
        BGE      ??Test_RoadInfo_Shuzhi_5
//  622   {      	
//  623       if(Road_Remember_RI[i]>15&&Road_Remember_LI[i]<1)//100,38
        ADD      R0,SP,#+200
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6  ;; 0x41700001
        BL       __aeabi_cfrcmple
        BHI      ??Test_RoadInfo_Shuzhi_6
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_Shuzhi_6
//  624       {
//  625           WindingRoad_Right++;		//判断弯道稳定性---右转累加
        LDR      R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_Shuzhi_7
//  626       }
//  627       else if(Road_Remember_LI[i] >15 && Road_Remember_RI[i] <1)//100,38
??Test_RoadInfo_Shuzhi_6:
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6  ;; 0x41700001
        BL       __aeabi_cfrcmple
        BHI      ??Test_RoadInfo_Shuzhi_8
        ADD      R0,SP,#+200
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_Shuzhi_8
//  628       {
//  629           WindingRoad_Left++;		//判断弯道稳定性---左转累加
        LDR      R0,??DataTable5_11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_11
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_Shuzhi_7
//  630       }
//  631       else 
//  632       {
//  633           StraightRoad++; 
??Test_RoadInfo_Shuzhi_8:
        LDR      R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  634       }         
//  635   }
??Test_RoadInfo_Shuzhi_7:
        ADDS     R2,R2,#+1
        B        ??Test_RoadInfo_Shuzhi_4
//  636   
//  637   StraightRoad_Flag = 0;//直道标志
??Test_RoadInfo_Shuzhi_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  638   WindingRoad_Left_Flag = 0;WindingRoad_Right_Flag = 0;//左转,右转标志                 
        MOVS     R0,#+0
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  639   
//  640   if(StraightRoad >= 15)
        LDR      R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+15
        BLT      ??Test_RoadInfo_Shuzhi_9
//  641   {
//  642   StraightRoad_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  643   }
//  644   if(WindingRoad_Left >= 5)//50
??Test_RoadInfo_Shuzhi_9:
        LDR      R0,??DataTable5_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??Test_RoadInfo_Shuzhi_10
//  645   {
//  646     WindingRoad_Left_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  647   }
//  648   if(WindingRoad_Right >= 5)
??Test_RoadInfo_Shuzhi_10:
        LDR      R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??Test_RoadInfo_Shuzhi_11
//  649   {
//  650     WindingRoad_Right_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  651   }       
//  652 }
??Test_RoadInfo_Shuzhi_11:
        ADD      SP,SP,#+404
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x42200001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     StraightRoad_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     WindingRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     WindingRoad_Right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x41700000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     WindingRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     WindingRoad_Left_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     WindingRoad_Right_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     StraightRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     Road_Remember+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     WindingRoad_Left

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//  653 
//  654 
//  655 
//  656 
//  657 
//  658 
//  659 
//  660 
//  661 /*******************确定电感最大最小值**********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  662 void Inductor_Check(void)
//  663 {
Inductor_Check:
        PUSH     {R7,LR}
//  664   //起始电感值滤波:确定最低电感值
//  665 if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500)
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_0
//  666     {
//  667       if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&
//  668       AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5)
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+4]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+4]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_0
//  669          {
//  670             min_v[0]=AD_valu[0];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  671             min_v[1]=AD_valu[1];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+4]
//  672             min_v[2]=AD_valu[2];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+8]
//  673          }    
//  674     }
//  675 
//  676 if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500&&AD_valu[3]<500&&AD_valu[4]<500)
??Inductor_Check_0:
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BLT      .+4
        B        ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BLT      .+4
        B        ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+12]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+16]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BGE      ??Inductor_Check_1
//  677     {
//  678       if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&AD_valu[1]-AD_valu[3]<5&&AD_valu[1]-AD_valu[4]<5&&
//  679       AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[3]>-5&&AD_valu[1]-AD_valu[4]>-5)
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+4]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+12]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+16]
        SUBS     R0,R0,R1
        CMP      R0,#+5
        BGE      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+4]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+12]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_1
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+16]
        SUBS     R0,R0,R1
        MOVS     R1,#+3
        MVNS     R1,R1            ;; #-4
        CMP      R0,R1
        BLT      ??Inductor_Check_1
//  680          {
//  681             min_v[0]=AD_valu[0];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  682             min_v[1]=AD_valu[1];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+4]
//  683             min_v[2]=AD_valu[2];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+8]
//  684             min_v[3]=AD_valu[3];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+12]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+12]
//  685             min_v[4]=AD_valu[4];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+16]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+16]
//  686          }    
//  687     }
//  688 
//  689   for(int i=0;i<5;i++)
??Inductor_Check_1:
        MOVS     R2,#+0
??Inductor_Check_2:
        CMP      R2,#+5
        BGE      ??Inductor_Check_3
//  690   {
//  691      if( min_v[i]>499)
        LDR      R0,??DataTable6_3
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6_4  ;; 0x43f98001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_Check_4
//  692          min_v[i]=499;
        LDR      R0,??DataTable6_5  ;; 0x43f98000
        LDR      R1,??DataTable6_3
        MOVS     R3,#+4
        MULS     R3,R2,R3
        STR      R0,[R1, R3]
//  693   }
??Inductor_Check_4:
        ADDS     R2,R2,#+1
        B        ??Inductor_Check_2
//  694 //电感最大值确定：防止实际最大电感值偏大
//  695 if(Circle_Flag==0)
??Inductor_Check_3:
        LDR      R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
//  696   {
//  697      if(AD_inductor[1]<90)
//  698      {
//  699 //        if(AD_valu[0]>max_v[0]) max_v[0]=AD_valu[0];//避免差值变大
//  700 //        if(AD_valu[2]>max_v[2]) max_v[2]=AD_valu[2];
//  701 //        if(AD_valu[3]>max_v[3]) max_v[3]=AD_valu[3];
//  702 //        if(AD_valu[4]>max_v[4]) max_v[4]=AD_valu[4];
//  703      }
//  704   }
//  705 }
??Inductor_Check_5:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x41700001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     AD_valu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     min_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x43f98001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x43f98000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     Circle_Flag
//  706 //电感最小值确定：防止实际最大电感值偏小？没想出来
//  707 
//  708 
//  709 ///取绝对值

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  710 uint16 abs_i(int value)
//  711 {
abs_i:
        PUSH     {LR}
//  712     if(value<0)
        CMP      R0,#+0
        BPL      ??abs_i_0
//  713       value=-value;
        RSBS     R1,R0,#+0
        MOVS     R0,R1
//  714     return value;
??abs_i_0:
        UXTH     R0,R0
        POP      {PC}             ;; return
//  715 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  716 
//  717 
//  718 
//  719 /************************************************************************************************************************************************************************************************************************************
//  720 检测弯道还是直道
//  721 5.6、 弯道策略
//  722 电科：电磁组前瞻较小， S 道处理较困难， S 道的处理的好坏对整体速度有较大
//  723 的影响。 处理方法如下：初始化一个容量为 50 的数组，记录每次的弯曲度，动
//  724 态更新数组。然后对 50 个数据求绝对值和和代数和,如果代数和绝对值很小，
//  725 则车在直道，如果代数和和绝对值和较小，但是前 20 个数据较大，则可以判定
//  726 小车在出弯，如果代数和和绝对值和较小，后 20 较大，则判定小车在入弯，如
//  727 果代数和很小，但绝对值和很大，则在 s 弯道。经过调试， 虽然有一点滞后性，
//  728 还可以继续完善。但是这个算法可以非常好的处理弯道。
//  729 
//  730 北科：对过弯速度的处理方式确定为：
//  731 入弯时急减速，以得到足够的调整时间，获得正确的转向角度；在弯道内适当
//  732 提速，并保持角度不变，为出弯时的加速节约时间；出弯时，先准确判断标志，
//  733 然后加速，虽然会耗费一些时间，但是面对连续变向弯道可以减少判断出错的
//  734 概率，保证行驶状态的稳定性，而且弯道内的有限加速对后面的提速也有很大
//  735 的帮助。综合考虑用可以接收的额外时间换回行驶稳定性还是值得的
//  736 ******************************************************************************************************************************/
//  737 /*void Small_S(void)
//  738 {
//  739 int Chazhi_i=0;
//  740 float Chazhi_wandao[50]={0};
//  741  float    Chazhi_he=0,Chazhi_he_before=0,Chazhi_he_after=0,
//  742      Chazhi_abs=0,     
//  743      Chazhi_he_before_flag = 0,
//  744      Chazhi_he_after_flag  = 0,
//  745      Chazhi_he_flag        = 0,
//  746      Chazhi_abs_flag       =0;
//  747 
//  748       for(Chazhi_i = 0;Chazhi_i < 50; Chazhi_i++)   //将所有更新的数据往前移1位
//  749   {
//  750       Chazhi_wandao[Chazhi_i] = Chazhi_wandao[Chazhi_i+1];
//  751   }
//  752   Road_Remember[49] = Chazhi;	//该值为电感检测值-100~100
//  753      
//  754 //     Chazhi_i++;
//  755 //  Chazhi_wandao[Chazhi_i] = Chazhi;
//  756 //  if(Chazhi_i >= 50)
//  757 //  {
//  758 //    Chazhi_i = 0;
//  759   
//  760     for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//  761     {   
//  762 //取50个的电感值的代数和
//  763       Chazhi_he += Chazhi_wandao[Chazhi_j];
//  764 //取前20的值,
//  765       if(Chazhi_j == 20)
//  766       Chazhi_he_before = Chazhi_he;
//  767 //取后20的值,最新值
//  768       if(Chazhi_j >=31&&Chazhi_j <= 50)
//  769         Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
//  770     }
//  771 
//  772 //取50个电感值的绝对值和
//  773     for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//  774     { Chazhi_abs  += abs_f(Chazhi_wandao[Chazhi_j]);}
//  775   }
//  776   
//  777 //  Chazhi_he_before_flag = Chazhi_he_before;
//  778 //  Chazhi_he_after_flag  = Chazhi_he_after;
//  779 //  Chazhi_he_flag        = Chazhi_he;
//  780 //  Chazhi_abs_flag       = Chazhi_abs;
//  781 //  
//  782 //
//  783 //  Chazhi_he_before = 0;
//  784 //  Chazhi_he_after  = 0;
//  785 //  Chazhi_he        = 0;
//  786 //  Chazhi_abs       = 0;
//  787 
//  788 */
//  789 //void Test_RoadInfo2(void) 
//  790 //{
//  791 //  StraightRoad_Old = StraightRoad;
//  792 //   
//  793 //  for(int8_t i = 0;i <M-1; i++)   //将所有更新的数据往前移1位
//  794 //  {
//  795 //      Road_Remember2[i] = Road_Remember[i+1];
//  796 //  }
//  797 //  Road_Remember2[M-1] = Chazhi;	//该值为电感检测值-100~100
//  798 //  
//  799 //  for(int8_t i = 0;i<20;i++)  
//  800 //  {
//  801 //      Abs_old_Chazhi+= abs_f(Road_Remember2[i]);
//  802 //      Alg_old_Chazhi+=Road_Remember2[i];
//  803 //  }
//  804 //  for(int8_t i = 30;i<M;i++)  
//  805 //  {
//  806 //      Abs_new_Chazhi+= abs_f(Road_Remember2[i]);
//  807 //      Alg_new_Chazhi+=Road_Remember2[i];
//  808 //  }
//  809 //   for(int8_t i = 20;i<30;i++)  
//  810 //  {
//  811 //      Abs_sum_Chazhi+= abs_f(Road_Remember2[i]);
//  812 //      Alg_sum_Chazhi+=Road_Remember2[i];
//  813 //  }
//  814 //  
//  815 //  Abs_sum_Chazhi+=Abs_new_Chazhi+Abs_old_Chazhi;
//  816 //  Alg_sum_Chazhi+=Alg_new_Chazhi+Alg_old_Chazhi;
//  817 //  
//  818 //  Chazhi_Acc_Zhi=250,//50*5
//  819 //  Chazhi_Acc_Wan=400,//20*20
//  820 //
//  821 //  if(Abs_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi>-Chazhi_Acc_Zhi)
//  822 //  {
//  823 //       StraightRoad_Flag = 1;
//  824 //  }
//  825 //  
//  826 //   if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi>Chazhi_Acc_Wan)
//  827 //  {
//  828 //      WindingRoad_Left_Flag = 1;
//  829 //  } 
//  830 //  if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
//  831 //  {
//  832 //      WindingRoad_Right_Flag = 1;
//  833 //  }
//  834 //  
//  835 //  if(Abs_old_Chazhi<Chazhi_Acc_Wan&&Alg_old_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
//  836 //  {
//  837 //      WindingRoad_Left_Flag = 1;
//  838 //  }
//  839 
//  840 //  
//  841 ////  StraightRoad=0;;//小车直走次数
//  842 ////  WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
//  843 //  
//  844 //  for(int8_t i = 0;i < 100; i++)
//  845 //  {        
//  846 //    if(Road_Remember[i] > -40 && Road_Remember[i] < 40)	//在-35~35范围内，保证差值与位置的线性关系
//  847 //    {
//  848 //      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//  849 //    }
//  850 // //else if(g_AD_Remember[i] > -45 && g_AD_Remember[i] < 45)				//在-35~35范围内，保证Mid_AD_value与位置的线性关系
//  851 // //{
//  852 // //  StraightRoad2++;		//判断直道稳定性，分别列出一百组信号
//  853 // //}		
//  854 //    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -40)//100,38
//  855 //   {
//  856 //     WindingRoad_Right++;		//判断弯道稳定性---右转累加
//  857 //   }
//  858 //   else if(Road_Remember[i] >= 40 && Road_Remember[i] <= 300)
//  859 //   {
//  860 //      WindingRoad_Left++;		//判断弯道稳定性---左转累加
//  861 //   }
//  862 //    
//  863 //  }
//  864 //  StraightRoad_Flag = 0;//直道标志
//  865 //  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
//  866 //  if(StraightRoad >= 95)
//  867 //  {
//  868 //  StraightRoad_Flag = 1;
//  869 //  }
//  870 //  if(WindingRoad_Left >= 5)//50
//  871 //  {
//  872 //    WindingRoad_Left_Flag = 1;
//  873 //  }
//  874 //  if(WindingRoad_Right >= 5)
//  875 //  {
//  876 //    WindingRoad_Right_Flag = 1;
//  877 //  }       
//  878 //}
//  879 //void Test_Huandao()
//  880 //{
//  881 ////  状态      右     中     左   右竖  左竖 
//  882 ////  最大      2000  1600   2000  2000  2000
//  883 ////                               400(13)   400(13)    
//  884 ////  正常      825   1600   825   170(10)   170(10)
//  885 ////  环岛两 个环切线滤波
//  886 ////  if(AD_inductor[0]>45&&AD_inductor[1]>80&&AD_inductor[2]>45)//中
//  887 ////    Chazhi=Chazhi/10;
//  888 ////  if(AD_inductor[1]>75&&(AD_inductor[0]>75||AD_inductor[2]>75))//电磁线在俩电感之间时不行
//  889 ////    Chazhi=Chazhi/10; 
//  890 ////   if(Circle_Flag>0)
//  891 ////   {
//  892 ////      if(AD_inductor[1]>105&&AD_inductor[1]<Circle_inductor_Max)//识别进入到环岛双线之前之后
//  893 ////         {
//  894 //////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  895 //////       Chazhi=0; 
//  896 ////           if(AD_inductor[3]>AD_inductor[4]) //100       
//  897 ////              Circle_R_Count++; 
//  898 ////           if(AD_inductor[4]>AD_inductor[3]) //100       
//  899 ////              Circle_L_Count++;    
//  900 ////    }
//  901 ////   }  
//  902 //                     //100
//  903 ////    if(AD_inductor[1]>120&&AD_inductor[1]<Circle_inductor_Mid2)//识别进入到环岛双线之前之后
//  904 ////    {
//  905 //////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  906 //////       Chazhi=0; 
//  907 ////       if(AD_inductor[0]>90) //100       
//  908 ////         Circle_R_Count++; 
//  909 ////       if(AD_inductor[2]>90)  //100      
//  910 ////         Circle_L_Count++;    
//  911 ////    }
//  912 ////    
//  913 ////     if(AD_inductor[0]>70&&AD_inductor[1]>90&&AD_inductor[2]>70||
//  914 ////        AD_inductor[1]>85&&(AD_inductor[0]>80||AD_inductor[2]>80))//中
//  915 //  //2000,100;2500,125;3000,150;3500,175
//  916 //  if(Circle_Flag==0)//处于检测圆环双线状态
//  917 //  {
//  918 //    
//  919 ////       if(AD_inductor[1]>130&&AD_inductor[1]<170)
//  920 ////          {
//  921 //////            if(AD_inductor[0]>AD_inductor[2]+30) //100       
//  922 //////              Circle_R_Count++; 
//  923 //////             if(AD_inductor[2]>AD_inductor[0]+30) //100       
//  924 //////              Circle_L_Count++; 
//  925 //////          
//  926 ////          }
//  927 //    
//  928 //    
//  929 //      if(AD_inductor[1]>Circle_Inductor_value1)
//  930 //      {
//  931 //              Circle_Count++;//环岛双线计数   
//  932 //              if(Circle_Count>Circle_Count_Max)
//  933 //              {
//  934 //                  Circle_Flag=1; //进入环岛双线
//  935 //                  Circle_Count=0;
//  936 //              }
//  937 //      }
//  938 //  }
//  939 //  
//  940 //  
//  941 //  if(Circle_Flag==1)//检测到圆环双线，进入到检测离开圆环双线
//  942 //  {
//  943 //        if(AD_inductor[1]<Circle_Inductor_value2)      
//  944 //                Circle_Count2++;//离开环岛双线计数
//  945 //        
//  946 //         if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
//  947 //          Circle_R_Count++; 
//  948 //         if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
//  949 //          Circle_L_Count++; 
//  950 //         
//  951 // //会出现提前转弯，与滞后转弯后强制出环转冲突，导致提前转弯一直旋转        
//  952 ////      if(Circle_L_Count>Circle_Turn_Count||Circle_R_Count>Circle_Turn_Count)//转弯计数达到上限，进入转弯时刻
//  953 ////         Circle_Flag=3;//转弯识别结束该转弯了
//  954 //         
//  955 //         
//  956 //         
//  957 //         
//  958 //        if(Circle_Count2>Circle_Count2_Max)
//  959 //
//  960 //        {
//  961 //             Circle_Flag=2; //离开环岛双线标志
//  962 //             Circle_Count2=0;
//  963 //        }
//  964 //
//  965 //  }
//  966 //
//  967 //   if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
//  968 //   {
//  969 //       if(AD_inductor[3]>AD_inductor[4]) //100       
//  970 //          Circle_R_Count++; 
//  971 //       if(AD_inductor[4]>AD_inductor[3]) //100       
//  972 //          Circle_L_Count++;
//  973 ////       if(AD_inductor[0]>AD_inductor[2]) //100       
//  974 ////          Circle_R_Count++; 
//  975 ////       if(AD_inductor[2]>AD_inductor[0]) //100       
//  976 ////          Circle_L_Count++; 
//  977 ////   
//  978 //       
//  979 //    //同上解释，可通过计算速度时间路程来使用
//  980 ////       if(Circle_L_Count>Circle_Turn_Count2||Circle_R_Count>Circle_Turn_Count2)//转弯计数达到上限，进入转弯时刻
//  981 ////                    Circle_Flag=3;//转弯识别结束该转弯了
//  982 //
//  983 //       if(AD_inductor[1]<Circle_Inductor_value3)//150
//  984 //        {
//  985 //////          Circle_Count3++;//圆环转弯计数，累加为了避免遇到误判，环岛双线提前结束
//  986 //////          if(Circle_Count3>Circle_Count3_Max)
//  987 //////          {
//  988 //////          Circle_Count3=0;
//  989 //             Circle_Flag=3;//转弯识别结束该转弯了
//  990 //////          }
//  991 //        }
//  992 //   }
//  993 //   
//  994 //   if(Circle_Flag==3)//开始转弯
//  995 //   {      
//  996 //      if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
//  997 //      {
//  998 //         if(Circle_L_Count>Circle_R_Count)
//  999 //         {
// 1000 //          Circle_L_Count=0;
// 1001 //          Circle_R_Count=0;
// 1002 //          
// 1003 //           Circle_L_Flag=1;
// 1004 //           
// 1005 //           Circle_Turn_Old_Flag=2;
// 1006 //           
// 1007 //           Circle_Error_Flag=2;
// 1008 //         }
// 1009 //         else
// 1010 //         {
// 1011 //            Circle_L_Count=0;
// 1012 //            Circle_R_Count=0;
// 1013 //          
// 1014 //            Circle_R_Flag=1;
// 1015 //            
// 1016 //             Circle_Turn_Old_Flag=1;
// 1017 //            
// 1018 //            Circle_Error_Flag=1;
// 1019 //         }           
// 1020 //      }
// 1021 //   }
// 1022 //
// 1023 //
// 1024 //      if(Circle_L_Flag==1)
// 1025 //      {
// 1026 //          Chazhi = 43.5;
// 1027 //          
// 1028 //          Circle_L_Finish_Count++;
// 1029 //          LED_2_ON;
// 1030 //          BUZZER_ON;
// 1031 //      }
// 1032 //      if(Circle_R_Flag==1)
// 1033 //      {
// 1034 //           Chazhi =-43.5;//47=70度,43.5=65
// 1035 //           Circle_R_Finish_Count++;      
// 1036 //           LED_1_ON;
// 1037 //                     BUZZER_ON;
// 1038 //
// 1039 //      }
// 1040 //    
// 1041 //
// 1042 //    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
// 1043 //    {
// 1044 //      Circle_Count=0;
// 1045 //      Circle_Count2=0;
// 1046 //      Circle_L_Finish_Count=0;
// 1047 //      Circle_R_Finish_Count=0;
// 1048 //      Circle_L_Count=0;
// 1049 //      Circle_R_Count=0;
// 1050 //      
// 1051 //      Circle_L_Flag=0;
// 1052 //      Circle_R_Flag=0;
// 1053 //     Circle_Flag=4;
// 1054 //                          BUZZER_OFF;
// 1055 //     Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道
// 1056 //
// 1057 //    }
// 1058 //  
// 1059 // /*仅用电感150左右转弯，还会出现帅的提前转弯反转，故屏蔽
// 1060 //  基本不会出现太滞后转弯,所以屏蔽，一旦出现提前转弯，和太滞后转弯的强制差值一样，导致一直在内旋转
// 1061 //  
// 1062 //  */ 
// 1063 ////    if(Circle_Count_Out_Flag==1)
// 1064 ////    {
// 1065 ////        Circle_Count_Out++;
// 1066 ////        if(Circle_Count_Out>Circle_Count_Out_Max)
// 1067 ////        {
// 1068 ////            Circle_Count_Out=0;
// 1069 ////            Circle_Count_Out_Flag=0;
// 1070 ////        }
// 1071 ////        
// 1072 ////        if(Circle_Turn_Old_Flag==2)//左转进弯
// 1073 ////        {
// 1074 ////           if(Chazhi)
// 1075 ////           if(Chazhi<-40)
// 1076 ////            Chazhi=-Chazhi;     
// 1077 ////         }
// 1078 ////      
// 1079 ////         if(Circle_Turn_Old_Flag==1)//右转进弯
// 1080 ////         {
// 1081 ////             
// 1082 ////            if(Chazhi>50)
// 1083 ////               Circle_Count_Out__Wai_Flag=1;
// 1084 ////            if(Chazhi>50)
// 1085 ////               Circle_Count_Out__Wai_Flag=1;             
// 1086 ////         if(Chazhi>40)
// 1087 ////            Chazhi=-Chazhi;     
// 1088 ////         }
// 1089 ////      
// 1090 ////     }
// 1091 //  
// 1092 //  
// 1093 //    if(Circle_Flag==4)//圆环强制转弯结束,进入圆环行驶检测
// 1094 //   {
// 1095 //        if(AD_inductor[1]<Circle_Inductor_value4)
// 1096 //      {
// 1097 //              Circle_Count4++;//环岛双线计数   
// 1098 //              if(Circle_Count4>Circle_Count4_Max)
// 1099 //              {
// 1100 //                  Circle_Flag=5; //出环岛双线标志
// 1101 //                  Circle_Count4=0;
// 1102 //              }
// 1103 //      }
// 1104 //   }
// 1105 //     
// 1106 //  
// 1107 //   if(Circle_Flag==5)//圆环正规行驶结束束,进入检测出圆环双线
// 1108 //   {
// 1109 //        if(AD_inductor[1]>Circle_Inductor_value5)
// 1110 //      {
// 1111 //              Circle_Count5++;//环岛双线计数   
// 1112 //              if(Circle_Count5>Circle_Count5_Max)
// 1113 //              {
// 1114 //                  Circle_Flag=6; //出环岛双线标志
// 1115 //                  Circle_Count5=0;
// 1116 //              }
// 1117 //      }
// 1118 //   }
// 1119 //     
// 1120 // 
// 1121 ////   if(Circle_Flag==6)//标志6暂定时间3s
// 1122 ////   {
// 1123 ////     
// 1124 //////     if(AD_inductor[1]>?)
// 1125 ////     if(AD_inductor[1]>100)
// 1126 ////     {
// 1127 //////     if(AD_inductor[2]>?)
// 1128 ////     
// 1129 ////     Circle_Turn_Again_Counter++;
// 1130 ////     if(Circle_Turn_Again_Counter>Circle_Turn_Again_Counter_Max)
// 1131 ////     {
// 1132 ////        Circle_Turn_Again_Prevent_Flag=0;
// 1133 ////     }
// 1134 ////     else
// 1135 ////     {
// 1136 ////       Circle_Turn_Again_Prevent_Flag=1;
// 1137 ////     }
// 1138 ////     
// 1139 ////     if(Circle_Turn_Again_Prevent_Flag==1)
// 1140 ////     {
// 1141 ////         if(Circle_Turn_Old_Flag==2)//左转进弯预防差值60
// 1142 ////         {
// 1143 ////           if(Chazhi>30)
// 1144 ////            Chazhi=-Chazhi/2;     
// 1145 ////         }
// 1146 ////      
// 1147 ////        if(Circle_Turn_Old_Flag==1)//右转进弯预防差值-60
// 1148 ////        {
// 1149 ////            if(Chazhi<-30)
// 1150 ////            Chazhi=-Chazhi/2;     
// 1151 ////        }
// 1152 ////     }
// 1153 ////   }
// 1154 ////   }
// 1155 //  
// 1156 //  
// 1157 //
// 1158 //  if(Circle_Flag==6)
// 1159 //  {
// 1160 //      if(AD_inductor[1]<Circle_Inductor_value6)
// 1161 //      {
// 1162 //        Circle_Count6++;
// 1163 //        if(Circle_Count6>Circle_Count6_Max)
// 1164 //        {
// 1165 //        Circle_Flag=0;
// 1166 //        Circle_Error_Flag=0;//转弯误判解除
// 1167 //        }
// 1168 //      }
// 1169 //  }
// 1170 //
// 1171 ////   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//防止误判计数
// 1172 ////      {
// 1173 ////         Circle_Error_Count++;
// 1174 ////         if(Circle_Error_Count>Circle_Error_Count_Max)
// 1175 ////         {
// 1176 ////            Circle_Error_Flag=0;//转弯误判解除
// 1177 ////            Circle_Error_Count=0;
// 1178 //////                 Circle_Flag=0;
// 1179 ////         }      
// 1180 ////      }   
// 1181 //
// 1182 //}
// 1183 //
// 1184 //
// 1185 //
// 
//   912 bytes in section .bss
//   209 bytes in section .data
//   800 bytes in section .rodata
// 3 872 bytes in section .text
// 
// 3 872 bytes of CODE  memory
//   800 bytes of CONST memory
// 1 121 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
