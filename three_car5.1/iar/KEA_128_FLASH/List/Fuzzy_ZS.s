///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Fuzzy_ZS.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Fuzzy_ZS.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\Fuzzy_ZS.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Chazhi
        EXTERN Chazhi_Last
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub

        PUBLIC Angle_Fuzzy
        PUBLIC Angle_Grade
        PUBLIC Angle_Grade2
        PUBLIC Angle_Set
        PUBLIC Chazhi_Fuzzy
        PUBLIC Chazhi_Grade
        PUBLIC Chazhi_Rate
        PUBLIC Chazhi_Rate_Fuzzy
        PUBLIC Chazhi_Rate_Grade
        PUBLIC Chazhi_Rate_Set
        PUBLIC Chazhi_Set
        PUBLIC Fuzzy_Control_Direction
        PUBLIC rule
        PUBLIC t1
        PUBLIC t2
        PUBLIC t3
        PUBLIC t4
        PUBLIC temp1
        PUBLIC temp2

// H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\Fuzzy_ZS.c
//    1 #include "Fuzzy_ZS.h"
//    2 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    3 int rule[7][7]={  //角度等级表
rule:
        DATA
        DC32 -3, -3, -3, -2, -1, -1, -1, -3, -3, -2, -2, -1, 0, 1, -2, -2, -1
        DC32 -1, 0, 1, 1, -2, -1, -1, 0, 0, 1, 2, -1, -1, 0, 1, 1, 2, 2, -1, 0
        DC32 1, 1, 2, 3, 3, 0, 1, 1, 2, 3, 3, 3
//    4 // -45  -30 -15  0  15  30  45C_R
//    5 // -3   -2  -1   0   1   2  3   等级    CHa 
//    6 {  -3,  -3, -3, -2, -1, -1,-1 }, //  -3 -45
//    7 {  -3,  -3, -2, -2, -1,  0, 1 }, //  -2 -30  //特征点
//    8 {  -2,  -2, -1, -1,  0,  1, 1 }, //  -1 -15
//    9 {  -2,  -1, -1,  0,  0,  1, 2 }, //   0  0
//   10 {  -1,  -1,  0,  1,  1,  2, 2 }, //   1  15
//   11 {  -1,   0,  1,  1,  2,  3, 3 }, //   2  30
//   12 {   0,   1,  1,  2,  3,  3, 3 }  //   3  45
//   13 };

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int   Angle_Grade[4]={0};//角度等级
Angle_Grade:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 int   Angle_Grade2[4]={0};//角度等级
Angle_Grade2:
        DS8 16
//   16 
//   17 //        角度等级 -3  -2  -3  0 1   2  3

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float Angle_Set[7]={-60,-45,-22.5,0,22.5,45,60};//角度设定/角度特征点
Angle_Set:
        DATA
        DC32 0C2700000H, 0C2340000H, 0C1B40000H, 0H, 41B40000H, 42340000H
        DC32 42700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float Angle_Fuzzy[4]={0};//角度隶属度
Angle_Fuzzy:
        DS8 16
//   20     
//   21 
//   22 // ~-45 -45~-30 -30~-15 -15~0  0~15 15~30 30~45 45~
//   23 //   -3   -3       -2     -1    1     2    3     3

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int   Chazhi_Grade=0;//差值等级
Chazhi_Grade:
        DS8 4
//   25 //                     NB   NM   NS  ZO PS  PM  PB

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 float Chazhi_Set[7]=  {-45, -30, -15, 0, 15, 30, 45};//差值设定
Chazhi_Set:
        DATA
        DC32 0C2340000H, 0C1F00000H, 0C1700000H, 0H, 41700000H, 41F00000H
        DC32 42340000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 float Chazhi_Fuzzy[2]={ 0 ,  0};//差值设定隶属度
Chazhi_Fuzzy:
        DS8 8
//   28 
//   29 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 float Chazhi_Rate=0;
Chazhi_Rate:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 int   Chazhi_Rate_Grade=0;//差值变化率等级
Chazhi_Rate_Grade:
        DS8 4
//   32 //float Chazhi_Rate_Set[7]={-45,-30,-,0,15,30,45,};//差值变化率设定

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   33 float Chazhi_Rate_Set[7]={-90,-70,-40,0,40,70,90,};//差值变化率设定
Chazhi_Rate_Set:
        DATA
        DC32 0C2B40000H, 0C28C0000H, 0C2200000H, 0H, 42200000H, 428C0000H
        DC32 42B40000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 float Chazhi_Rate_Fuzzy[2]={0};//差值变化率隶属度
Chazhi_Rate_Fuzzy:
        DS8 8
//   35 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36 float t1=0,t2=0,t3=0,t4=0,temp1=0,temp2=0;
t1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t4:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
temp1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
temp2:
        DS8 4
