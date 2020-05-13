///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       30/Jul/2018  14:35:49
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Direction_Control.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Direction_Control.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\Direction_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Chazhi
        EXTERN Chazhi_Rate
        EXTERN Circle_Flag
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
        PUBLIC Angle_P_Change
        PUBLIC Angle_P_Temp
        PUBLIC Angle_P_choose
        PUBLIC Angle_Weight
        PUBLIC `B`
        PUBLIC BB_H
        PUBLIC BB_P_F
        PUBLIC BB_P_W
        PUBLIC BB_P_Z
        PUBLIC BB_W
        PUBLIC BB_Z
        PUBLIC BangBang
        PUBLIC Chasu_Bili
        PUBLIC Chasu_Bili_Temp
        PUBLIC Chazhi_Bili
        PUBLIC Chazhi_Bili_Temp
        PUBLIC Chazhi_Change
        PUBLIC Chazhi_Change2
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
        PUBLIC Direction_P2_Change
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
        PUBLIC akmj_w
        PUBLIC akmj_z
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

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Direction_Control.c
//    1 #include "Direction_Control.h"
//    2 #include "math.h"
//    3 #include "BL.h"
//    4 /*****************************阿克曼角参数2************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 float k=0;float k3=0.0,k4=0.0;float B=15.5,L=15;float angle,angle_2;float  speed_temp2=0,speed_temp1=-20;
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
//    6 /*-----------方向环2---------------------------------------------------------------*/
//    7 #define N 3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8  float Speed_I_D_Temp=0,X=20;float Accum_Error_L[N]={0};float Accum_Error_R[N]={0};float Chazhi_Error_L[N]={0};float Chazhi_Error_R[N]={0};float Sum_Error_L=0,Sum_Error_R=0;float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;float Speed_I_lntegral_Max = 9000;float Direction_Control_Output_L = 0.0;float Direction_Control_Output_R = 0.0,Control_Output_L=0,Control_Output_R=0;uint8 Piaoyi_L=0,Piaoyi_R=0;
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
//    9 /*--------------------------------------------------------------------------*/
//   10 /********************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   11 float Chazhi_point=45;
Chazhi_point:
        DATA
        DC32 42340000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   12 float  Angle_Weight=0.5,Direction_Weight=0.5;
Angle_Weight:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Direction_Weight:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float Chazhi_limit=75;float Chasu_Bili=1,Chasu_Bili_Temp=1, Speed_Bili=1,Chazhi_Bili=1,Chazhi_Bili_Temp=1,Speed_Bili_Temp=1,Chazhi_Temp=0;double angle_limit=60,angle_limit_2=60;float change_bili_F=1,change_bili_Z=1;float speed_dead_F=-0;int change_value=10;int change_factor=0; int change_variable=0;                                                                float Angle_P_choose;int   angle_P=60;
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
//   14 float Direction_P2_Temp=0,Direction_P2_Speed=0,Direction_P2_Chazhi=0;int t=0;
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
//   15 float Angle_P_Temp=0,Angle_D_Speed=0,Angle_D_Chazhi=0;
Angle_P_Temp:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D_Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D_Chazhi:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float speed_point=0; float Direction_P_Temp=0;  
speed_point:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_P_Temp:
        DS8 4
//   17 /************************常用调参变量**************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18  int Chazhi_Change=50,Chazhi_Change2=75;
Chazhi_Change:
        DATA
        DC32 50

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chazhi_Change2:
        DATA
        DC32 75

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19    int  Direction_P2_Change=0,Angle_P_Change=0; 
Direction_P2_Change:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_P_Change:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 float  speed_set  = 80,//改5ms 
speed_set:
        DATA
        DC32 42A00000H
//   21 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22     Direction_P=100,        Direction_D=0,          Direction_I=100,          //阿克曼角位置式方向+速度环
Direction_P:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_D:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Direction_I:
        DATA
        DC32 42C80000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23     Direction_P2=700,     Direction_D2=-1000,         Direction_I2=0.0,                 //差值位置式 
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
//   24     Angle_P=100,          Angle_D=0,                  Angle_D_Temp,//陀螺仪
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
//   25                                                     Speed_P=0,          Speed_I=0,                 Speed_D=0.00;//速度还增量式
Speed_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_D:
        DS8 4
