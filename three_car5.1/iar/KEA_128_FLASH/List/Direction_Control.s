///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:19
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\user\C\Direction_Control.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\user\C\Direction_Control.c -D
//        IAR -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\device\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\user\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\Direction_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Chazhi
        EXTERN Speed_Error_L
        EXTERN Speed_Error_Last_L
        EXTERN Speed_Error_Last_R
        EXTERN Speed_Error_R
        EXTERN StraightRoad_Flag
        EXTERN WindingRoad_Left_Flag
        EXTERN WindingRoad_Right_Flag
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
        EXTERN speed_set
        EXTERN speed_set_L
        EXTERN speed_set_R
        EXTERN speed_set_W
        EXTERN speed_set_Z
        EXTERN tan

        PUBLIC Accum_Error_L
        PUBLIC Accum_Error_R
        PUBLIC Angle_D
        PUBLIC Angle_P
        PUBLIC Angle_P_choose
        PUBLIC `B`
        PUBLIC Chasu_Bili
        PUBLIC Chasu_Bili_Temp
        PUBLIC Chazhi_limit
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
        PUBLIC Direction_Controler_I
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
        PUBLIC Speed_D_D
        PUBLIC Speed_I_D
        PUBLIC Speed_I_D_Temp
        PUBLIC Speed_I_lntegral_L
        PUBLIC Speed_I_lntegral_Max
        PUBLIC Speed_I_lntegral_R
        PUBLIC Speed_P_D
        PUBLIC Sum_Error_L
        PUBLIC Sum_Error_R
        PUBLIC X
        PUBLIC angle
        PUBLIC angle_P
        PUBLIC angle_limit
        PUBLIC change_factor
        PUBLIC change_value
        PUBLIC change_variable
        PUBLIC k
        PUBLIC k1
        PUBLIC k2
        PUBLIC k3
        PUBLIC k4
        PUBLIC speed_temp1
        PUBLIC speed_temp2
        PUBLIC t
        PUBLIC turn_spd

// H:\���ܳ�����2018\������֡���ZS\5.1\user\C\Direction_Control.c
//    1 #include "Direction_Control.h"
//    2 #include "math.h"
//    3 /*****************************�������ǲ���1************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    4 float k1=1,k2=1.5;//ͨ��k1ȷ����ֵ��Ƕȵ�ת������2��1.5
k1:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
k2:
        DATA
        DC32 3FC00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    5 float Chazhi_limit=20;//60//25*1.5=37.5;30*1.5=45;30
Chazhi_limit:
        DATA
        DC32 41A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    6 float Chasu_Bili=1 ,Chasu_Bili_Temp=1;
Chasu_Bili:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Chasu_Bili_Temp:
        DATA
        DC32 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(3)
//    7 double angle_limit=75;//70
angle_limit:
        DATA
        DC32 0H, 4052C000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    8 int change_value=10;//ֵ,�ӽ���תʱ���ٶ��趨
change_value:
        DATA
        DC32 10

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int change_factor=0; //ϵ��,�ӽ���תʱ�ĸ�����̥����ϵ��
change_factor:
        DS8 4
//   10 //�ٶ��趨�ﵽ50��ʱ��,����60��:������̥��ʼ�为,������̥�Ѿ���100��,û��Ҫ����

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int change_variable=0;//����,�ӽ���תʱ�ĵ�����̥��������
change_variable:
        DS8 4
//   12 /*****************************************************************/
//   13 
//   14 /*-----------����1---------------------------------------------------------------*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15  float Speed_P_D=350;//����Pѡ��
Speed_P_D:
        DATA
        DC32 43AF0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16  float Speed_I_D=0.0;//����Iѡ��
Speed_I_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17  float Speed_D_D=0;//����Dѡ��80 
Speed_D_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18  float Angle_P=0,Angle_D=0,Angle_P_choose;//������
Angle_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_P_choose:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   19  int   angle_P=80;//ʵ�ʽǶ�Ϊһ��
angle_P:
        DATA
        DC32 80
//   20 /*--------------------------------------------------------------------------*/
//   21 
//   22 /*****************************�������ǲ���2************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float k=0;//kδ��������k���������ת�������ǰ��kСת����ٿ���
k:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float k3=0.0,k4=0.0;//��ֵ�仯��Ӱ��ϵ��
k3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
k4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   25 float B=15.5,L=15;//BΪ���ּ�࣬LΪǰ���ּ��,B/2L=4/9
`B`:
        DATA
        DC32 41780000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
L:
        DATA
        DC32 41700000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 float angle;//С��ƫת�Ƕ�2
angle:
        DS8 4
