///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:00
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Fuzzy.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Fuzzy.c -D IAR -D
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\Fuzzy.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_memclr4

        PUBLIC Angle_E
        PUBLIC Fuzzy_Shell_P
        PUBLIC Gyro_E
        PUBLIC Shell_P
        PUBLIC rule

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\user\C\Fuzzy.c
//    1 #include "Fuzzy.h"
//    2 //二维模糊控制系统
//    3 //输入小车的实际速度与陀螺仪Y轴数据，控制输出方向P
//    4 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 float  Angle_E[3]  = {5,10,15};   //小车速度
Angle_E:
        DATA
        DC32 40A00000H, 41200000H, 41700000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float  Gyro_E[3] = {10,15,30};	   //角速度数据
Gyro_E:
        DATA
        DC32 41200000H, 41700000H, 41F00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    7 float  Shell_P[3]  = {10,15,40};  //外层比例控制系数
Shell_P:
        DATA
        DC32 41200000H, 41700000H, 42200000H
//    8 
//    9 //由于所测数据均为单向数据，故规则表拟定为单向

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   10  int rule[3][3]=
rule:
        DATA
        DC32 2, 1, 0, 1, 1, 0, 0, 0, 0
//   11         {
//   12           {2,1,0},
//   13           {1,1,0},
//   14           {0,0,0},
//   15         };
//   16 
//   17 	
//   18 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   19 float Fuzzy_Shell_P(float E_angle,float E_gyro)
//   20 {
Fuzzy_Shell_P:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+36
//   21   float  angle_err=0,gyro_err=0;
        MOVS     R6,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//   22   int angle_N=0,gyro_N=0; //隶属语言值
        MOVS     R5,#+0
        MOVS     R4,#+0
//   23   int  num=0;
        MOVS     R7,#+0
//   24   float fuzzy_P=0;
        MOVS     R0,#+0
//   25    //记录隶属函数的输出值
//   26   float  Angle_Fzy[2] ={0.0,0.0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   27   float  Gyro_Fzy[2] ={0.0,0.0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   28 
//   29   float  Shell_P_Fzy[3] ={0.0,0.0,0.0};
        ADD      R0,SP,#+20
        MOVS     R1,#+12
        BL       __aeabi_memclr4
//   30   // /*----- 数据更新-----*/
//   31   // Shell_P[1]  = P_Direction_low;
//   32   // Shell_P[2]  = P_Direction_high;
//   33 
//   34 
//   35   //将数据取绝对值，数据的正负仅代表左右	
//   36 //	ABS_val(E_angle,angle_err);
//   37 //	ABS_val(E_gyro,gyro_err);
//   38 
//   39   /*-----   Angle 隶属函数描述-----*/
//   40 	if(angle_err<Angle_E[0]) //1
        MOVS     R0,R6
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_1
//   41 	{
//   42 		Angle_Fzy[0] =1.0;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        STR      R0,[SP, #+12]
//   43 		angle_N = 0;
        MOVS     R5,#+0
        B        ??Fuzzy_Shell_P_2
//   44 	}
//   45 	else if(angle_err<Angle_E[1])  //2
??Fuzzy_Shell_P_1:
        MOVS     R0,R6
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_3
//   46 	{
//   47 		Angle_Fzy[0] = (Angle_E[1]-angle_err)/(Angle_E[1]-Angle_E[0]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+4]
        MOVS     R1,R6
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   48 		angle_N = 0;
        MOVS     R5,#+0
        B        ??Fuzzy_Shell_P_2
//   49 	}
//   50 	else if(angle_err<Angle_E[2])  //3
??Fuzzy_Shell_P_3:
        MOVS     R0,R6
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_4
//   51 	{
//   52 		Angle_Fzy[0] = (Angle_E[2]-angle_err)/(Angle_E[2]-Angle_E[1]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+8]
        MOVS     R1,R6
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   53 		angle_N = 1;
        MOVS     R5,#+1
        B        ??Fuzzy_Shell_P_2
//   54 	}
//   55 	else
//   56 	{
//   57 		Angle_Fzy[0] =0;//4
??Fuzzy_Shell_P_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   58 		angle_N =1;
        MOVS     R5,#+1
