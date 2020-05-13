///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:45
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\SDSB_ZS.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\SDSB_ZS.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\SDSB_ZS.s
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
        PUBLIC Circle_Inductor_value1
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

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\SDSB_ZS.c
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
//    9 //速度设定30:过渡点：0，,0；之前是36.因为按照现在的k1=1.5，差值是50的时候就达
//   10 //到最大偏转角度，还没到标准过渡点就已最大偏转角度
//   11 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float Chazhi_Chucun[20]={0},Chazhi_Old=0,Rate_Count=0,Rate_Flag=0;
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
//   13 
//   14 
//   15 /******************电感分析变量2******************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 int16 ad_valu[5][5];
ad_valu:
        DS8 52

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   17 char position=1;
position:
        DATA
        DC8 1
//   18 #define NM   3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int AD_valu[5],AD_V[5][NM],chazhi_old,RefAd=20, Add_AD_value = 20;
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
//   20 float  Chazhi,Chazhi_Last,Chazhi_Max=60,Chazhi_Min=-60,Chazhi_Max_New=100;//此为1,2位置的最大差值
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
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float  AD_inductor_Last[5]={0};
AD_inductor_Last:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float  AD_inductor[5],sensor_to_one[5],AD_inductor_Huan,sensor_to_one_Huan;
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
//   23 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float  Slope_AD_1;  // 用于坡道检测
Slope_AD_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int  AD_sum[5];
AD_sum:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 int  AD_MAX_NUM;   
AD_MAX_NUM:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 int  position_back = 1;
position_back:
        DATA
        DC32 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 float  max_value,AD_0_max,AD_1_max,AD_2_max,AD_3_max;
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
//   29 /*------------------------------------------------------------------------------------------*/
//   30 /**************判断道路信息变量1****************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 int StraightRoad=0,StraightRoad2=0,StraightRoad_Old=0;//小车直走次数
StraightRoad:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
StraightRoad2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
StraightRoad_Old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int WindingRoad_Left = 0,WindingRoad_Right = 0,WindingRoad=0;//小车左转,右转次数
WindingRoad_Left:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Right:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad:
        DS8 4
//   33 
//   34 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 float Road_Remember[P]={0};//差值储存，用于判断道路信息
Road_Remember:
        DS8 200

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 int StraightRoad_Flag = 0;//直道标志
StraightRoad_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 int WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0,WindingRoad_Flag=0;//左转,右转标志 
WindingRoad_Left_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Right_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
WindingRoad_Flag:
        DS8 4
//   38 /*             判断道路信息变量2                   */
//   39 //Road_Remember2[M]:[]里面的数越大，值的状态越新

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 float Road_Remember2[M]={0},//差值储存，用于判断道路信息
Road_Remember2:
        DS8 200

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41       Abs_sum_Chazhi=0,//50个差值的绝对值总和
Abs_sum_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42       Alg_sum_Chazhi=0,//50个差值的代数总和
Alg_sum_Chazhi:
        DS8 4
//   43       

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44       Abs_new_Chazhi=0,//最新20个差值的绝对值和，用于检测进弯
Abs_new_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45       Alg_new_Chazhi=0,//最新20个差值的代数和
Alg_new_Chazhi:
        DS8 4
//   46       

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47       Abs_old_Chazhi=0,
Abs_old_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48       Alg_old_Chazhi=0; 
Alg_old_Chazhi:
        DS8 4
//   49 /*******************END*************************************************************************************/
//   50 
//   51 /*              左电感       中电感     右电感  
//   52 平时直道         35           90          35
//   53 初环岛切线       45           100         62  
//   54                  49          100          75
//   55 两条电磁线       80           100         92
//   56 电感到达进环岛   74           100         98    
//   57 前轮到达进环岛   48           100          
//   58 */
//   59 
//   60 /******************环岛变量*************************************************/
//   61 
//   62 
//   63 /******************环岛变量2*************************************************/
//   64 //  100,0.5s  
//   65 
//   66 int 
//   67 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   68     Circle_Flag=0,//  圆环进入标志，=1圆环双线识别结束，=2识别到转弯时刻
Circle_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   69     Circle_L_Flag,Circle_R_Flag,//圆环左/右转标志
Circle_L_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   70     Circle_Turn_Old_Flag=0,
Circle_Turn_Old_Flag:
        DS8 4
//   71 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   72     Circle_Count=0,//  进入圆环双线计数
Circle_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   73     Circle_Count_Max=20,//30,0.25s， 圆环双线计数最大值  
Circle_Count_Max:
        DATA
        DC32 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   74     Circle_Count2=0,// 出圆环双线转弯前计数
Circle_Count2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   75     Circle_Count2_Max=2,//30,0.25s， 圆环双线计数最大值
Circle_Count2_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76     Circle_Count3=0,//圆环转弯时刻计数
Circle_Count3:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   77     Circle_Count3_Max=2,//圆环转弯时刻计数最大值
Circle_Count3_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   78     Circle_Count4=0,//圆环转弯时刻计数
Circle_Count4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   79     Circle_Count4_Max=20,//圆环转弯时刻计数最大值 
Circle_Count4_Max:
        DATA
        DC32 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   80     Circle_Count5=0,//出环双线计数
Circle_Count5:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   81     Circle_Count5_Max=2,//出环双线计数最大值
Circle_Count5_Max:
        DATA
        DC32 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   82     Circle_Count6=0,//出环后直道计数
Circle_Count6:
        DS8 4
//   83     
//   84     

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   85     Circle_Count_Out_Flag=0,
Circle_Count_Out_Flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   86     Circle_Count_Out=0,//避免进环迟后,圆环强制转弯结束后保护时间，避免出赛道
Circle_Count_Out:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   87     Circle_Count_Out_Max=400,//800，2s
Circle_Count_Out_Max:
        DATA
        DC32 400
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   89     Circle_L_Count=0,Circle_R_Count=0,//圆环左/右转计数 
Circle_L_Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   90     Circle_Turn_Count=20,//圆环左/右转计数最大值20
Circle_Turn_Count:
        DATA
        DC32 20

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   91     Circle_Turn_Count2=5,//圆环左/右转计数最大值20
Circle_Turn_Count2:
        DATA
        DC32 5

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   92     Circle_Error_Count=0,
Circle_Error_Count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   93     Circle_Error_Count_Max=10000,
Circle_Error_Count_Max:
        DATA
        DC32 10000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   94     Circle_Error_Flag=0,
Circle_Error_Flag:
        DS8 4
//   95     

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   96     Circle_L_Finish_Count=0,Circle_R_Finish_Count=0,// 圆环左/右转结束计数
Circle_L_Finish_Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Circle_R_Finish_Count:
        DS8 4
//   97 //速度100   结束计数100
//   98 //速度110   结束计数300   差值79
//   99 //速度120   结束计数500   差值100

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  100     Circle_Finish_Count_Max=300;//400:1s,// 圆环左/右转结束计数最大值
Circle_Finish_Count_Max:
        DATA
        DC32 300
//  101 
//  102 //        进入圆环双线中电感值   转弯时刻中电感值      转弯计数累加左右电感值：进双线      出双线
//  103 float  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  104         Circle_Inductor_value2=172,//圆环开始转弯计数值 3550，3500
Circle_Inductor_value2:
        DATA
        DC32 432C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  105         Circle_Inductor_value3=150,//不用了,圆环强制转弯值
Circle_Inductor_value3:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  106         Circle_Inductor_value4=100,//圆环行驶值
Circle_Inductor_value4:
        DATA
        DC32 42C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  107         Circle_Inductor_value5=160,//出圆环双线值
Circle_Inductor_value5:
        DATA
        DC32 43200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  108         Circle_Inductor_value6=100,//出圆环进入单线值，解除本次圆环，进入下次圆环状态
Circle_Inductor_value6:
        DATA
        DC32 42C80000H
//  109        

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  110         Circle_Turn_Again_Counter=0,//防止再次进弯计数
Circle_Turn_Again_Counter:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  111         Circle_Turn_Again_Counter_Max=400,//1s防止再次进弯计数最大值
Circle_Turn_Again_Counter_Max:
        DATA
        DC32 43C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  112         Circle_Turn_Again_Prevent_Flag=1,//防止再次进弯标志
Circle_Turn_Again_Prevent_Flag:
        DATA
        DC32 3F800000H
//  113         
//  114         

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  115         AD_inductor_Shuzhi_Max=40,AD_inductor_Shuzhi_Min=1,
AD_inductor_Shuzhi_Max:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AD_inductor_Shuzhi_Min:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  116        Circle_inductor_Max=165,Circle_inductor_Max2=175,//190
Circle_inductor_Max:
        DATA
        DC32 43250000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Max2:
        DATA
        DC32 432F0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  117         Circle_inductor_Mid=150, Circle_inductor_Mid2=170,
Circle_inductor_Mid:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Mid2:
        DATA
        DC32 432A0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  118         Circle_inductor_Min=105,Circle_inductor_Min2=120;
Circle_inductor_Min:
        DATA
        DC32 42D20000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Circle_inductor_Min2:
        DATA
        DC32 42F00000H
//  119 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  120   float AD_hall,Stop_Plan_Flag=0,Stop_OK=0,Stop_Flag=0;
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
//  121   int Stop_ms=0;
Stop_ms:
        DS8 4
//  122   

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  123 void Hall(void)
//  124 {
Hall:
        PUSH     {R7,LR}
//  125     AD_hall = ADC_Once(ADC_6,adc12bit);  //中2 通道
        MOVS     R1,#+2
        MOVS     R0,#+46
        BL       ADC_Once
        BL       __aeabi_ui2f
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  126     if(Stop_Plan_Flag==0)
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_0
//  127     {
//  128        if(AD_hall<2500) 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_2  ;; 0x451c4000
        BL       __aeabi_cfcmple
        BCS      ??Hall_0
//  129        {
//  130            Stop_Plan_Flag=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  131        }
//  132     }
//  133     if(Stop_Plan_Flag==1)
??Hall_0:
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_1
//  134     {
//  135        Stop_ms++;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  136        if(Stop_ms>10000)
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4  ;; 0x2711
        CMP      R0,R1
        BLT      ??Hall_1
//  137          Stop_OK=1;       
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  138     }
//  139     
//  140     if(Stop_OK==1)
??Hall_1:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??Hall_2
//  141     {
//  142        if(AD_hall<2500) 
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_2  ;; 0x451c4000
        BL       __aeabi_cfcmple
        BCS      ??Hall_2