//   27 //�ٶ��趨30��Chasu_Bili=2��3;3��2Ч����һ���
//   28 //�ٶ��趨30����ֵ60��60�ȡ����70�Ⱥ�����Ư�����⣬75Ư��

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 float  speed_temp2=0,speed_temp1=-20;
speed_temp2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
speed_temp1:
        DATA
        DC32 0C1A00000H
//   30 /********************************************************************************/
//   31 
//   32 /*-----------����2---------------------------------------------------------------*/
//   33 //I����1���ֻἫ�켫��ﵽ�趨ֵ,����תһ��ͣһ�µ�����
//   34 ///�ٶ��趨30��P=240��I=0;D=0;P=280֮�󣬽��Ư�����⡣
//   35 //V=30:I=1,D=0�������΢���Ұڶ�;I=0,D=50����٣�������˦β���ֻ���΢˦������ 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   36  float Speed_I_D_Temp=0,
Speed_I_D_Temp:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   37         X=20;//�ǶȻ��ֶ���
X:
        DATA
        DC32 41A00000H
//   38 #define N 10//2.80m/s*5ms*20=28cm,2.80m/s*5ms*10=14cm,��Nȡ10

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39  float Accum_Error_L[N]={0};//�������20��ƫ��ֵ����
Accum_Error_L:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40  float Accum_Error_R[N]={0};//�������20��ƫ��ֵ����
Accum_Error_R:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41  float Sum_Error_L=0,Sum_Error_R=0;//���������20�ε�ƫ���ܺ� 
Sum_Error_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Sum_Error_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42  float Speed_I_lntegral_L=0 ,Speed_I_lntegral_R=0;//�ٶȻ�I�����ۼ�_���֣��ٶȻ�I�����ۼ�_����
Speed_I_lntegral_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_I_lntegral_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   43  float Speed_I_lntegral_Max = 9000;//�ٶȻ������ۼ����ֵ
Speed_I_lntegral_Max:
        DATA
        DC32 460CA000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44  float Direction_Control_Output_L = 0.0;
Direction_Control_Output_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45  float Direction_Control_Output_R = 0.0;
Direction_Control_Output_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   46  uint8 Piaoyi_L=0,Piaoyi_R=0;
Piaoyi_L:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
Piaoyi_R:
        DS8 1
//   47 /*-------------------------------------------------------------------------------------------------------------------------****/
//   48 
//   49  /*****************************************************************************/
//   50  
//   51 /********************************************************************************/
//   52 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   53  int t=0;
t:
        DS8 4
