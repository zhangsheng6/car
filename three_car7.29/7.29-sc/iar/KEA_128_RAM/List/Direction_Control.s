///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Direction_Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Direction_Control.c -D
//        IAR -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\Direction_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Chazhi
        EXTERN Chazhi_Rate
        EXTERN Speed_Error_L
        EXTERN Speed_Error_R
        EXTERN StraightRoad_Flag
        EXTERN WindingRoad_Flag
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN abs_f
        EXTERN gyr_angle_speed
        EXTERN speed_L
        EXTERN speed_R
        EXTERN speed_buzzer
        EXTERN speed_car
        EXTERN speed_set_L
        EXTERN speed_set_R
        EXTERN speed_set_temp
        EXTERN speed_set_temp_L
        EXTERN speed_set_temp_R
        EXTERN tan

        PUBLIC Accum_Error_L
        PUBLIC Accum_Error_R
        PUBLIC Angle_D
        PUBLIC Angle_D_Chazhi
        PUBLIC Angle_D_Speed
        PUBLIC Angle_D_Temp
        PUBLIC Angle_P
        PUBLIC Angle_P_Temp
        PUBLIC Angle_P_choose
        PUBLIC Angle_Weight
        PUBLIC `B`
        PUBLIC BangBang
        PUBLIC Chasu_Bili
        PUBLIC Chasu_Bili_Temp
        PUBLIC Chazhi_Bili
        PUBLIC Chazhi_Bili_Temp
        PUBLIC Chazhi_Error_L
        PUBLIC Chazhi_Error_R
        PUBLIC Chazhi_Temp
        PUBLIC Chazhi_limit
        PUBLIC Chazhi_point
        PUBLIC Control_Output_L
        PUBLIC Control_Output_R
        PUBLIC Controler
        PUBLIC D_Direction
        PUBLIC D_Direction1
        PUBLIC D_Direction2
        PUBLIC D_Direction3
        PUBLIC Direction_ChaSpeed_Control
        PUBLIC Direction_Control
        PUBLIC Direction_Control_Err
        PUBLIC Direction_Control_Last
        PUBLIC Direction_Control_Output_L
        PUBLIC Direction_Control_Output_R
        PUBLIC Direction_Control_Period
        PUBLIC Direction_Controler
        PUBLIC Direction_D
        PUBLIC Direction_D2
        PUBLIC Direction_I
        PUBLIC Direction_I2
        PUBLIC Direction_P
        PUBLIC Direction_P2
        PUBLIC Direction_P2_Chazhi
        PUBLIC Direction_P2_Speed
        PUBLIC Direction_P2_Temp
        PUBLIC Direction_P_Temp
        PUBLIC Direction_Weight
        PUBLIC Direction_angle
        PUBLIC L
        PUBLIC P_Dir_agl
        PUBLIC P_Direction
        PUBLIC P_Direction1
        PUBLIC P_Direction2
        PUBLIC P_Direction3
        PUBLIC P_Direction_high
        PUBLIC P_Direction_low
        PUBLIC Piaoyi_L
        PUBLIC Piaoyi_R
        PUBLIC Road_Err_D
        PUBLIC Speed_Bili
        PUBLIC Speed_Bili_Temp
        PUBLIC Speed_D
        PUBLIC Speed_I
        PUBLIC Speed_I_D_Temp
        PUBLIC Speed_I_lntegral_L
        PUBLIC Speed_I_lntegral_Max
        PUBLIC Speed_I_lntegral_R
        PUBLIC Speed_P
        PUBLIC Speed_PWM
        PUBLIC Sum_Error_L
        PUBLIC Sum_Error_R
        PUBLIC X
        PUBLIC angle
        PUBLIC angle_2
        PUBLIC angle_P
        PUBLIC angle_limit
        PUBLIC angle_limit_2
        PUBLIC change_bili_F
        PUBLIC change_bili_Z
        PUBLIC change_factor
        PUBLIC change_value
        PUBLIC change_variable
        PUBLIC k
        PUBLIC k3
        PUBLIC k4
        PUBLIC speed_dead_F
        PUBLIC speed_point
        PUBLIC speed_set
        PUBLIC speed_temp1
        PUBLIC speed_temp2
        PUBLIC t
        PUBLIC turn_spd

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Direction_Control.c
//    1 #include "Direction_Control.h"
//    2 #include "math.h"
//    3 #include "BL.h"
//    4 
//    5 
//    6 /*****************************阿克曼角参数2************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 float k=0;float k3=0.0,k4=0.0;float B=15.5,L=15;float angle,angle_2;float  speed_temp2=0,speed_temp1=-20;
k:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
`B`:
        DATA
        DC32 41780000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
L:
        DATA
        DC32 41700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_temp2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_temp1:
        DATA
        DC32 0C1A00000H
//    8 /*-----------方向环2---------------------------------------------------------------*/
//    9 #define N 3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10  float Speed_I_D_Temp=0,X=20;float Accum_Error_L[N]={0};float Accum_Error_R[N]={0};float Chazhi_Error_L[N]={0};float Chazhi_Error_R[N]={0};float Sum_Error_L=0,Sum_Error_R=0;float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;float Speed_I_lntegral_Max = 9000;float Direction_Control_Output_L = 0.0;float Direction_Control_Output_R = 0.0,Control_Output_L=0,Control_Output_R=0;uint8 Piaoyi_L=0,Piaoyi_R=0;
Speed_I_D_Temp:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
X:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Accum_Error_L:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Accum_Error_R:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Chazhi_Error_L:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Chazhi_Error_R:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Sum_Error_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Sum_Error_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_lntegral_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_lntegral_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_I_lntegral_Max:
        DATA
        DC32 460CA000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Output_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Output_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Control_Output_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Control_Output_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Piaoyi_L:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Piaoyi_R:
        DS8 1
//   11 /*--------------------------------------------------------------------------*/
//   12 /********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float Chazhi_point=45;
Chazhi_point:
        DATA
        DC32 42340000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   14 float  Angle_Weight=0.5,Direction_Weight=0.5;
