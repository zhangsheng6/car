///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       31/Jul/2018  01:16:48
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Boma_zs.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Boma_zs.c -D IAR -D
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
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\Boma_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_P
        EXTERN Angle_P_Change
        EXTERN BB_H
        EXTERN BB_P_F
        EXTERN BB_P_W
        EXTERN BB_P_Z
        EXTERN BB_W
        EXTERN BB_Z
        EXTERN Circle_Chazhi
        EXTERN Circle_Count6_Max
        EXTERN Circle_Finish_Count_Max
        EXTERN Circle_Inductor_LR1
        EXTERN Circle_Inductor_M1
        EXTERN Circle_Inductor_M2
        EXTERN Circle_Inductor_M3
        EXTERN Direction_D2
        EXTERN Direction_P
        EXTERN Direction_P2
        EXTERN Direction_P2_Change
        EXTERN GpioGet
        EXTERN akmj_w
        EXTERN akmj_z
        EXTERN angle_limit
        EXTERN speed_set

        PUBLIC BO_Scan
        PUBLIC Boma_Change
        PUBLIC Boma_Gear_ZS
        PUBLIC Boma_num
        PUBLIC Boma_num_old
        PUBLIC Flag

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\Boma_zs.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 #include  "Boma_zs.h"
//    5 extern int Boma_num;
//    6 extern int  Direction_P2_Change,Angle_P_Change;  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 uint8 BO_Scan(void)
//    8 {
BO_Scan:
        PUSH     {R4,LR}
//    9     uint8 num = 0;
        MOVS     R4,#+0
//   10 
//   11     if (GpioGet(KEY_BO_0) == UP)    num |= ((uint8)(1<<3));//num |= 1000
        MOVS     R0,#+43
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_0
        MOVS     R0,R4
        MOVS     R4,#+8
        ORRS     R4,R4,R0
//   12     if (GpioGet(KEY_BO_1) == UP)    num |= ((uint8)(1<<2));//num |= 0100
??BO_Scan_0:
        MOVS     R0,#+56
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_1
        MOVS     R0,R4
        MOVS     R4,#+4
        ORRS     R4,R4,R0
//   13     if (GpioGet(KEY_BO_2) == UP)    num |= ((uint8)(1<<1));//num |= 0010
??BO_Scan_1:
        MOVS     R0,#+57
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_2
        MOVS     R0,R4
        MOVS     R4,#+2
        ORRS     R4,R4,R0
//   14     if (GpioGet(KEY_BO_3) == UP)    num |= ((uint8)(1<<0));//num |= 0000
??BO_Scan_2:
        MOVS     R0,#+64
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??BO_Scan_3
        MOVS     R0,R4
        MOVS     R4,#+1
        ORRS     R4,R4,R0
//   15 
//   16     return num;
??BO_Scan_3:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return
//   17 }
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19 uint8 Flag=0;
Flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int Boma_num=0,Boma_num_old=0;
Boma_num:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Boma_num_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int Boma_Change=0;
Boma_Change:
        DS8 4
//   22 /*拨码开关程序*****************************************************************************************--*/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   23 void Boma_Gear_ZS(void)
//   24 {
Boma_Gear_ZS:
        PUSH     {R7,LR}