//   37 
//   38 
//   39 
//   40 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   41 float Fuzzy_Control_Direction()
//   42 {
Fuzzy_Control_Direction:
        PUSH     {R4,LR}
//   43 // float NB,NM,NS,ZO,PS,PM,PB;
//   44 
//   45 //Chazhi=1.5*Chazhi;
//   46 /***************差值模糊化****************************************************/
//   47  if(Chazhi<Chazhi_Set[0])//Chazhi<-45
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_1
//   48    {
//   49     Chazhi_Fuzzy[0]=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   50     Chazhi_Grade=-2;
        MOVS     R0,#+1
        MVNS     R0,R0            ;; #-2
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   51    }
//   52  else if(Chazhi<Chazhi_Set[1])//-45<Chazhi<-30
??Fuzzy_Control_Direction_1:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_3
//   53   {
//   54     Chazhi_Fuzzy[0]=(Chazhi_Set[1]-Chazhi)/(Chazhi_Set[1]-Chazhi_Set[0]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   55 //    Chazhi_Fuzzy[1]=(Chazhi-Chazhi_Set[0])/(Chazhi_Set[1]-Chazhi_Set[0]);
//   56     Chazhi_Grade=-2;
        MOVS     R0,#+1
        MVNS     R0,R0            ;; #-2
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   57   }
//   58  else if(Chazhi<Chazhi_Set[2])//-30<Chazhi<-15
??Fuzzy_Control_Direction_3:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_4
//   59   {
//   60     Chazhi_Fuzzy[0]=(Chazhi_Set[2]-Chazhi)/(Chazhi_Set[2]-Chazhi_Set[1]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   61 //    Chazhi_Fuzzy[2]=(Chazhi-Chazhi_Set[1])/(Chazhi_Set[2]-Chazhi_Set[1]);
//   62     Chazhi_Grade=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   63   } 
//   64  else if(Chazhi<Chazhi_Set[3])//-15<Chazhi<0
??Fuzzy_Control_Direction_4:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_5
//   65   {
//   66     Chazhi_Fuzzy[0]=(Chazhi_Set[3]-Chazhi)/(Chazhi_Set[3]-Chazhi_Set[2]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   67 //    Chazhi_Fuzzy[3]=(Chazhi-Chazhi_Set[2])/(Chazhi_Set[3]-Chazhi_Set[2]);
//   68     Chazhi_Grade=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   69   }
//   70   else if(Chazhi<Chazhi_Set[4])//0<Chazhi<15
??Fuzzy_Control_Direction_5:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_6
//   71   {
//   72     Chazhi_Fuzzy[0]=(Chazhi_Set[4]-Chazhi)/(Chazhi_Set[4]-Chazhi_Set[3]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   73 //    Chazhi_Fuzzy[4]=(Chazhi-Chazhi_Set[3])/(Chazhi_Set[4]-Chazhi_Set[3]);
//   74     Chazhi_Grade=1;
        MOVS     R0,#+1
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   75   } 
//   76  else if(Chazhi<Chazhi_Set[5])//15<Chazhi<30
??Fuzzy_Control_Direction_6:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+20]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_7
//   77   {
//   78     Chazhi_Fuzzy[0]=(Chazhi_Set[5]-Chazhi)/(Chazhi_Set[5]-Chazhi_Set[4]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+20]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+20]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   79 //    Chazhi_Fuzzy[5]=(Chazhi-Chazhi_Set[4])/(Chazhi_Set[5]-Chazhi_Set[4]);
//   80     Chazhi_Grade=2;
        MOVS     R0,#+2
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   81   }
//   82  else if(Chazhi<Chazhi_Set[6])//30<Chazhi<45
??Fuzzy_Control_Direction_7:
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+24]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_8
//   83   {
//   84     Chazhi_Fuzzy[0]=(Chazhi_Set[6]-Chazhi)/(Chazhi_Set[6]-Chazhi_Set[5]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+24]
        LDR      R1,??Fuzzy_Control_Direction_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x4
        LDR      R0,[R0, #+24]
        LDR      R1,??Fuzzy_Control_Direction_0+0x4
        LDR      R1,[R1, #+20]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   85 //    Chazhi_Fuzzy[6]=(Chazhi-Chazhi_Set[5])/(Chazhi_Set[6]-Chazhi_Set[5]);
//   86     Chazhi_Grade=3;
        MOVS     R0,#+3
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_2
//   87   }
//   88   else //Chazhi>45
//   89   {
//   90     Chazhi_Fuzzy[0]=1;
??Fuzzy_Control_Direction_8:
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+0]
//   91     Chazhi_Grade=3;
        MOVS     R0,#+3
        LDR      R1,??Fuzzy_Control_Direction_0+0xC
        STR      R0,[R1, #+0]
//   92   }
//   93   Chazhi_Fuzzy[1]=1-Chazhi_Fuzzy[0];
??Fuzzy_Control_Direction_2:
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Fuzzy_Control_Direction_0+0x8
        STR      R0,[R1, #+4]
//   94 /*****************************************************************************************/
//   95 
//   96 /***************差值变化率模糊化****************************************************/
//   97 //差值为正:Rate越往正方向大,Angle越大;Rate越往负方向大,Angle越小。
//   98 //差值为负:Rate越往负方向大,Angle越大;Rate越往正方向大,Angle越小。
//   99  Chazhi_Rate=Chazhi-Chazhi_Last;
        LDR      R0,??Fuzzy_Control_Direction_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        STR      R0,[R1, #+0]
//  100 
//  101  if(Chazhi_Rate<Chazhi_Rate_Set[0])//Chazhi_Rate<-45
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_9
//  102    {
//  103     Chazhi_Rate_Fuzzy[0]=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  104     Chazhi_Rate_Grade=-2;
        MOVS     R0,#+1
        MVNS     R0,R0            ;; #-2
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  105    }
//  106  else if(Chazhi_Rate<Chazhi_Rate_Set[1])//-45<Chazhi_Rate<-30
??Fuzzy_Control_Direction_9:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_12
//  107   {
//  108     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[1]-Chazhi_Rate)/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  109     Chazhi_Rate_Grade=-2;
        MOVS     R0,#+1
        MVNS     R0,R0            ;; #-2
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  110   }
//  111  else if(Chazhi_Rate<Chazhi_Rate_Set[2])//-30<Chazhi_Rate<-15
??Fuzzy_Control_Direction_12:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_13
//  112   {
//  113     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[2]-Chazhi_Rate)/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  114     Chazhi_Rate_Grade=-1;
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  115   } 
//  116  else if(Chazhi_Rate<Chazhi_Rate_Set[3])//-15<Chazhi_Rate<0
??Fuzzy_Control_Direction_13:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_14
//  117   {
//  118     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[3]-Chazhi_Rate)/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  119     Chazhi_Rate_Grade=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  120   }
//  121   else if(Chazhi_Rate<Chazhi_Rate_Set[4])//0<Chazhi_Rate<15
??Fuzzy_Control_Direction_14:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_15
//  122   {
//  123     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[4]-Chazhi_Rate)/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  124     Chazhi_Rate_Grade=1;
        MOVS     R0,#+1
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  125   } 
//  126  else if(Chazhi_Rate<Chazhi_Rate_Set[5])//15<Chazhi_Rate<30
??Fuzzy_Control_Direction_15:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+20]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_16
//  127   {
//  128     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[5]-Chazhi_Rate)/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+20]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+20]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  129     Chazhi_Rate_Grade=2;
        MOVS     R0,#+2
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
//  130   }
//  131  else if(Chazhi_Rate<Chazhi_Rate_Set[6])//30<Chazhi_Rate<45
??Fuzzy_Control_Direction_16:
        LDR      R0,??Fuzzy_Control_Direction_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+24]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_17