Angle_Weight:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Direction_Weight:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 float Chazhi_limit=75;float Chasu_Bili=1,Chasu_Bili_Temp=1, Speed_Bili=1,Chazhi_Bili=1,Chazhi_Bili_Temp=1,Speed_Bili_Temp=1,Chazhi_Temp=0;double angle_limit=60,angle_limit_2=60;float change_bili_F=1,change_bili_Z=1;float speed_dead_F=-0;int change_value=10;int change_factor=0; int change_variable=0;                                                                float Angle_P_choose;int   angle_P=60;
Chazhi_limit:
        DATA
        DC32 42960000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chasu_Bili:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chasu_Bili_Temp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_Bili:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Bili:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Bili_Temp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Speed_Bili_Temp:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Chazhi_Temp:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(3)
angle_limit:
        DATA
        DC32 0H, 404E0000H

        SECTION `.data`:DATA:REORDER:NOROOT(3)
angle_limit_2:
        DATA
        DC32 0H, 404E0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
change_bili_F:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
change_bili_Z:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_dead_F:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
change_value:
        DATA
        DC32 10

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
change_factor:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
change_variable:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_P_choose:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
angle_P:
        DATA
        DC32 60

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float Direction_P2_Temp=0,Direction_P2_Speed=0,Direction_P2_Chazhi=0;int t=0;
Direction_P2_Temp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_P2_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_P2_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 float Angle_P_Temp=0,Angle_D_Speed=0,Angle_D_Chazhi=0;
Angle_P_Temp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float speed_point=0; float Direction_P_Temp=0;  
speed_point:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_P_Temp:
        DS8 4
//   19 
//   20 
//   21 //验证tuoluoyi正负
//   22 //1目前调节动态P,陀螺仪PD,直道弯道速度不一样
//   23 //2降低速度设定，改参数，全程速度差不多，在渐渐提高速度设定，在速度达到最后极限，在采取直道速度比玩到速度大
//   24 //让全程速度差不多，弯道速度设定大于直道
//   25 //速度  P    P2   D2     AP
//   26 //100  600  600  -1000   100好轮胎
//   27 //100  1000  600  -1000  100差轮胎
//   28 /************************常用调参变量**************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 float  speed_set  = 80,//改5ms 
speed_set:
        DATA
        DC32 42A00000H
//   30 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31     Direction_P=100,        Direction_D=0,          Direction_I=0,          //阿克曼角位置式方向+速度环
Direction_P:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_I:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   32     Direction_P2=700,     Direction_D2=-1000,         Direction_I2=0.0,                 //差值位置式 
Direction_P2:
        DATA
        DC32 442F0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Direction_D2:
        DATA
        DC32 0C47A0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_I2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   33     Angle_P=100,          Angle_D=0,                  Angle_D_Temp,//陀螺仪
Angle_P:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D_Temp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34                                                    Speed_P=0,          Speed_I=0,                 Speed_D=0.00;//速度还增量式
Speed_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_D:
        DS8 4
//   35 /************************常用调参变量**************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void Direction_Controler(void)//2.71828
//   37 {
Direction_Controler:
        PUSH     {R3-R7,LR}
//   38  float speed_error2=0;
        MOVS     R0,#+0
//   39   float K1=0,K2=0,K3=0,K4=10;
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOVS     R0,#+0
        LDR      R0,??DataTable0  ;; 0x41200000
//   40   float Son_DP=0,Son_AP=0,Son_AD=0,Son_AD_Max=100,jsd=0;
        MOVS     R7,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        LDR      R0,??DataTable0_1  ;; 0x42c80000
        MOVS     R5,#+0
//   41   float Son_DP2=0,Son_AP2=0;
        MOVS     R0,#+0
        MOVS     R5,#+0
//   42   float Chazhi_Mid=50,Chazhi_Error=0;
        LDR      R6,??DataTable0_2  ;; 0x42480000
        MOVS     R0,#+0
//   43 //车速小， 正值；车速大，负值 
//   44 speed_error2=speed_buzzer+0-speed_car;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
//   45 //差值大，偏差正
//   46 Chazhi_Error=abs_f(Chazhi)-Chazhi_Mid;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R1,R6
        BL       __aeabi_fsub
//   47 Chazhi_Error/=Chazhi_Mid;
        MOVS     R1,R6
        BL       __aeabi_fdiv
//   48 ///--------------------------------------------
//   49 
//   50 //  K1=0;
//   51 //Son_DP=-1*speed_error2*K1;
//   52 
//   53 //K2=0;
//   54 //Son_AP=-1*speed_error2*K2;
//   55 ////
//   56 ////if(Chazhi_Error>0)
//   57 ////{
//   58 //if(Son_AP<-100)
//   59 //      Son_AP=-100;
//   60    
//   61 //}
//   62 //   if(Son_DP<-100)
//   63 //      Son_DP=-100;
//   64 
//   65 //
//   66 //K4=10;
//   67 //Son_AP2=Chazhi_Error*K4;
//   68 
//   69 //Son_DP=0;
//   70 //Son_AP=0;
//   71 //if(Son_DP<-1*Direction_P2/2)    Son_DP=-1*Direction_P2/2;
//   72 //if(Son_DP<0)    Son_DP=0;
//   73 //if(Son_AP<-50)    Son_AP=-50;
//   74 //if(Son_AP>100)    Son_AP=100; 
//   75 
//   76 Direction_P2_Temp=Direction_P2+Son_DP;
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   77 
//   78 //--------------------------------------------
//   79 if(abs_f(Chazhi)<20)
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_8  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_0
//   80 { 
//   81 Angle_P_Temp=0+Son_AP+Son_AP2;
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_1
//   82 }
//   83 else if(abs_f(Chazhi)<40)//20-40
??Direction_Controler_0:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_10  ;; 0x42200000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_2
//   84 { 
//   85 Angle_P_Temp=Angle_P/4+Son_AP+Son_AP2;
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        MOVS     R1,#+129
        LSLS     R1,R1,#+23       ;; #+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_1