//   54 /*******************************************
//   55 ��ʽ:V_left=V*(1+B*tan��/2L);V_right=V*(1-B*tan��/2L);
//   56 �����ٶ�=ǰ���ٶ�*��1+���ּ��*ǰ��ƫת�Ƕ�/2����ǰ���ּ�ࣩ
//   57 ͨ����ֵȷ��ƫת�Ƕȣ������ñ�����ת��
//   58 �ٶȿ��������֤����(ǰ���ٶ�)�ȶ���һ��ֵ�������ϡ�
//   59 **********************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   60 void Direction_ChaSpeed_Control(void)//(short int angle)
//   61 {
Direction_ChaSpeed_Control:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
//   62 /*
//   63 tan0��-45��-60��-70��--80��---81��--83��--85��--89��-90��-91��
//   64   0     1  1.73   2.7  5.7   6.3   8.1  11.4   57    ��  -57
//   65   �����������Ƕ�angle����С��90�ȣ�һ������90�ȣ��ʹ�����������ת��䵽������������䣬������ת
//   66 �������С����ڽǶ�Խ��tan���ҲԽ���أ����ܴ���80�ȡ����벻�ܴ���80�ȡ�
//   67   �������ݶ����ת��ò�����60�ȣ����趨��ת�Ƕ�Ϊ0��-60�ȡ�
//   68 ת��60�ȣ�PWM����Ϊ�����ڵ��ٶ��趨��30��P,ת��77����5500��PWM�
//   69 */
//   70   if(Chazhi<-Chazhi_limit||Chazhi>Chazhi_limit)
        LDR      R0,??Direction_ChaSpeed_Control_0
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_ChaSpeed_Control_1
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCC      ??Direction_ChaSpeed_Control_2
        LDR      R0,??Direction_ChaSpeed_Control_1
        LDR      R0,[R0, #+0]
        LDR      R1,??Direction_ChaSpeed_Control_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_3
//   71   {     
//   72     angle=Chazhi*k2;
??Direction_ChaSpeed_Control_2:
        LDR      R0,??Direction_ChaSpeed_Control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Direction_ChaSpeed_Control_1+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??Direction_ChaSpeed_Control_1+0x8
        STR      R0,[R1, #+0]
//   73   if(angle>0&&angle<Chazhi_limit*k1)
        LDR      R0,??Direction_ChaSpeed_Control_1+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Direction_ChaSpeed_Control_4
        LDR      R0,??Direction_ChaSpeed_Control_1
        LDR      R1,[R0, #+0]
        LDR      R0,??Direction_ChaSpeed_Control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,??Direction_ChaSpeed_Control_1+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_4
//   74     {
//   75       angle=Chazhi_limit*k1;
        LDR      R0,??Direction_ChaSpeed_Control_1
        LDR      R1,[R0, #+0]
        LDR      R0,??Direction_ChaSpeed_Control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??Direction_ChaSpeed_Control_1+0x8
        STR      R0,[R1, #+0]
//   76     }
//   77      if(angle<0&&angle>-Chazhi_limit*k1)
??Direction_ChaSpeed_Control_4:
        LDR      R0,??Direction_ChaSpeed_Control_1+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_5
        LDR      R0,??Direction_ChaSpeed_Control_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R1,R1,R0
        LDR      R0,??Direction_ChaSpeed_Control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??Direction_ChaSpeed_Control_1+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_5
//   78     {
//   79       angle=-Chazhi_limit*k1;
        LDR      R0,??Direction_ChaSpeed_Control_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R1,R1,R0
        LDR      R0,??Direction_ChaSpeed_Control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??Direction_ChaSpeed_Control_1+0x8
        STR      R0,[R1, #+0]
        B        ??Direction_ChaSpeed_Control_5
        Nop      
        DATA
??Direction_ChaSpeed_Control_1:
        DC32     Chazhi_limit
        DC32     k2
        DC32     angle
        THUMB
//   80     }
//   81 //    if(Chazhi>0)
//   82 //    {
//   83 //      if(Chazhi_Rate<0&&Chazhi_Rate>-10)
//   84 //      {
//   85 //         angle+=k3*Chazhi_Rate;
//   86 //      }
//   87 //     if(Chazhi_Rate<-10||Chazhi_Rate==-10)
//   88 //      {
//   89 //         angle+=k4*Chazhi_Rate;
//   90 //      }
//   91 //    }    
//   92 //    if(Chazhi<0)
//   93 //    {
//   94 //      if(Chazhi_Rate>0&&Chazhi_Rate<10)
//   95 //      {
//   96 //         angle+=k3*Chazhi_Rate;
//   97 //      }
//   98 //     if(Chazhi_Rate>10||Chazhi_Rate==-10)
//   99 //      {
//  100 //         angle+=k4*Chazhi_Rate;
//  101 //      }
//  102 //    }
//  103       
//  104   }
//  105   else
//  106   {
//  107 //��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
//  108 //��ֵΪ��:RateԽ���������,AngleԽ��;RateԽ���������,AngleԽС��
//  109 //  {    
//  110     angle=Chazhi*k1;
??Direction_ChaSpeed_Control_3:
        LDR      R0,??Direction_ChaSpeed_Control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Direction_ChaSpeed_Control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??Direction_ChaSpeed_Control_6
        STR      R0,[R1, #+0]
//  111 //    if(Chazhi_Rate>35)
//  112 //    {
//  113 //    angle=Chazhi*k1+Chazhi_Rate*k3;
//  114 //    }
//  115    }
//  116 
//  117 
//  118 ////angle=Fuzzy_Control_Direction();
//  119   
//  120 
//  121    
//  122    if(StraightRoad_Flag==1)
??Direction_ChaSpeed_Control_5:
        LDR      R0,??Direction_ChaSpeed_Control_6+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_7
//  123    {
//  124        speed_set=speed_set_Z;
        LDR      R0,??DataTable0
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  125        Piaoyi_L=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  126        Piaoyi_R=0; 
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STRB     R0,[R1, #+0]
//  127 //       BUZZER_OFF;
//  128 
//  129    }
//  130    
//  131     if(WindingRoad_Left_Flag==1)
??Direction_ChaSpeed_Control_7:
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_8
//  132     {
//  133        speed_set=speed_set_W;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  134 //       LED_3_ON;
//  135        if(angle>angle_limit-10)
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR      R0,??DataTable0_6
        LDM      R0!,{R2,R3}
        SUBS     R0,R0,#+8
        MOVS     R0,#+0
        LDR      R1,??DataTable0_7  ;; 0xc0240000
        BL       __aeabi_dadd
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_8
//  136           Piaoyi_L=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  137     }
//  138   
//  139      if(WindingRoad_Right_Flag==1)
??Direction_ChaSpeed_Control_8:
        LDR      R0,??DataTable0_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_9
//  140     {
//  141        speed_set=speed_set_W;
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  142 //       LED_3_ON;
//  143        if(angle<-angle_limit+10)
        MOVS     R0,#+0
        LDR      R1,??DataTable0_9  ;; 0x40240000
        LDR      R2,??DataTable0_6
        LDM      R2,{R2,R3}
        BL       __aeabi_dsub
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_9
//  144           Piaoyi_R=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable0_3
        STRB     R0,[R1, #+0]
//  145     }
//  146    
//  147    if(Piaoyi_L==1)
??Direction_ChaSpeed_Control_9:
        LDR      R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_10
//  148    {
//  149       if(angle<-30)
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_10  ;; 0xc1f00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_10
//  150         Piaoyi_L=2;     
        MOVS     R0,#+2
        LDR      R1,??DataTable0_2
        STRB     R0,[R1, #+0]
//  151    }
//  152    
//  153    if(Piaoyi_R==1)
??Direction_ChaSpeed_Control_10:
        LDR      R0,??DataTable0_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Direction_ChaSpeed_Control_11
//  154    {
//  155       if(angle>30)
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_11  ;; 0x41f00001
        BL       __aeabi_cfrcmple
        BHI      ??Direction_ChaSpeed_Control_11
//  156         Piaoyi_R=2;     
        MOVS     R0,#+2
        LDR      R1,??DataTable0_3
        STRB     R0,[R1, #+0]
//  157    }
//  158    
//  159    if(Piaoyi_L==2)
??Direction_ChaSpeed_Control_11:
        LDR      R0,??DataTable0_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
//  160    {
//  161       if(angle<-40)
//  162       {
//  163 //         speed_set-=20;
//  164 //       angle=angle*2;
//  165 //         BUZZER_ON;
//  166       }
//  167    }
//  168    
//  169      if(Piaoyi_R==2)
??Direction_ChaSpeed_Control_12:
        LDR      R0,??DataTable0_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
//  170    {
//  171       if(angle>40)
//  172       {
//  173 //          speed_set-=20;
//  174 //        angle=angle*2;
//  175 //          BUZZER_ON;
//  176       }
//  177    }
//  178    
//  179 ////�Ƕ����ƺ���
//  180 //  if(angle<60) Chasu_Bili_Temp=Chasu_Bili+0.5;
//  181 //  else         Chasu_Bili_Temp=Chasu_Bili;
//  182   
//  183   if(angle>angle_limit)   angle=angle_limit;
??Direction_ChaSpeed_Control_13:
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,??DataTable0_6
        LDM      R0,{R0,R1}
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_14
        LDR      R0,??DataTable0_6
        LDM      R0,{R0,R1}
        BL       __aeabi_d2f
        LDR      R1,??Direction_ChaSpeed_Control_6
        STR      R0,[R1, #+0]
//  184   if(angle<-angle_limit)   angle=-angle_limit;
??Direction_ChaSpeed_Control_14:
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR      R2,??DataTable0_6
        LDM      R2,{R2,R3}
        MOVS     R4,#+128
        LSLS     R4,R4,#+24       ;; #-2147483648
        EORS     R3,R3,R4
        BL       __aeabi_cdcmple
        BCS      ??Direction_ChaSpeed_Control_15
        LDR      R0,??DataTable0_6
        LDM      R0,{R0,R1}
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_d2f
        LDR      R1,??Direction_ChaSpeed_Control_6
        STR      R0,[R1, #+0]
//  185    
//  186    speed_set_L=speed_set*(1+k-Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L));//tan((double)(angle*0.01745))
??Direction_ChaSpeed_Control_15:
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1_3
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_4
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
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  187    speed_set_R=speed_set*(1+k+Chasu_Bili*B*tan((double)(angle*0.01745))/(2*L)); 
        LDR      R0,??DataTable0_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        LDR      R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Direction_ChaSpeed_Control_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable1_3
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_4
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
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  188    //�ٶ��趨0-10
//  189       if(speed_set_L>0&&speed_set_L<change_value)
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Direction_ChaSpeed_Control_16
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_16
//  190    {
//  191 //      speed_set_L=0;
//  192       speed_set_L-=change_variable;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  193       speed_set_R+=change_factor*speed_set_L;
        LDR      R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  194    }
//  195    
//  196    if(speed_set_R>0&&speed_set_R<change_value)
??Direction_ChaSpeed_Control_16:
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Direction_ChaSpeed_Control_17
        LDR      R0,??DataTable1_5
        B.N      ??Direction_ChaSpeed_Control_18
        DATA
??Direction_ChaSpeed_Control_0:
        DC32     Chazhi
        DC32     k1
        THUMB
??Direction_ChaSpeed_Control_18:
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_17
//  197    {
//  198 //      speed_set_R=0;
//  199            speed_set_R-=change_variable;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  200       speed_set_L+=change_factor*speed_set_R;
        LDR      R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  201    }
//  202 //�ٶ��趨С��0  
//  203    if(speed_set_L<0)
??Direction_ChaSpeed_Control_17:
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_19
//  204    {
//  205            speed_set_L-=change_variable;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  206 //                 speed_set_L=0;
//  207 
//  208       speed_set_R+=-change_factor*speed_set_L;
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        RSBS     R0,R1,#+0
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  209    }
//  210    
//  211    if(speed_set_R<0)
??Direction_ChaSpeed_Control_19:
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Direction_ChaSpeed_Control_20
//  212    {
//  213            speed_set_R-=change_variable;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  214 //                 speed_set_R=0;
//  215 
//  216       speed_set_L+=-change_factor*speed_set_R;
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        RSBS     R0,R1,#+0
        BL       __aeabi_i2f
        LDR      R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  217    }
//  218 //   if(speed_set_L<5)
//  219 //      speed_set_L-=20;
//  220 //   if(speed_set_R<5)
//  221 //      speed_set_R-=20;
//  222    
//  223 //   if(speed_set_L<=speed_temp2&&speed_set_L>speed_temp1)
//  224 //      speed_set_L=speed_temp1;
//  225 //   if(speed_set_R<=speed_temp2&&speed_set_R>speed_temp1)
//  226 //      speed_set_R=speed_temp1;
//  227    
//  228   }
??Direction_ChaSpeed_Control_20:
        POP      {R0-R2,R4-R7,PC}  ;; return
        Nop      
        DATA
??Direction_ChaSpeed_Control_6:
        DC32     angle
        DC32     StraightRoad_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     speed_set_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     Piaoyi_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     Piaoyi_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     WindingRoad_Left_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     speed_set_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     angle_limit

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0xc0240000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     WindingRoad_Right_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     0x40240000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0xc1f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0x41f00001
//  229 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  230 void Direction_Controler_I(void)
//  231 {
Direction_Controler_I:
        PUSH     {R7,LR}
//  232 //speed_car = speed_car / (10*);//ת������ 
//  233    Speed_Error_L = speed_set_L - speed_L; 
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_13
        STR      R0,[R1, #+0]
//  234    Speed_Error_R = speed_set_R - speed_R; 
        LDR      R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_14
        STR      R0,[R1, #+0]
//  235     
//  236     for(int i=0;i<N-1;i++)
        MOVS     R0,#+0
??Direction_Controler_I_0:
        CMP      R0,#+9
        BGE      ??Direction_Controler_I_1
//  237    {
//  238      Accum_Error_L[i]=Accum_Error_L[i+1]; 
        LDR      R1,??DataTable1_12
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable1_12
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  239    }
        ADDS     R0,R0,#+1
        B        ??Direction_Controler_I_0
//  240    Accum_Error_L[N-1]=Speed_Error_L;
??Direction_Controler_I_1:
        LDR      R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_12
        STR      R0,[R1, #+36]
//  241  
//  242    for( int i=0;i<N-1;i++)
        MOVS     R0,#+0
??Direction_Controler_I_2:
        CMP      R0,#+9
        BGE      ??Direction_Controler_I_3
//  243    {
//  244      Accum_Error_R[i]=Accum_Error_R[i+1]; 
        LDR      R1,??DataTable2
        MOVS     R2,#+4
        MULS     R2,R0,R2
        ADDS     R1,R1,R2
        LDR      R1,[R1, #+4]
        LDR      R2,??DataTable2
        MOVS     R3,#+4
        MULS     R3,R0,R3
        STR      R1,[R2, R3]
//  245    }
        ADDS     R0,R0,#+1
        B        ??Direction_Controler_I_2
//  246    Accum_Error_R[N-1]=Speed_Error_R;
??Direction_Controler_I_3:
        LDR      R0,??DataTable1_14
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2
        STR      R0,[R1, #+36]
//  247     
//  248 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     k

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     `B`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xAD42C3CA,0x3F91DE69

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     change_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     change_variable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     change_factor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     speed_set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     Accum_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     Speed_Error_R
//  249 
//  250 
//  251 
//  252 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  253 void Direction_Controler(void)
//  254 {
Direction_Controler:
        PUSH     {R3-R5,LR}
//  255 //speed_car = speed_car / (10*);//ת������ 
//  256    Speed_Error_L = speed_set_L - speed_L;//�ظ�
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  257    Speed_Error_R = speed_set_R - speed_R; 
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_6
        STR      R0,[R1, #+0]
//  258 //������20��ƫ����ܺ���Ϊ������
//  259    
//  260    Sum_Error_L=0;//������ƫ���ܺ�
        MOVS     R0,#+0
        LDR      R1,??DataTable2_7
        STR      R0,[R1, #+0]
//  261    Sum_Error_R=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  262    Speed_I_lntegral_L=0;//������ƫ���ܺ�*I=0��
        MOVS     R0,#+0
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  263    Speed_I_lntegral_R=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  264    
//  265 //����ƫ���ۻ�
//  266    for(int i=0;i<N-1;i++)
        MOVS     R4,#+0
??Direction_Controler_0:
        CMP      R4,#+9
        BGE      ??Direction_Controler_1
//  267    {
//  268      Accum_Error_L[i]=Accum_Error_L[i+1]; //�ظ�
        LDR      R0,??DataTable2_11
        MOVS     R1,#+4
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2_11
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  269      Sum_Error_L+=Accum_Error_L[i];
        LDR      R0,??DataTable2_7
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_11
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_7
        STR      R0,[R1, #+0]
//  270    }
        ADDS     R4,R4,#+1
        B        ??Direction_Controler_0
//  271       if(speed_L<20&&speed_R<20)
??Direction_Controler_1:
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_2
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_2
//  272    Accum_Error_L[N-1]=Speed_Error_L/10;
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_13  ;; 0x41200000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+36]
        B        ??Direction_Controler_3
//  273       else
//  274    Accum_Error_L[N-1]=Speed_Error_L;
??Direction_Controler_2:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+36]
//  275    Sum_Error_L+=Accum_Error_L[N-1]; 
??Direction_Controler_3:
        LDR      R0,??DataTable2_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_11
        LDR      R0,[R0, #+36]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_7
        STR      R0,[R1, #+0]
//  276  
//  277    for( int i=0;i<N-1;i++)
        MOVS     R4,#+0
??Direction_Controler_4:
        CMP      R4,#+9
        BGE      ??Direction_Controler_5
//  278    {
//  279      Accum_Error_R[i]=Accum_Error_R[i+1]; //�ظ�
        LDR      R0,??DataTable2
        MOVS     R1,#+4
        MULS     R1,R4,R1
        ADDS     R0,R0,R1
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable2
        MOVS     R2,#+4
        MULS     R2,R4,R2
        STR      R0,[R1, R2]
//  280      Sum_Error_R+=Accum_Error_R[i];
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  281    }
        ADDS     R4,R4,#+1
        B        ??Direction_Controler_4
//  282          if(speed_L<20&&speed_R<20)
??Direction_Controler_5:
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_6
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_12  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_6
//  283    Accum_Error_R[N-1]=Speed_Error_R/10;
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_13  ;; 0x41200000
        BL       __aeabi_fdiv
        LDR      R1,??DataTable2
        STR      R0,[R1, #+36]
        B        ??Direction_Controler_7
//  284          else
//  285    Accum_Error_R[N-1]=Speed_Error_R;
??Direction_Controler_6:
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2
        STR      R0,[R1, #+36]
//  286    Sum_Error_R+=Accum_Error_R[N-1];
??Direction_Controler_7:
        LDR      R0,??DataTable2_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+36]
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  287 //   if(angle>X)
//  288      Speed_I_D_Temp=Speed_I_D;
        LDR      R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_15
        STR      R0,[R1, #+0]
//  289 //   else
//  290 //     Speed_I_D_Temp=Speed_I_D/100;
//  291    Speed_I_lntegral_L = Speed_I_D_Temp*Sum_Error_L;
        LDR      R0,??DataTable2_15
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  292    Speed_I_lntegral_R = Speed_I_D_Temp*Sum_Error_R;
        LDR      R0,??DataTable2_15
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  293           
//  294    if (Speed_I_lntegral_L< -Speed_I_lntegral_Max)
        LDR      R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_16
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_8
//  295        Speed_I_lntegral_L= -Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  296    if (Speed_I_lntegral_L>  Speed_I_lntegral_Max)
??Direction_Controler_8:
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_9
//  297        Speed_I_lntegral_L=  Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  298    if (Speed_I_lntegral_R< -Speed_I_lntegral_Max)
??Direction_Controler_9:
        LDR      R0,??DataTable2_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_16
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        EORS     R1,R1,R2
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_10
//  299        Speed_I_lntegral_R= -Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  300    if (Speed_I_lntegral_R>  Speed_I_lntegral_Max)
??Direction_Controler_10:
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_11
//  301        Speed_I_lntegral_R=  Speed_I_lntegral_Max;
        LDR      R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  302 
//  303    if(angle>angle_P)
??Direction_Controler_11:
        LDR      R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable2_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Direction_Controler_12
//  304     Angle_P_choose=1;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable2_19
        STR      R0,[R1, #+0]
        B        ??Direction_Controler_13
//  305  else
//  306     Angle_P_choose=0;
??Direction_Controler_12:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_19
        STR      R0,[R1, #+0]
//  307  
//  308  
//  309  Direction_Control_Output_L = Speed_P_D*Speed_Error_L + Speed_I_lntegral_L+Speed_D_D*(Speed_Error_L-Speed_Error_Last_L)
//  310                             +Speed_Error_L*Angle_P_choose*Angle_P*abs_f(gyr_angle_speed)-Angle_D*gyr_angle_speed;   
??Direction_Controler_13:
        LDR      R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R5,R0
        LDR      R0,??DataTable2_21
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_24
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR      R0,??DataTable2_25
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_26
        STR      R0,[R1, #+0]
//  311 Direction_Control_Output_R = Speed_P_D*Speed_Error_R + Speed_I_lntegral_R+Speed_D_D*(Speed_Error_R-Speed_Error_Last_R)
//  312                             +Speed_Error_R*Angle_P_choose*Angle_P*abs_f(gyr_angle_speed)+Angle_D*gyr_angle_speed;   
        LDR      R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        BL       abs_f
        MOVS     R5,R0
        LDR      R0,??DataTable2_21
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable2_23
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable2_24
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R4,R1
        LDR      R0,??DataTable2_25
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR      R1,??DataTable2_28
        STR      R0,[R1, #+0]
//  313  
//  314    
//  315  
//  316  
//  317 //Direction_Control_Output_L = Speed_P_D*Speed_Error_L + Speed_I_lntegral_L+Speed_D_D*(Speed_Error_L-Speed_Error_Last_L)
//  318 //                            +Angle_P_choose*Angle_P*gyr_angle_speed-Angle_D*gyr_angle_speed;   
//  319 //Direction_Control_Output_R = Speed_P_D*Speed_Error_R + Speed_I_lntegral_R+Speed_D_D*(Speed_Error_R-Speed_Error_Last_R)
//  320 //                             -Angle_P_choose*Angle_P*gyr_angle_speed+Angle_D*gyr_angle_speed;   
//  321 // 
//  322    
//  323 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     Accum_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     speed_set_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     Speed_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     speed_set_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Speed_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     Sum_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     Sum_Error_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     Speed_I_lntegral_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Speed_I_lntegral_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     Accum_Error_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     Speed_I_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     Speed_I_D_Temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     Speed_I_lntegral_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     Angle_P_choose

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     gyr_angle_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     Speed_P_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     Speed_Error_Last_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     Speed_D_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     Direction_Control_Output_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     Speed_Error_Last_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_28:
        DC32     Direction_Control_Output_R
//  324 
//  325 
//  326 
//  327 
//  328 
//  329 
//  330 
//  331 
//  332 
//  333 
//  334 
//  335 
//  336 
//  337 
//  338 
//  339 
//  340 
//  341 
//  342 
//  343 
//  344 
//  345 
//  346 
//  347 
//  348 
//  349 
//  350 
//  351 
//  352 
//  353 
//  354 
//  355 
//  356 
//  357 
//  358 
//  359 
//  360 
//  361 
//  362 
//  363 
//  364 
//  365 
//  366 
//  367 
//  368 
//  369 //���룺��
//  370 //�������
//  371 //����:С�����ٵ���
//  372 //ԭ����������
//  373 //��ʽ:V_left=V*(k-B*tan��/2L);V_right=V*(k+B*tan��/2L);
//  374 //��Ϊ������ֵ��BΪ���ּ�࣬LΪǰ���ּ�࣬V = Speed_Set
//  375 //aΪ����ϵ��������p�����������,s��ǰ
//  376 //   Direction_Control_Output_L= P_Direction * speed_set_L;  
//  377 //   Direction_Control_Output_R= P_Direction * speed_set_R;
//  378    
//  379 // DIF_INTENSITY = 11; //����ǿ��    �������������Խ���ԣ����ٶ������Ժ󣬴�ֵӦ�ü�С  
//  380 //  uint32 temp1 = Speed_Set_Temp * DIF_P/100;
//  381 //  int32 temp2 = Speed_Set_Temp*angle*angle/DIF_INTENSITY;
//  382 //  if(angle<0) temp2 = -temp2;  
//  383 //  Speed_Set_L = temp1 +  temp2;
//  384 //  Speed_Set_R = temp1 -  temp2;
//  385 //  float temp=Speed_Set_Temp*DIF_INTENSITY*tan((double)(angle*0.01745))/10;
//  386 //  float temp2 = Speed_Set_Temp*DIF_P;     //��ǰ����Խ��Խ��ǰ
//  387 //  Speed_Set_L=(uint32)(temp2+temp);
//  388 //  Speed_Set_R=(uint32)(temp2-temp);
//  389 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  390 uint8 Direction_Control_Period = 0;
Direction_Control_Period:
        DS8 1
//  391 #define DIRECTION_CONTROL_PERIOD 50
//  392 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  393 float P_Direction1=40,D_Direction1=20.5;		//����
P_Direction1:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction1:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  394 float P_Direction2=40,D_Direction2=20.5;		//����
P_Direction2:
        DATA
        DC32 42200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction2:
        DATA
        DC32 41A40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  395 float P_Direction3=173,D_Direction3=145.5;		//����
P_Direction3:
        DATA
        DC32 432D0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
D_Direction3:
        DATA
        DC32 43118000H
//  396 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  397 float P_Direction = 100,D_Direction = 0;              
P_Direction:
        DATA
        DC32 42C80000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
D_Direction:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  398 float turn_spd = 150;
turn_spd:
        DATA
        DC32 43160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  399 float P_Direction_high = 80, P_Direction_low=80;//26
P_Direction_high:
        DATA
        DC32 42A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
P_Direction_low:
        DATA
        DC32 42A00000H
//  400 //float   K =1;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  401 float Direction_Control = 0.0, Direction_Control_Last = 0.0,Direction_Control_Err=0.0;
Direction_Control:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Last:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_Control_Err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  402 float Direction_angle=0.0;
Direction_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  403 float P_Dir_agl=20.0;
P_Dir_agl:
        DATA
        DC32 41A00000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  404 float Road_Err_D=0;		//ƫ���΢��
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
//  405 
//  406 //void Direction_Controler(void)
//  407 //{
//  408 //  float road_err_D_Tmp;
//  409 //  static float Chazhi_last;
//  410 //  
//  411 //  road_err_D_Tmp = Chazhi - Chazhi_last;
//  412 //  Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  413 //  
//  414 //  if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//  415 //  else                         P_Direction = P_Direction_low;
//  416 //  
//  417 //  Direction_Control_Output=( P_Direction * Chazhi)  + D_Direction*Road_Err_D;
//  418 //  Chazhi_last = Chazhi;
//  419 //
//  420 //
//  421 //}
//  422 
//  423 //void Direction_Controler(void)
//  424 //{
//  425 //    double road_err_D_Tmp = 0.0;	//ƫ��΢���м����
//  426 //
//  427 //    //һ���˲�
//  428 //    road_err_D_Tmp = Road_Err[9]- Road_Err[6];
//  429 //    Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  430 //
//  431 //    if( speed_car>turn_spd )     P_Direction = P_Direction_high;
//  432 //    else                         P_Direction = P_Direction_low;
//  433 //
//  434 //    Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//ת��
//  435 //    Direction_Control_Output = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//  436 //
//  437 //#if 0
//  438 //    //�����Կ��Ʒ���
//  439 //    Direction_Control_Period++;
//  440 //    //---------------------------------------------------------------------------------------------------------------------
//  441 //    if (Direction_Control_Period>=DIRECTION_CONTROL_PERIOD)
//  442 //    {
//  443 //        Direction_Control_Period = 0;
//  444 //        Direction_Control_Last = Direction_Control;
//  445 //        //һ���˲�
//  446 //        road_err_D_Tmp = Road_Err[9]- Road_Err[0];
//  447 //        Road_Err_D = (1-K)*Road_Err_D + K*road_err_D_Tmp;
//  448 //
//  449 //        Direction_angle = (gyro_y - gyr_offset_y) * gyr_ratio;		//ת��
//  450 //
//  451 //        Direction_Control = P_Direction * Road_Err[9] + D_Direction*Road_Err_D + Direction_angle*P_Dir_agl;
//  452 //        Direction_Control_Err = Direction_Control - Direction_Control_Last;
//  453 //    }
//  454 //    //---------------------------------------------------------------------------------------------------------------------
//  455 //
//  456 //    Direction_Control_Output = Direction_Control_Last + Direction_Control_Err*(Direction_Control_Period+1)/DIRECTION_CONTROL_PERIOD ;
//  457 //#endif
//  458 //}
//  459 //
//  460 //*/
// 
//   187 bytes in section .bss
//   104 bytes in section .data
// 2 130 bytes in section .text
// 
// 2 130 bytes of CODE memory
//   291 bytes of DATA memory
//
//Errors: none
//Warnings: none
