///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:37:57
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\Fuzzy_ZS2.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\Fuzzy_ZS2.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\device\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\user\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\Fuzzy_ZS2.s
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
        EXTERN abs_f

        PUBLIC Chazhi_E
        PUBLIC Fuzzy_Shell_P
        PUBLIC Shell_P
        PUBLIC Speed_E
        PUBLIC rule2

// H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\Fuzzy_ZS2.c
//    1 #include "Fuzzy_ZS2.h"
//    2 #include "allHead.h"
//    3 //extern float speed_set; 
//    4 //��άģ������ϵͳ
//    5 //���룺��ֵ���ٶȣ�������x
//    6 //���������P,D,������D
//    7 //�ٶ�=�����/2
//    8 
//    9 //����С����ʵ���ٶ���������Y�����ݣ������������P
//   10 //float speed_set_Low,speed_set_Mid,speed_set_High;
//   11 //float  Angle_E[3]  = {5,10,15};   //С���ٶ�
//   12 //float  Gyro_E[3] = {10,15,30};	   //���ٶ�����
//   13 //float  Shell_P[3]  = {10,15,40};  //����������ϵ��
//   14 //��������ֵ             0           1         
//   15 //                      20           40        60
//   16 //float Speed_E[3]={speed_set-50,speed_set-30,speed_set-10 };   //С���ٶ�

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 float Speed_E[5]={30,40,50,60,70 };   //С���ٶ�
Speed_E:
        DATA
        DC32 41F00000H, 42200000H, 42480000H, 42700000H, 428C0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float Chazhi_E[5]={30,45,60,75,95};	   //���ٶ�����
Chazhi_E:
        DATA
        DC32 41F00000H, 42340000H, 42700000H, 42960000H, 42BE0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19 float Shell_P[5]={180,220,260,300,380};  //����������ϵ��
Shell_P:
        DATA
        DC32 43340000H, 435C0000H, 43820000H, 43960000H, 43BE0000H
//   20 
//   21 //�����������ݾ�Ϊ�������ݣ��ʹ�����ⶨΪ����
//   22 //  int rule2[3][3]=
//   23 //        {       
//   24 //          {2,1,0},
//   25 //          {1,1,0},
//   26 //          {0,0,0},    
//   27 //        };
//   28 //          {0,1,2},              //30
//   29 //          {1,1,2},              //45
//   30 //          {2,2,2},              //90

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31  int rule2[5][5]=
rule2:
        DATA
        DC32 0, 1, 2, 3, 4, 1, 1, 2, 3, 4, 2, 2, 3, 3, 4, 3, 3, 3, 4, 4, 4, 4
        DC32 4, 4, 4
//   32         {
//   33 //  �ٶ�  10 20 30 40 60   
//   34 //                             ��ֵ      
//   35           {0,1,2,3 ,4},              //30
//   36           {1,1,2,3 ,4},              //45
//   37           {2,2,3,3 ,4},              //60
//   38           {3,3,3,4 ,4},              //75
//   39           {4,4,4,4 ,4},              //90
//   40           
//   41           
//   42           
//   43         };                    
//   44 
//   45 
//   46  
//   47 //float Fuzzy_Shell_P(float E_angle,float E_gyro)

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   48 float Fuzzy_Shell_P(float speed_car,float Chazhi)
//   49 {
Fuzzy_Shell_P:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+52
//   50 //  float  angle_err=0,gyro_err=0;
//   51   float  Speed_abs=0,Chazhi_abs=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+44]
        MOVS     R7,#+0
//   52   int speed_N=0,Chazhi_N=0; //��������ֵ��������ֵΪX�ᵵλ
        MOVS     R6,#+0
        MOVS     R5,#+0
//   53   int  num=0;
        MOVS     R4,#+0