//   86 }else if(abs_f(Chazhi)<50)//40-50
??Direction_Controler_2:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_2  ;; 0x42480000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_3
//   87 { 
//   88 Angle_P_Temp=Angle_P/2+Son_AP+Son_AP2;
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_1
//   89 }
//   90 else 
//   91 {
//   92 Angle_P_Temp=Angle_P+Son_AP+Son_AP2;
??Direction_Controler_3:
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
//   93 }   
//   94 //K3=10;
//   95 //Son_AD=speed_error2*K3;
//   96 //if(Son_AD>50)    Son_AD=50;
//   97 //if(Son_AD>Son_AD_Max)    Son_AD=Son_AD_Max;
//   98 //if(Son_AD<-Son_AD_Max)    Son_AD=-Son_AD_Max;
//   99 //if(Son_AD<0)    Son_AD=0;
//  100 //Son_AD=0; 
//  101 
//  102 //if(abs_f(Chazhi)<40)
//  103 //{ 
//  104 //Angle_D_Temp=Angle_D+Son_AD;
//  105 //}
//  106 //else if(abs_f(Chazhi)<60)
//  107 //{ 
//  108 //Angle_D_Temp=Angle_D/3+Son_AD;
//  109 //}
//  110 //else if(abs_f(Chazhi)<70)
//  111 //{ 
//  112 //Angle_D_Temp=0+Son_AD;
//  113 //}
//  114 //else if(abs_f(Chazhi)<80)
//  115 //{ 
//  116 //Angle_D_Temp=0+Son_AD;
//  117 //}
//  118 //else 
//  119 //{
//  120 //Angle_D_Temp=0+Son_AD;
//  121 //}
//  122 
//  123 //Angle_D_Temp=Angle_D+Son_AD;
//  124 //if(gyr_angle_speed>200)
//  125 //     gyr_angle_speed=200;
//  126 //if(gyr_angle_speed<-200)
//  127 //     gyr_angle_speed=-200;
//  128 if(Chazhi>0)//左转角速度负，
??Direction_Controler_1:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Direction_Controler_4
//  129    jsd=-1*abs_f(gyr_angle_speed);
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_13  ;; 0xbf800000
        BL       __aeabi_fmul
        MOVS     R5,R0
        B        ??Direction_Controler_5