//   26 /************************常用调参变量**************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 void Direction_Controler(void)//2.71828
//   28 {
Direction_Controler:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+52
//   29  float speed_error2=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//   30   float K1=0,K2=0,K3=0,K4=10;
        MOVS     R0,#+0
        STR      R0,[SP, #+44]
        MOVS     R0,#+0
        STR      R0,[SP, #+40]
        MOVS     R0,#+0
        STR      R0,[SP, #+36]
        LDR      R0,??DataTable0  ;; 0x41200000
        STR      R0,[SP, #+32]
//   31   float Son_DP=0,Son_AP=0,Son_AD=0,Son_AD_Max=100,jsd=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R5,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable0_1  ;; 0x42c80000
        STR      R0,[SP, #+24]
        MOVS     R4,#+0
//   32   float Son_DP2=0,Son_AP2=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//   33   float Chazhi_Mid=50,Chazhi_Error=0,Chazhi_Error2=0;
        LDR      R0,??DataTable0_2  ;; 0x42480000
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R6,#+0
//   34 //车速小， 正值；车速大，负值 
//   35 speed_error2=speed_buzzer-speed_car;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+8]
//   36 
//   37 //差值P改变--------------------------------------------
//   38   if(abs_f(Chazhi)>Chazhi_Change)
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R7,R0
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_0
//   39     Chazhi_Error=(abs_f(Chazhi)-50)/50;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_7  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_2  ;; 0x42480000
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
        B        ??Direction_Controler_1
//   40 else
//   41     Chazhi_Error=0;
??Direction_Controler_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//   42   Son_DP=Direction_P2_Change*Chazhi_Error;
??Direction_Controler_1:
        LDR      R0,??DataTable0_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,[SP, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+4]
//   43   
//   44 //陀螺仪P--------------------------------------------
//   45 if(abs_f(Chazhi)>Chazhi_Change2)
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R7,R0
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_2
//   46     Chazhi_Error2=(abs_f(Chazhi)-75)/25;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_10  ;; 0xc2960000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_11  ;; 0x41c80000
        BL       __aeabi_fdiv
        MOVS     R6,R0
        B        ??Direction_Controler_3
//   47 else
//   48     Chazhi_Error2=0;
??Direction_Controler_2:
        MOVS     R0,#+0
        MOVS     R6,R0
//   49     Son_AP=Angle_P_Change*Chazhi_Error2; 
??Direction_Controler_3:
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R5,R0
//   50 
//   51 Direction_P2_Temp=Direction_P2+Son_DP;
        LDR      R0,??DataTable0_13
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+4]
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
//   52 
//   53 //--------------------------------------------
//   54 if(abs_f(Chazhi)<20)
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_15  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_4
//   55 { 
//   56 Angle_P_Temp=0+Son_AP;
        LDR      R0,??DataTable0_16
        STR      R5,[R0, #+0]
        B        ??Direction_Controler_5
//   57 }
//   58 else if(abs_f(Chazhi)<40)//20-40
??Direction_Controler_4:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_17  ;; 0x42200000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_6
//   59 { 
//   60 Angle_P_Temp=Angle_P/4+Son_AP;
        LDR      R0,??DataTable0_18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+129
        LSLS     R1,R1,#+23       ;; #+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_16
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_5
//   61 }else if(abs_f(Chazhi)<50)//40-50
??Direction_Controler_6:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_2  ;; 0x42480000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_7
//   62 { 
//   63 Angle_P_Temp=Angle_P/2+Son_AP;
        LDR      R0,??DataTable0_18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_16
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_5
//   64 }
//   65 else 
//   66 {
//   67 Angle_P_Temp=Angle_P+Son_AP;
??Direction_Controler_7:
        LDR      R0,??DataTable0_18
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_16
        STR      R0,[R1, #+0]
//   68 }   
//   69 //--------------------------------------------
//   70 if(gyr_angle_speed>200)
??Direction_Controler_5:
        LDR      R0,??DataTable0_19
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_20  ;; 0x43480001
        BL       __aeabi_cfrcmple
        BHI      ??Direction_Controler_8
//   71      gyr_angle_speed=200;
        LDR      R0,??DataTable0_21  ;; 0x43480000
        LDR      R1,??DataTable0_19
        STR      R0,[R1, #+0]
//   72 if(gyr_angle_speed<-200)
??Direction_Controler_8:
        LDR      R0,??DataTable0_19
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_22  ;; 0xc3480000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_9
//   73      gyr_angle_speed=-200;
        LDR      R0,??DataTable0_22  ;; 0xc3480000
        LDR      R1,??DataTable0_19
        STR      R0,[R1, #+0]
//   74 if(Chazhi>0)//左转角速度负，
??Direction_Controler_9:
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Direction_Controler_10
//   75    jsd=-1*abs_f(gyr_angle_speed);
        LDR      R0,??DataTable0_19
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??DataTable0_23  ;; 0xbf800000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B        ??Direction_Controler_11
//   76 else//右转，角速度正
//   77    jsd=abs_f(gyr_angle_speed);
??Direction_Controler_10:
        LDR      R0,??DataTable0_19
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R4,R0
//   78 //--------------------------------------------
//   79 Direction_Control_Output_L = 
//   80                              -Direction_P2_Temp*Chazhi-Direction_D2*Chazhi_Rate 
//   81                                +Angle_P_Temp*jsd-Angle_D_Temp*jsd ;//gyr_angle_speed:值左转负有转正
??Direction_Controler_11:
        LDR      R0,??DataTable0_14
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R1,R1,R0
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,??DataTable0_24
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R7,R1
        LDR      R0,??DataTable0_16
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R7
        BL       __aeabi_fadd
        MOVS     R7,R0
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
//   82 Direction_Control_Output_R = 
//   83                              Direction_P2_Temp*Chazhi+Direction_D2*Chazhi_Rate
//   84                              -Angle_P_Temp*jsd+Angle_D_Temp*jsd;
        LDR      R0,??DataTable0_14
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R7,R1
        LDR      R0,??DataTable0_24
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R7
        BL       __aeabi_fadd
        MOVS     R7,R0
        LDR      R0,??DataTable0_16
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R7
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_21
        STR      R0,[R1, #+0]
//   85 }
        ADD      SP,SP,#+52
        POP      {R4-R7,PC}       ;; return

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
        DC32     Chazhi_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0xc2480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     Direction_P2_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Chazhi_Change2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0xc2960000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0x41c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     Angle_P_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     Direction_P2_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     Angle_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     0x42200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_18:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_19:
        DC32     gyr_angle_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_20:
        DC32     0x43480001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_21:
        DC32     0x43480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_22:
        DC32     0xc3480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_23:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_24:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_25:
        DC32     Chazhi_Rate
//   86 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   87  int akmj_z=0,akmj_w=20;//w20
akmj_z:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
akmj_w:
        DATA
        DC32 20
//   88 /*方向阿克曼角差速控制***************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   89 void Direction_ChaSpeed_Control(void)//(short int angle)
//   90 {   
Direction_ChaSpeed_Control:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
//   91  int k1=1;
        MOVS     R4,#+1
//   92  angle_limit=80;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_2  ;; 0x40540000
        LDR      R2,??DataTable1_11
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//   93  angle=Chazhi*1;
        LDR      R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//   94  
//   95    if(StraightRoad_Flag==1)
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_0
//   96     {
//   97        speed_set_temp_L=speed_set+akmj_z;
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//   98        speed_set_temp_R=speed_set+akmj_z;
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//   99        Direction_P_Temp=Direction_P;
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  100     } 
//  101     if(WindingRoad_Flag==1)
??Direction_ChaSpeed_Control_0:
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_1
//  102     {
//  103        speed_set_temp_L=speed_set+akmj_w;
        LDR      R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+0]
//  104        speed_set_temp_R=speed_set+akmj_w;
        LDR      R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  105        Direction_P_Temp=Direction_P-0;
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  106     }
//  107   
//  108    
//  109   if(angle>angle_limit)   angle=angle_limit;
??Direction_ChaSpeed_Control_1:
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,??DataTable1_11
        LDM      R0,{R0,R1}
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_2
        LDR      R0,??DataTable1_11
        LDM      R0,{R0,R1}
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//  110   if(angle<-angle_limit)   angle=-angle_limit;//0.5  1.5    k=1  1.5   2.5
??Direction_ChaSpeed_Control_2:
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR      R2,??DataTable1_11
        LDM      R2,{R2,R3}
        MOVS     R5,#+128
        LSLS     R5,R5,#+24       ;; #-2147483648
        EORS     R3,R3,R5
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_3
        LDR      R0,??DataTable1_11
        LDM      R0,{R0,R1}
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//  111    
//  112    speed_set_L=speed_set_temp_L*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
??Direction_ChaSpeed_Control_3:
        LDR      R0,??DataTable1_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+8]
        STR      R1,[SP, #+12]
        LDR      R0,??DataTable1_15
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable1_16
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1_19
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_20
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,[SP, #+0]
        LDR      R1,[SP, #+4]
        BL       __aeabi_dsub
        LDR      R2,[SP, #+8]
        LDR      R3,[SP, #+12]
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_13
        STR      R0,[R1, #+0]
//  113    speed_set_R=speed_set_temp_R*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); //b/2L=0.517
        LDR      R0,??DataTable1_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+8]
        STR      R1,[SP, #+12]
        LDR      R0,??DataTable1_15
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable1_16
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1_19
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_20
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_ddiv
        LDR      R2,[SP, #+0]
        LDR      R3,[SP, #+4]
        BL       __aeabi_dadd
        LDR      R2,[SP, #+8]
        LDR      R3,[SP, #+12]
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable3
        STR      R0,[R1, #+0]
//  114 
//  115 }
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     Direction_Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Angle_D_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x40540000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     akmj_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     WindingRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     akmj_w

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     Direction_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     angle_limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     speed_set_temp_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     speed_set_temp_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     k

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     `B`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     0xAD42C3CA,0x3F91DE69

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     Direction_Control_Output_R

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  116 float Speed_PWM=0;
Speed_PWM:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  117 int BB_Z=0,BB_W=0,BB_H=-0;
BB_Z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BB_W:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BB_H:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  118 int BB_P_Z=50,BB_P_W=50,BB_P_F=200;
BB_P_Z:
        DATA
        DC32 50

        SECTION `.data`:DATA:REORDER:NOROOT(2)
BB_P_W:
        DATA
        DC32 50

        SECTION `.data`:DATA:REORDER:NOROOT(2)
BB_P_F:
        DATA
        DC32 200
//  119 /**速度棒棒控制********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  120 void BangBang(void)
//  121 {
BangBang:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+28
//  122  int sele=1;
        MOVS     R4,#+1
//  123 float Speed_PWM_Max=8000,Speed_PWM_Min=-8000,speed_error=0,K4=0,Son_SP,Speed_Error=0,Speed_PWM_L=0,Speed_PWM_R=0,Error_L=0,Error_R=0; 
        LDR      R5,??DataTable2  ;; 0x45fa0000
        LDR      R6,??DataTable3_1  ;; 0xc5fa0000
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R7,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  124 
//  125 if(StraightRoad_Flag==1)
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??BangBang_0
//  126 {
//  127    speed_set_temp=speed_set+BB_Z;//10
        LDR      R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  128    sele=1;
        MOVS     R0,#+1
        MOVS     R4,R0
        B        ??BangBang_1
//  129 }
//  130 else
//  131 {
//  132     speed_set_temp=speed_set+BB_W;//10
??BangBang_0:
        LDR      R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  133        sele=2;
        MOVS     R0,#+2
        MOVS     R4,R0
//  134 }
//  135 if(Circle_Flag>1&&Circle_Flag<4)//处于检测圆环双线状态
??BangBang_1:
        LDR      R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BLT      ??BangBang_2
        LDR      R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+4
        BGE      ??BangBang_2
//  136 {
//  137    speed_set_temp=speed_set+BB_H;//10
        LDR      R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  138       sele=2;
        MOVS     R0,#+2
        MOVS     R4,R0
//  139 }
//  140 /*防止出赛道降速*/
//  141 //if(speed_set>84)
//  142 //{
//  143 //if(abs_f(Chazhi)>75)
//  144 //  speed_set_temp-=10;
//  145 //}
//  146 
//  147 Speed_Error=speed_set_temp-speed_car;
??BangBang_2:
        LDR      R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R7,R0
//  148 switch(sele)
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ      ??BangBang_3
        CMP      R0,#+2
        BEQ      ??BangBang_4
        B        ??BangBang_5
//  149 {
//  150 case 1:
//  151 
//  152     if(Speed_Error>30)//车速大,>30
??BangBang_3:
        MOVS     R0,R7
        LDR      R1,??DataTable3_9  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_6
//  153    {
//  154      Speed_PWM =BB_P_Z*30;//1500
        LDR      R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+30
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_7
//  155    }
//  156     else if(Speed_Error>0)//车速小0-30
??BangBang_6:
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??BangBang_8
//  157    {
//  158     Speed_PWM = Speed_Error*BB_P_Z;
        LDR      R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_7
//  159    }
//  160    else if(Speed_Error>-20)//车速大0->-20
??BangBang_8:
        MOVS     R0,R7
        LDR      R1,??DataTable3_12  ;; 0xc19fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_9
//  161    {
//  162         Speed_PWM = Speed_Error*BB_P_F;
        LDR      R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_7
//  163    }
//  164    else if(Speed_Error>-30)//车速大-20>-30
??BangBang_9:
        MOVS     R0,R7
        LDR      R1,??DataTable3_14  ;; 0xc1efffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_10
//  165    {
//  166        Speed_PWM =-6000;
        LDR      R0,??DataTable3_15  ;; 0xc5bb8000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_7
//  167    }
//  168    else if(Speed_Error>-40)//车速大-30>-40
??BangBang_10:
        MOVS     R0,R7
        LDR      R1,??DataTable3_16  ;; 0xc21fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_11
//  169    {
//  170        Speed_PWM =-7000;
        LDR      R0,??DataTable3_17  ;; 0xc5dac000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_7
//  171    }    
//  172    else //车速大<-40
//  173    {
//  174        Speed_PWM =-8000;
??BangBang_11:
        LDR      R0,??DataTable3_1  ;; 0xc5fa0000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  175    }
//  176 break;
??BangBang_7:
        B        ??BangBang_12
//  177 
//  178 case 2:
//  179  
//  180     
//  181      if(Speed_Error>20)//车速小,20-30
??BangBang_4:
        MOVS     R0,R7
        LDR      R1,??DataTable3_18  ;; 0x41a00001
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_13
//  182    {
//  183      Speed_PWM =BB_P_W*20;//1500
        LDR      R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        MOVS     R1,#+20
        MULS     R0,R1,R0
        BL       __aeabi_i2f
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_14
//  184    }
//  185     else if(Speed_Error>0)//车速小0-20
??BangBang_13:
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??BangBang_15
//  186    {
//  187     Speed_PWM = Speed_Error*BB_P_W;
        LDR      R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_14
//  188 
//  189    }
//  190    else if(Speed_Error>-20)//车速大0->-20
??BangBang_15:
        MOVS     R0,R7
        LDR      R1,??DataTable3_12  ;; 0xc19fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_16
//  191    {
//  192         Speed_PWM = Speed_Error*BB_P_F;
        LDR      R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_14
//  193    }
//  194    else if(Speed_Error>-30)//车速大-20>-30
??BangBang_16:
        MOVS     R0,R7
        LDR      R1,??DataTable3_14  ;; 0xc1efffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_17
//  195    {
//  196        Speed_PWM =-6000;
        LDR      R0,??DataTable3_15  ;; 0xc5bb8000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_14
//  197    }
//  198    else if(Speed_Error>-40)//车速大-30>-40
??BangBang_17:
        MOVS     R0,R7
        LDR      R1,??DataTable3_16  ;; 0xc21fffff
        BL       __aeabi_cfrcmple
        BHI      ??BangBang_18
//  199    {
//  200        Speed_PWM =-7000;
        LDR      R0,??DataTable3_17  ;; 0xc5dac000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
        B        ??BangBang_14
//  201    }    
//  202    else //车速大<-40
//  203    {
//  204        Speed_PWM =-8000;
??BangBang_18:
        LDR      R0,??DataTable3_1  ;; 0xc5fa0000
        LDR      R1,??DataTable3_11
        STR      R0,[R1, #+0]
//  205    }
//  206 break;
??BangBang_14:
        B        ??BangBang_12
//  207   
//  208     default :
//  209         break;
//  210 }   
//  211       
//  212    if(Speed_PWM>Speed_PWM_Max)  Speed_PWM=Speed_PWM_Max;
??BangBang_5:
??BangBang_12:
        MOVS     R0,R5
        LDR      R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??BangBang_19
        LDR      R0,??DataTable3_11
        STR      R5,[R0, #+0]
//  213    if(Speed_PWM<Speed_PWM_Min)  Speed_PWM=Speed_PWM_Min;  
??BangBang_19:
        LDR      R0,??DataTable3_11
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_cfcmple
        BCS      ??BangBang_20
        LDR      R0,??DataTable3_11
        STR      R6,[R0, #+0]
//  214 //  if(Stop_Flag==1)
//  215 //  Speed_PWM=0;
//  216 }
??BangBang_20:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x45fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     StraightRoad_Flag
//  217 /*速度环控制******************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  218 void Controler()
//  219 {
Controler:
        PUSH     {R4-R6,LR}
//  220 float Speed_Error_L_Old=0,Speed_Error_R_Old=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
//  221 
//  222    Speed_Error_L = speed_set_L - speed_L;//重复
        LDR      R0,??DataTable3_20
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_21
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_22
        STR      R0,[R1, #+0]
//  223    Speed_Error_R = speed_set_R - speed_R; 
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_24
        STR      R0,[R1, #+0]
//  224 
//  225    Direction_P_Temp=Direction_P;
        LDR      R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable3_26
        STR      R0,[R1, #+0]
//  226 Control_Output_L=Direction_P_Temp*Speed_Error_L +Speed_I_lntegral_L+Direction_D*(Speed_Error_L-Speed_Error_L_Old)
//  227                  ;
        LDR      R0,??DataTable3_26
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_22
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable3_22
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_29
        STR      R0,[R1, #+0]
//  228 //
//  229 Control_Output_R=Direction_P_Temp*Speed_Error_R +Speed_I_lntegral_R+Direction_D*(Speed_Error_R-Speed_Error_R_Old)
//  230                    ;
        LDR      R0,??DataTable3_26
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable3_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fsub
        LDR      R1,??DataTable3_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable3_31
        STR      R0,[R1, #+0]
//  231 
//  232 
//  233 }
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
        DC32     0xc5fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     BB_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     speed_set_temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     Circle_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x41f00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     BB_P_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     Speed_PWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0xc19fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     BB_P_F

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0xc1efffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0xc5bb8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0xc21fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0xc5dac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x41a00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     BB_P_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     Speed_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     Direction_P_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_27:
        DC32     Speed_I_lntegral_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_28:
        DC32     Direction_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_29:
        DC32     Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_30:
        DC32     Speed_I_lntegral_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_31:
        DC32     Control_Output_R
//  234 
//  235 
//  236 
//  237 
//  238 
//  239 
//  240 
//  241 
//  242 
//  243 
//  244 
//  245 
//  246 
//  247 
//  248 //                               Speed_Error_L_Old    -  Speed_Error_L：为P的作用
//  249 //速度设定100 初始速度0 本次速度50       100-0=100     -  100-50=50    =50*D，加速
//  250 //                    本次速度100             100     -   100-100=0    =100*D,加速
//  251 
//  252 //                                  Speed_Error_L -  Speed_Error_L_Old：为D的作用
//  253 //速度设定100 初始速度0 本次速度50      100-50=50  -   100-0=100       =-50*D,减速
//  254 //速度设定0 初始速度100 本次速度50      0-50=-50   -   0-100=-100       =50*D,加速
//  255 //直道速度=速度设定-10   
//  256 //一个弯道速度=速度设定-40   
//  257 //大弯道速度=速度设定-60       速度设定-30
//  258 //车速小， 正值；车速大，负值 
//  259 //   speed_error=speed_buzzer-speed_car;
//  260 //   K4=50;
//  261 //   Son_SP=speed_error*K4;
//  262 //      if(Son_SP>500)   Son_SP=500;
//  263 //      if(Son_SP<300)   Son_SP=300;
//  264 //   Son_SP=0;
//  265 //Direction_P_Temp=Direction_P+Son_SP;

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  266 uint8 Direction_Control_Period = 0;
Direction_Control_Period:
        DS8 1
//  267 #define DIRECTION_CONTROL_PERIOD 50
//  268 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  269 float P_Direction1=40,D_Direction1=20.5;		//低速
P_Direction1:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction1:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  270 float P_Direction2=40,D_Direction2=20.5;		//中速
P_Direction2:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction2:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  271 float P_Direction3=173,D_Direction3=145.5;		//快速
P_Direction3:
        DATA
        DC32 432D0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction3:
        DATA
        DC32 43118000H
//  272 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  273 float P_Direction = 100,D_Direction = 0;              
P_Direction:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
D_Direction:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  274 float turn_spd = 150;
turn_spd:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  275 float P_Direction_high = 80, P_Direction_low=80;//26
P_Direction_high:
        DATA
        DC32 42A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Direction_low:
        DATA
        DC32 42A00000H
//  276 //float   K =1;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  277 float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
Direction_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  278 float Direction_angle=0.0;
Direction_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  279 float P_Dir_agl=20.0;
P_Dir_agl:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  280 float Road_Err_D=0;		//偏差的微分
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
// 
//   247 bytes in section .bss
//   184 bytes in section .data
// 2 034 bytes in section .text
// 
// 2 034 bytes of CODE memory
//   431 bytes of DATA memory
//
//Errors: none
//Warnings: 18
