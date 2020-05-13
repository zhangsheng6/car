///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       12/Mar/2018  19:34:05
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\user\C\balanceControl.c
//    Command line =  
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\user\C\balanceControl.c" -D IAR -D TWR_K60N512 -D
//        _DLIB_FILE_DESCRIPTOR -lCN "C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\iar\KEA_128_FLASH\List\" -lB
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\iar\KEA_128_FLASH\List\" -o
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\iar\KEA_128_FLASH\Obj\" --no_cse --no_unroll --no_inline
//        --no_code_motion --no_tbaa --no_clustering --no_scheduling --debug
//        --endian=little --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\iar\..\device\H\" -I
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\iar\..\user\H\" -I
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\iar\..\system\" -I
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\iar\..\lib\H\" -I
//        "C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\iar\..\system\coreSupport\" -Ol
//    List file    =  
//        C:\Users\��˧ӡ\Desktop\2018ֱ�� -
//        KEAֱ��312\iar\KEA_128_FLASH\List\balanceControl.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioSet
        EXTERN L3G4200_Read
        EXTERN OutPut_Data
        EXTERN UART_SendFloat
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
        EXTERN __aeabi_ui2f
        EXTERN acos
        EXTERN chice
        EXTERN gyro_x
        EXTERN hw_ad_ave
        EXTERN tan

        PUBLIC Angle_Controler
        PUBLIC Angle_Kalman
        PUBLIC Angle_Out
        PUBLIC D_angle
        PUBLIC P_angle
        PUBLIC Q_angle
        PUBLIC Q_gyro
        PUBLIC R_angle
        PUBLIC acc_angle
        PUBLIC acc_angle_cos
        PUBLIC acc_ave
        PUBLIC acc_mid
        PUBLIC angle_mid
        PUBLIC car_angle
        PUBLIC car_angle_speed
        PUBLIC gyr_angle
        PUBLIC gyr_angle_speed
        PUBLIC gyr_offset_x
        PUBLIC low_spd_agl

// C:\Users\��˧ӡ\Desktop\2018ֱ�� - KEAֱ��312\user\C\balanceControl.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�    balanceControl.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��    ƽ�����
//   10   *
//   11   * ��ǰ�汾��     1.0
//   12   * ��    ��     ��־ΰ
//   13   * ʱ    �䣺     2018��1��30�� 20:35:50
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "balanceControl.h"
//   18 #include "Variable.h"
//   19 #define PI 3.141592654
//   20 #define INTEGRAL_TIME_CONSTANT 0.005         //����ʱ��
//   21 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 float R_angle =  0.00009;//0.009;	//ԽС,��������,����ֵ̬ë�̶�;Խ��������������ֵ̬Խƽ��  ��С�� ��Ҫ������������������ȥ��㣬���治��ʱ
R_angle:
        DATA
        DC32 38BCBE62H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 float Q_angle = 0.0001;//0.00001;	//Խ���������٣�����̬�������ԽСԽ�ã�������Ժ�����
Q_angle:
        DATA
        DC32 38D1B717H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 float Q_gyro = 0.0003;//0.00003;	//ԽС,�˳������ȶ��ǶȲ��ڼ��ٶȼƵ����ģ���С��������̫С���������࣬���治��ʱ
Q_gyro:
        DATA
        DC32 399D4952H
//   25 
//   26 //----------------------------������--------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 float gyr_angle_speed, gyr_angle = 0, gyr_offset_x = 35;//������x,y��ƫ����
gyr_angle_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
gyr_offset_x:
        DATA
        DC32 420C0000H
//   28 //int16 gyr_offset_x;
//   29 
//   30 
//   31 //----------------------------���ٶȼ�------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 float acc_ave,acc_angle,acc_mid = 1211.76;//���崹ֱ�����ADֵ
acc_ave:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
acc_angle:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
acc_mid:
        DATA
        DC32 44977852H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 float acc_angle_cos;						//���ڼ�����ٶȼƽǶ�
acc_angle_cos:
        DS8 4