//  143        {
//  144            Stop_Flag=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//  145        }  
//  146     }
//  147 
//  148            
//  149 
//  150 }
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
//  151 /******************环岛变量END*************************************************/
//  152 /*
//  153   快接近环岛，中电感大于130小于165，右电感为左电感2倍次数判断为转弯处方向
//  154   一过切点，竖直电感便可以立即判断转弯方向可设置大于20，
//  155     也可以不设置，此时有一个左右电感大于100，或接近，中电感180
//  156 一过切点，左右竖直均可判断，左右差2倍，且一个大于100，竖直一个0.1一个上52
//  157 */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  158 int     Circle_Count6_Max=5000;//强制打角结束后，下个环岛识别间隔时间
Circle_Count6_Max:
        DATA
        DC32 5000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  159 float   Circle_Inductor_value1=178;//进圆环双线值
Circle_Inductor_value1:
        DATA
        DC32 43320000H

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 void Test_Huandao()
//  161 {
Test_Huandao:
        PUSH     {R7,LR}
//  162 
//  163 if(Circle_Flag==0)//处于检测圆环双线状态
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Test_Huandao_0
//  164 { 
//  165       if(AD_inductor[1]>Circle_Inductor_value1&&(AD_inductor[0]>50||AD_inductor[2]>50))//&&(AD_inductor[3]>30||AD_inductor[4]>30)
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_0
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_4  ;; 0x42480001
        BL       __aeabi_cfrcmple
        BLS      ??Test_Huandao_1
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable1_4  ;; 0x42480001
        BL       __aeabi_cfrcmple
        BHI      ??Test_Huandao_0
//  166       {
//  167           Circle_Count++;//环岛双线计数   
??Test_Huandao_1:
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  168           if(Circle_Count>Circle_Count_Max)
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_5
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_0
//  169           {
//  170                Circle_Flag=2; //进入环岛双线
        MOVS     R0,#+2
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  171                Circle_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  172           }
//  173       }
//  174 }
//  175 
//  176 
//  177 if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
??Test_Huandao_0:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??Test_Huandao_2
//  178 {
//  179      if(AD_inductor[1]<175)
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_7  ;; 0x432f0000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_3
//  180      {
//  181          
//  182        if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_4
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_4
//  183          Circle_R_Count++; 
        LDR      R0,??DataTable1_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  184      if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
??Test_Huandao_4:
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_5
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_5
//  185          Circle_L_Count++; 
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  186          
//  187        if(AD_inductor[3]>AD_inductor[4]&&AD_inductor[4]<20) //100       
??Test_Huandao_5:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_6
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable1_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_6
//  188           Circle_R_Count++; 
        LDR      R0,??DataTable1_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  189        if(AD_inductor[4]>AD_inductor[3]&&AD_inductor[3]<20) //100       
??Test_Huandao_6:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_3
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable1_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_3
//  190           Circle_L_Count++;   
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  191      }      
//  192 //同上解释，可通过计算速度时间路程来使用
//  193         if(AD_inductor[1]<160)//150转弯
??Test_Huandao_3:
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_13  ;; 0x43200000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_2
//  194         {
//  195 
//  196             Circle_Flag=3;//转弯识别结束该转弯了
        MOVS     R0,#+3
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  197          }
//  198 }
//  199   
//  200   
//  201 if(Circle_Flag==3)//开始转弯
??Test_Huandao_2:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??Test_Huandao_7
//  202 {      
//  203       if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
        LDR      R0,??DataTable1_14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??Test_Huandao_7