//   54   float fuzzy_P=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//   55    //��¼�������������ֵ
//   56   float  Speed_Fzy[2] ={0.0,0.0};
        ADD      R0,SP,#+12
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   57   float  Chazhi_Fzy[2] ={0.0,0.0};
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   58 
//   59   float  Shell_P_Fzy[5] ={0.0,0.0,0.0,0.0,0.0};
        ADD      R0,SP,#+24
        MOVS     R1,#+20
        BL       __aeabi_memclr4
//   60   // /*----- ���ݸ���-----*/
//   61   // Shell_P[1]  = P_Direction_low;
//   62   // Shell_P[2]  = P_Direction_high;
//   63 
//   64 
//   65   //������ȡ����ֵ�����ݵ���������������	
//   66 //	ABS_val(E_angle,angle_err);
//   67 //	ABS_val(E_gyro,gyro_err);
//   68   Chazhi_abs=abs_f(Chazhi);
        LDR      R0,[SP, #+56]
        BL       abs_f
        MOVS     R7,R0
//   69 //  Speed_abs=abs_f(speed_car);
//   70   /*-----   Angle ������������-----*/
//   71 	if(speed_car<Speed_E[0]) //�ٶ�<0��
        LDR      R0,[SP, #+52]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_1
//   72 	{
//   73 		Speed_Fzy[0] =1.0;//�ٶȵ͵�������Ϊ1
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        STR      R0,[SP, #+12]
//   74 		speed_N = 0;//�ٶ�20
        MOVS     R0,#+0
        MOVS     R6,R0
        B        ??Fuzzy_Shell_P_2
//   75 	}
//   76 	else if(speed_car<Speed_E[1])  //0��<�ٶ�<1��
??Fuzzy_Shell_P_1:
        LDR      R0,[SP, #+52]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_3
//   77 	{//  Ϊ�ٶȵ͵�������=1���ٶ�-�ٶ�/1���ٶ�-0���ٶ�
//   78 		Speed_Fzy[0] = (Speed_E[1]-speed_car)/(Speed_E[1]-Speed_E[0]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+4]
        LDR      R1,[SP, #+52]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   79 		speed_N = 0;//�ٶ�20
        MOVS     R0,#+0
        MOVS     R6,R0
        B        ??Fuzzy_Shell_P_2
//   80 	}
//   81 	else if(speed_car<Speed_E[2])  //1��<�ٶ�<2��
??Fuzzy_Shell_P_3:
        LDR      R0,[SP, #+52]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_4
//   82 	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
//   83 		Speed_Fzy[0] = (Speed_E[2]-speed_car)/(Speed_E[2]-Speed_E[1]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+8]
        LDR      R1,[SP, #+52]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   84 		speed_N = 1;//�ٶ�40
        MOVS     R0,#+1
        MOVS     R6,R0
        B        ??Fuzzy_Shell_P_2
//   85 	}
//   86         
//   87         else if(speed_car<Speed_E[3])  //2��<�ٶ�<3��
??Fuzzy_Shell_P_4:
        LDR      R0,[SP, #+52]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_5
//   88 	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
//   89 		Speed_Fzy[0] = (Speed_E[3]-speed_car)/(Speed_E[3]-Speed_E[2]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+12]
        LDR      R1,[SP, #+52]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   90 		speed_N = 2;//�ٶ�40
        MOVS     R0,#+2
        MOVS     R6,R0
        B        ??Fuzzy_Shell_P_2
//   91 	}
//   92         
//   93          else if(speed_car<Speed_E[4])  //3��<�ٶ�<4��
??Fuzzy_Shell_P_5:
        LDR      R0,[SP, #+52]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_6
//   94 	{//  Ϊ�ٶȵ�(40)��������=60-�ٶ�/60-40
//   95 		Speed_Fzy[0] = (Speed_E[4]-speed_car)/(Speed_E[4]-Speed_E[3]);
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+52]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Shell_P_0
        LDR      R1,[R1, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+12]
//   96 		speed_N = 3;//�ٶ�40
        MOVS     R0,#+3
        MOVS     R6,R0
        B        ??Fuzzy_Shell_P_2
//   97 	}
//   98         
//   99 	else//�ٶ�>4��
//  100 	{//�ٶȵ�������
//  101 		Speed_Fzy[0] =0;//4
??Fuzzy_Shell_P_6:
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  102 		speed_N =3;//�ٶ�40
        MOVS     R0,#+3
        MOVS     R6,R0
//  103 	}
//  104 	Speed_Fzy[1] = 1.0 - Speed_Fzy[0];//�����ٶȸߺ������ֵ
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
//  105 
//  106         
//  107   /*----- Pre_dirr �仯������������-----*/
//  108    if(Chazhi_abs<Chazhi_E[0])//��ֵ<0��//��������Y������С��40ʱ����Ӧ��������������������Ϊ1����������ģ���ȼ�Ϊ0��
        MOVS     R0,R7
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_7
//  109 	{
//  110 		Chazhi_Fzy[0] =1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        STR      R0,[SP, #+4]
//  111 		Chazhi_N = 0;
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??Fuzzy_Shell_P_8
//  112 	}//��ֵ<60,
//  113 	else if(Chazhi_abs<Chazhi_E[1])//0��<��ֵ<1��//��������Y������С��70ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ0������ʱΪ40�����ε��ұ�һ��
??Fuzzy_Shell_P_7:
        MOVS     R0,R7
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_9
//  114 	{
//  115 		Chazhi_Fzy[0] = (Chazhi_E[1] - Chazhi_abs)/(Chazhi_E[1]-Chazhi_E[0]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+4]
        MOVS     R1,R7
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+4]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//  116 		Chazhi_N = 0 ;
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??Fuzzy_Shell_P_8
//  117 	}
//  118 	else if(Chazhi_abs<Chazhi_E[2])//1��<��ֵ<2��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
??Fuzzy_Shell_P_9:
        MOVS     R0,R7
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+8]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_10
//  119 	{
//  120 		Chazhi_Fzy[0] = (Chazhi_E[2] - Chazhi_abs)/(Chazhi_E[2]-Chazhi_E[1]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+8]
        MOVS     R1,R7
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+8]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//  121 		Chazhi_N = 1;
        MOVS     R0,#+1
        MOVS     R5,R0
        B        ??Fuzzy_Shell_P_8
//  122 	}
//  123    
//  124    else if(Chazhi_abs<Chazhi_E[3])//2��<��ֵ<3��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
??Fuzzy_Shell_P_10:
        MOVS     R0,R7
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+12]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_11
//  125 	{
//  126 		Chazhi_Fzy[0] = (Chazhi_E[3] - Chazhi_abs)/(Chazhi_E[3]-Chazhi_E[2]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+12]
        MOVS     R1,R7
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+12]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//  127 		Chazhi_N = 2;
        MOVS     R0,#+2
        MOVS     R5,R0
        B        ??Fuzzy_Shell_P_8
//  128 	}
//  129    
//  130    else if(Chazhi_abs<Chazhi_E[4])//3��<��ֵ<4��//��������Y������С��160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε����һ��
??Fuzzy_Shell_P_11:
        MOVS     R0,R7
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+16]
        BL       __aeabi_cfcmple
        BCS      ??Fuzzy_Shell_P_12
//  131 	{
//  132 		Chazhi_Fzy[0] = (Chazhi_E[4] - Chazhi_abs)/(Chazhi_E[4]-Chazhi_E[3]);
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+16]
        MOVS     R1,R7
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        LDR      R0,??Fuzzy_Shell_P_0+0x8
        LDR      R0,[R0, #+16]
        LDR      R1,??Fuzzy_Shell_P_0+0x8
        LDR      R1,[R1, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fdiv
        STR      R0,[SP, #+4]
//  133 		Chazhi_N = 3;
        MOVS     R0,#+3
        MOVS     R5,R0
        B        ??Fuzzy_Shell_P_8
//  134 	}
//  135    
//  136 	else//��ֵ>4��                     //��������Y�����ݴ���160ʱ����Ӧ�������������������ȸ��ݹ�ʽ�ó�����������ģ���ȼ�Ϊ1������ʱΪ70�����ε��ұ�һ��
//  137 	{
//  138 		Chazhi_Fzy[0] =0.0;
??Fuzzy_Shell_P_12:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  139 		Chazhi_N = 3;
        MOVS     R0,#+3
        MOVS     R5,R0
//  140 	}
//  141 	//һ�������������������Ⱥ����ж�Ӧ�����������������е������ȣ����������Ⱥ�Ϊ1
//  142 	Chazhi_Fzy[1] = 1.0 - Chazhi_Fzy[0];
??Fuzzy_Shell_P_8:
        LDR      R0,[SP, #+4]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??Fuzzy_Shell_P_0+0x4  ;; 0x3ff00000
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        STR      R0,[SP, #+8]
//  143 
//  144 	/*��ѯģ������������*/
//  145 //����ʱ�򲻵�����ѯһ�����򣬶�������������չ��һ�����������β�ѯ
//  146 //num�����������,
//  147 //eg:�ٶ�30����ֵ45��Chazhi_N=0��speed_N=0
//  148 	num =rule2[Chazhi_N][speed_N];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R6,R1
        LDR      R0,[R0, R1]
        MOVS     R4,R0
//  149 	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[0];//0.5
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fmul
        MOVS     R1,R0
        ADD      R0,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  150 
//  151 	num =rule2[Chazhi_N+1][speed_N];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+20]
        MOVS     R4,R0
//  152 	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[0];
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fmul
        MOVS     R1,R0
        ADD      R0,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  153 
//  154 	num =rule2[Chazhi_N][speed_N+1];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
        MOVS     R4,R0
//  155 	Shell_P_Fzy[num] += Chazhi_Fzy[0]*Speed_Fzy[1];
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+16]
        BL       __aeabi_fmul
        MOVS     R1,R0
        ADD      R0,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  156 
//  157 	num =rule2[Chazhi_N+1][speed_N+1];
        LDR      R0,??Fuzzy_Shell_P_0+0xC
        MOVS     R1,#+20
        MULS     R1,R5,R1
        ADDS     R0,R0,R1
        MOVS     R1,#+4
        MULS     R1,R6,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+24]
        MOVS     R4,R0
//  158 	Shell_P_Fzy[num] += Chazhi_Fzy[1]*Speed_Fzy[1];
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+16]
        BL       __aeabi_fmul
        MOVS     R1,R0
        ADD      R0,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        BL       __aeabi_fadd
        ADD      R1,SP,#+24
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  159 
//  160 	/*������ķ���ģ��*/
//  161 	fuzzy_P=Shell_P_Fzy[0]*Shell_P[0]+Shell_P_Fzy[1]*Shell_P[1]+Shell_P_Fzy[2]*Shell_P[2]
//  162                 +Shell_P_Fzy[3]*Shell_P[3]+Shell_P_Fzy[4]*Shell_P[4];
        LDR      R1,[SP, #+24]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+28]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+4]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+32]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+8]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+36]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+12]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+40]
        LDR      R0,??Fuzzy_Shell_P_0+0x10
        LDR      R0,[R0, #+16]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        STR      R0,[SP, #+20]
//  163   return(fuzzy_P);
        LDR      R0,[SP, #+20]
        ADD      SP,SP,#+60
        POP      {R4-R7,PC}       ;; return
        DATA
??Fuzzy_Shell_P_0:
        DC32     Speed_E
        DC32     0x3ff00000
        DC32     Chazhi_E
        DC32     rule2
        DC32     Shell_P
//  164 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H, 0H, 0H, 0H

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
// 160 bytes in section .data
//  36 bytes in section .rodata
// 892 bytes in section .text
// 
// 892 bytes of CODE  memory
//  36 bytes of CONST memory
// 160 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