//  130 else//右转，角速度正
//  131    jsd=abs_f(gyr_angle_speed);
??Direction_Controler_4:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R5,R0
//  132 
//  133 Direction_Control_Output_L = 
//  134 //                             -Direction_P2_Temp*Chazhi-Direction_D2*(Chazhi_Last-Chazhi)+Speed_I_lntegral_L 
//  135                              -Direction_P2_Temp*Chazhi-Direction_D2*Chazhi_Rate 
//  136 //                               +Angle_P_Temp*gyr_angle_speed-Angle_D_Temp*gyr_angle_speed ;//gyr_angle_speed:值左转负有转正
//  137                                +Angle_P_Temp*jsd-Angle_D_Temp*jsd ;//gyr_angle_speed:值左转负有转正
??Direction_Controler_5:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R1,R1,R0
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  138 
//  139 Direction_Control_Output_R = 
//  140 //                             Direction_P2_Temp*Chazhi+Direction_D2*(Chazhi_Last-Chazhi)+Speed_I_lntegral_R
//  141                              Direction_P2_Temp*Chazhi+Direction_D2*Chazhi_Rate
//  142                              -Angle_P_Temp*jsd+Angle_D_Temp*jsd;
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_4
        STR      R0,[R1, #+0]
//  143 }
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     speed_buzzer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     Direction_P2_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Angle_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0x42200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     gyr_angle_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     0xbf800000
//  144 
//  145 /*******************************************
//  146 公式:V_left=V*(1+B*tanα/2L);V_right=V*(1-B*tanα/2L);
//  147 左轮速度=前轮速度*（1+后轮间距*前轮偏转角度/2倍的前后轮间距）
//  148 通过差值确定偏转角度，再利用本函数转弯
//  149 速度控制输出保证车速(前轮速度)稳定在一个值，理论上。
//  150 tan0度-45度-60度-70度--80度---81度--83度--85度--89度-90度-91度
//  151   0     1  1.73   2.7  5.7   6.3   8.1  11.4   57    无  -57
//  152 **********************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  153 void Direction_ChaSpeed_Control(void)//(short int angle)
//  154 {   
Direction_ChaSpeed_Control:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
//  155  int k1=1;
        MOVS     R0,#+1
//  156 //直道--80，弯道--100,2.1
//  157  int speed_z=0,speed_w=20;//w20
        MOVS     R4,#+0
        MOVS     R5,#+20
//  158  angle_limit=89;  //0,
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5  ;; 0x40564000
        LDR      R2,??DataTable1_6
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  159  angle=Chazhi*1;
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  160  
//  161    if(StraightRoad_Flag==1)
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_0
//  162     {
//  163        speed_set_temp_L=speed_set+speed_z;
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  164        speed_set_temp_R=speed_set+speed_z;
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//  165        Direction_P_Temp=Direction_P;
        LDR      R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  166 //       BUZZER_OFF;
//  167     } 
//  168     if(WindingRoad_Flag==1)
??Direction_ChaSpeed_Control_0:
        LDR      R0,??DataTable1_15
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_1
//  169     {
//  170        speed_set_temp_L=speed_set+speed_w;
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_11
        STR      R0,[R1, #+0]
//  171        speed_set_temp_R=speed_set+speed_w;
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//  172               Direction_P_Temp=Direction_P-0;
        LDR      R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  173 //BUZZER_ON;
//  174     }
//  175   
//  176    
//  177   if(angle>angle_limit)   angle=angle_limit;
??Direction_ChaSpeed_Control_1:
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,??DataTable1_6
        LDM      R0,{R0,R1}
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_2
        LDR      R0,??DataTable1_6
        LDM      R0,{R0,R1}
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  178   if(angle<-angle_limit)   angle=-angle_limit;//0.5  1.5    k=1  1.5   2.5
??Direction_ChaSpeed_Control_2:
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR      R2,??DataTable1_6
        LDM      R2,{R2,R3}
        MOVS     R4,#+128
        LSLS     R4,R4,#+24       ;; #-2147483648
        EORS     R3,R3,R4
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_3
        LDR      R0,??DataTable1_6
        LDM      R0,{R0,R1}
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  179    
//  180    speed_set_L=speed_set_temp_L*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
??Direction_ChaSpeed_Control_3:
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable2_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable2_4
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable2_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        LDR      R2,[SP, #+0]
        LDR      R3,[SP, #+4]
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  181    speed_set_R=speed_set_temp_R*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); //b/2L=0.517
        LDR      R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable2_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable2_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable2_4
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable2_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        LDR      R2,[SP, #+0]
        LDR      R3,[SP, #+4]
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  182   
//  183 //速度设定小于0 
//  184     
//  185 //   if(speed_set_L<30)
//  186 //   {
//  187 //      if(speed_set_L>0)//0<speed_set_L<30
//  188 //          speed_set_R+=2*abs_f(speed_set_L);
//  189 //      else
//  190 //          speed_set_R+=30+2*abs_f(speed_set_L);
//  191 //
//  192 //      speed_set_L=30;
//  193 //   }  
//  194 //   
//  195 //   if(speed_set_R<30)
//  196 //   {
//  197 //      if(speed_set_R>0)//0<speed_set_L<30
//  198 //          speed_set_L+=2*abs_f(speed_set_R);
//  199 //      else
//  200 //          speed_set_L+=30+2*abs_f(speed_set_R);
//  201 //
//  202 //      speed_set_R=30;
//  203 //   }  
//  204   
//  205    
//  206 //      if(speed_set_L<0)
//  207 //   {
//  208 //
//  209 //    speed_set_R+=1*abs_f(speed_set_L);
//  210 //    speed_set_L=0;
//  211 //   }  
//  212 //   if(speed_set_R<0)
//  213 //   {
//  214 //    speed_set_L+=1*abs_f(speed_set_R);
//  215 //    speed_set_R=0;
//  216 //   } 
//  217   
//  218 
//  219 }
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Chazhi_Rate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     Angle_D_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Direction_Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Direction_Control_Output_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x40564000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     angle_limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     speed_set_temp_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     speed_set_temp_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     Direction_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     WindingRoad_Flag

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  220 float Speed_PWM=0;
Speed_PWM:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  221 void BangBang(void)
//  222 {
BangBang:
        PUSH     {R3-R5,LR}
//  223 float speed_error=0,K4=0,Son_SP,KP=0,
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOVS     R1,#+0
//  224       Speed_Error=0,Speed_PWM_L=0,Speed_PWM_R=0,
        MOVS     R0,#+0
        MOVS     R0,#+0
        MOVS     R0,#+0
//  225      Speed_PWM_Max=8000,Speed_PWM_Min=-8000,
        LDR      R4,??DataTable3_1  ;; 0x45fa0000
        LDR      R5,??DataTable3_2  ;; 0xc5fa0000
//  226        Error_L=0,Error_R=0; 
        MOVS     R0,#+0
        MOVS     R0,#+0
//  227 /*棒棒是为了达到速度设定
//  228 速度1：之前的，设定同一速度，
//  229      实际直道比弯道快
//  230 速度2：改变不同速度设定/速度环P/改变棒棒的强度                     
//  231      实际直道弯道一样快
//  232 速度3 :棒棒强硬，速度设定不一样；速度设定一样，弯道取消棒棒，甚至运用棒棒-PWM                       
//  233     实际直道比弯道快
//  234 ---------------------------------------------------------
//  235 1稳定现在速度，直道弯道一样快，再85，
//  236 2出弯加速，直道加速一段时间
//  237 入弯减速，弯道中加速   
//  238  */   
//  239 /*-------------------棒棒1------------------------------------------*/  
//  240 if(StraightRoad_Flag==1)
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??BangBang_0
//  241 {
//  242   speed_set_temp=speed_set+10;//10
        LDR      R0,??DataTable3_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
        B        ??BangBang_1
//  243 }
//  244 else
//  245 if(Circle_Flag>1&&Circle_Flag<4)//处于检测圆环双线状态
//  246       {
//  247       
//  248       }
//  249 
//  250 
//  251 
//  252   
//  253 speed_set_temp=speed_set+10;//10
??BangBang_0:
??BangBang_1:
        LDR      R0,??DataTable3_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_5  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
//  254 //车速小，偏差正，    
//  255 Speed_Error=speed_set_temp-speed_car;
        LDR      R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
//  256 
//  257    if(Speed_Error>50)//车速小,>50
        LDR      R1,??DataTable3_8  ;; 0x42480001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_2
//  258    {
//  259      Speed_PWM =7000;
        LDR      R0,??DataTable3_9  ;; 0x45dac000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  260      //P=200;
//  261    }
//  262    else if(Speed_Error>40)//车速小,40-50
??BangBang_2:
        LDR      R1,??DataTable3_11  ;; 0x42200001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_4
//  263    {
//  264      Speed_PWM =5000;
        LDR      R0,??DataTable3_12  ;; 0x459c4000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  265    }
//  266    else if(Speed_Error>30)//车速小,30-40
??BangBang_4:
        LDR      R1,??DataTable3_13  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_5
//  267    {
//  268      Speed_PWM =4000;
        LDR      R0,??DataTable3_14  ;; 0x457a0000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  269    }
//  270    else if(Speed_Error>20)//车速小,20-30
??BangBang_5:
        LDR      R1,??DataTable3_15  ;; 0x41a00001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_6
//  271    {
//  272      Speed_PWM =3000;
        LDR      R0,??DataTable3_16  ;; 0x453b8000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  273    }
//  274    else if(Speed_Error>0)//车速小0-20
??BangBang_6:
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??BangBang_7
//  275    {
//  276      KP=100;
        LDR      R1,??DataTable3_17  ;; 0x42c80000
//  277     Speed_PWM = Speed_Error*P;
        LDR      R1,??DataTable3_18  ;; 0x42480000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  278    }
//  279    else if(Speed_Error>-20)//车速大0->-20
??BangBang_7:
        LDR      R1,??DataTable3_19  ;; 0xc19fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_8
//  280    {
//  281         KP=200;
        LDR      R1,??DataTable3_20  ;; 0x43480000
//  282         Speed_PWM = Speed_Error*P;
        LDR      R1,??DataTable3_18  ;; 0x42480000
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  283    }
//  284    else if(Speed_Error>-30)//车速大-20>-30
??BangBang_8:
        LDR      R1,??DataTable3_21  ;; 0xc1efffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_9
//  285    {
//  286        Speed_PWM =-6000;
        LDR      R0,??DataTable3_22  ;; 0xc5bb8000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  287    }
//  288    else if(Speed_Error>-40)//车速大-30>-40
??BangBang_9:
        LDR      R1,??DataTable3_23  ;; 0xc21fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_10
//  289    {
//  290        Speed_PWM =-7000;
        LDR      R0,??DataTable3_24  ;; 0xc5dac000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
        B        ??BangBang_3