//  132   {
//  133     Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[6]-Chazhi_Rate)/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+24]
        LDR      R1,??Fuzzy_Control_Direction_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Control_Direction_0+0x18
        LDR      R0,[R0, #+24]
        LDR      R1,??Fuzzy_Control_Direction_0+0x18
        LDR      R1,[R1, #+20]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  134     Chazhi_Rate_Grade=3;
        MOVS     R0,#+3
        LDR      R1,??Fuzzy_Control_Direction_0+0x1C
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_11
        DATA
??Fuzzy_Control_Direction_0:
        DC32     Chazhi
        DC32     Chazhi_Set
        DC32     Chazhi_Fuzzy
        DC32     Chazhi_Grade
        DC32     Chazhi_Last
        DC32     Chazhi_Rate
        DC32     Chazhi_Rate_Set
        DC32     Chazhi_Rate_Grade
        THUMB
//  135   }
//  136   else //Chazhi_Rate>45
//  137   {
//  138     Chazhi_Rate_Fuzzy[0]=1;
??Fuzzy_Control_Direction_17:
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+0]
//  139     Chazhi_Rate_Grade=3;
        MOVS     R0,#+3
        LDR      R1,??Fuzzy_Control_Direction_18
        STR      R0,[R1, #+0]
//  140   }
//  141   Chazhi_Rate_Fuzzy[1]=1-Chazhi_Rate_Fuzzy[0];
??Fuzzy_Control_Direction_11:
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??Fuzzy_Control_Direction_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Fuzzy_Control_Direction_10
        STR      R0,[R1, #+4]
//  142 /*****************************************************************************************/
//  143 
//  144  /*使用误差范围优化后的规则表rule[7][7]*/ 
//  145  /*输出值使用13个隶属函数,中心值由UFF[7]指定*/ 
//  146  /*一般都是四个规则有效*/ 
//  147 //int rule[7][7]={  //角度等级表
//  148 //// -45  -30 -154 0  15  30  45C_R
//  149 //// -3   -2  -1   0   1   2  3   等级    CHa 
//  150 
//  151 //{  -3,  -3, -3, -2, -1, -1,-1 }, //  -3 -45
//  152 //{  -3,  -3, -2, -2, -1,  0, 1 }, //  -2 -30  //特征点
//  153 //{  -2,  -2, -1, -1,  0,  1, 1 }, //  -1 -15
//  154 //{  -2,  -1, -1,  0,  0,  1, 2 }, //   0  0
//  155 //{  -1,  -1,  0,  1,  1,  2, 2 }, //   1  15
//  156 //{  -1,   0,  1,  1,  2,  3, 3 }, //   2  30
//  157 //{   0,   1,  1,  2,  3,  3, 3 }  //   3  45
//  158 //}//2.
//  159   
//  160 Angle_Grade[0]=rule[Chazhi_Grade-1+3][Chazhi_Rate_Grade-1+3]; //角度=精确点
        LDR      R0,??Fuzzy_Control_Direction_18+0x4
        LDR      R1,??Fuzzy_Control_Direction_18+0x8
        LDR      R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??Fuzzy_Control_Direction_18
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+64]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        STR      R0,[R1, #+0]
//  161 Angle_Grade[1]=rule[Chazhi_Grade+3][Chazhi_Rate_Grade-1+3]; 
        LDR      R0,??Fuzzy_Control_Direction_18+0x4
        LDR      R1,??Fuzzy_Control_Direction_18+0x8
        LDR      R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??Fuzzy_Control_Direction_18
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+92]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        STR      R0,[R1, #+4]
//  162 Angle_Grade[2]=rule[Chazhi_Grade-1+3][Chazhi_Rate_Grade+3]; 
        LDR      R0,??Fuzzy_Control_Direction_18+0x4
        LDR      R1,??Fuzzy_Control_Direction_18+0x8
        LDR      R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??Fuzzy_Control_Direction_18
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+68]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        STR      R0,[R1, #+8]
//  163 Angle_Grade[3]=rule[Chazhi_Grade+3][Chazhi_Rate_Grade+3]; 
        LDR      R0,??Fuzzy_Control_Direction_18+0x4
        LDR      R1,??Fuzzy_Control_Direction_18+0x8
        LDR      R1,[R1, #+0]
        MOVS     R2,#+28
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??Fuzzy_Control_Direction_18
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+96]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        STR      R0,[R1, #+12]
//  164 
//  165 //Angle_Grade[0]=rule[Chazhi_Grade-1+4][Chazhi_Rate_Grade-1+4]; //角度=精确点
//  166 //Angle_Grade[1]=rule[Chazhi_Grade+4][Chazhi_Rate_Grade-1+4]; 
//  167 //Angle_Grade[2]=rule[Chazhi_Grade-1+4][Chazhi_Rate_Grade+4]; 
//  168 //Angle_Grade[3]=rule[Chazhi_Grade+4][Chazhi_Rate_Grade+4]; 
//  169 
//  170  
//  171  if(Chazhi_Fuzzy[0]<=Chazhi_Rate_Fuzzy[0])    //求小   差值，差值变化率隶属度比较
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x10
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfrcmple
        BHI      ??Fuzzy_Control_Direction_19
//  172   Angle_Fuzzy[0]=Chazhi_Fuzzy[0];        //      角度隶属度=小的隶属度
        LDR      R0,??Fuzzy_Control_Direction_18+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+0]
        B        ??Fuzzy_Control_Direction_20
//  173  else
//  174   Angle_Fuzzy[0]=Chazhi_Rate_Fuzzy[0];
??Fuzzy_Control_Direction_19:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+0]
//  175  
//  176  if(Chazhi_Fuzzy[1]<=Chazhi_Rate_Fuzzy[0])
??Fuzzy_Control_Direction_20:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x10
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfrcmple
        BHI      ??Fuzzy_Control_Direction_21
//  177   Angle_Fuzzy[1]=Chazhi_Fuzzy[1];
        LDR      R0,??Fuzzy_Control_Direction_18+0x10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+4]
        B        ??Fuzzy_Control_Direction_22
//  178  else
//  179   Angle_Fuzzy[1]=Chazhi_Rate_Fuzzy[0];
??Fuzzy_Control_Direction_21:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+4]
//  180  
//  181  if(Chazhi_Fuzzy[0]<=Chazhi_Rate_Fuzzy[1])
??Fuzzy_Control_Direction_22:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x10
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfrcmple
        BHI      ??Fuzzy_Control_Direction_23