//   34 #define ACC_MV_NUM  1.220703125         //mv/num
//   35 #define acc_ratio	0.00100708       		//���ٶȼƱ���ϵ��������ֵ��
//   36 
//   37 //---------------------------------ֱ������-------------------------------------
//   38 //angle_mid  103.3 ������  92.4 �����ص����
//   39 //P_angle    1000�𲽵���

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 float car_angle = 0, car_angle_speed = 0;
car_angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
car_angle_speed:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   41 float angle_mid = 90.35;//83.5; //80.690;// 90.930	88.5 ����ǰ���ʹ�ٶȲ��ȣ�82~125��
angle_mid:
        DATA
        DC32 42B4B333H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   42 float low_spd_agl = 90;
low_spd_agl:
        DATA
        DC32 42B40000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   43 float P_angle = 2100;//1900;//;3340;//5300;//9500; 5000 - ֱ��,̫���ִ򻬳��ᷢ��
P_angle:
        DATA
        DC32 45034000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 float D_angle = 0;//6.3; //6.8; //6.300
D_angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 float Angle_Out = 0;
Angle_Out:
        DS8 4
//   46 
//   47 /**
//   48   * ���
//   49   *     �������˲�
//   50   * ע��
//   51   *     1
//   52   *       ���������� �� ��Ӯ����ֱ�������ֲ� PDF
//   53   *     2
//   54   *       �����Ƕ�ʱ�����ݿ���
//   55   *       ���ٶȼƳ�ʱ�����ݿ��ţ����߻���
//   56   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   57 void Angle_Kalman(void)
//   58 {
Angle_Kalman:
        PUSH     {R3-R5,LR}
//   59     static float Pdot[4] = {0,0,0,0};             //����Э��������΢�־���
//   60     static float P[2][2] = {{ 1, 0 }, { 0, 1 }};  //����Э�������      |1  0|
//   61     static float gyro_error = 0, angle_error = 0; //�����ǽ��ٶȵ�ƫ���ֵ�ɿ��������̼�����£�  |0  1|
//   62     static float K_0 = 0, K_1 = 0;                //���п��������������һ�����������ڼ������Ź���ֵ
//   63     static float E, t_0, t_1;
//   64 
//   65     //�����ǲ⳵�Ƕ�
//   66     L3G4200_Read();
        BL       L3G4200_Read