//  291    }    
//  292    else //车速大<-40
//  293    {
//  294        Speed_PWM =-8000;
??BangBang_10:
        LDR      R0,??DataTable3_2  ;; 0xc5fa0000
        LDR      R1,??DataTable3_10
        STR      R0,[R1, #+0]
//  295    }
//  296    
//  297 
//  298 
//  299  
//  300 
//  301 
//  302 
//  303    if(Speed_PWM>Speed_PWM_Max)  Speed_PWM=Speed_PWM_Max;
??BangBang_3:
        MOVS     R0,R4
        LDR      R1,??DataTable3_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??BangBang_11
        LDR      R0,??DataTable3_10
        STR      R4,[R0, #+0]
//  304    if(Speed_PWM<Speed_PWM_Min)  Speed_PWM=Speed_PWM_Min;  
??BangBang_11:
        LDR      R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_cfcmple
        BCS      ??BangBang_12
        LDR      R0,??DataTable3_10
        STR      R5,[R0, #+0]
//  305 
//  306 }
??BangBang_12:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     k

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     `B`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xAD42C3CA,0x3F91DE69

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     L

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  307 void Controler()
//  308 {
Controler:
        PUSH     {R4-R6,LR}
//  309 float Speed_Error_L_Old=0,Speed_Error_R_Old=0;
        MOVS     R6,#+0
        MOVS     R5,#+0
//  310 
//  311 // speed_error=speed_buzzer-speed_car;
//  312 //  Speed_Error_L = speed_set - speed_car;//重复
//  313 //  Speed_Error_R = speed_set - speed_car;//
//  314    Speed_Error_L = speed_set_L - speed_L;//重复
        LDR      R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_26
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_27
        STR      R0,[R1, #+0]
//  315    Speed_Error_R = speed_set_R - speed_R;     
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_29
        STR      R0,[R1, #+0]
//  316 
//  317 
//  318 Control_Output_L=Direction_P_Temp*Speed_Error_L +Speed_I_lntegral_L+Direction_D*(Speed_Error_L-Speed_Error_L_Old)
//  319                  ;
        LDR      R0,??DataTable3_30
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_27
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_31
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable3_27
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_32
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_33
        STR      R0,[R1, #+0]
//  320 //
//  321 Control_Output_R=Direction_P_Temp*Speed_Error_R +Speed_I_lntegral_R+Direction_D*(Speed_Error_R-Speed_Error_R_Old)
//  322                    ;
        LDR      R0,??DataTable3_30
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_29
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_34
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable3_29
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_32
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_35
        STR      R0,[R1, #+0]
//  323 
//  324 
//  325 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     speed_set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x45fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0xc5fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     speed_set_temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x42480001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x45dac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     Speed_PWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x42200001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x459c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0x41f00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0x457a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x41a00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x453b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0xc19fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0x43480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     0xc1efffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     0xc5bb8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     0xc21fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     0xc5dac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_28:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_29:
        DC32     Speed_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_30:
        DC32     Direction_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_31:
        DC32     Speed_I_lntegral_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_32:
        DC32     Direction_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_33:
        DC32     Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_34:
        DC32     Speed_I_lntegral_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_35:
        DC32     Control_Output_R
//  326 //                               Speed_Error_L_Old    -  Speed_Error_L：为P的作用
//  327 //速度设定100 初始速度0 本次速度50       100-0=100     -  100-50=50    =50*D，加速
//  328 //                    本次速度100             100     -   100-100=0    =100*D,加速
//  329 
//  330 //                                  Speed_Error_L -  Speed_Error_L_Old：为D的作用
//  331 //速度设定100 初始速度0 本次速度50      100-50=50  -   100-0=100       =-50*D,减速
//  332 //速度设定0 初始速度100 本次速度50      0-50=-50   -   0-100=-100       =50*D,加速
//  333 //直道速度=速度设定-10   
//  334 //一个弯道速度=速度设定-40   
//  335 //大弯道速度=速度设定-60       速度设定-30
//  336 //车速小， 正值；车速大，负值 
//  337 //   speed_error=speed_buzzer-speed_car;
//  338 //   K4=50;
//  339 //   Son_SP=speed_error*K4;
//  340 //      if(Son_SP>500)   Son_SP=500;
//  341 //      if(Son_SP<300)   Son_SP=300;
//  342 //   Son_SP=0;
//  343 //Direction_P_Temp=Direction_P+Son_SP;
//  344 //--------------bb-------------------------------
//  345 //速度偏差方案2:Speed_Error_L,Speed_Error_R
//  346 //棒棒PWM给值方案2,偏差方案2,错了，同速度环P
//  347 //   Speed_PWM_L = Error_L*200;
//  348 //   Speed_PWM_R = Error_R*200; 
//  349 /*积分偏差累
//  350    for(int i=0;i<N-1;i++)
//  351    {
//  352      Accum_Error_L[i]=Accum_Error_L[i+1]; //重复
//  353      Sum_Error_L+=Accum_Error_L[i];
//  354    }
//  355      
//  356    Accum_Error_L[N-1]=Speed_Error_L;
//  357    Sum_Error_L+=Accum_Error_L[N-1]; 
//  358  
//  359    for( int i=0;i<N-1;i++)
//  360    {
//  361      Accum_Error_R[i]=Accum_Error_R[i+1]; //重复
//  362      Sum_Error_R+=Accum_Error_R[i];
//  363    }
//  364          
//  365    Accum_Error_R[N-1]=Speed_Error_R;
//  366    Sum_Error_R+=Accum_Error_R[N-1];
//  367 
//  368    Speed_I_lntegral_L = Direction_I*Sum_Error_L;
//  369    Speed_I_lntegral_R = Direction_I*Sum_Error_R;
//  370           
//  371    if (Speed_I_lntegral_L< -Speed_I_lntegral_Max)
//  372        Speed_I_lntegral_L= -Speed_I_lntegral_Max;
//  373    if (Speed_I_lntegral_L>  Speed_I_lntegral_Max)
//  374        Speed_I_lntegral_L=  Speed_I_lntegral_Max;
//  375    if (Speed_I_lntegral_R< -Speed_I_lntegral_Max)
//  376        Speed_I_lntegral_R= -Speed_I_lntegral_Max;
//  377    if (Speed_I_lntegral_R>  Speed_I_lntegral_Max)
//  378        Speed_I_lntegral_R=  Speed_I_lntegral_Max;
//  379    */
//  380 
//  381 
//  382 
//  383 
//  384 
//  385 
//  386 /*差值P关于速度大小作指数函数
//  387   速度低于速度设定，差值P下降，减小底数，增强差值P
//  388   速度高于速度设定，差值P上升，减小底数，削弱差值P
//  389 */  
//  390 //  speed_point=speed_set-40;
//  391   
//  392 //  Speed_Bili_Temp=(speed_car-speed_point)/speed_point;
//  393 //  
//  394 //  if(speed_car<speed_point)//数学比值为负数，指数值0-1
//  395 //  Speed_Bili=pow(2.7,Speed_Bili_Temp);//减小底数，指数比例变大，数值降得慢
//  396 //  else//数学比值为正数，指数值>1
//  397 //  Speed_Bili=pow(1.5,Speed_Bili_Temp);//减小底数，指数比例变小，数值升的慢
//  398 //  
//  399 //  Direction_P2_Speed=Speed_Bili*Direction_P2;//300 
//  400  
//  401 /*    
//  402   陀螺仪D关于速度大小作指数函数           
//  403   速度低于速度设定，陀螺仪D上升，减小底数，减小陀螺仪D
//  404   速度高于速度设定，陀螺仪D下降，减小底数，增强陀螺仪D
//  405 */ 
//  406   
//  407   
//  408 //  Speed_Bili_Temp=(speed_point-speed_car)/speed_point;
//  409 //  
//  410 //   if(speed_car<speed_point)//数学比值为正数
//  411 //  Speed_Bili=pow(1.5,Speed_Bili_Temp);//减小底数，指数比例变小，数值升的慢
//  412 //  else//数学比值为负数
//  413 //  Speed_Bili=pow(1.5,Speed_Bili_Temp);//减小底数，指数比例变大，数值降得慢
//  414 //  
//  415 //  Angle_D_Speed=Speed_Bili*Angle_D;//300 
//  416    
//  417 /*差值P关于差值大小作指数函数*/    
//  418 //Chazhi_Bili_Temp=(abs_f(Chazhi)-Chazhi_point)/Chazhi_point;//-2/3
//  419 //
//  420 // if(abs_f(Chazhi)<Chazhi_point)//数学比值为负数
//  421 //  Chazhi_Bili=pow(1.5,Chazhi_Bili_Temp);//减小底数，指数比例变大，数值降得慢
//  422 //  else//数学比值为正数
//  423 //  Chazhi_Bili=pow(2.7,Chazhi_Bili_Temp);//减小底数，指数比例变小，数值升的慢
//  424 //
//  425 // Direction_P2_Chazhi=Chazhi_Bili*Direction_P2;//300
//  426 //// 
//  427 ///*陀螺仪D关于差值大小作指数函数*/ 
//  428 // if(abs_f(Chazhi)<80)  Chazhi_Temp=abs_f(Chazhi);
//  429 // else                  Chazhi_Temp=80;
//  430 // 
//  431 // Chazhi_Bili_Temp=(Chazhi_Temp-Chazhi_point)/Chazhi_point;//-2/3
//  432 //// 
//  433 //if(Chazhi_Temp<Chazhi_point)//数学比值为负数
//  434 //  Chazhi_Bili=pow(2.7,Chazhi_Bili_Temp);//减小底数，指数比例变大，数值降得慢
//  435 //else//数学比值为正数
//  436 //  Chazhi_Bili=pow(1.5,Chazhi_Bili_Temp);//减小底数，指数比例变小，数值升的慢
//  437 // 
//  438 // Angle_D_Chazhi     =Chazhi_Bili*Angle_D;//300        
//  439 /*-----------------------------------------------*/
//  440  
//  441 //Angle_Weight=1.0;//陀螺仪D--速度权重
//  442 //Direction_Weight=1;//方向环P--速度权重
//  443 //Direction_P2_Temp=Direction_P2_Speed*Direction_Weight+Direction_P2_Chazhi*(1-Direction_Weight);     
//  444 //Angle_D_Temp     =Angle_D_Speed*Angle_Weight+Angle_D_Chazhi*(1-Angle_Weight);
//  445 
//  446 //if(speed_car<speed_set-50)  
//  447 //{
//  448 //  if(abs_f(Chazhi)<40)
//  449 //  Angle_D_Temp=Angle_D;//30*0.8=24 
//  450 //  else  if(abs_f(Chazhi)<60)
//  451 //  Angle_D_Temp=0;//30*0.8=24  
//  452 //  else  
//  453 //  Angle_D_Temp=0;//30*0.8=24 
//  454 //}
//  455 //else
//  456 //    Angle_D_Temp=0;//30*0.8=24 
//  457 //差值P关于速度作大小，速度上流畅，  
//  458 //-10    弯道速度略大   弯道沿中线过弯
//  459 //差值P关于差值作大小，弯道速度平缓，
//  460 /*差值P关于速度大小作2次函数*/
//  461 //  speed_point=speed_set-10;
//  462 //  Speed_Bili=(speed_car*speed_car)/(speed_point*speed_point);
//  463 // Direction_P2_Speed=Speed_Bili*Direction_P2;//300 
//  464 /*陀螺仪D关于速度大小作2次函数*/  
//  465 //  Angle_D_Speed=Speed_Bili*Angle_D;//300 
//  466 //差值P关于差值大小作2次函数，
//  467 //  Chazhi_Bili=(Chazhi*Chazhi)/(Chazhi_point*Chazhi_point);
//  468 // Direction_P2_Temp=Chazhi_Bili*Direction_P2;//300
//  469 /*陀螺仪*/
//  470 //     if(abs_f(Chazhi<20))
//  471 //     {
//  472 //        Angle_P_Temp=0;
//  473 //        Angle_D_Temp=Angle_D;//30
//  474 //     }
//  475 //     else if(abs_f(Chazhi<40))
//  476 //     {
//  477 //        Angle_P_Temp=0;
//  478 //        Angle_D_Temp=Angle_D;//30*0.8=24 
//  479 //        Angle_D_Temp=Angle_D*2;//30*0.8=24 
//  480 //     }
//  481 //     else if(abs_f(Chazhi<50))
//  482 //     {
//  483 //        Angle_P_Temp=0;//30*0.8=24
//  484 //        Angle_D_Temp=Angle_D/2;//30*0.8=24
//  485 //     }
//  486 //     else if(abs_f(Chazhi<75))
//  487 //     {
//  488 //        Angle_P_Temp=Angle_P/2;//P
//  489 //        Angle_D_Temp=0;//P
//  490 //     }
//  491 //     else
//  492 //     {
//  493 //        Angle_P_Temp=Angle_P;//P
//  494 //        Angle_D_Temp=0;//P
//  495 //     }
//  496      
//  497 //    if(speed_car<10)//速度
//  498 //        Angle_D_Temp+=55;//P
//  499 //    else  if(speed_car<20)//速度
//  500 //        Angle_D_Temp+=35;//P
//  501 //    else  if(speed_car<30)//速度
//  502 //        Angle_D_Temp+=25;//P
//  503 //    else  if(speed_car<40)//速度
//  504 //        Angle_D_Temp+=15;//P
//  505 //    else  if(speed_car<50)//速度
//  506 //        Angle_D_Temp+=10;//P
//  507 //    else  if(speed_car<60)//速度
//  508 //        Angle_D_Temp+=5;//P
//  509 //    else
//  510 //        Angle_D_Temp+=0;//P
//  511 
//  512 /*差值P*/
//  513 //     if(abs_f(Chazhi<30))
//  514 //        Direction_P2_Temp=Direction_P2*0.8;//250*0.8=200
//  515 //     
//  516 //     else if(abs_f(Chazhi<40))
//  517 //        Direction_P2_Temp=Direction_P2*0.9;//250
//  518 //     
//  519 //      else if(abs_f(Chazhi<50))
//  520 //        Direction_P2_Temp=Direction_P2;//250
//  521 //     
//  522 //     else if(abs_f(Chazhi<75))
//  523 //        Direction_P2_Temp=Direction_P2*1.1;//275
//  524 //     else
//  525 //        Direction_P2_Temp=Direction_P2*1.2;//300
//  526 //     
//  527    
//  528 //            Direction_P2_Temp=Direction_P2;//300
//  529 
//  530 //        if(StraightRoad_Flag==1)
//  531 //    {
//  532 //       if(speed_car>speed_set-20)//速度>50
//  533 //           Direction_P2_Temp=Direction_P2+30;
//  534 //    }
//  535     
//  536 //   if(speed_car>speed_set)//速度：>70
//  537 //        Direction_P2_Temp+=30;
//  538 //   else if(speed_car>speed_set-10)//速度：60-70
//  539 //     Direction_P2_Temp+=10;
//  540 //   else if(speed_car>speed_set-20)//速度：50-60
//  541 //        Direction_P2_Temp-=20;
//  542 //   else if(speed_car>speed_set-30)//速度：40-50
//  543 //        Direction_P2_Temp-=40;
//  544 //   else if(speed_car>speed_set-40)//速度：30-40
//  545 //        Direction_P2_Temp-=60; 
//  546 //   else if(speed_car>speed_set-50)//速度：20-30
//  547 //        Direction_P2_Temp-=90;
//  548 
//  549 //   else if(speed_car>speed_set-60)//速度：10-20
//  550 //        Direction_P2_Temp-=130;
//  551 //  else                          //速度<10
//  552 //        Direction_P2_Temp-=170;
//  553 
//  554 
//  555 
//  556 
//  557 
//  558 
//  559 
//  560 
//  561 
//  562 
//  563 
//  564 
//  565 
//  566 
//  567 
//  568 
//  569 
//  570 
//  571 
//  572 
//  573 
//  574 
//  575 
//  576 
//  577 
//  578 
//  579 
//  580 
//  581 
//  582 
//  583 
//  584 
//  585 
//  586 
//  587 //60度，
//  588 //Chasu_Bili*0.89547
//  589 //1.5*0.89547=1.3432
//  590 //速度=速度*（1+Chasu_Bili*0.89547）  
//  591 //速度=速度*（1-Chasu_Bili*0.89547）
//  592    
//  593 //Chasu_Bili=1.5  
//  594 //速度=速度*（2.3432）  
//  595 //速度=速度*（-0.3432） 
//  596 //60度，Chasu_Bili=1.5.速度100最低-34
//  597 //55度，Chasu_Bili=1.5.速度100最低-10
//  598    
//  599 
//  600 
//  601      //   Direction_Control_Output_L = Direction_P*Speed_Error_L + Speed_I_lntegral_L+Direction_D*(Speed_Error_L-Speed_Error_Last_L)
//  602 //                            +Angle_P_choose*Angle_P*gyr_angle_speed-Angle_D*gyr_angle_speed
//  603 //                             -Direction_P2*Chazhi-Direction_D2*(Chazhi-Chazhi_Last);   
//  604 
//  605 //Direction_Control_Output_R = Direction_P*Speed_Error_R + Speed_I_lntegral_R+Direction_D*(Speed_Error_R-Speed_Error_Last_R)
//  606 //                             -Angle_P_choose*Angle_P*gyr_angle_speed+Angle_D*gyr_angle_speed
//  607 //                             +Direction_P2*Chazhi+Direction_D2*(Chazhi-Chazhi_Last);  
//  608 //Direction_Control_Output_L = Direction_P*Speed_Error_L +Speed_I_lntegral_L
//  609 //                             -Angle_D_Temp*gyr_angle_speed
//  610 //                             -Direction_P2*Chazhi-Direction_D2*(Chazhi_Last-Chazhi);   
//  611 //
//  612 //Direction_Control_Output_R = Direction_P*Speed_Error_R +Speed_I_lntegral_R
//  613 //                              +Angle_D_Temp*gyr_angle_speed
//  614 //                             +Direction_P2*Chazhi+Direction_D2*(Chazhi_Last-Chazhi); 
//  615 /*
//  616 void Steercontrol(void)                  //PD控制或者非线性控制
//  617 {
//  618 float pwm;
//  619 uint steerpwm;
//  620 float positionerror;
//  621 if(positiony<20)
//  622 xianzhiflag=0.5;
//  623 else if(positiony<30)       //若上限为40，则转折点为100  若上限为30，则转折点为753
//  624 无挖潜
//  625 xianzhiflag=0.05*positiony-0.5;
//  626 else
//  627 xianzhiflag=1;
//  628 if(psum<75)
//  629 xianzhiflag=1;
//  630 positionerror=position1[0]-position1[1]; 
//  631 if(position1[0]<0)
//  632 kpc=d*position1[0]*position1[0]-e*position1[0]+f;
//  633 else
//  634 kpc=d*position1[0]*position1[0]+e*position1[0]+f;
//  635 pwm=(kpc*position1[0]+kdc*positionerror)*xianzhiflag;
//  636 steerpwm=csteermid+(int)pwm;    
//  637 if(steerpwm<csteerleft)
//  638 PWMDTY67=csteerleft;
//  639 else if(steerpwm>csteerright) 
//  640 错误！未找到引用源。
//  641 第  XVII  页
//  642 {
//  643 PWMDTY67=csteerright;
//  644 } 
//  645 else
//  646 {
//  647 PWMDTY67=steerpwm;
//  648 }      
//  649 }
//  650 */
//  651 
//  652 /*
//  653 tan0度-45度-60度-70度--80度---81度--83度--85度--89度-90度-91度
//  654   0     1  1.73   2.7  5.7   6.3   8.1  11.4   57    无  -57
//  655   综上所述，角度angle必须小于90度，一旦大于90度，就从向左往死里转弯变到往右往死里打弯，彻底旋转
//  656 根本不行。由于角度越大，tan变得也越严重，不能大于80度。必须不能大于80度。
//  657   所以依据舵机能转向貌似最大60度，先设定旋转角度为0度-60度。
//  658 转向60度，PWM相差？因为按现在的速度设定和30的P,转向77度有5500的PWM差。
//  659 */
//  660 //输入：无
//  661 //输出：无
//  662 //功能:小车差速调节
//  663 //原理：阿克曼角
//  664 //公式:V_left=V*(k-B*tanα/2L);V_right=V*(k+B*tanα/2L);
//  665 //α为舵机打角值，B为后轮间距，L为前后轮间距，V = Speed_Set
//  666 //a为差速系数，增加p可以增大差速,s提前
//  667 //   Direction_Control_Output_L= P_Direction * speed_set_L;  
//  668 //   Direction_Control_Output_R= P_Direction * speed_set_R;
//  669    
//  670 // DIF_INTENSITY = 11; //差速强度    增大此数，差速越明显，当速度增大以后，此值应该减小  
//  671 //  uint32 temp1 = Speed_Set_Temp * DIF_P/100;
//  672 //  int32 temp2 = Speed_Set_Temp*angle*angle/DIF_INTENSITY;
//  673 //  if(angle<0) temp2 = -temp2;  
//  674 //  Speed_Set_L = temp1 +  temp2;
//  675 //  Speed_Set_R = temp1 -  temp2;
//  676 //  float temp=Speed_Set_Temp*DIF_INTENSITY*tan((double)(angle*0.01745))/10;
//  677 //  float temp2 = Speed_Set_Temp*DIF_P;     //提前量，越大，越提前
//  678 //  Speed_Set_L=(uint32)(temp2+temp);
//  679 //  Speed_Set_R=(uint32)(temp2-temp);
//  680 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  681 uint8 Direction_Control_Period = 0;
Direction_Control_Period:
        DS8 1
//  682 #define DIRECTION_CONTROL_PERIOD 50
//  683 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  684 float P_Direction1=40,D_Direction1=20.5;		//低速
P_Direction1:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction1:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  685 float P_Direction2=40,D_Direction2=20.5;		//中速
P_Direction2:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction2:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  686 float P_Direction3=173,D_Direction3=145.5;		//快速
P_Direction3:
        DATA
        DC32 432D0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction3:
        DATA
        DC32 43118000H
//  687 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  688 float P_Direction = 100,D_Direction = 0;              
P_Direction:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
D_Direction:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  689 float turn_spd = 150;
turn_spd:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  690 float P_Direction_high = 80, P_Direction_low=80;//26
P_Direction_high:
        DATA
        DC32 42A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Direction_low:
        DATA
        DC32 42A00000H
//  691 //float   K =1;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  692 float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
Direction_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  693 float Direction_angle=0.0;
Direction_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  694 float P_Dir_agl=20.0;
P_Dir_agl:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  695 float Road_Err_D=0;		//偏差的微分
Road_Err_D:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  696 
//  697 //void Direction_Controler(void)
//  698 //{
//  699 //  float road_err_D_Tmp;
//  700 //  static float Chazhi_last;
//  701 //  
//  702 //  road_err_D_Tmp = Chazhi - Chazhi_last;
//  703 //  Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  704 //  
//  705 //  if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//  706 //  else                         P_Direction = P_Direction_low;
//  707 //  
//  708 //  Direction_Control_Output=( P_Direction * Chazhi)  + D_Direction*Road_Err_D;
//  709 //  Chazhi_last = Chazhi;
//  710 //
//  711 //
//  712 //}
//  713 
//  714 //void Direction_Controler(void)
//  715 //{
//  716 //    double road_err_D_Tmp = 0.0;	//偏差微分中间变量
//  717 //
//  718 //    //一阶滤波
//  719 //    road_err_D_Tmp = Road_Err[9]- Road_Err[6];
//  720 //    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  721 //
//  722 //    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//  723 //    else                         P_Direction = P_Direction_low;
//  724 //
//  725 //    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//  726 //    Direction_Control_Output = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//  727 //
//  728 //#if 0
//  729 //    //周期性控制方向
//  730 //    Direction_Control_Period++;
//  731 //    //---------------------------------------------------------------------------------------------------------------------
//  732 //    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
//  733 //    {
//  734 //        Direction_Control_Period = 0;
//  735 //        Direction_Control_Last = Direction_Control;
//  736 //        //一阶滤波
//  737 //        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
//  738 //        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  739 //
//  740 //        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//转角
//  741 //
//  742 //        Direction_Control = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//  743 //        Direction_Control_Err = Direction_Control - Direction_Control_Last;
//  744 //    }
//  745 //    //---------------------------------------------------------------------------------------------------------------------
//  746 //
//  747 //    Direction_Control_Output = Direction_Control_Last + Direction_Control_Err*(Direction_Control_Period+1)/DIRECTION_CONTROL_PERIOD ;
//  748 //#endif
//  749 //}
//  750 //
//  751 //*/
// 
//   227 bytes in section .bss
//   156 bytes in section .data
// 1 604 bytes in section .text
// 
// 1 604 bytes of CODE memory
//   383 bytes of DATA memory
//
//Errors: none
//Warnings: 17