//   25   Boma_num_old=Boma_num;
        LDR      R0,??Boma_Gear_ZS_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Boma_Gear_ZS_0+0x4
        STR      R0,[R1, #+0]
//   26   Boma_num=BO_Scan();
        BL       BO_Scan
        LDR      R1,??Boma_Gear_ZS_0
        STR      R0,[R1, #+0]
//   27   if(Boma_num_old==Boma_num)
        LDR      R0,??Boma_Gear_ZS_0+0x4
        LDR      R0,[R0, #+0]
        LDR      R1,??Boma_Gear_ZS_0
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??Boma_Gear_ZS_1
//   28     Boma_Change=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x8
        STR      R0,[R1, #+0]
        B        ??Boma_Gear_ZS_2
//   29   else
//   30     Boma_Change=1;
??Boma_Gear_ZS_1:
        MOVS     R0,#+1
        LDR      R1,??Boma_Gear_ZS_0+0x8
        STR      R0,[R1, #+0]
//   31  switch(BO_Scan())
??Boma_Gear_ZS_2:
        BL       BO_Scan
        CMP      R0,#+1
        BEQ      ??Boma_Gear_ZS_3
        BCS      .+4
        B        ??Boma_Gear_ZS_4
        CMP      R0,#+3
        BNE      .+4
        B        ??Boma_Gear_ZS_5
        BCC      ??Boma_Gear_ZS_6
        CMP      R0,#+5
        BNE      .+4
        B        ??Boma_Gear_ZS_7
        BCS      .+4
        B        ??Boma_Gear_ZS_8
        CMP      R0,#+6
        BNE      .+4
        B        ??Boma_Gear_ZS_9
        B        ??Boma_Gear_ZS_4
//   32  {
//   33 /*----------------------------------------------------------*/
//   34 //   case 0:
//   35 //      if(Flag!=0)
//   36 //     {
//   37 //     OLED_Clear();
//   38 //     OLED_Biaoge_ZS();//表格，静态
//   39 //     Flag=0;
//   40 //     }
//   41 //     OLED_Key_ZS();//按键改参数
//   42 //     if (KEY_sta)
//   43 //     {
//   44 //        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//   45 //        {
//   46 //            OLED_Select_ZS();
//   47 //            KEY_menuChange = !KEY_menuChange;
//   48 //        }
//   49 //        Oled_Data_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
//   50 //        KEY_sta = !KEY_sta;             
//   51 //    }   
//   52 //     break;
//   53 /*   
//   54 打角参数
//   55 Direction_P2  Direction_D2   
//   56 Angle_P 
//   57 Direction_P2_Change  Angle_P_Change; 
//   58    
//   59 速度参数
//   60 直道P:BB_P_Z 弯道P:BB_P_Z  
//   61  BB_W- BB_H-
//   62    
//   63 环岛参数 7个    
//   64 */        
//   65 /*----------------------------------------------------------*/
//   66    case 1:
//   67      if(Flag!=1)
??Boma_Gear_ZS_3:
        LDR      R0,??Boma_Gear_ZS_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??Boma_Gear_ZS_10
//   68 {
//   69      speed_set  = 70;//速度设定 
        LDR      R0,??Boma_Gear_ZS_0+0x10  ;; 0x428c0000
        LDR      R1,??Boma_Gear_ZS_0+0x14
        STR      R0,[R1, #+0]
//   70 /*打角参数*/    
//   71      Direction_P2=100;  Direction_D2=-300; //差值PD                               
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x1C
        STR      R0,[R1, #+0]
        LDR      R0,??Boma_Gear_ZS_0+0x20  ;; 0xc3960000
        LDR      R1,??Boma_Gear_ZS_0+0x24
        STR      R0,[R1, #+0]
//   72      Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x28
        STR      R0,[R1, #+0]
//   73      Direction_P2_Change=0;   Angle_P_Change=0; 
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x2C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x30
        STR      R0,[R1, #+0]
//   74 /*速度参数  */ 
//   75      BB_P_Z=50;  BB_P_W=50;
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x34
        STR      R0,[R1, #+0]
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x38
        STR      R0,[R1, #+0]
//   76      BB_W=0;     BB_H=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x3C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x40
        STR      R0,[R1, #+0]
//   77 /*环岛参数  */    
//   78      Circle_Chazhi=90;    
        MOVS     R0,#+90
        LDR      R1,??Boma_Gear_ZS_0+0x44
        STR      R0,[R1, #+0]
//   79      Circle_Finish_Count_Max=200;//强制打角时间
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x48
        STR      R0,[R1, #+0]
//   80      Circle_Count6_Max=2000;//下次圆环间隔时间1S1000
        MOVS     R0,#+250
        LSLS     R0,R0,#+3        ;; #+2000
        LDR      R1,??Boma_Gear_ZS_0+0x4C
        STR      R0,[R1, #+0]
//   81      Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x50
        STR      R0,[R1, #+0]
//   82      Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??Boma_Gear_ZS_0+0x54
        STR      R0,[R1, #+0]
//   83      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??Boma_Gear_ZS_0+0x58
        STR      R0,[R1, #+0]
//   84      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??Boma_Gear_ZS_0+0x5C
        STR      R0,[R1, #+0]
//   85  /*暂定不调参数  */ 
//   86      Direction_P=100;    //阿克曼角P                     
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x60
        STR      R0,[R1, #+0]
//   87      akmj_w=0;//阿克曼角
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x64
        STR      R0,[R1, #+0]
//   88      angle_limit=60;  //0,     
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x68  ;; 0x404e0000
        LDR      R2,??Boma_Gear_ZS_0+0x6C
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//   89      akmj_z=0;   
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x70
        STR      R0,[R1, #+0]
//   90      BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x74
        STR      R0,[R1, #+0]
//   91      BB_P_F=200;
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x78
        STR      R0,[R1, #+0]
//   92 
//   93      Flag=1;
        MOVS     R0,#+1
        LDR      R1,??Boma_Gear_ZS_0+0xC
        STRB     R0,[R1, #+0]
//   94 }
//   95     break; 
??Boma_Gear_ZS_10:
        B        ??Boma_Gear_ZS_11
//   96 /*----------------------------------------------------------*/     
//   97 
//   98     case 2:
//   99        if(Flag!=2)
??Boma_Gear_ZS_6:
        LDR      R0,??Boma_Gear_ZS_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??Boma_Gear_ZS_12
//  100 {
//  101      speed_set  = 75;    //速度设定
        LDR      R0,??Boma_Gear_ZS_13  ;; 0x42960000
        LDR      R1,??Boma_Gear_ZS_0+0x14
        STR      R0,[R1, #+0]
//  102 /*打角参数*/  
//  103      Direction_P2=150;      Direction_D2=-300; //差值PD                        
        LDR      R0,??Boma_Gear_ZS_13+0x4  ;; 0x43160000
        LDR      R1,??Boma_Gear_ZS_0+0x1C
        STR      R0,[R1, #+0]
        LDR      R0,??Boma_Gear_ZS_0+0x20  ;; 0xc3960000
        LDR      R1,??Boma_Gear_ZS_0+0x24
        STR      R0,[R1, #+0]
//  104      Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x28
        STR      R0,[R1, #+0]
//  105      Direction_P2_Change=0;   Angle_P_Change=0;     
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x2C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x30
        STR      R0,[R1, #+0]
//  106 /*速度参数  */ 
//  107      BB_P_Z=50;  BB_P_W=50;
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x34
        STR      R0,[R1, #+0]
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x38
        STR      R0,[R1, #+0]
//  108      BB_W=0;     BB_H=0;//10
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x3C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x40
        STR      R0,[R1, #+0]
//  109 /*环岛参数  */ 
//  110      Circle_Chazhi=90;    
        MOVS     R0,#+90
        LDR      R1,??Boma_Gear_ZS_0+0x44
        STR      R0,[R1, #+0]
//  111      Circle_Finish_Count_Max=200;//强制打角时间
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x48
        STR      R0,[R1, #+0]
//  112      Circle_Count6_Max=2000;//下次圆环间隔时间1S1000
        MOVS     R0,#+250
        LSLS     R0,R0,#+3        ;; #+2000
        LDR      R1,??Boma_Gear_ZS_0+0x4C
        STR      R0,[R1, #+0]
//  113      Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x50
        STR      R0,[R1, #+0]
//  114   Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??Boma_Gear_ZS_0+0x54
        STR      R0,[R1, #+0]
//  115      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??Boma_Gear_ZS_0+0x58
        STR      R0,[R1, #+0]
//  116      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??Boma_Gear_ZS_0+0x5C
        STR      R0,[R1, #+0]
//  117 /*暂定不调参数*/
//  118      angle_limit=60;     //0,
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x68  ;; 0x404e0000
        LDR      R2,??Boma_Gear_ZS_0+0x6C
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  119      akmj_w=0;//阿克曼角20
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x64
        STR      R0,[R1, #+0]
//  120      Direction_P=100;    //阿克曼角P                     
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x60
        STR      R0,[R1, #+0]
//  121      akmj_z=0;   
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x70
        STR      R0,[R1, #+0]
//  122      BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x74
        STR      R0,[R1, #+0]
//  123     BB_P_F=200;   
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x78
        STR      R0,[R1, #+0]
//  124    
//  125           Flag=2;
        MOVS     R0,#+2
        LDR      R1,??Boma_Gear_ZS_0+0xC
        STRB     R0,[R1, #+0]
//  126 
//  127 }     
//  128     break; 
??Boma_Gear_ZS_12:
        B        ??Boma_Gear_ZS_11
//  129  /*----------------------------------------------------------*/     
//  130    
//  131  case 3:
//  132        if(Flag!=3)
??Boma_Gear_ZS_5:
        LDR      R0,??Boma_Gear_ZS_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BEQ      ??Boma_Gear_ZS_14
//  133 {
//  134      speed_set  = 90;//速度设定  
        LDR      R0,??DataTable0  ;; 0x42b40000
        LDR      R1,??Boma_Gear_ZS_0+0x14
        STR      R0,[R1, #+0]
//  135 /*打角参数*/  
//  136      Direction_P2=500; Direction_D2=-1000; //差值PD                        
        LDR      R0,??DataTable0_1  ;; 0x43fa0000
        LDR      R1,??Boma_Gear_ZS_0+0x1C
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable0_2  ;; 0xc47a0000
        LDR      R1,??Boma_Gear_ZS_0+0x24
        STR      R0,[R1, #+0]
//  137      Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x28
        STR      R0,[R1, #+0]
//  138      Direction_P2_Change=0;   Angle_P_Change=0;     
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x2C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x30
        STR      R0,[R1, #+0]
//  139 /*速度参数  */ 
//  140      BB_P_Z=50;  BB_P_W=50;
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x34
        STR      R0,[R1, #+0]
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x38
        STR      R0,[R1, #+0]
//  141      BB_W=-0;BB_H=-0;//10
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x3C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x40
        STR      R0,[R1, #+0]
//  142 /*环岛参数  */ 
//  143      Circle_Chazhi=100;    
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x44
        STR      R0,[R1, #+0]
//  144      Circle_Finish_Count_Max=140;//强制打角时间
        MOVS     R0,#+140
        LDR      R1,??Boma_Gear_ZS_0+0x48
        STR      R0,[R1, #+0]
//  145      Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
        LDR      R0,??DataTable0_3  ;; 0x1388
        LDR      R1,??Boma_Gear_ZS_0+0x4C
        STR      R0,[R1, #+0]
//  146      Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x50
        STR      R0,[R1, #+0]
//  147      Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??Boma_Gear_ZS_0+0x54
        STR      R0,[R1, #+0]
//  148      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??Boma_Gear_ZS_0+0x58
        STR      R0,[R1, #+0]
//  149      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??Boma_Gear_ZS_0+0x5C
        STR      R0,[R1, #+0]
//  150 /*暂定不调参数*/  
//  151      angle_limit=60;     //0,
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x68  ;; 0x404e0000
        LDR      R2,??Boma_Gear_ZS_0+0x6C
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  152      akmj_w=0;//阿克曼角20     
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x64
        STR      R0,[R1, #+0]
//  153      Direction_P=100;    //阿克曼角P                     
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x60
        STR      R0,[R1, #+0]
//  154      akmj_z=0;   
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x70
        STR      R0,[R1, #+0]
//  155      BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x74
        STR      R0,[R1, #+0]
//  156      BB_P_F=200;   
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x78
        STR      R0,[R1, #+0]
//  157       
//  158           Flag=3;
        MOVS     R0,#+3
        LDR      R1,??Boma_Gear_ZS_0+0xC
        STRB     R0,[R1, #+0]
//  159 }
//  160     break;
??Boma_Gear_ZS_14:
        B        ??Boma_Gear_ZS_11
//  161 /*----------------------------------------------------------*/     
//  162 case 4:
//  163        if(Flag!=4)
??Boma_Gear_ZS_8:
        LDR      R0,??Boma_Gear_ZS_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BEQ      ??Boma_Gear_ZS_15
//  164 {
//  165      speed_set  = 100;//速度设定 
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x14
        STR      R0,[R1, #+0]
//  166 /*打角参数*/    
//  167      Direction_P2=600;    Direction_D2=-1000; //差值PD                        
        LDR      R0,??DataTable0_4  ;; 0x44160000
        LDR      R1,??Boma_Gear_ZS_0+0x1C
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable0_2  ;; 0xc47a0000
        LDR      R1,??Boma_Gear_ZS_0+0x24
        STR      R0,[R1, #+0]
//  168      Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x28
        STR      R0,[R1, #+0]
//  169      Direction_P2_Change=0;   Angle_P_Change=0;    
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x2C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x30
        STR      R0,[R1, #+0]
//  170 /*速度参数  */ 
//  171     BB_P_Z=50;  BB_P_W=50;
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x34
        STR      R0,[R1, #+0]
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x38
        STR      R0,[R1, #+0]
//  172     BB_W=0;BB_H=0;   
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x3C
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x40
        STR      R0,[R1, #+0]
//  173 /*环岛参数  */   
//  174      Circle_Chazhi=100;    
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x44
        STR      R0,[R1, #+0]
//  175      Circle_Finish_Count_Max=140;//强制打角时间
        MOVS     R0,#+140
        LDR      R1,??Boma_Gear_ZS_0+0x48
        STR      R0,[R1, #+0]
//  176      Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
        LDR      R0,??DataTable0_3  ;; 0x1388
        LDR      R1,??Boma_Gear_ZS_0+0x4C
        STR      R0,[R1, #+0]
//  177      Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??Boma_Gear_ZS_0+0x50
        STR      R0,[R1, #+0]
//  178     Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??Boma_Gear_ZS_0+0x54
        STR      R0,[R1, #+0]
//  179      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??Boma_Gear_ZS_0+0x58
        STR      R0,[R1, #+0]
//  180      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??Boma_Gear_ZS_0+0x5C
        STR      R0,[R1, #+0]
//  181 /*暂定不调参数*/ 
//  182    Direction_P=100;//阿克曼角P                     
        LDR      R0,??Boma_Gear_ZS_0+0x18  ;; 0x42c80000
        LDR      R1,??Boma_Gear_ZS_0+0x60
        STR      R0,[R1, #+0]
//  183    akmj_z=0;    
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x70
        STR      R0,[R1, #+0]
//  184    BB_P_Z=50;BB_P_F=200;
        MOVS     R0,#+50
        LDR      R1,??Boma_Gear_ZS_0+0x34
        STR      R0,[R1, #+0]
        MOVS     R0,#+200
        LDR      R1,??Boma_Gear_ZS_0+0x78
        STR      R0,[R1, #+0]
//  185    BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x74
        STR      R0,[R1, #+0]
//  186    angle_limit=60;  //0,
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x68  ;; 0x404e0000
        LDR      R2,??Boma_Gear_ZS_0+0x6C
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  187    akmj_w=0;//阿克曼角    
        MOVS     R0,#+0
        LDR      R1,??Boma_Gear_ZS_0+0x64
        STR      R0,[R1, #+0]
//  188    Flag=4;
        MOVS     R0,#+4
        LDR      R1,??Boma_Gear_ZS_0+0xC
        STRB     R0,[R1, #+0]
//  189 }
//  190     break;
??Boma_Gear_ZS_15:
        B        ??Boma_Gear_ZS_11
        DATA
??Boma_Gear_ZS_0:
        DC32     Boma_num
        DC32     Boma_num_old
        DC32     Boma_Change
        DC32     Flag
        DC32     0x428c0000
        DC32     speed_set
        DC32     0x42c80000
        DC32     Direction_P2
        DC32     0xc3960000
        DC32     Direction_D2
        DC32     Angle_P
        DC32     Direction_P2_Change
        DC32     Angle_P_Change
        DC32     BB_P_Z
        DC32     BB_P_W
        DC32     BB_W
        DC32     BB_H
        DC32     Circle_Chazhi
        DC32     Circle_Finish_Count_Max
        DC32     Circle_Count6_Max
        DC32     Circle_Inductor_LR1
        DC32     Circle_Inductor_M1
        DC32     Circle_Inductor_M2
        DC32     Circle_Inductor_M3
        DC32     Direction_P
        DC32     akmj_w
        DC32     0x404e0000
        DC32     angle_limit
        DC32     akmj_z
        DC32     BB_Z
        DC32     BB_P_F
        THUMB
//  191 /*---------------------------------------------130,1000100,100，-35-------------*/     
//  192 case 5:
//  193        if(Flag!=5)
??Boma_Gear_ZS_7:
        LDR      R0,??DataTable0_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+5
        BEQ      ??Boma_Gear_ZS_16
//  194 {
//  195      speed_set  = 110;//速度设定 
        LDR      R0,??DataTable0_6  ;; 0x42dc0000
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  196 /*打角参数*/     
//  197   Direction_P2=1100;  Direction_D2=-1000; //差值PD        
        LDR      R0,??DataTable0_8  ;; 0x44898000
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable0_2  ;; 0xc47a0000
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//  198   Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_11
        STR      R0,[R1, #+0]
//  199   Direction_P2_Change=50;  Angle_P_Change=50;    
        MOVS     R0,#+50
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
        MOVS     R0,#+50
        LDR      R1,??DataTable0_13
        STR      R0,[R1, #+0]
//  200 /*速度参数  */
//  201   BB_P_Z=50;  BB_P_W=0;
        MOVS     R0,#+50
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable0_15
        STR      R0,[R1, #+0]
//  202   BB_W=-10;BB_H=-10;
        MOVS     R0,#+9
        MVNS     R0,R0            ;; #-10
        LDR      R1,??DataTable0_16
        STR      R0,[R1, #+0]
        MOVS     R0,#+9
        MVNS     R0,R0            ;; #-10
        LDR      R1,??DataTable0_17
        STR      R0,[R1, #+0]
//  203 /*环岛参数  */   
//  204   Circle_Chazhi=90;    
        MOVS     R0,#+90
        LDR      R1,??DataTable0_18
        STR      R0,[R1, #+0]
//  205   Circle_Finish_Count_Max=140;//强制打角时间
        MOVS     R0,#+140
        LDR      R1,??DataTable0_19
        STR      R0,[R1, #+0]
//  206   Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
        LDR      R0,??DataTable0_3  ;; 0x1388
        LDR      R1,??DataTable0_20
        STR      R0,[R1, #+0]
//  207   Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??DataTable0_21
        STR      R0,[R1, #+0]
//  208   Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??DataTable0_22
        STR      R0,[R1, #+0]
//  209      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??DataTable0_23
        STR      R0,[R1, #+0]
//  210      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??DataTable0_24
        STR      R0,[R1, #+0]
//  211 /*暂定不调参数*/
//  212   Direction_P=100;//阿克曼角P 
        LDR      R0,??DataTable0_25  ;; 0x42c80000
        LDR      R1,??DataTable0_26
        STR      R0,[R1, #+0]
//  213   akmj_z=0;   
        MOVS     R0,#+0
        LDR      R1,??DataTable0_27
        STR      R0,[R1, #+0]
//  214   BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_28
        STR      R0,[R1, #+0]
//  215  BB_P_F=200;
        MOVS     R0,#+200
        LDR      R1,??DataTable0_29
        STR      R0,[R1, #+0]
//  216   akmj_w=0;//阿克曼角
        MOVS     R0,#+0
        LDR      R1,??DataTable0_30
        STR      R0,[R1, #+0]
//  217   angle_limit=60;  //0,                  
        MOVS     R0,#+0
        LDR      R1,??DataTable0_31  ;; 0x404e0000
        LDR      R2,??DataTable0_32
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  218 
//  219           Flag=5;
        MOVS     R0,#+5
        LDR      R1,??DataTable0_5
        STRB     R0,[R1, #+0]
//  220 }
//  221     break;
??Boma_Gear_ZS_16:
        B        ??Boma_Gear_ZS_11
//  222     
//  223     
//  224           case 6:
//  225        if(Flag!=6)
??Boma_Gear_ZS_9:
        LDR      R0,??DataTable0_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+6
        BEQ      ??Boma_Gear_ZS_17
//  226 {
//  227      speed_set  = 120;//速度设定 
        LDR      R0,??DataTable0_33  ;; 0x42f00000
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  228 /*打角参数*/     
//  229   Direction_P2=1000;    Direction_D2=-1000; //差值PD         
        LDR      R0,??DataTable0_34  ;; 0x447a0000
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable0_2  ;; 0xc47a0000
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//  230   Angle_P=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_11
        STR      R0,[R1, #+0]
//  231   Direction_P2_Change=100;  Angle_P_Change=100;    
        MOVS     R0,#+100
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
        MOVS     R0,#+100
        LDR      R1,??DataTable0_13
        STR      R0,[R1, #+0]
//  232 /*速度参数  */
//  233     BB_P_Z=50;  BB_P_W=0;
        MOVS     R0,#+50
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable0_15
        STR      R0,[R1, #+0]
//  234   BB_W=-20;BB_H=-20;
        MOVS     R0,#+19
        MVNS     R0,R0            ;; #-20
        LDR      R1,??DataTable0_16
        STR      R0,[R1, #+0]
        MOVS     R0,#+19
        MVNS     R0,R0            ;; #-20
        LDR      R1,??DataTable0_17
        STR      R0,[R1, #+0]
//  235 /*环岛参数  */   
//  236      Circle_Chazhi=90;    
        MOVS     R0,#+90
        LDR      R1,??DataTable0_18
        STR      R0,[R1, #+0]
//  237      Circle_Finish_Count_Max=140;//强制打角时间
        MOVS     R0,#+140
        LDR      R1,??DataTable0_19
        STR      R0,[R1, #+0]
//  238      Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
        LDR      R0,??DataTable0_3  ;; 0x1388
        LDR      R1,??DataTable0_20
        STR      R0,[R1, #+0]
//  239      Circle_Inductor_LR1=100;//进环最低左右电感值
        MOVS     R0,#+100
        LDR      R1,??DataTable0_21
        STR      R0,[R1, #+0]
//  240      Circle_Inductor_M1=172;//进圆环双线值178
        MOVS     R0,#+172
        LDR      R1,??DataTable0_22
        STR      R0,[R1, #+0]
//  241      Circle_Inductor_M2=170;//测转弯值175
        MOVS     R0,#+170
        LDR      R1,??DataTable0_23
        STR      R0,[R1, #+0]
//  242      Circle_Inductor_M3=163;//转弯值160
        MOVS     R0,#+163
        LDR      R1,??DataTable0_24
        STR      R0,[R1, #+0]
//  243 /*暂定不调参数*/
//  244       Direction_P=100;//阿克曼角P 
        LDR      R0,??DataTable0_25  ;; 0x42c80000
        LDR      R1,??DataTable0_26
        STR      R0,[R1, #+0]
//  245       akmj_z=0;   
        MOVS     R0,#+0
        LDR      R1,??DataTable0_27
        STR      R0,[R1, #+0]
//  246       BB_Z=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_28
        STR      R0,[R1, #+0]
//  247       BB_P_Z=50;BB_P_F=200;
        MOVS     R0,#+50
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
        MOVS     R0,#+200
        LDR      R1,??DataTable0_29
        STR      R0,[R1, #+0]
//  248       angle_limit=60;  //0,                  
        MOVS     R0,#+0
        LDR      R1,??DataTable0_31  ;; 0x404e0000
        LDR      R2,??DataTable0_32
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
//  249      akmj_w=0;//阿克曼角
        MOVS     R0,#+0
        LDR      R1,??DataTable0_30
        STR      R0,[R1, #+0]
//  250 
//  251           Flag=6;
        MOVS     R0,#+6
        LDR      R1,??DataTable0_5
        STRB     R0,[R1, #+0]
//  252 }
//  253     break;
??Boma_Gear_ZS_17:
        B        ??Boma_Gear_ZS_11
//  254           
//  255      
//  256      
//  257 /*----------------------------------------------------------*/     
//  258 //   case 15:
//  259 //     if(Flag!=15)
//  260 //     {
//  261 //     OLED_Clear();
//  262 //     OLED_Biaoge_Par_ZS();//表格，静态
//  263 //     Flag=15;
//  264 //     }
//  265 //     OLED_Key_Par_ZS();//按键改参数
//  266 //      if (KEY_sta)
//  267 //     {
//  268 //        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//  269 //        {
//  270 //            OLED_Select_Par_ZS();
//  271 //            KEY_menuChange = !KEY_menuChange;
//  272 //        }
//  273 //        Oled_Data_Par_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
//  274 //        KEY_sta = !KEY_sta;             
//  275 //    }   
//  276 //     break;
//  277 
//  278      
//  279      
//  280      
//  281    default :
//  282       break;
//  283  }
//  284 
//  285 }
??Boma_Gear_ZS_4:
??Boma_Gear_ZS_11:
        POP      {R0,PC}          ;; return
        DATA
??Boma_Gear_ZS_13:
        DC32     0x42960000
        DC32     0x43160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x42b40000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x43fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0xc47a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x1388

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x44160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0x42dc0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x44898000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     Direction_P2_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     Angle_P_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     BB_P_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     BB_P_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_18:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_19:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_20:
        DC32     Circle_Count6_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_21:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_22:
        DC32     Circle_Inductor_M1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_23:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_24:
        DC32     Circle_Inductor_M3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_25:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_26:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_27:
        DC32     akmj_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_28:
        DC32     BB_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_29:
        DC32     BB_P_F

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_30:
        DC32     akmj_w

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_31:
        DC32     0x404e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_32:
        DC32     angle_limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_33:
        DC32     0x42f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_34:
        DC32     0x447a0000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  286 
//  287 
//  288 
//  289 /**
//  290   * 简介
//  291   *     拨码按键检测
//  292   * 备注
//  293 0     1     2    3     4
//  294 0000 0001  0010 0011  0100
//  295 通过四个IO口的不同高低电平切换，2*2*2*2=16，共0-15，16个挡位
//  296   */
// 
//    13 bytes in section .bss
// 1 402 bytes in section .text
// 
// 1 402 bytes of CODE memory
//    13 bytes of DATA memory
//
//Errors: none
//Warnings: none