//   67     gyr_angle_speed = ((float)gyro_x-gyr_offset_x)*gyr_ratio; //X,���ٶȣ���/��
        LDR      R0,??DataTable0_14
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??DataTable0_15
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_16
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable0_13
        STR      R0,[R1, #+0]
//   68 
//   69     //���ٶȼƲ⳵�Ƕ�
//   70     acc_ave = hw_ad_ave(MMA7361, adc12bit, 10);//jlink��3.3v���磬�������5v�����Ի�׼��ѹ��ͬ���ɼ������᲻һ��
        MOVS     R2,#+10
        MOVS     R1,#+2
        MOVS     R0,#+9
        BL       hw_ad_ave
        BL       __aeabi_ui2f
        LDR      R1,??DataTable0_18
        STR      R0,[R1, #+0]
//   71 //    acc_angle_cos = (acc_mid - acc_ave)*acc_ratio;/* ���㲻���������ʽ --- han */
//   72     acc_angle_cos = (float)(((acc_ave + 1351.68 - acc_mid)*ACC_MV_NUM - 1650) / 7840.0);
        LDR      R0,??DataTable0_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_17
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        MOVS     R2,#+0
        LDR      R3,??DataTable0  ;; 0x3ff38800
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable0_1  ;; 0xc099c800
        BL       __aeabi_dadd
        MOVS     R2,#+0
        LDR      R3,??DataTable0_2  ;; 0x40bea000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   73 
//   74     if (acc_angle_cos > 1.0)
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_3  ;; 0x3f800001
        BL       __aeabi_cfrcmple
        BHI      ??Angle_Kalman_0
//   75         acc_angle_cos  = 1.0;
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
        B        ??Angle_Kalman_1
//   76     else if (acc_angle_cos < -1.0)
??Angle_Kalman_0:
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_6  ;; 0xbf800000
        BL       __aeabi_cfcmple
        BCS      ??Angle_Kalman_1
//   77         acc_angle_cos  = -1.0;
        LDR      R0,??DataTable0_6  ;; 0xbf800000
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   78 
//   79     acc_angle = acos(acc_angle_cos)*180/PI;     //ת��Ϊ�Ƕ�
??Angle_Kalman_1:
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       acos
        MOVS     R2,#+0
        LDR      R3,??DataTable0_7  ;; 0x40668000
        BL       __aeabi_dmul
        ADR      R2,??DataTable0_8
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR      R1,??DataTable0_11
        STR      R0,[R1, #+0]
//   80 
//   81     /* 1 ������� -----------------------------------------------------------  */
//   82     //������һ�γ���Ƕȹ��Ʊ��νǶ�
//   83     //���ڵĽǶ� = �ϴεĽǶ� + (������������ٶ� - ��̬ƫ��)*�����ǲ�������
//   84     car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??DataTable0_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable0_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//   85 
//   86     /* 2 Ԥ�ⷽ�����Ԥ��ֵ -------------------------------------------------- */
//   87     //�������Э��������΢�־���
//   88     Pdot[0] = Q_angle  - P[0][1] - P[1][0];
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_6
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_6
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   89     Pdot[1] = - P[1][1];
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+12]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+4]
//   90     Pdot[2] = - P[1][1];
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+12]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+8]
//   91     Pdot[3] = Q_gyro;
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+12]
//   92 
//   93     //����Э�������
//   94     P[0][0] += Pdot[0] * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//   95     P[0][1] += Pdot[1] * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+4]
//   96     P[1][0] += Pdot[2] * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+8]
//   97     P[1][1] += Pdot[3] * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        ADR      R2,??DataTable0_10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+12]
//   98 
//   99     /* 3 ���㿨�������� ------------------------------------------------------ */
//  100     E = R_angle + P[0][0];
        LDR      R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  101     //���㿨��������
//  102     K_0 =  P[0][0] / E;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR      R1,??DataTable1_7
        STR      R0,[R1, #+0]
//  103     K_1 =  P[1][0] / E;
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR      R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  104 
//  105     /* 5 ����Э������� ------------------------------------------------------ */
//  106     t_0 = P[0][0];
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_4
        STR      R0,[R1, #+0]
//  107     t_1 = P[0][1];
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//  108 
//  109     //����Э�������
//  110     P[0][0] -= K_0 * t_0;  //P(K|K)
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  111     P[0][1] -= K_0 * t_1;
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+4]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+4]
//  112     P[1][0] -= K_1 * t_0;
        LDR      R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+8]
//  113     P[1][1] -= K_1 * t_1;
        LDR      R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+12]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+12]