//  182   Angle_Fuzzy[2]=Chazhi_Fuzzy[0];
        LDR      R0,??Fuzzy_Control_Direction_18+0x10
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+8]
        B        ??Fuzzy_Control_Direction_24
//  183  else
//  184   Angle_Fuzzy[2]=Chazhi_Rate_Fuzzy[1];
??Fuzzy_Control_Direction_23:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+8]
//  185  
//  186  if(Chazhi_Fuzzy[1]<=Chazhi_Rate_Fuzzy[1])
??Fuzzy_Control_Direction_24:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x10
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfrcmple
        BHI      ??Fuzzy_Control_Direction_25
//  187   Angle_Fuzzy[3]=Chazhi_Fuzzy[1];
        LDR      R0,??Fuzzy_Control_Direction_18+0x10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+12]
        B        ??Fuzzy_Control_Direction_26
//  188  else
//  189   Angle_Fuzzy[3]=Chazhi_Rate_Fuzzy[1];
??Fuzzy_Control_Direction_25:
        LDR      R0,??Fuzzy_Control_Direction_10
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+12]
//  190 
//  191  /*同隶属函数输出语言值求大*/ 
//  192  if(Angle_Grade[0]==Angle_Grade[1]) //精确点 角度==角度
??Fuzzy_Control_Direction_26:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_27
//  193  {
//  194    if(Angle_Fuzzy[0]>Angle_Fuzzy[1])   //隶属度比较:消灭小的
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_28
//  195   Angle_Fuzzy[1]=0;          //
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+4]
        B        ??Fuzzy_Control_Direction_27