//   59 	}
//   60 	Angle_Fzy[1] = 1.0 - Angle_Fzy[0];//隶属函数输出值
??Fuzzy_Shell_P_2:
        LDR      R0,[SP, #+12]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Shell_P_0+0x4  ;; 0x3ff00000
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        STR      R0,[SP, #+16]
//   61 
//   62   /*----- Pre_dirr 变化隶属函数描述-----*/
//   63    if(gyro_err<Gyro_E[0])//当陀螺仪Y轴数据小于40时，对应三角隶属函数的隶属度为1，方向量度模糊等级为0级
        LDR      R0,[SP, #+0]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_5
//   64 	{
//   65 		Gyro_Fzy[0] =1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        STR      R0,[SP, #+4]
//   66 		gyro_N = 0;
        MOVS     R4,#+0
        B        ??Fuzzy_Shell_P_6
//   67 	}
//   68 	else if(gyro_err<Gyro_E[1])//当陀螺仪Y轴数据小于70时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为0级，此时为40三角形的右边一半
??Fuzzy_Shell_P_5:
        LDR      R0,[SP, #+0]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_7
//   69 	{
//   70 		Gyro_Fzy[0] = (Gyro_E[1] - gyro_err)/(Gyro_E[1]-Gyro_E[0]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+4]
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//   71 		gyro_N = 0 ;
        MOVS     R4,#+0
        B        ??Fuzzy_Shell_P_6
//   72 	}
//   73 	else if(gyro_err<Gyro_E[2])//当陀螺仪Y轴数据小于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的左边一半
??Fuzzy_Shell_P_7:
        LDR      R0,[SP, #+0]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_8
//   74 	{
//   75 		Gyro_Fzy[0] = (Gyro_E[2] - gyro_err)/(Gyro_E[2]-Gyro_E[1]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+8]
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//   76 		gyro_N = 1;
        MOVS     R4,#+1
        B        ??Fuzzy_Shell_P_6
//   77 	}
//   78 	else                     //当陀螺仪Y轴数据大于160时，对应三角隶属函数的隶属度根据公式得出，方向量度模糊等级为1级，此时为70三角形的右边一半
//   79 	{
//   80 		Gyro_Fzy[0] =0.0;
??Fuzzy_Shell_P_8:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//   81 		gyro_N = 1;
        MOVS     R4,#+1
//   82 	}
//   83 	//一个数据在三角形隶属度函数中对应着两个相邻三角形中的隶属度，两个隶属度和为1
//   84 	Gyro_Fzy[1] = 1.0 - Gyro_Fzy[0];
??Fuzzy_Shell_P_6:
        LDR      R0,[SP, #+4]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Shell_P_0+0x4  ;; 0x3ff00000
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        STR      R0,[SP, #+8]
//   85 
//   86 	/*查询模糊规则表*/
//   87 	//查表的时候不单单查询一个规则，而是向右向下拓展成一个规则正方形查询
//   88 	num =rule[gyro_N][angle_N];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R7,[R0, R1]
//   89 	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[0];
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fmul
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R7,R2,R7
        STR      R0,[R1, R7]
//   90 
//   91 	num =rule[gyro_N+1][angle_N];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R7,[R0, #+12]
//   92 	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[0];
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fmul
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R7,R2,R7
        STR      R0,[R1, R7]
//   93 
//   94 	num =rule[gyro_N][angle_N+1];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+12
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        LDR      R7,[R0, #+4]
//   95 	Shell_P_Fzy[num] += Gyro_Fzy[0]*Angle_Fzy[1];
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+16]
        BL       __aeabi_fmul
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R7,R2,R7
        STR      R0,[R1, R7]
//   96 
//   97 	num =rule[gyro_N+1][angle_N+1];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+12
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        MOVS     R1,#+4
        MULS     R5,R1,R5
        ADDS     R0,R0,R5
        LDR      R7,[R0, #+16]
//   98 	Shell_P_Fzy[num] += Gyro_Fzy[1]*Angle_Fzy[1];
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+16]
        BL       __aeabi_fmul
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+20
        MOVS     R2,#+4
        MULS     R7,R2,R7
        STR      R0,[R1, R7]
//   99 
//  100 	/*面积中心法解模糊*/
//  101 	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2];
        LDR      R1,[SP, #+20]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R1,[SP, #+24]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+4]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R1,[SP, #+28]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
//  102   return(fuzzy_P);
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return
        Nop      
        DATA
??Fuzzy_Shell_P_0:
        DC32     Angle_E
        DC32     0x3ff00000
        DC32     Gyro_E
        DC32     rule
        DC32     Shell_P
//  103 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H, 0H

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
//  72 bytes in section .data
//  28 bytes in section .rodata
// 600 bytes in section .text
// 
// 600 bytes of CODE  memory
//  28 bytes of CONST memory
//  72 bytes of DATA  memory
//
//Errors: none
//Warnings: none