//  114 
//  115     /* 4 �����п��������������� ------------------------------------------- */
//  116     angle_error = acc_angle - car_angle;
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_9
        STR      R0,[R1, #+0]
//  117     //�������Ź���ֵ
//  118     car_angle += K_0 * angle_error; //X(K|K)
        LDR      R0,??DataTable1_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable0_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_12
        STR      R0,[R1, #+0]
//  119     //�������Ź���ֵƫ��
//  120     gyro_error += K_1 * angle_error; //X(K|K)
        LDR      R0,??DataTable1_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??DataTable1_10
        STR      R0,[R1, #+0]
//  121     //Ϊ��PID���ưѽ��ٶ������
//  122     car_angle_speed = gyr_angle_speed - gyro_error;
        LDR      R0,??DataTable0_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_18
        STR      R0,[R1, #+0]
//  123 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x3ff38800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0xc099c800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x40bea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     0x3f800001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     acc_angle_cos

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     acc_mid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0x40668000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x54524550,0x400921FB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Q_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0x47AE147B,0x3F747AE1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     acc_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     car_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     gyr_angle_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     gyro_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     gyr_offset_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     0x1EB851EC,0xBF81EB85

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     0x51EB851F,0x40951EB8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_18:
        DC32     acc_ave

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Pdot:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??P:
        DATA
        DC32 3F800000H, 0H, 0H, 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??gyro_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??angle_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??K_0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??K_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??E:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??t_0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??t_1:
        DS8 4
//  124 
//  125 /**
//  126   * ���
//  127   *     ֱ������
//  128   * ע��
//  129   *     math.h�����Ǻ����õ��� ����
//  130   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void Angle_Controler(void)
//  132 {
Angle_Controler:
        PUSH     {R4,LR}
//  133     static float angle_E, E_angle;
//  134 
//  135     angle_E = (angle_mid - car_angle);
        LDR      R0,??DataTable1_11
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_13
        STR      R0,[R1, #+0]
//  136 
//  137     //>E_angle ����ֱ������(ʹ����ʵ��������ΪP_angle��ȡֵ��Χ̫С������ֻ��ʹ���Ƿ�Χ��С)
//  138     E_angle = tan(angle_E/180*PI) * 9.8;//a > tan(��) * g -> �ָ���ʹС���ָ�
        LDR      R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1_14  ;; 0x43340000
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        ADR      R2,??DataTable1_15
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       tan
        ADR      R2,??DataTable1_16
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??DataTable1_20
        STR      R0,[R1, #+0]
//  139     //tan(��) -0.414~0.374
//  140     //E_angle
//  141 
//  142     //    Angle_Out = -( P_angle*angle_E ) - D_angle*car_angle_speed;//ȡֵ��Χ̫С���˷�������
//  143 
//  144     Angle_Out = -(P_angle*E_angle) + D_angle*car_angle_speed;// E_angle = 10 <-> 0.02985259896577487006352080076417
        LDR      R0,??DataTable1_17
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R0,??DataTable1_19
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR      R1,??DataTable1_21
        STR      R0,[R1, #+0]
//  145     // P_angle*E_angle 349.2858
//  146     //gyr_angle_speed 32.4  D_angle*gyr_angle_speed 1.8 ������
//  147     //	DataScope_Get_Channel_Data(car_angle,3);
//  148 
//  149 
//  150 //        UART_SendFloat(gyro_x, 1);
//  151     switch (chice)
        LDR      R0,??DataTable1_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Angle_Controler_0
        CMP      R0,#+2
        BEQ      ??Angle_Controler_1
        BCC      ??Angle_Controler_2
        B        ??Angle_Controler_3
//  152     {
//  153       case 0:
//  154         LED_2_OFF;
??Angle_Controler_0:
        MOVS     R1,#+1
        MOVS     R0,#+50
        BL       GpioSet
//  155         break;
        B        ??Angle_Controler_4
//  156 
//  157       case 1:
//  158         LED_2_ON;
??Angle_Controler_2:
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       GpioSet
//  159         UART_SendFloat(acc_ave, 1);
        MOVS     R1,#+1
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        BL       UART_SendFloat
//  160         break;
        B        ??Angle_Controler_4
//  161 
//  162       case 2:
//  163         LED_2_ON;
??Angle_Controler_1:
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       GpioSet
//  164         OutPut_Data(acc_ave, 0, 0, 0);
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR      R0,??DataTable1_23
        LDR      R0,[R0, #+0]
        BL       OutPut_Data
//  165 //        UART_SendFloat(car_angle, 1);
//  166         break;
        B        ??Angle_Controler_4
//  167 
//  168       default :
//  169         break;
//  170     }
//  171 }
??Angle_Controler_3:
??Angle_Controler_4:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     Q_gyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ??Pdot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     R_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     ??E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     ??t_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     ??t_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     ??P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     ??K_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     ??K_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     ??angle_error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     ??gyro_error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     angle_mid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     car_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     ??angle_E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     0x43340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     0x54524550,0x400921FB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     0x9999999A,0x40239999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     D_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     car_angle_speed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     P_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     ??E_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     Angle_Out

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_22:
        DC32     chice

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_23:
        DC32     acc_ave

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??angle_E:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??E_angle:
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
//  172 
//  173 
// 
//    88 bytes in section .bss
//    48 bytes in section .data
// 1 114 bytes in section .text
// 
// 1 114 bytes of CODE memory
//   136 bytes of DATA memory
//
//Errors: none
//Warnings: 1