//  196   else
//  197   Angle_Fuzzy[0]=0;
??Fuzzy_Control_Direction_28:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+0]
//  198  }
//  199  
//  200  if(Angle_Grade[0]==Angle_Grade[2])
??Fuzzy_Control_Direction_27:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        LDR      R1,[R1, #+8]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_29
//  201  {
//  202   if(Angle_Fuzzy[0]>Angle_Fuzzy[2])
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_30
//  203   Angle_Fuzzy[2]=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+8]
        B        ??Fuzzy_Control_Direction_29
//  204   else
//  205   Angle_Fuzzy[0]=0;
??Fuzzy_Control_Direction_30:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+0]
//  206  }
//  207  
//  208  if(Angle_Grade[0]==Angle_Grade[3])
??Fuzzy_Control_Direction_29:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_31
//  209  {
//  210   if(Angle_Fuzzy[0]>Angle_Fuzzy[3])
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_32
//  211   Angle_Fuzzy[3]=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+12]
        B        ??Fuzzy_Control_Direction_31
//  212   else
//  213   Angle_Fuzzy[0]=0;
??Fuzzy_Control_Direction_32:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+0]
//  214  }
//  215  
//  216  if(Angle_Grade[1]==Angle_Grade[2])
??Fuzzy_Control_Direction_31:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        B.N      ??Fuzzy_Control_Direction_33
        Nop      
        DATA
??Fuzzy_Control_Direction_10:
        DC32     Chazhi_Rate_Fuzzy
        THUMB
??Fuzzy_Control_Direction_33:
        LDR      R1,[R1, #+8]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_34
//  217  {
//  218   if(Angle_Fuzzy[1]>Angle_Fuzzy[2])
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_35
//  219   Angle_Fuzzy[2]=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+8]
        B        ??Fuzzy_Control_Direction_34
//  220   else
//  221   Angle_Fuzzy[1]=0;
??Fuzzy_Control_Direction_35:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+4]
//  222  }
//  223  
//  224  if(Angle_Grade[1]==Angle_Grade[3])
??Fuzzy_Control_Direction_34:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_36
//  225  {
//  226   if(Angle_Fuzzy[1]>Angle_Fuzzy[3])
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_37
//  227   Angle_Fuzzy[3]=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+12]
        B        ??Fuzzy_Control_Direction_36
//  228   else
//  229   Angle_Fuzzy[1]=0;
??Fuzzy_Control_Direction_37:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+4]
//  230  } 
//  231  
//  232  if(Angle_Grade[2]==Angle_Grade[3])
??Fuzzy_Control_Direction_36:
        LDR      R0,??Fuzzy_Control_Direction_18+0xC
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BNE      ??Fuzzy_Control_Direction_38
//  233  {
//  234   if(Angle_Fuzzy[2]>Angle_Fuzzy[3])
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Control_Direction_39
//  235   Angle_Fuzzy[3]=0;
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+12]
        B        ??Fuzzy_Control_Direction_38