//  204       {
//  205          if(Circle_L_Count>Circle_R_Count)
        LDR      R0,??DataTable1_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_11
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_8
//  206          {
//  207           Circle_L_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  208           Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  209           
//  210            Circle_L_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_15
        STR      R0,[R1, #+0]
//  211            
//  212            Circle_Turn_Old_Flag=2;
        MOVS     R0,#+2
        LDR      R1,??DataTable1_16
        STR      R0,[R1, #+0]
//  213            
//  214            Circle_Error_Flag=2;
        MOVS     R0,#+2
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
        B        ??Test_Huandao_7
//  215          }
//  216          else
//  217          {
//  218             Circle_L_Count=0;
??Test_Huandao_8:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  219             Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  220           
//  221             Circle_R_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_17
        STR      R0,[R1, #+0]
//  222             
//  223              Circle_Turn_Old_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_16
        STR      R0,[R1, #+0]
//  224             
//  225             Circle_Error_Flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  226          }           
//  227       }
//  228    }
//  229       if(Circle_L_Flag==1)
??Test_Huandao_7:
        LDR      R0,??DataTable1_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Test_Huandao_9
//  230       {
//  231           Chazhi = 100;
        LDR      R0,??DataTable1_18  ;; 0x42c80000
        LDR      R1,??DataTable1_19
        STR      R0,[R1, #+0]
//  232           
//  233           Circle_L_Finish_Count++;
        LDR      R0,??DataTable1_20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_20
        STR      R0,[R1, #+0]
//  234 //          LED_2_ON;
//  235           BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  236       }
//  237       if(Circle_R_Flag==1)
??Test_Huandao_9:
        LDR      R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Test_Huandao_10
//  238       {
//  239            Chazhi =-100;//47=70度,43.5=65
        LDR      R0,??DataTable1_21  ;; 0xc2c80000
        LDR      R1,??DataTable1_19
        STR      R0,[R1, #+0]
//  240            Circle_R_Finish_Count++;      
        LDR      R0,??DataTable1_22
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_22
        STR      R0,[R1, #+0]
//  241 //           LED_1_ON;
//  242                      BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  243 
//  244 }
//  245     
//  246 
//  247     if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
??Test_Huandao_10:
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_20
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BLT      ??Test_Huandao_11
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_22
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_12
//  248     {
//  249       Circle_Count=0;
??Test_Huandao_11:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  250       Circle_Count2=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_24
        STR      R0,[R1, #+0]
//  251       Circle_L_Finish_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_20
        STR      R0,[R1, #+0]
//  252       Circle_R_Finish_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_22
        STR      R0,[R1, #+0]
//  253       Circle_L_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  254       Circle_R_Count=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  255       
//  256       Circle_L_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_15
        STR      R0,[R1, #+0]
//  257       Circle_R_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_17
        STR      R0,[R1, #+0]
//  258      Circle_Flag=6;
        MOVS     R0,#+6
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  259                           BUZZER_OFF;
        MOVS     R1,#+0
        MOVS     R0,#+24
        BL       GpioSet
//  260      Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道
        MOVS     R0,#+1
        LDR      R1,??DataTable1_25
        STR      R0,[R1, #+0]
//  261 
//  262     }
//  263   
//  264 
//  265 if(Circle_Flag==6)
??Test_Huandao_12:
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+6
        BNE      ??Test_Huandao_13
//  266   {
//  267       if(AD_inductor[1]<100)
        LDR      R0,??DataTable1_3
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_18  ;; 0x42c80000
        BL       __aeabi_cfcmple
        BCS      ??Test_Huandao_13
//  268       {
//  269         Circle_Count6++;
        LDR      R0,??DataTable1_26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_26
        STR      R0,[R1, #+0]
//  270         if(Circle_Count6>Circle_Count6_Max)
        LDR      R0,??DataTable1_27
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_26
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE      ??Test_Huandao_13
//  271         {
//  272         Circle_Flag=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  273         Circle_Error_Flag=0;//转弯误判解除
        MOVS     R0,#+0
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  274         }
//  275       }
//  276   }
//  277 
//  278 //      if(Circle_Flag>1&&Circle_Flag<4)//处于检测圆环双线状态
//  279 //      WindingRoad_Flag=1;
//  280   
//  281   // if(Circle_Flag==1)//检测到圆环双线，进入到检测离开圆环双线
//  282 // {
//  283 ////                        BUZZER_ON;
//  284 //
//  285 //     if(AD_inductor[1]<Circle_Inductor_value2)      
//  286 //         Circle_Count2++;//离开环岛双线计数
//  287 //
//  288 //
//  289 // //会出现提前转弯，与滞后转弯后强制出环转冲突，导致提前转弯一直旋转//计数强制转弯使用        
//  290 ////      if(Circle_L_Count>Circle_Turn_Count||Circle_R_Count>Circle_Turn_Count)//转弯计数达到上限，进入转弯时刻
//  291 ////         Circle_Flag=3;//转弯识别结束该转弯了              
//  292 //    if(Circle_Count2>Circle_Count2_Max)
//  293 //   {
//  294 //        Circle_Flag=2; //离开环岛双线标志
//  295 //        Circle_Count2=0;
//  296 //    }
//  297   
//  298   // 
//  299 //    if(Circle_Flag==4)//圆环强制转弯结束,进入圆环行驶检测
//  300 //   {
//  301 //        if(AD_inductor_Huan<100)
//  302 //      {
//  303 //            Circle_Count4++;//环岛双线计数   
//  304 //            if(Circle_Count4>Circle_Count4_Max)
//  305 //            {
//  306 //                Circle_Flag=5; //出环岛双线标志
//  307 //                Circle_Count4=0;
//  308 //            }
//  309 //      }
//  310 //   }
//  311 //     
//  312 //   if(Circle_Flag==5)//圆环正规行驶结束束,进入检测出圆环双线
//  313 //   {
//  314 //      if(AD_inductor_Huan>Circle_Inductor_value5)
//  315 //      {
//  316 //           Circle_Count5++;//环岛双线计数   
//  317 //           if(Circle_Count5>Circle_Count5_Max)
//  318 //           {
//  319 //                Circle_Flag=6; //出环岛双线标志
//  320 //                Circle_Count5=0;
//  321 //           }
//  322 //      }
//  323 //   }
//  324       
//  325 
//  326   
//  327   
//  328 //   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//防止误判计数
//  329 //      {
//  330 //         Circle_Error_Count++;
//  331 //         if(Circle_Error_Count>Circle_Error_Count_Max)
//  332 //         {
//  333 //            Circle_Error_Flag=0;//转弯误判解除
//  334 //            Circle_Error_Count=0;
//  335 ////                 Circle_Flag=0;
//  336 //         }      
//  337 //      }   
//  338 
//  339   //   if(Circle_Flag==6)//标志6暂定时间3s
//  340 //   {
//  341 //     
//  342 ////     if(AD_inductor[1]>?)
//  343 //     if(AD_inductor[1]>100)
//  344 //     {
//  345 ////     if(AD_inductor[2]>?)
//  346 //     
//  347 //     Circle_Turn_Again_Counter++;
//  348 //     if(Circle_Turn_Again_Counter>Circle_Turn_Again_Counter_Max)
//  349 //     {
//  350 //        Circle_Turn_Again_Prevent_Flag=0;
//  351 //     }
//  352 //     else
//  353 //     {
//  354 //       Circle_Turn_Again_Prevent_Flag=1;
//  355 //     }
//  356 //     
//  357 //     if(Circle_Turn_Again_Prevent_Flag==1)
//  358 //     {
//  359 //         if(Circle_Turn_Old_Flag==2)//左转进弯预防差值60
//  360 //         {
//  361 //           if(Chazhi>30)
//  362 //            Chazhi=-Chazhi/2;     
//  363 //         }
//  364 //      
//  365 //        if(Circle_Turn_Old_Flag==1)//右转进弯预防差值-60
//  366 //        {
//  367 //            if(Chazhi<-30)
//  368 //            Chazhi=-Chazhi/2;     
//  369 //        }
//  370 //     }
//  371 //   }
//  372 //   }
//  373   
//  374 }
??Test_Huandao_13:
        POP      {R0,PC}          ;; return

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
        DC32     Circle_Inductor_value1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x42480001

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
        DC32     0x432f0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     AD_inductor_Shuzhi_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     AD_inductor_Shuzhi_Min

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     Circle_R_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     Circle_L_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0x43200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     Circle_Error_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     Circle_L_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     Circle_Turn_Old_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     Circle_R_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     Circle_L_Finish_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     0xc2c80000

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
        DC32     Circle_Count6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_27:
        DC32     Circle_Count6_Max
//  375 /*************************************************************************
//  376 电感数据分析
//  377 *************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  378 void Inductor_analyse()
//  379 {
Inductor_analyse:
        PUSH     {R4-R6,LR}
//  380      int16  i,max_front=0;//max_back
        MOVS     R4,#+0
//  381      static int16 max_old = 1,max_crosstalk = 1;
//  382      static int16 position_last = 1;
//  383      float  sensor_1;
//  384 
//  385      Read_ADC();
        BL       Read_ADC
//  386 
//  387      Inductor_Check();//电感最大最小值校验 
        BL       Inductor_Check
//  388      
//  389 /*********************归一化处理********************/
//  390      for(i=0;i<5;i++)
        MOVS     R5,#+0
        B        ??Inductor_analyse_0
//  391      {
//  392         sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
??Inductor_analyse_1:
        LDR      R0,??Inductor_analyse_2
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,??Inductor_analyse_2+0x8
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x4
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        LDR      R1,??Inductor_analyse_2+0xC
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        STR      R0,[R1, R2]
//  393         if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
        LDR      R0,??Inductor_analyse_2+0xC
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI      ??Inductor_analyse_3
        LDR      R0,??Inductor_analyse_2+0x10  ;; 0x3a83126f
        LDR      R1,??Inductor_analyse_2+0xC
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        STR      R0,[R1, R2]
//  394      }   
??Inductor_analyse_3:
        ADDS     R5,R5,#+1
??Inductor_analyse_0:
        SXTH     R5,R5
        CMP      R5,#+5
        BLT      ??Inductor_analyse_1
//  395           sensor_to_one_Huan=sensor_to_one[1];
        LDR      R0,??Inductor_analyse_2+0xC
        LDR      R0,[R0, #+4]
        LDR      R1,??Inductor_analyse_2+0x14
        STR      R0,[R1, #+0]
//  396 
//  397 //       if(sensor_to_one[0]>1.0)  sensor_to_one[0]=1.0;
//  398 //       if(sensor_to_one[1]>1.0)  sensor_to_one[1]=1.0;
//  399 //       if(sensor_to_one[2]>1.0)  sensor_to_one[2]=1.0;
//  400 //       if(sensor_to_one[3]>1.0)  sensor_to_one[3]=1.0;
//  401 //       if(sensor_to_one[4]>1.0)  sensor_to_one[4]=1.0;
//  402 
//  403        for(i=0;i<5;i++)
        MOVS     R5,#+0
        B        ??Inductor_analyse_4
//  404      {
//  405       
//  406         AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
??Inductor_analyse_5:
        LDR      R0,??Inductor_analyse_2+0xC
        SXTH     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x18  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x1C
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        STR      R0,[R1, R2]
//  407      }
        ADDS     R5,R5,#+1
??Inductor_analyse_4:
        SXTH     R5,R5
        CMP      R5,#+5
        BLT      ??Inductor_analyse_5
//  408      AD_inductor_Huan=100*sensor_to_one_Huan;
        LDR      R0,??Inductor_analyse_2+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??Inductor_analyse_2+0x18  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x20
        STR      R0,[R1, #+0]
//  409 /*******1号电感特殊归一化，用于坡道检测********/
//  410       sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,??Inductor_analyse_2+0x24
        MOVS     R1,#+10
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
//  411       if(sensor_1 <= 0.0)  sensor_1 = 0.001;
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BHI      ??Inductor_analyse_6
        LDR      R0,??Inductor_analyse_2+0x10  ;; 0x3a83126f
//  412       Slope_AD_1 = 100 * sensor_1;
??Inductor_analyse_6:
        LDR      R1,??Inductor_analyse_2+0x18  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR      R1,??Inductor_analyse_2+0x28
        STR      R0,[R1, #+0]
//  413 /***********找出最强的传感器**********************/
//  414        for(i=0;i<3;i++)                 
        MOVS     R5,#+0
        B        ??Inductor_analyse_7
//  415        {
//  416          if(AD_inductor[max_front]<AD_inductor[i])
??Inductor_analyse_8:
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x1C
        SXTH     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_9
//  417            max_front=i;
        MOVS     R4,R5
//  418        }
??Inductor_analyse_9:
        ADDS     R5,R5,#+1
??Inductor_analyse_7:
        SXTH     R5,R5
        CMP      R5,#+3
        BLT      ??Inductor_analyse_8
//  419        max_value=AD_inductor[max_front];  //最大电感值
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x2C
        STR      R0,[R1, #+0]
//  420 /**************丢线时最大值取旧值***************/
//  421        if(max_value < 5)//?           
        LDR      R0,??Inductor_analyse_2+0x2C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10  ;; 0x40a00000
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_11
//  422        {
//  423          max_front=max_old;
        LDR      R0,??Inductor_analyse_10+0x4
        MOVS     R1,#+0
        LDRSH    R4,[R0, R1]
//  424          max_value=AD_inductor[max_front];
        LDR      R0,??Inductor_analyse_2+0x1C
        SXTH     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDR      R1,??Inductor_analyse_2+0x2C
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_12
//  425        }
//  426        else
//  427          max_old=max_front;
??Inductor_analyse_11:
        LDR      R0,??Inductor_analyse_10+0x4
        STRH     R4,[R0, #+0]
//  428 /********防串道***************/
//  429 //       if(abs_inductor(max_front - max_crosstalk) < 2)  
//  430 //       {
//  431 //            max_crosstalk = max_front;
//  432 //       }
//  433 //       else
//  434 //            max_front = max_crosstalk;
//  435 /****************位置解算，解算过程的值用归一化放大后的值************************/
//  436        position_last = position;
??Inductor_analyse_12:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        STRH     R0,[R1, #+0]
//  437        
//  438         if(max_front==0 && (AD_inductor[1] <= Position_transit[0]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[0]>1)&&AD_valu[1]>AD_valu[2])  //已经偏离0号传感器
        SXTH     R4,R4
        CMP      R4,#+0
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
        LDR      R1,??Inductor_analyse_10+0x14  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_13
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_2
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BGE      ??Inductor_analyse_13
//  439        {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//  440                position=0;//右电感在电磁线左方，整个小车都在电磁线左方
        MOVS     R0,#+0
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_14
//  441 //              LED_1_ON;
//  442  //          AD_0_max = AD_inductor[0];//zs加
//  443        }
//  444        else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
??Inductor_analyse_13:
        SXTH     R4,R4
        CMP      R4,#+0
        BNE      ??Inductor_analyse_15
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCC      ??Inductor_analyse_16
??Inductor_analyse_15:
        SXTH     R4,R4
        CMP      R4,#+1
        BNE      ??Inductor_analyse_17
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_17
//  445        {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//  446            //      中电感在电磁线左边                            中电感在电磁线左边
//  447            
//  448              position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
??Inductor_analyse_16:
        MOVS     R0,#+1
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  449              AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_18
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_14
//  450             
//  451        }
//  452        else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
??Inductor_analyse_17:
        SXTH     R4,R4
        CMP      R4,#+1
        BNE      ??Inductor_analyse_19
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCC      ??Inductor_analyse_20
??Inductor_analyse_19:
        SXTH     R4,R4
        CMP      R4,#+2
        BNE      ??Inductor_analyse_21
        LDR      R0,??Inductor_analyse_10+0x10
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??Inductor_analyse_2+0x1C
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_21
//  453        {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//  454         //    中电感在电磁线右边                         中电感在电磁线右边          
//  455              position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
??Inductor_analyse_20:
        MOVS     R0,#+2
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  456              AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
        LDR      R0,??Inductor_analyse_2+0x1C
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_14
//  457        }
//  458        else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] &&AD_inductor[1]>AD_inductor[0]&&AD_inductor[2]>1)&&AD_valu[1]>AD_valu[0]) //已经偏离3号传感器
??Inductor_analyse_21:
        SXTH     R4,R4
        CMP      R4,#+2
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
        LDR      R1,??Inductor_analyse_10+0x14  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_analyse_22
        LDR      R0,??Inductor_analyse_2
        LDR      R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_2
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BGE      ??Inductor_analyse_22
//  459        {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//  460             
//  461                position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
        MOVS     R0,#+3
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_14
//  462             
//  463                //                          LED_2_ON;
//  464         // AD_2_max = AD_inductor[2];//zs加
//  465        }   
//  466        else 
//  467        {
//  468          position=position_last;
??Inductor_analyse_22:
        LDR      R0,??Inductor_analyse_10+0xC
        LDRH     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
//  469        }
//  470 /*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
//  471        if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
??Inductor_analyse_14:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        MOVS     R2,#+0
        LDRSH    R1,[R1, R2]
        SUBS     R0,R0,R1
        BL       abs_inductor
        CMP      R0,#+2
        BLT      ??Inductor_analyse_23
//  472        {
//  473             position = position_last;//此刻小车位置转变为上一次小车位置
        LDR      R0,??Inductor_analyse_10+0xC
        LDRH     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0x8
        STRB     R0,[R1, #+0]
        B        ??Inductor_analyse_24
//  474        }
//  475        else
//  476        {
//  477        position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
??Inductor_analyse_23:
        LDR      R0,??Inductor_analyse_10+0x8
        LDRB     R0,[R0, #+0]
        LDR      R1,??Inductor_analyse_10+0xC
        STRH     R0,[R1, #+0]
//  478        }   
//  479 /*************计算偏移量/差值*************/
//  480      
//  481 //       Chazhi_Last=Chazhi;
//  482 //  
//  483 //       if(position == 0)   //左侧丢线
//  484 //       {
//  485 //           Chazhi =Chazhi_Min-abs_f(Chazhi_Min+AD_inductor[0]);//目前用不到差值50,60以上的
//  486 //       }
//  487 //       else if(position == 1 || position == 2) //处于中间位置        
//  488 //       {
//  489 //         Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  490 //       }
//  491 //       else if(position == 3)  //右侧丢线
//  492 //       {
//  493 //           Chazhi =Chazhi_Max+abs_f(Chazhi_Max-AD_inductor[2]);//目前用不到差值50,60以上的
//  494 //       }    
//  495  /*************计算偏移量/差值*************/
//  496 //因为在0,3区拿右，左电感算差值，在该区，还会出现电感从60变到72在变小，
//  497  //虽优化但不稳定，故改为拿中电感算差值
//  498  //65度/1.5=差值43.333
//  499 //差值60*0.75=45
//  500 //
//  501 // if(AD_inductor[0]>5&&AD_inductor[2]>5) 
//  502 // {
//  503 //     Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//  504 //     Chazhi*=0.75;
//  505 //
//  506 // }
//  507 //                 
//  508 // else if(AD_inductor[0]>AD_inductor[2]&&AD_inductor[0]>10)
//  509 // {
//  510 ////     if(AD_inductor[0]>Chazhi_Max)
//  511 //     if(AD_inductor[1]>Chazhi_Max)
//  512 //       Chazhi =-AD_inductor[1];
//  513 //     else
//  514 //     Chazhi =-Chazhi_Max-abs_f(-Chazhi_Max+AD_inductor[1]);//目前用不到差值50,60以上的
//  515 //     
//  516 //     Chazhi*=0.75;
//  517 // }
//  518 //else if(AD_inductor[2]>AD_inductor[0]&&AD_inductor[2]>10)
//  519 //{
//  520 //   if(AD_inductor[1]>Chazhi_Max)
//  521 //       Chazhi =AD_inductor[1];
//  522 //   else
//  523 //     Chazhi =Chazhi_Max+abs_f(Chazhi_Max-AD_inductor[1]);//目前用不到差值50,60以上的
//  524 //   
//  525 //    Chazhi*=0.75;
//  526 //}
//  527 //else 
//  528 //     Chazhi=Chazhi_Last;
//  529 
//  530        Chazhi_Last=Chazhi;
??Inductor_analyse_24:
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  531 
//  532  switch (max_front)  //最大电感序列号
        SXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??Inductor_analyse_25
        CMP      R4,#+2
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
//  533   {
//  534   /*********** 车离开导线偏左，分3种情况************/
//  535   case 0:   // 右侧电感最大
//  536     {
//  537       if(AD_inductor[0] > RefAd)     //右侧电感> RefAd=20 【RefAd参考值视情况改动】
??Inductor_analyse_25:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_29
//  538       {
//  539                           
//  540         if(AD_inductor[1] > RefAd)  //中间电感> RefAd=20   16
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_30
//  541         {
//  542          Chazhi = -30 - 30*(AD_inductor[0]-AD_inductor[1])/(AD_inductor[0]-RefAd); 
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable2_6  ;; 0xc1f00000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_31
//  543         }
//  544         else 
//  545         {
//  546           Chazhi=-100 +40*(AD_inductor[0]-RefAd)/(AD_inductor[0]-AD_inductor[1]);   
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
        MOVS     R4,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_8  ;; 0xc2c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_31
//  547         }
//  548       }
//  549      else  
//  550        	Chazhi = -100;      //丢信号
??Inductor_analyse_29:
        LDR      R0,??DataTable2_8  ;; 0xc2c80000
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  551     } break;
??Inductor_analyse_31:
        B        ??Inductor_analyse_28
//  552 /*********** 车在左右之间晃荡 ，分2种情况 ************/	
//  553 /*                       左中差值  左电感   中电感   右电感   右中差值
//  554           
//  555 车在最中间:               75        25       100      24    75
//  556 差值=33-34*（100-25）/（100-24）=33-34*1.01=0
//  557           
//  558 中电感最大,左电感>右电感: 31         57      88        5     83     
//  559 差值=33-34*（88-57）/（88-5）=33-34*（31/83）=*0.373   
//  560                                       51/103=*0.495
//  561 临界电感值             69            3      72        70     2
//  562 当达到临界电感值时，为中电感是最大电感时的最大差值，此时分数最小
//  563     差值常数待定
//  564 */
//  565 //          Chazhi =  33 - 34*(Add_AD_value+AD_inductor[1]-AD_inductor[2])/(Add_AD_value+AD_inductor[1]-AD_inductor[0]);
//  566 //电感值较大的与中电感相减值小，作分子，
//  567 //电感值较小的与中电感相减值大，作分母，
//  568 //中电感保持最大时，车偏，中电感变小，
//  569 //    较大电感值变大，分子变小，
//  570 //    较小电感值变小，分母变大，
//  571 //分数变小，抑制差值作用变小，差值变大
//  572 //总结：车跑偏时，分数变小，削减差值常数值作用变小， 差值变大 
//  573 //总结：以最大电感为中电感为界 
//  574   case 1://中间电感最大
//  575      {
//  576         if(AD_inductor[1] > RefAd)   //已5修改  中间电感
??Inductor_analyse_27:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_32
//  577         {  
//  578           if(AD_inductor[2] > AD_inductor[0])       //  左边大于右边偏右            
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_33
//  579            
//  580 Chazhi =  30 - 30*(AD_inductor[1]-AD_inductor[2])/(AD_inductor[1]-AD_inductor[0]);
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_32
//  581           else	                          //  右边大于左边偏左                    
//  582 //          Chazhi = -34 + 34*(Add_AD_value+AD_inductor[1]-AD_inductor[0])/(Add_AD_value+AD_inductor[1]-AD_inductor[2]);
//  583 Chazhi = -30 + 30*(AD_inductor[1]-AD_inductor[0])/(AD_inductor[1]-AD_inductor[2]);
??Inductor_analyse_33:
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_6  ;; 0xc1f00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  584         }                                                                          
//  585      }  break;
??Inductor_analyse_32:
        B        ??Inductor_analyse_28
//  586 
//  587 /***************车离开导线偏右，分3种情况 **************************/
//  588 /*                       左中差值  左电感   中电感   右电感  左参差值 
//  589 2电感最大,考虑2电感和中电感         
//  590 车在最中间:               75        25       100      24   
//  591      
//  592 中电感>参考电感          18         83        65      0.1    83-20=63      
//  593 中电感>参考电感          72         97        25      0.1    97-20=77
//  594 差值=25+25*（18/63）
//  595 差值=25+25*（72/77）
//  596      
//  597 中电感<参考电感          24         43        19      0.1    43-20=23      
//  598 中电感<参考电感          28         38        10      0.1    38-20=18
//  599 差值=100-34*(23/24)
//  600 差值=100-34*(18/28)
//  601  */         
//  602  //2电感最大
//  603   case 2:
//  604     {
//  605 //2电感>参考电感
//  606       if(AD_inductor[2] > RefAd)
??Inductor_analyse_26:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_34
//  607 	{
//  608 //1电感>参考电感：车越偏,分数越小，差值越大，
//  609 //最大差值50
//  610           if(AD_inductor[1] > RefAd)
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_35
//  611 //        Chazhi = 25 + 25*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
//  612           Chazhi = 30 + 30*(AD_inductor[2]-AD_inductor[1])/(AD_inductor[2]-RefAd);  
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_5  ;; 0x41f00000
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
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
        DC32     0x3f800001
        THUMB
//  613           else 
//  614 //参考电感>1电感:车越偏,分数越小，差值越大，
//  615 //        Chazhi = 100 - 34*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
//  616           Chazhi = 100 - 40*(AD_inductor[2]-RefAd)/(AD_inductor[2]-AD_inductor[1]); 
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
        MOVS     R4,R0
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable2_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,??DataTable3  ;; 0x42c80000
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B        ??Inductor_analyse_36
//  617         }                                                                        
//  618        else
//  619       	  Chazhi = 100;	                 //丢信号3
??Inductor_analyse_34:
        LDR      R0,??DataTable3  ;; 0x42c80000
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  620     }  break;
//  621    }
//  622 //     
//  623 // if(AD_inductor[3]>40&&AD_inductor[4]>40)
//  624 //   Chazhi=Chazhi/3;
//  625        
//  626      if(Chazhi>Chazhi_Max_New)
??Inductor_analyse_36:
??Inductor_analyse_28:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Inductor_analyse_37
//  627        Chazhi=Chazhi_Max_New;
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  628      if(Chazhi<-Chazhi_Max_New)
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
//  629        Chazhi=-Chazhi_Max_New;
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  630    
//  631      
//  632   for(uint8 i=0;i<19;i++)
??Inductor_analyse_38:
        MOVS     R0,#+0
        B        ??Inductor_analyse_39
        Nop      
        DATA
??Inductor_analyse_18:
        DC32     AD_0_max
        THUMB
//  633     {
//  634         Chazhi_Chucun[i]=Chazhi_Chucun[i+1];
??Inductor_analyse_40:
        LDR      R1,??DataTable4
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable4
        UXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  635          
//  636     }
        ADDS     R0,R0,#+1
??Inductor_analyse_39:
        UXTB     R0,R0
        CMP      R0,#+19
        BLT      ??Inductor_analyse_40
//  637         Chazhi_Chucun[19]=Chazhi;
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable4
        STR      R0,[R1, #+76]
//  638 
//  639     Chazhi_Old=Chazhi_Chucun[0];
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
//  640      Chazhi_Rate=Chazhi_Old-Chazhi;//D
        LDR      R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable4_2
        STR      R0,[R1, #+0]
//  641 
//  642 //     if(Rate_Count++>19)
//  643 //     {
//  644 //        Rate_Count=0;
//  645 //        Chazhi_Old=Chazhi;
//  646 //     }
//  647 //      Chazhi_Rate=Chazhi_Old-Chazhi;//D
//  648 
//  649      
//  650 //     Chazhi_Rate=Chazhi-Chazhi_Old;//P
//  651      
//  652 }
        POP      {R4-R6,PC}       ;; return

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
//  653 /*   差值 竖直电感   差值 竖直电感
//  654 直道      15,20
//  655 
//  656 弯道   1     20      0       10
//  657       15     35      10      22
//  658       30     51      20      29
//  659       49     49      30      31
//  660       60     34      40      28
//  661       68     23      50      18
//  662       78     11      59      0.1
//  663       94     2
//  664 右竖直电感，差值负
//  665 
//  666 
//  667 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  668 void Small_S(void)
//  669 {
Small_S:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+404
//  670 float Road_Remember_SZ[100]={0}; 
        MOV      R0,SP
        MOVS     R1,#+200
        LSLS     R1,R1,#+1        ;; #+400
        BL       __aeabi_memclr4
//  671 int XS=0,XS_NO=0,XS_Flag=0,
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
//  672 //  StraightRoad=0,//小车直走次数
//  673   WindingRoad = 0,
        MOVS     R2,#+0
//  674     WindingRoad_Flag;//小车左转,右转次数
//  675   
//  676 
//  677    
//  678   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
        B        ??Small_S_0
//  679   {
//  680       Road_Remember[i] = Road_Remember[i+1];
??Small_S_1:
        LDR      R1,??DataTable4_3
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable4_3
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  681   }
        ADDS     R0,R0,#+1
??Small_S_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BLT      ??Small_S_1
//  682   Road_Remember[P-1] = abs_f(Chazhi);	//该值为电感检测值-100~100
        LDR      R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  683   
//  684   StraightRoad=0;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_6
        STR      R0,[R1, #+0]
//  685   WindingRoad = 0;//小车左转,右转次数
        MOVS     R2,#+0
//  686   
//  687   for(int8_t i = 0;i < P; i++)
        MOVS     R3,#+0
        B        ??Small_S_2
//  688   {        
//  689     if(Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
//  690     {
//  691        StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//  692     }		
//  693     else 
//  694       WindingRoad++;		//判断弯道稳定性---右转累   
??Small_S_3:
        ADDS     R2,R2,#+1
??Small_S_4:
        ADDS     R3,R3,#+1
??Small_S_2:
        SXTB     R3,R3
        CMP      R3,#+50
        BGE      ??Small_S_5
        LDR      R0,??DataTable4_3
        SXTB     R3,R3
        MOVS     R1,#+4
        MULS     R1,R3,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable4_7  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_3
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable4_6
        STR      R0,[R1, #+0]
        B        ??Small_S_4
//  695   }
//  696   StraightRoad_Flag = 0;//直道标志
??Small_S_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
//  697   WindingRoad_Flag = 0;//左转,右转标志                 
        MOVS     R2,#+0
//  698   if(StraightRoad >= 90)
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+90
        BLT      ??Small_S_6
//  699   {
//  700   StraightRoad_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
//  701   }
//  702   if(WindingRoad_Left >= 30)
??Small_S_6:
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+30
        BLT      ??Small_S_7
//  703   {
//  704     WindingRoad_Flag = 1;
        MOVS     R2,#+1
//  705   }
//  706  
//  707   
//  708 
//  709   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
??Small_S_7:
        MOVS     R0,#+0
        B        ??Small_S_8
//  710   {
//  711       Road_Remember_SZ[i] = Road_Remember_SZ[i+1];
??Small_S_9:
        MOV      R1,SP
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        ADDS     R1,R1,R3
        LDR      R1,[R1, #+4]
        MOV      R3,SP
        SXTB     R0,R0
        MOVS     R4,#+4
        MULS     R4,R0,R4
        STR      R1,[R3, R4]
//  712   }
        ADDS     R0,R0,#+1
??Small_S_8:
        SXTB     R0,R0
        CMP      R0,#+49
        BLT      ??Small_S_9
//  713   
//  714   if(AD_inductor[3]>AD_inductor[4])
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable4_10
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Small_S_10
//  715      Road_Remember[P-1] = AD_inductor[3];	
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
        B        ??Small_S_11
//  716   else
//  717      Road_Remember[P-1] = AD_inductor[4];	
??Small_S_10:
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  718   
//  719   XS=0; 
??Small_S_11:
        MOVS     R3,#+0
//  720       XS_NO=0;
        MOVS     R4,#+0
//  721         XS_Flag=0;
        MOVS     R5,#+0
//  722 
//  723   if(WindingRoad_Flag==1&&AD_inductor[1]<110)
        CMP      R2,#+1
        BNE      ??Small_S_12
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable4_11  ;; 0x42dc0000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_12
//  724   { 
//  725        for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R2,#+0
        B        ??Small_S_13
//  726       {
//  727          if(Road_Remember_SZ[i]<35)
??Small_S_14:
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable5  ;; 0x420c0000
        BL       __aeabi_cfcmple
        BCS      ??Small_S_15
//  728             XS++; 
        ADDS     R3,R3,#+1
//  729          if(Road_Remember_SZ[i]>40)
??Small_S_15:
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable5_1  ;; 0x42200001
        BL       __aeabi_cfrcmple
        BHI      ??Small_S_16
//  730             XS_NO++;
        ADDS     R4,R4,#+1
//  731       }
??Small_S_16:
        ADDS     R2,R2,#+1
??Small_S_13:
        SXTB     R2,R2
        CMP      R2,#+49
        BLT      ??Small_S_14
//  732       if(XS>95)
        CMP      R3,#+96
        BLT      ??Small_S_17
//  733         XS_Flag=1;
        MOVS     R5,#+1
//  734       if(XS_NO>1)
??Small_S_17:
        CMP      R4,#+2
        BLT      ??Small_S_12
//  735         XS_Flag=0;
        MOVS     R5,#+0
//  736   }
//  737   if(XS_Flag==1)  
??Small_S_12:
        CMP      R5,#+1
        BNE      ??Small_S_18
//  738   {
//  739 //     Chazhi=Chazhi/3;
//  740      BUZZER_ON;
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       GpioSet
//  741   }
//  742          
//  743       
//  744       
//  745   }
??Small_S_18:
        ADD      SP,SP,#+404
        POP      {R4,R5,PC}       ;; return

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
//  746 
//  747 
//  748 /*************************************************************************************************************
//  749 检测弯道还是直道
//  750 ******************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  751 void Test_RoadInfo(void) 
//  752 {
Test_RoadInfo:
        PUSH     {R4,LR}
//  753   StraightRoad_Old = StraightRoad;
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  754    
//  755   for(int8_t i = 0;i < P-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
        B        ??Test_RoadInfo_0
//  756   {
//  757       Road_Remember[i] = Road_Remember[i+1];
??Test_RoadInfo_1:
        LDR      R1,??DataTable4_3
        SXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable4_3
        SXTB     R0,R0
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  758   }
        ADDS     R0,R0,#+1
??Test_RoadInfo_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BLT      ??Test_RoadInfo_1
//  759   Road_Remember[P-1] = Chazhi;	//该值为电感检测值-100~100
        LDR      R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
//  760   
//  761   StraightRoad=0;;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_6
        STR      R0,[R1, #+0]
//  762   WindingRoad=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
//  763   WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
        MOVS     R0,#+0
        LDR      R1,??DataTable4_9
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STR      R0,[R1, #+0]
//  764   
//  765 //  for(int8_t i = 0;i < P; i++)
//  766 //  {        
//  767 //    if(Road_Remember[i] > -20 && Road_Remember[i] < 20)	//在-35~35范围内，保证差值与位置的线性关系
//  768 //    {
//  769 //      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
//  770 //    }
//  771 //		
//  772 //    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -20)//100,38
//  773 //   {
//  774 //     WindingRoad_Right++;		//判断弯道稳定性---右转累加
//  775 //   }
//  776 //   else if(Road_Remember[i] >= 20 && Road_Remember[i] <= 300)
//  777 //   {
//  778 //      WindingRoad_Left++;		//判断弯道稳定性---左转累加
//  779 //   }
//  780     
//  781 //  }
//  782   
//  783   for(int8_t i = 0;i < P; i++)
        MOVS     R4,#+0
        B        ??Test_RoadInfo_2
//  784   {        
//  785     if(abs_f(Road_Remember[i])< 15)	//在-35~35范围内，保证差值与位置的线性关系
//  786     {
//  787       WindingRoad--;		//判断直道稳定性，分别列出一百组信号
//  788     }		
//  789     else 
//  790     {
//  791       WindingRoad++;		//判断弯道稳定性---左转累加
//  792     }
//  793    
//  794   StraightRoad_Flag = 0;//直道标志
//  795   WindingRoad_Flag=0;
//  796   WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
//  797   if(WindingRoad <10)
//  798   {
//  799   StraightRoad_Flag = 1;
//  800        WindingRoad_Flag=0;
//  801 
//  802   }
//  803 else
//  804 {
//  805      WindingRoad_Flag=1;
??Test_RoadInfo_3:
        MOVS     R0,#+1
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  806        StraightRoad_Flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
//  807 
//  808   }  
??Test_RoadInfo_4:
        ADDS     R4,R4,#+1
??Test_RoadInfo_2:
        SXTB     R4,R4
        CMP      R4,#+50
        BGE      ??Test_RoadInfo_5
        LDR      R0,??DataTable4_3
        SXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        BL       abs_f
        LDR      R1,??DataTable5_6  ;; 0x41700000
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_6
        LDR      R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_7
??Test_RoadInfo_6:
        LDR      R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_3
        STR      R0,[R1, #+0]
??Test_RoadInfo_7:
        MOVS     R0,#+0
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable5_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE      ??Test_RoadInfo_3
        MOVS     R0,#+1
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_4
//  809 }
//  810 
//  811 }
??Test_RoadInfo_5:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     Chazhi_Chucun

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     Chazhi_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     Chazhi_Rate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     Road_Remember

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     Road_Remember+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     StraightRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     WindingRoad_Left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x42dc0000
//  812 /*************************************************************************************************************
//  813 检测弯道还是直道:利用两个竖直电感
//  814 ******************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  815 void Test_RoadInfo_Shuzhi(void) 
//  816 {
Test_RoadInfo_Shuzhi:
        PUSH     {LR}
        SUB      SP,SP,#+404
//  817   StraightRoad_Old = StraightRoad;
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  818 #define SZ 50
//  819 float Road_Remember_RI[SZ]={0},Road_Remember_LI[SZ]={0}; 
        ADD      R0,SP,#+200
        MOVS     R1,#+200
        BL       __aeabi_memclr4
        MOV      R0,SP
        MOVS     R1,#+200
        BL       __aeabi_memclr4
//  820 
//  821   for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
        B        ??Test_RoadInfo_Shuzhi_0
//  822   {
//  823       Road_Remember_RI[i] = Road_Remember_RI[i+1];
??Test_RoadInfo_Shuzhi_1:
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
//  824   }
        ADDS     R0,R0,#+1
??Test_RoadInfo_Shuzhi_0:
        SXTB     R0,R0
        CMP      R0,#+49
        BLT      ??Test_RoadInfo_Shuzhi_1
//  825   Road_Remember[SZ-1] = AD_inductor[3];	
        LDR      R0,??DataTable5_10
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable5_11
        STR      R0,[R1, #+0]
//  826   
//  827    for(int8_t i = 0;i < SZ-1; i++)   //将所有更新的数据往前移1位
        MOVS     R0,#+0
        B        ??Test_RoadInfo_Shuzhi_2
//  828   {
//  829       Road_Remember_LI[i] = Road_Remember_LI[i+1];
??Test_RoadInfo_Shuzhi_3:
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
//  830   }
        ADDS     R0,R0,#+1
??Test_RoadInfo_Shuzhi_2:
        SXTB     R0,R0
        CMP      R0,#+49
        BLT      ??Test_RoadInfo_Shuzhi_3
//  831   Road_Remember[SZ-1] = AD_inductor[4];	
        LDR      R0,??DataTable5_10
        LDR      R0,[R0, #+16]
        LDR      R1,??DataTable5_11
        STR      R0,[R1, #+0]
//  832   
//  833   StraightRoad=0;;//小车直走次数
        MOVS     R0,#+0
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  834   WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
        MOVS     R0,#+0
        LDR      R1,??DataTable5_12
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_4
        STR      R0,[R1, #+0]
//  835   
//  836   for(int8_t i = 0;i < SZ; i++)
        MOVS     R2,#+0
        B        ??Test_RoadInfo_Shuzhi_4
//  837   {      	
//  838       if(Road_Remember_RI[i]>15&&Road_Remember_LI[i]<1)//100,38
//  839       {
//  840           WindingRoad_Right++;		//判断弯道稳定性---右转累加
//  841       }
//  842       else if(Road_Remember_LI[i] >15 && Road_Remember_RI[i] <1)//100,38
//  843       {
//  844           WindingRoad_Left++;		//判断弯道稳定性---左转累加
//  845       }
//  846       else 
//  847       {
//  848           StraightRoad++; 
??Test_RoadInfo_Shuzhi_5:
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  849       }         
??Test_RoadInfo_Shuzhi_6:
        ADDS     R2,R2,#+1
??Test_RoadInfo_Shuzhi_4:
        SXTB     R2,R2
        CMP      R2,#+50
        BGE      ??Test_RoadInfo_Shuzhi_7
        ADD      R0,SP,#+200
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6  ;; 0x41700001
        BL       __aeabi_cfrcmple
        BHI      ??Test_RoadInfo_Shuzhi_8
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_Shuzhi_8
        LDR      R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_4
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_Shuzhi_6
??Test_RoadInfo_Shuzhi_8:
        MOV      R0,SP
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6  ;; 0x41700001
        BL       __aeabi_cfrcmple
        BHI      ??Test_RoadInfo_Shuzhi_5
        ADD      R0,SP,#+200
        SXTB     R2,R2
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmple
        BCS      ??Test_RoadInfo_Shuzhi_5
        LDR      R0,??DataTable5_12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_12
        STR      R0,[R1, #+0]
        B        ??Test_RoadInfo_Shuzhi_6
//  850   }
//  851   
//  852   StraightRoad_Flag = 0;//直道标志
??Test_RoadInfo_Shuzhi_7:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  853   WindingRoad_Left_Flag = 0;WindingRoad_Right_Flag = 0;//左转,右转标志                 
        MOVS     R0,#+0
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  854   
//  855   if(StraightRoad >= 15)
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+15
        BLT      ??Test_RoadInfo_Shuzhi_9
//  856   {
//  857   StraightRoad_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
//  858   }
//  859   if(WindingRoad_Left >= 5)//50
??Test_RoadInfo_Shuzhi_9:
        LDR      R0,??DataTable5_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??Test_RoadInfo_Shuzhi_10
//  860   {
//  861     WindingRoad_Left_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  862   }
//  863   if(WindingRoad_Right >= 5)
??Test_RoadInfo_Shuzhi_10:
        LDR      R0,??DataTable5_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??Test_RoadInfo_Shuzhi_11
//  864   {
//  865     WindingRoad_Right_Flag = 1;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  866   }       
//  867 }
??Test_RoadInfo_Shuzhi_11:
        ADD      SP,SP,#+404
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x420c0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x42200001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     StraightRoad_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     WindingRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     WindingRoad_Right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     WindingRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x41700000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     WindingRoad_Left_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     WindingRoad_Right_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     StraightRoad

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     Road_Remember+0xC4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
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
//  868 
//  869 
//  870 
//  871 
//  872 
//  873 
//  874 
//  875 
//  876 /*******************确定电感最大最小值**********************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  877 void Inductor_Check(void)
//  878 {
Inductor_Check:
        PUSH     {R7,LR}
//  879   //起始电感值滤波:确定最低电感值
//  880 if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500)
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
//  881     {
//  882       if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&
//  883       AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5)
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
//  884          {
//  885             min_v[0]=AD_valu[0];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  886             min_v[1]=AD_valu[1];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+4]
//  887             min_v[2]=AD_valu[2];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+8]
//  888          }    
//  889     }
//  890 
//  891 if(AD_valu[0]<500&&AD_valu[1]<500&&AD_valu[2]<500&&AD_valu[3]<500&&AD_valu[4]<500)
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
//  892     {
//  893       if(AD_valu[0]-AD_valu[1]<5&&AD_valu[0]-AD_valu[2]<5&&AD_valu[1]-AD_valu[2]<5&&AD_valu[1]-AD_valu[3]<5&&AD_valu[1]-AD_valu[4]<5&&
//  894       AD_valu[0]-AD_valu[1]>-5&&AD_valu[0]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[2]>-5&&AD_valu[1]-AD_valu[3]>-5&&AD_valu[1]-AD_valu[4]>-5)
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
//  895          {
//  896             min_v[0]=AD_valu[0];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  897             min_v[1]=AD_valu[1];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+4]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+4]
//  898             min_v[2]=AD_valu[2];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+8]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+8]
//  899             min_v[3]=AD_valu[3];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+12]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+12]
//  900             min_v[4]=AD_valu[4];
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+16]
        BL       __aeabi_i2f
        LDR      R1,??DataTable6_3
        STR      R0,[R1, #+16]
//  901          }    
//  902     }
//  903 
//  904   for(int i=0;i<5;i++)
??Inductor_Check_1:
        MOVS     R2,#+0
        B        ??Inductor_Check_2
//  905   {
//  906      if( min_v[i]>499)
??Inductor_Check_3:
        LDR      R0,??DataTable6_3
        MOVS     R1,#+4
        MULS     R1,R2,R1
        LDR      R0,[R0, R1]
        LDR      R1,??DataTable6_4  ;; 0x43f98001
        BL       __aeabi_cfrcmple
        BHI      ??Inductor_Check_4
//  907          min_v[i]=499;
        LDR      R0,??DataTable6_5  ;; 0x43f98000
        LDR      R1,??DataTable6_3
        MOVS     R3,#+4
        MULS     R3,R2,R3
        STR      R0,[R1, R3]
//  908   }
??Inductor_Check_4:
        ADDS     R2,R2,#+1
??Inductor_Check_2:
        CMP      R2,#+5
        BLT      ??Inductor_Check_3
//  909 //电感最大值确定：防止实际最大电感值偏大
//  910 if(Circle_Flag==0)
        LDR      R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
//  911   {
//  912      if(AD_inductor[1]<90)
//  913      {
//  914 //        if(AD_valu[0]>max_v[0]) max_v[0]=AD_valu[0];//避免差值变大
//  915 //        if(AD_valu[2]>max_v[2]) max_v[2]=AD_valu[2];
//  916 //        if(AD_valu[3]>max_v[3]) max_v[3]=AD_valu[3];
//  917 //        if(AD_valu[4]>max_v[4]) max_v[4]=AD_valu[4];
//  918      }
//  919   }
//  920 }
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
//  921 //电感最小值确定：防止实际最大电感值偏小？没想出来
//  922 
//  923 
//  924 ///取绝对值

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  925 uint16 abs_i(int value)
//  926 {
abs_i:
        PUSH     {LR}
//  927     if(value<0)
        CMP      R0,#+0
        BPL      ??abs_i_0
//  928       value=-value;
        RSBS     R1,R0,#+0
        MOVS     R0,R1
//  929     return value;
??abs_i_0:
        UXTH     R0,R0
        POP      {PC}             ;; return
//  930 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  931 
//  932 
//  933 
//  934 /************************************************************************************************************************************************************************************************************************************
//  935 检测弯道还是直道
//  936 5.6、 弯道策略
//  937 电科：电磁组前瞻较小， S 道处理较困难， S 道的处理的好坏对整体速度有较大
//  938 的影响。 处理方法如下：初始化一个容量为 50 的数组，记录每次的弯曲度，动
//  939 态更新数组。然后对 50 个数据求绝对值和和代数和,如果代数和绝对值很小，
//  940 则车在直道，如果代数和和绝对值和较小，但是前 20 个数据较大，则可以判定
//  941 小车在出弯，如果代数和和绝对值和较小，后 20 较大，则判定小车在入弯，如
//  942 果代数和很小，但绝对值和很大，则在 s 弯道。经过调试， 虽然有一点滞后性，
//  943 还可以继续完善。但是这个算法可以非常好的处理弯道。
//  944 
//  945 北科：对过弯速度的处理方式确定为：
//  946 入弯时急减速，以得到足够的调整时间，获得正确的转向角度；在弯道内适当
//  947 提速，并保持角度不变，为出弯时的加速节约时间；出弯时，先准确判断标志，
//  948 然后加速，虽然会耗费一些时间，但是面对连续变向弯道可以减少判断出错的
//  949 概率，保证行驶状态的稳定性，而且弯道内的有限加速对后面的提速也有很大
//  950 的帮助。综合考虑用可以接收的额外时间换回行驶稳定性还是值得的
//  951 ******************************************************************************************************************************/
//  952 /*void Small_S(void)
//  953 {
//  954 int Chazhi_i=0;
//  955 float Chazhi_wandao[50]={0};
//  956  float    Chazhi_he=0,Chazhi_he_before=0,Chazhi_he_after=0,
//  957      Chazhi_abs=0,     
//  958      Chazhi_he_before_flag = 0,
//  959      Chazhi_he_after_flag  = 0,
//  960      Chazhi_he_flag        = 0,
//  961      Chazhi_abs_flag       =0;
//  962 
//  963       for(Chazhi_i = 0;Chazhi_i < 50; Chazhi_i++)   //将所有更新的数据往前移1位
//  964   {
//  965       Chazhi_wandao[Chazhi_i] = Chazhi_wandao[Chazhi_i+1];
//  966   }
//  967   Road_Remember[49] = Chazhi;	//该值为电感检测值-100~100
//  968      
//  969 //     Chazhi_i++;
//  970 //  Chazhi_wandao[Chazhi_i] = Chazhi;
//  971 //  if(Chazhi_i >= 50)
//  972 //  {
//  973 //    Chazhi_i = 0;
//  974   
//  975     for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//  976     {   
//  977 //取50个的电感值的代数和
//  978       Chazhi_he += Chazhi_wandao[Chazhi_j];
//  979 //取前20的值,
//  980       if(Chazhi_j == 20)
//  981       Chazhi_he_before = Chazhi_he;
//  982 //取后20的值,最新值
//  983       if(Chazhi_j >=31&&Chazhi_j <= 50)
//  984         Chazhi_he_after  += Chazhi_wandao[Chazhi_j];
//  985     }
//  986 
//  987 //取50个电感值的绝对值和
//  988     for (int Chazhi_j = 1;Chazhi_j <= 50;Chazhi_j++)
//  989     { Chazhi_abs  += abs_f(Chazhi_wandao[Chazhi_j]);}
//  990   }
//  991   
//  992 //  Chazhi_he_before_flag = Chazhi_he_before;
//  993 //  Chazhi_he_after_flag  = Chazhi_he_after;
//  994 //  Chazhi_he_flag        = Chazhi_he;
//  995 //  Chazhi_abs_flag       = Chazhi_abs;
//  996 //  
//  997 //
//  998 //  Chazhi_he_before = 0;
//  999 //  Chazhi_he_after  = 0;
// 1000 //  Chazhi_he        = 0;
// 1001 //  Chazhi_abs       = 0;
// 1002 
// 1003 */
// 1004 //void Test_RoadInfo2(void) 
// 1005 //{
// 1006 //  StraightRoad_Old = StraightRoad;
// 1007 //   
// 1008 //  for(int8_t i = 0;i <M-1; i++)   //将所有更新的数据往前移1位
// 1009 //  {
// 1010 //      Road_Remember2[i] = Road_Remember[i+1];
// 1011 //  }
// 1012 //  Road_Remember2[M-1] = Chazhi;	//该值为电感检测值-100~100
// 1013 //  
// 1014 //  for(int8_t i = 0;i<20;i++)  
// 1015 //  {
// 1016 //      Abs_old_Chazhi+= abs_f(Road_Remember2[i]);
// 1017 //      Alg_old_Chazhi+=Road_Remember2[i];
// 1018 //  }
// 1019 //  for(int8_t i = 30;i<M;i++)  
// 1020 //  {
// 1021 //      Abs_new_Chazhi+= abs_f(Road_Remember2[i]);
// 1022 //      Alg_new_Chazhi+=Road_Remember2[i];
// 1023 //  }
// 1024 //   for(int8_t i = 20;i<30;i++)  
// 1025 //  {
// 1026 //      Abs_sum_Chazhi+= abs_f(Road_Remember2[i]);
// 1027 //      Alg_sum_Chazhi+=Road_Remember2[i];
// 1028 //  }
// 1029 //  
// 1030 //  Abs_sum_Chazhi+=Abs_new_Chazhi+Abs_old_Chazhi;
// 1031 //  Alg_sum_Chazhi+=Alg_new_Chazhi+Alg_old_Chazhi;
// 1032 //  
// 1033 //  Chazhi_Acc_Zhi=250,//50*5
// 1034 //  Chazhi_Acc_Wan=400,//20*20
// 1035 //
// 1036 //  if(Abs_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi<Chazhi_Acc_Zhi&&Alg_sum_Chazhi>-Chazhi_Acc_Zhi)
// 1037 //  {
// 1038 //       StraightRoad_Flag = 1;
// 1039 //  }
// 1040 //  
// 1041 //   if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi>Chazhi_Acc_Wan)
// 1042 //  {
// 1043 //      WindingRoad_Left_Flag = 1;
// 1044 //  } 
// 1045 //  if(Abs_new_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
// 1046 //  {
// 1047 //      WindingRoad_Right_Flag = 1;
// 1048 //  }
// 1049 //  
// 1050 //  if(Abs_old_Chazhi<Chazhi_Acc_Wan&&Alg_old_Chazhi>Chazhi_Acc_Wan&&Alg_new_Chazhi<-Chazhi_Acc_Wan)
// 1051 //  {
// 1052 //      WindingRoad_Left_Flag = 1;
// 1053 //  }
// 1054 
// 1055 //  
// 1056 ////  StraightRoad=0;;//小车直走次数
// 1057 ////  WindingRoad_Left = 0;WindingRoad_Right = 0;//小车左转,右转次数
// 1058 //  
// 1059 //  for(int8_t i = 0;i < 100; i++)
// 1060 //  {        
// 1061 //    if(Road_Remember[i] > -40 && Road_Remember[i] < 40)	//在-35~35范围内，保证差值与位置的线性关系
// 1062 //    {
// 1063 //      StraightRoad++;		//判断直道稳定性，分别列出一百组信号
// 1064 //    }
// 1065 // //else if(g_AD_Remember[i] > -45 && g_AD_Remember[i] < 45)				//在-35~35范围内，保证Mid_AD_value与位置的线性关系
// 1066 // //{
// 1067 // //  StraightRoad2++;		//判断直道稳定性，分别列出一百组信号
// 1068 // //}		
// 1069 //    else if(Road_Remember[i] >= -300 && Road_Remember[i] <= -40)//100,38
// 1070 //   {
// 1071 //     WindingRoad_Right++;		//判断弯道稳定性---右转累加
// 1072 //   }
// 1073 //   else if(Road_Remember[i] >= 40 && Road_Remember[i] <= 300)
// 1074 //   {
// 1075 //      WindingRoad_Left++;		//判断弯道稳定性---左转累加
// 1076 //   }
// 1077 //    
// 1078 //  }
// 1079 //  StraightRoad_Flag = 0;//直道标志
// 1080 //  WindingRoad_Left_Flag = 0,WindingRoad_Right_Flag = 0;//左转,右转标志                 
// 1081 //  if(StraightRoad >= 95)
// 1082 //  {
// 1083 //  StraightRoad_Flag = 1;
// 1084 //  }
// 1085 //  if(WindingRoad_Left >= 5)//50
// 1086 //  {
// 1087 //    WindingRoad_Left_Flag = 1;
// 1088 //  }
// 1089 //  if(WindingRoad_Right >= 5)
// 1090 //  {
// 1091 //    WindingRoad_Right_Flag = 1;
// 1092 //  }       
// 1093 //}
// 1094 //void Test_Huandao()
// 1095 //{
// 1096 ////  状态      右     中     左   右竖  左竖 
// 1097 ////  最大      2000  1600   2000  2000  2000
// 1098 ////                               400(13)   400(13)    
// 1099 ////  正常      825   1600   825   170(10)   170(10)
// 1100 ////  环岛两 个环切线滤波
// 1101 ////  if(AD_inductor[0]>45&&AD_inductor[1]>80&&AD_inductor[2]>45)//中
// 1102 ////    Chazhi=Chazhi/10;
// 1103 ////  if(AD_inductor[1]>75&&(AD_inductor[0]>75||AD_inductor[2]>75))//电磁线在俩电感之间时不行
// 1104 ////    Chazhi=Chazhi/10; 
// 1105 ////   if(Circle_Flag>0)
// 1106 ////   {
// 1107 ////      if(AD_inductor[1]>105&&AD_inductor[1]<Circle_inductor_Max)//识别进入到环岛双线之前之后
// 1108 ////         {
// 1109 //////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
// 1110 //////       Chazhi=0; 
// 1111 ////           if(AD_inductor[3]>AD_inductor[4]) //100       
// 1112 ////              Circle_R_Count++; 
// 1113 ////           if(AD_inductor[4]>AD_inductor[3]) //100       
// 1114 ////              Circle_L_Count++;    
// 1115 ////    }
// 1116 ////   }  
// 1117 //                     //100
// 1118 ////    if(AD_inductor[1]>120&&AD_inductor[1]<Circle_inductor_Mid2)//识别进入到环岛双线之前之后
// 1119 ////    {
// 1120 //////       Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
// 1121 //////       Chazhi=0; 
// 1122 ////       if(AD_inductor[0]>90) //100       
// 1123 ////         Circle_R_Count++; 
// 1124 ////       if(AD_inductor[2]>90)  //100      
// 1125 ////         Circle_L_Count++;    
// 1126 ////    }
// 1127 ////    
// 1128 ////     if(AD_inductor[0]>70&&AD_inductor[1]>90&&AD_inductor[2]>70||
// 1129 ////        AD_inductor[1]>85&&(AD_inductor[0]>80||AD_inductor[2]>80))//中
// 1130 //  //2000,100;2500,125;3000,150;3500,175
// 1131 //  if(Circle_Flag==0)//处于检测圆环双线状态
// 1132 //  {
// 1133 //    
// 1134 ////       if(AD_inductor[1]>130&&AD_inductor[1]<170)
// 1135 ////          {
// 1136 //////            if(AD_inductor[0]>AD_inductor[2]+30) //100       
// 1137 //////              Circle_R_Count++; 
// 1138 //////             if(AD_inductor[2]>AD_inductor[0]+30) //100       
// 1139 //////              Circle_L_Count++; 
// 1140 //////          
// 1141 ////          }
// 1142 //    
// 1143 //    
// 1144 //      if(AD_inductor[1]>Circle_Inductor_value1)
// 1145 //      {
// 1146 //              Circle_Count++;//环岛双线计数   
// 1147 //              if(Circle_Count>Circle_Count_Max)
// 1148 //              {
// 1149 //                  Circle_Flag=1; //进入环岛双线
// 1150 //                  Circle_Count=0;
// 1151 //              }
// 1152 //      }
// 1153 //  }
// 1154 //  
// 1155 //  
// 1156 //  if(Circle_Flag==1)//检测到圆环双线，进入到检测离开圆环双线
// 1157 //  {
// 1158 //        if(AD_inductor[1]<Circle_Inductor_value2)      
// 1159 //                Circle_Count2++;//离开环岛双线计数
// 1160 //        
// 1161 //         if(AD_inductor[3]>AD_inductor_Shuzhi_Max&&AD_inductor[4]<AD_inductor_Shuzhi_Min) //100       
// 1162 //          Circle_R_Count++; 
// 1163 //         if(AD_inductor[4]>AD_inductor_Shuzhi_Max&&AD_inductor[3]<AD_inductor_Shuzhi_Min) //100       
// 1164 //          Circle_L_Count++; 
// 1165 //         
// 1166 // //会出现提前转弯，与滞后转弯后强制出环转冲突，导致提前转弯一直旋转        
// 1167 ////      if(Circle_L_Count>Circle_Turn_Count||Circle_R_Count>Circle_Turn_Count)//转弯计数达到上限，进入转弯时刻
// 1168 ////         Circle_Flag=3;//转弯识别结束该转弯了
// 1169 //         
// 1170 //         
// 1171 //         
// 1172 //         
// 1173 //        if(Circle_Count2>Circle_Count2_Max)
// 1174 //
// 1175 //        {
// 1176 //             Circle_Flag=2; //离开环岛双线标志
// 1177 //             Circle_Count2=0;
// 1178 //        }
// 1179 //
// 1180 //  }
// 1181 //
// 1182 //   if(Circle_Flag==2)//已经检测到离开圆环双线，开始转弯计数
// 1183 //   {
// 1184 //       if(AD_inductor[3]>AD_inductor[4]) //100       
// 1185 //          Circle_R_Count++; 
// 1186 //       if(AD_inductor[4]>AD_inductor[3]) //100       
// 1187 //          Circle_L_Count++;
// 1188 ////       if(AD_inductor[0]>AD_inductor[2]) //100       
// 1189 ////          Circle_R_Count++; 
// 1190 ////       if(AD_inductor[2]>AD_inductor[0]) //100       
// 1191 ////          Circle_L_Count++; 
// 1192 ////   
// 1193 //       
// 1194 //    //同上解释，可通过计算速度时间路程来使用
// 1195 ////       if(Circle_L_Count>Circle_Turn_Count2||Circle_R_Count>Circle_Turn_Count2)//转弯计数达到上限，进入转弯时刻
// 1196 ////                    Circle_Flag=3;//转弯识别结束该转弯了
// 1197 //
// 1198 //       if(AD_inductor[1]<Circle_Inductor_value3)//150
// 1199 //        {
// 1200 //////          Circle_Count3++;//圆环转弯计数，累加为了避免遇到误判，环岛双线提前结束
// 1201 //////          if(Circle_Count3>Circle_Count3_Max)
// 1202 //////          {
// 1203 //////          Circle_Count3=0;
// 1204 //             Circle_Flag=3;//转弯识别结束该转弯了
// 1205 //////          }
// 1206 //        }
// 1207 //   }
// 1208 //   
// 1209 //   if(Circle_Flag==3)//开始转弯
// 1210 //   {      
// 1211 //      if(Circle_Error_Flag==0)//防止左/右转后因为电感值变反而引发右/左转，
// 1212 //      {
// 1213 //         if(Circle_L_Count>Circle_R_Count)
// 1214 //         {
// 1215 //          Circle_L_Count=0;
// 1216 //          Circle_R_Count=0;
// 1217 //          
// 1218 //           Circle_L_Flag=1;
// 1219 //           
// 1220 //           Circle_Turn_Old_Flag=2;
// 1221 //           
// 1222 //           Circle_Error_Flag=2;
// 1223 //         }
// 1224 //         else
// 1225 //         {
// 1226 //            Circle_L_Count=0;
// 1227 //            Circle_R_Count=0;
// 1228 //          
// 1229 //            Circle_R_Flag=1;
// 1230 //            
// 1231 //             Circle_Turn_Old_Flag=1;
// 1232 //            
// 1233 //            Circle_Error_Flag=1;
// 1234 //         }           
// 1235 //      }
// 1236 //   }
// 1237 //
// 1238 //
// 1239 //      if(Circle_L_Flag==1)
// 1240 //      {
// 1241 //          Chazhi = 43.5;
// 1242 //          
// 1243 //          Circle_L_Finish_Count++;
// 1244 //          LED_2_ON;
// 1245 //          BUZZER_ON;
// 1246 //      }
// 1247 //      if(Circle_R_Flag==1)
// 1248 //      {
// 1249 //           Chazhi =-43.5;//47=70度,43.5=65
// 1250 //           Circle_R_Finish_Count++;      
// 1251 //           LED_1_ON;
// 1252 //                     BUZZER_ON;
// 1253 //
// 1254 //      }
// 1255 //    
// 1256 //
// 1257 //    if(Circle_L_Finish_Count>Circle_Finish_Count_Max||Circle_R_Finish_Count>Circle_Finish_Count_Max)//圆环转弯结束
// 1258 //    {
// 1259 //      Circle_Count=0;
// 1260 //      Circle_Count2=0;
// 1261 //      Circle_L_Finish_Count=0;
// 1262 //      Circle_R_Finish_Count=0;
// 1263 //      Circle_L_Count=0;
// 1264 //      Circle_R_Count=0;
// 1265 //      
// 1266 //      Circle_L_Flag=0;
// 1267 //      Circle_R_Flag=0;
// 1268 //     Circle_Flag=4;
// 1269 //                          BUZZER_OFF;
// 1270 //     Circle_Count_Out_Flag=1;//避免强制转弯迟,造成进环后反方向出赛道
// 1271 //
// 1272 //    }
// 1273 //  
// 1274 // /*仅用电感150左右转弯，还会出现帅的提前转弯反转，故屏蔽
// 1275 //  基本不会出现太滞后转弯,所以屏蔽，一旦出现提前转弯，和太滞后转弯的强制差值一样，导致一直在内旋转
// 1276 //  
// 1277 //  */ 
// 1278 ////    if(Circle_Count_Out_Flag==1)
// 1279 ////    {
// 1280 ////        Circle_Count_Out++;
// 1281 ////        if(Circle_Count_Out>Circle_Count_Out_Max)
// 1282 ////        {
// 1283 ////            Circle_Count_Out=0;
// 1284 ////            Circle_Count_Out_Flag=0;
// 1285 ////        }
// 1286 ////        
// 1287 ////        if(Circle_Turn_Old_Flag==2)//左转进弯
// 1288 ////        {
// 1289 ////           if(Chazhi)
// 1290 ////           if(Chazhi<-40)
// 1291 ////            Chazhi=-Chazhi;     
// 1292 ////         }
// 1293 ////      
// 1294 ////         if(Circle_Turn_Old_Flag==1)//右转进弯
// 1295 ////         {
// 1296 ////             
// 1297 ////            if(Chazhi>50)
// 1298 ////               Circle_Count_Out__Wai_Flag=1;
// 1299 ////            if(Chazhi>50)
// 1300 ////               Circle_Count_Out__Wai_Flag=1;             
// 1301 ////         if(Chazhi>40)
// 1302 ////            Chazhi=-Chazhi;     
// 1303 ////         }
// 1304 ////      
// 1305 ////     }
// 1306 //  
// 1307 //  
// 1308 //    if(Circle_Flag==4)//圆环强制转弯结束,进入圆环行驶检测
// 1309 //   {
// 1310 //        if(AD_inductor[1]<Circle_Inductor_value4)
// 1311 //      {
// 1312 //              Circle_Count4++;//环岛双线计数   
// 1313 //              if(Circle_Count4>Circle_Count4_Max)
// 1314 //              {
// 1315 //                  Circle_Flag=5; //出环岛双线标志
// 1316 //                  Circle_Count4=0;
// 1317 //              }
// 1318 //      }
// 1319 //   }
// 1320 //     
// 1321 //  
// 1322 //   if(Circle_Flag==5)//圆环正规行驶结束束,进入检测出圆环双线
// 1323 //   {
// 1324 //        if(AD_inductor[1]>Circle_Inductor_value5)
// 1325 //      {
// 1326 //              Circle_Count5++;//环岛双线计数   
// 1327 //              if(Circle_Count5>Circle_Count5_Max)
// 1328 //              {
// 1329 //                  Circle_Flag=6; //出环岛双线标志
// 1330 //                  Circle_Count5=0;
// 1331 //              }
// 1332 //      }
// 1333 //   }
// 1334 //     
// 1335 // 
// 1336 ////   if(Circle_Flag==6)//标志6暂定时间3s
// 1337 ////   {
// 1338 ////     
// 1339 //////     if(AD_inductor[1]>?)
// 1340 ////     if(AD_inductor[1]>100)
// 1341 ////     {
// 1342 //////     if(AD_inductor[2]>?)
// 1343 ////     
// 1344 ////     Circle_Turn_Again_Counter++;
// 1345 ////     if(Circle_Turn_Again_Counter>Circle_Turn_Again_Counter_Max)
// 1346 ////     {
// 1347 ////        Circle_Turn_Again_Prevent_Flag=0;
// 1348 ////     }
// 1349 ////     else
// 1350 ////     {
// 1351 ////       Circle_Turn_Again_Prevent_Flag=1;
// 1352 ////     }
// 1353 ////     
// 1354 ////     if(Circle_Turn_Again_Prevent_Flag==1)
// 1355 ////     {
// 1356 ////         if(Circle_Turn_Old_Flag==2)//左转进弯预防差值60
// 1357 ////         {
// 1358 ////           if(Chazhi>30)
// 1359 ////            Chazhi=-Chazhi/2;     
// 1360 ////         }
// 1361 ////      
// 1362 ////        if(Circle_Turn_Old_Flag==1)//右转进弯预防差值-60
// 1363 ////        {
// 1364 ////            if(Chazhi<-30)
// 1365 ////            Chazhi=-Chazhi/2;     
// 1366 ////        }
// 1367 ////     }
// 1368 ////   }
// 1369 ////   }
// 1370 //  
// 1371 //  
// 1372 //
// 1373 //  if(Circle_Flag==6)
// 1374 //  {
// 1375 //      if(AD_inductor[1]<Circle_Inductor_value6)
// 1376 //      {
// 1377 //        Circle_Count6++;
// 1378 //        if(Circle_Count6>Circle_Count6_Max)
// 1379 //        {
// 1380 //        Circle_Flag=0;
// 1381 //        Circle_Error_Flag=0;//转弯误判解除
// 1382 //        }
// 1383 //      }
// 1384 //  }
// 1385 //
// 1386 ////   if(Circle_Error_Flag==1||Circle_Error_Flag==2)//防止误判计数
// 1387 ////      {
// 1388 ////         Circle_Error_Count++;
// 1389 ////         if(Circle_Error_Count>Circle_Error_Count_Max)
// 1390 ////         {
// 1391 ////            Circle_Error_Flag=0;//转弯误判解除
// 1392 ////            Circle_Error_Count=0;
// 1393 //////                 Circle_Flag=0;
// 1394 ////         }      
// 1395 ////      }   
// 1396 //
// 1397 //}
// 1398 //
// 1399 //
// 1400 //
// 
//   912 bytes in section .bss
//   193 bytes in section .data
//   800 bytes in section .rodata
// 3 690 bytes in section .text
// 
// 3 690 bytes of CODE  memory
//   800 bytes of CONST memory
// 1 105 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