//  236   else
//  237   Angle_Fuzzy[2]=0;
??Fuzzy_Control_Direction_39:
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        STR      R0,[R1, #+8]
//  238  }
//  239  for(int i=0;i<4;i++)
??Fuzzy_Control_Direction_38:
        MOVS     R0,#+0
??Fuzzy_Control_Direction_40:
        CMP      R0,#+4
        BGE      ??Fuzzy_Control_Direction_41
//  240  {
//  241     Angle_Grade2[i]=Angle_Grade[i]+3;
        LDR      R1,??Fuzzy_Control_Direction_18+0xC
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R1,[R1, R2]
        ADDS     R1,R1,#+3
        LDR      R2,??Fuzzy_Control_Direction_18+0x18
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  242  }
        ADDS     R0,R0,#+1
        B        ??Fuzzy_Control_Direction_40
//  243  //角度输出量=隶属度*特征点【精确点/等级】
//  244  t1=Angle_Fuzzy[0]*Angle_Set[Angle_Grade2[0]];  
??Fuzzy_Control_Direction_41:
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??Fuzzy_Control_Direction_18+0x1C
        LDR      R2,??Fuzzy_Control_Direction_18+0x18
        LDR      R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fmul
        LDR      R1,??Fuzzy_Control_Direction_18+0x20
        STR      R0,[R1, #+0]
//  245  t2=Angle_Fuzzy[1]*Angle_Set[Angle_Grade2[1]];
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R0, #+4]
        LDR      R0,??Fuzzy_Control_Direction_18+0x1C
        LDR      R2,??Fuzzy_Control_Direction_18+0x18
        LDR      R2,[R2, #+4]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fmul
        LDR      R1,??Fuzzy_Control_Direction_18+0x24
        STR      R0,[R1, #+0]
//  246  t3=Angle_Fuzzy[2]*Angle_Set[Angle_Grade2[2]];
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R0, #+8]
        LDR      R0,??Fuzzy_Control_Direction_18+0x1C
        LDR      R2,??Fuzzy_Control_Direction_18+0x18
        LDR      R2,[R2, #+8]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fmul
        LDR      R1,??Fuzzy_Control_Direction_18+0x28
        STR      R0,[R1, #+0]
//  247  t4=Angle_Fuzzy[3]*Angle_Set[Angle_Grade2[3]];
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R0, #+12]
        LDR      R0,??Fuzzy_Control_Direction_18+0x1C
        LDR      R2,??Fuzzy_Control_Direction_18+0x18
        LDR      R2,[R2, #+12]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fmul
        LDR      R1,??Fuzzy_Control_Direction_18+0x2C
        STR      R0,[R1, #+0]
//  248  temp1=t1+t2+t3+t4;
        LDR      R0,??Fuzzy_Control_Direction_18+0x20
        LDR      R1,[R0, #+0]
        LDR      R0,??Fuzzy_Control_Direction_18+0x24
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x2C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x30
        STR      R0,[R1, #+0]
//  249  temp2=Angle_Fuzzy[0]+Angle_Fuzzy[1]+Angle_Fuzzy[2]+Angle_Fuzzy[3];//模糊量输出//隶属度相加
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R0, #+0]
        LDR      R0,??Fuzzy_Control_Direction_18+0x14
        LDR      R0,[R0, #+4]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x14
        LDR      R1,[R1, #+12]
        BL       __aeabi_fadd
        LDR      R1,??Fuzzy_Control_Direction_18+0x34
        STR      R0,[R1, #+0]
//  250 // angle=temp1/temp2;
//  251 // return angle;
//  252   return temp1/temp2; 
        LDR      R0,??Fuzzy_Control_Direction_18+0x30
        LDR      R0,[R0, #+0]
        LDR      R1,??Fuzzy_Control_Direction_18+0x34
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        POP      {R4,PC}          ;; return
        DATA
??Fuzzy_Control_Direction_18:
        DC32     Chazhi_Rate_Grade
        DC32     rule
        DC32     Chazhi_Grade
        DC32     Angle_Grade
        DC32     Chazhi_Fuzzy
        DC32     Angle_Fuzzy
        DC32     Angle_Grade2
        DC32     Angle_Set
        DC32     t1
        DC32     t2
        DC32     t3
        DC32     t4
        DC32     temp1
        DC32     temp2
//  253 
//  254 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  255 
//  256 
//  257 
//  258 
//  259 
//  260 
//  261 
//  262 
//  263 
//  264 
//  265 
//  266 
//  267 
//  268 
//  269 
//  270 
//  271 
//  272 
//  273 /*
//  274 /void Fuzzy_Control_Direction()
//  275 //{
//  276 //
//  277 ////  Angle[]={-60,60};
//  278 //
//  279 //// float NB,NM,NS,ZO,PS,PM,PB;
//  280 //  
//  281 //  
//  282 //  
//  283 //  
//  284 //// ~-45 -45~-30 -30~-15 -15~0  0~15 15~30 30~45 45~
//  285 ////   -3   -3       -2     -1    1     2    3     3
//  286 //int   Chazhi_Grade=0;//差值等级
//  287 ////                     NB   NM   NS  ZO PS  PM  PB
//  288 //float Chazhi_Set[]=  {-45, -30, -15, 0, 15, 30, 45};//差值设定
//  289 ////                     0     1   2   3   4   5   6
//  290 //float Chazhi_Fuzzy[]={ 0 ,  0,   0,  0,  0,  0,  0};//差值设定隶属度
//  291 //
//  292 //int   Chazhi_Rate_Grade=0;//差值变化率等级
//  293 //float Chazhi_Rate_Set[]={-45,-30,-15,0,15,30,45,};//差值变化率设定
//  294 //float Chazhi_Rate_Fuzzy[]={0};//差值变化率隶属度*/
//  295 /***************差值模糊化****************************************************/
//  296 /* if(Chazhi<Chazhi_Set[0])//Chazhi<-45
//  297 //   {
//  298 //    Chazhi_Fuzzy[0]=1;
//  299 //    Chazhi_Grade=-3;
//  300 //   }
//  301 // else if(Chazhi<Chazhi_Set[1])//-45<Chazhi<-30
//  302 //  {
//  303 //    Chazhi_Fuzzy[0]=(Chazhi_Set[1]-Chazhi)/(Chazhi_Set[1]-Chazhi_Set[0]);
//  304 //    Chazhi_Fuzzy[1]=(Chazhi-Chazhi_Set[0])/(Chazhi_Set[1]-Chazhi_Set[0]);
//  305 //    Chazhi_Grade=-3;
//  306 //  }
//  307 // else if(Chazhi<Chazhi_Set[2])//-30<Chazhi<-15
//  308 //  {
//  309 //    Chazhi_Fuzzy[1]=(Chazhi_Set[2]-Chazhi)/(Chazhi_Set[2]-Chazhi_Set[1]);
//  310 //    Chazhi_Fuzzy[2]=(Chazhi-Chazhi_Set[1])/(Chazhi_Set[2]-Chazhi_Set[1]);
//  311 //    Chazhi_Grade=-2;
//  312 //  } 
//  313 // else if(Chazhi<Chazhi_Set[3])//-15<Chazhi<0
//  314 //  {
//  315 //    Chazhi_Fuzzy[2]=(Chazhi_Set[3]-Chazhi)/(Chazhi_Set[3]-Chazhi_Set[2]);
//  316 //    Chazhi_Fuzzy[3]=(Chazhi-Chazhi_Set[2])/(Chazhi_Set[3]-Chazhi_Set[2]);
//  317 //    Chazhi_Grade=-1;
//  318 //  }
//  319 //  else if(Chazhi<Chazhi_Set[4])//0<Chazhi<15
//  320 //  {
//  321 //    Chazhi_Fuzzy[3]=(Chazhi_Set[4]-Chazhi)/(Chazhi_Set[4]-Chazhi_Set[3]);
//  322 //    Chazhi_Fuzzy[4]=(Chazhi-Chazhi_Set[3])/(Chazhi_Set[4]-Chazhi_Set[3]);
//  323 //    Chazhi_Grade=1;
//  324 //  } 
//  325 // else if(Chazhi<Chazhi_Set[5])//15<Chazhi<30
//  326 //  {
//  327 //    Chazhi_Fuzzy[4]=(Chazhi_Set[5]-Chazhi)/(Chazhi_Set[5]-Chazhi_Set[4]);
//  328 //    Chazhi_Fuzzy[5]=(Chazhi-Chazhi_Set[4])/(Chazhi_Set[5]-Chazhi_Set[4]);
//  329 //    Chazhi_Grade=2;
//  330 //  }
//  331 // else if(Chazhi<Chazhi_Set[6])//30<Chazhi<45
//  332 //  {
//  333 //    Chazhi_Fuzzy[5]=(Chazhi_Set[6]-Chazhi)/(Chazhi_Set[6]-Chazhi_Set[5]);
//  334 //    Chazhi_Fuzzy[6]=(Chazhi-Chazhi_Set[5])/(Chazhi_Set[6]-Chazhi_Set[5]);
//  335 //    Chazhi_Grade=3;
//  336 //  }
//  337 //  else //Chazhi>45
//  338 //  {
//  339 //    Chazhi_Fuzzy[6]=1;
//  340 //    Chazhi_Grade=3;
//  341 //  }*/
//  342 /*****************************************************************************************/
//  343 
//  344 /***************差值变化率模糊化****************************************************/
//  345 /*///差值为正:Rate越往正方向大,Angle越大;Rate越往负方向大,Angle越小。
//  346 ////差值为负:Rate越往负方向大,Angle越大;Rate越往正方向大,Angle越小。
//  347 // Chazhi_Rate=Chazhi-Chazhi_Last;
//  348 //
//  349 // if(Chazhi_Rate<Chazhi_Rate_Set[0])//Chazhi_Rate<-45
//  350 //   {
//  351 //    Chazhi_Rate_Fuzzy[0]=1;
//  352 //    Chazhi_Rate_Grade=-3;
//  353 //   }
//  354 // else if(Chazhi_Rate_<Chazhi_Rate_Set[1])//-45<Chazhi_Rate<-30
//  355 //  {
//  356 //    Chazhi_Rate_Fuzzy[0]=(Chazhi_Rate_Set[1]-Chazhi_Rate)/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
//  357 //    Chazhi_Rate_Fuzzy[1]=(Chazhi_Rate-Chazhi_Rate_Set[0])/(Chazhi_Rate_Set[1]-Chazhi_Rate_Set[0]);
//  358 //    Chazhi_Rate_Grade=-3;
//  359 //  }
//  360 // else if(Chazhi_Rate<Chazhi_Rate_Set[2])//-30<Chazhi_Rate<-15
//  361 //  {
//  362 //    Chazhi_Rate_Fuzzy[1]=(Chazhi_Rate_Set[2]-Chazhi_Rate)/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
//  363 //    Chazhi_Rate_Fuzzy[2]=(Chazhi_Rate-Chazhi_Rate_Set[1])/(Chazhi_Rate_Set[2]-Chazhi_Rate_Set[1]);
//  364 //    Chazhi_Rate_Grade=-2;
//  365 //  } 
//  366 // else if(Chazhi_Rate<Chazhi_Rate_Set[3])//-15<Chazhi_Rate<0
//  367 //  {
//  368 //    Chazhi_Rate_Fuzzy[2]=(Chazhi_Rate_Set[3]-Chazhi_Rate)/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
//  369 //    Chazhi_Rate_Fuzzy[3]=(Chazhi_Rate-Chazhi_Rate_Set[2])/(Chazhi_Rate_Set[3]-Chazhi_Rate_Set[2]);
//  370 //    Chazhi_Rate_Grade=-1;
//  371 //  }
//  372 //  else if(Chazhi_Rate<Chazhi_Rate_Set[4])//0<Chazhi_Rate<15
//  373 //  {
//  374 //    Chazhi_Rate_Fuzzy[3]=(Chazhi_Rate_Set[4]-Chazhi_Rate)/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
//  375 //    Chazhi_Rate_Fuzzy[4]=(Chazhi_Rate-Chazhi_Rate_Set[3])/(Chazhi_Rate_Set[4]-Chazhi_Rate_Set[3]);
//  376 //    Chazhi_Rate_Grade=1;
//  377 //  } 
//  378 // else if(Chazhi_Rate<Chazhi_Rate_Set[5])//15<Chazhi_Rate<30
//  379 //  {
//  380 //    Chazhi_Rate_Fuzzy[4]=(Chazhi_Rate_Set[5]-Chazhi_Rate)/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
//  381 //    Chazhi_Rate_Fuzzy[5]=(Chazhi_Rate-Chazhi_Rate_Set[4])/(Chazhi_Rate_Set[5]-Chazhi_Rate_Set[4]);
//  382 //    Chazhi_Rate_Grade=2;
//  383 //  }
//  384 // else if(Chazhi_Rate<Chazhi_Rate_Set[6])//30<Chazhi_Rate<45
//  385 //  {
//  386 //    Chazhi_Rate_Fuzzy[5]=(Chazhi_Rate_Set[6]-Chazhi_Rate)/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
//  387 //    Chazhi_Rate_Fuzzy[6]=(Chazhi_Rate-Chazhi_Rate_Set[5])/(Chazhi_Rate_Set[6]-Chazhi_Rate_Set[5]);
//  388 //    Chazhi_Rate_Grade=3;
//  389 //  }
//  390 //  else //Chazhi_Rate>45
//  391 //  {
//  392 //    Chazhi_Rate_Fuzzy[6]=1;
//  393 //    Chazhi_Rate_Grade=3;
//  394 //  }*/
//  395 /*****************************************************************************************/
//  396 
// 
//   100 bytes in section .bss
//   280 bytes in section .data
// 1 648 bytes in section .text
// 
// 1 648 bytes of CODE memory
//   380 bytes of DATA memory
//
//Errors: none
//Warnings: none
