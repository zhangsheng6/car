///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:38:01
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\L3G4200D_ZS.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\L3G4200D_ZS.c -D IAR -D
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
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\L3G4200D_ZS.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN L3G4200_Read
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN abs_f
        EXTERN gyro_x
        EXTERN gyro_z

        PUBLIC Gyro_ZS
        PUBLIC gg
        PUBLIC gyr_angle
        PUBLIC gyr_angle_speed
        PUBLIC gyr_angle_speed_static
        PUBLIC gyr_angle_speed_static_sum
        PUBLIC gyr_angle_speed_up
        PUBLIC gyr_angle_static
        PUBLIC gyr_angle_up
        PUBLIC gyr_offset__x_average
        PUBLIC gyr_offset__x_sum
        PUBLIC gyr_offset__z_average
        PUBLIC gyr_offset__z_sum
        PUBLIC gyr_offset_x
        PUBLIC gyr_offset_y
        PUBLIC gyr_offset_z
        PUBLIC gyr_offset_z_sum
        PUBLIC sure_time
        PUBLIC zs

// H:\���ܳ�����2018\���ֱ���\7.29-sc\user\C\L3G4200D_ZS.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 #include "L3G4200D_ZS.h"
//    5 
//    6 #define INTEGRAL_TIME_CONSTANT 0.005        //����ʱ��
//    7 
//    8 //----------------------------������--------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float gyr_angle_speed,gyr_angle_speed_up,//�����ǽ��ٶ�
gyr_angle_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_angle_speed_up:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   10       gyr_angle_speed_static=3,//�����Ǿ�ֹʱ�Ľ��ٶ�
gyr_angle_speed_static:
        DATA
        DC32 40400000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11       gyr_angle_speed_static_sum,//�����Ǿ�ֹʱ�Ľ��ٶ��ܺ�
gyr_angle_speed_static_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12       gyr_angle = 0, gyr_angle_up = 0,//�����ǽǶ�
gyr_angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_angle_up:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13       gyr_angle_static=1,//�����Ǿ�ֹʱ�ĽǶ����,4min
gyr_angle_static:
        DATA
        DC32 3F800000H
//   14  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 gyr_offset_x = 18.8;//������x��ƫ����0.85
gyr_offset_x:
        DATA
        DC32 41966666H
//   16 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 float gyr_offset_y =-6.000;//������y��ƫ����
gyr_offset_y:
        DATA
        DC32 0C0C00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float gyr_offset_z =21.24,gyr_offset_z_sum=0;//������z��ƫ����
gyr_offset_z:
        DATA
        DC32 41A9EB85H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_offset_z_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int   gg=0;
gg:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float gyr_offset__z_sum=0;//������z�ᾲ̬ƫ�����ܺͣ�
gyr_offset__z_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float gyr_offset__z_average=0;//������z�ᾲ̬ƫ����ƽ��ֵ��
gyr_offset__z_average:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float gyr_offset__x_sum=0;//������z�ᾲ̬ƫ�����ܺͣ�
gyr_offset__x_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float gyr_offset__x_average=0;//������z�ᾲ̬ƫ����ƽ��ֵ��
gyr_offset__x_average:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int zs=0;
zs:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int sure_time=0;
sure_time:
        DS8 4
//   26 
//   27 /*****************�����ǲ⳵���ٶ�,�Ƕ�******************************************************************
//   28   δ�˲�4���Ӳ���10��
//   29   �˲���4���Ӳ���1��
//   30   С��ת90�ȣ������ǲ��45��
//   31   ����ͨ����������ǲ��45��
//   32   С����ԲȦ�����ʵ�ʳ�ת����270��,
//   33                   �����ǲ����136��
//   34   С��ת����󣬻���ʾ��ת�Ƕȣ�ֱ������ֱ������ֱ��ͨ�������ǽ����
//   35 �ĽǶȸ�P,ʹ��ֱ����ֱ������Ϊ������������ʾ�ĽǶ�һֱΪ0�ȡ�������
//   36 ��ת�����䲻ͬ������������������ʾ�Ƕ�Ϊ0�ȡ�֮ǰ��������ʾ�Ƕ�����
//   37 Ư�ƣ������ڹ�Բ�����ʱ����ʾ�Ƕ��Ѵﵽ��135�ȡ�
//   38   ��δ�뵽�������ǲ�õĽǶ�����Ư�ơ�
//   39   �������ǲ�õĴ���ٶ�������Ư��
//   40 *********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   41 void Gyro_ZS()
//   42 { 
Gyro_ZS:
        PUSH     {R4,R6,R7,LR}
//   43  int offset_flag=0;
        MOVS     R4,#+0
//   44 //������Z,Y�����ݶ�ȡ
//   45   L3G4200_Read();
        BL       L3G4200_Read
//   46 //  if(++sure_time<101)//2.5*100=250ms
//   47 //    gyr_offset_z_sum+=gyro_z;
//   48 //  else
//   49 //    offset_flag=1;
//   50 //  
//   51 //  if(offset_flag==1)
//   52 //  {
//   53 //      gyr_offset_z=gyr_offset_z_sum/100;
//   54 //      offset_flag=2;
//   55 //  }
//   56   if(sure_time<100)//2.5*100=250ms
        LDR      R0,??Gyro_ZS_0+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+100
        BGE      ??Gyro_ZS_1
//   57   {
//   58     sure_time++;
        LDR      R0,??Gyro_ZS_0+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??Gyro_ZS_0+0x4
        STR      R0,[R1, #+0]
//   59     gyr_offset_z_sum+=gyro_z;
        LDR      R0,??Gyro_ZS_0+0x10
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Gyro_ZS_0+0x8
        STR      R0,[R1, #+0]
        B        ??Gyro_ZS_2
//   60   }
//   61   else
//   62     offset_flag=1;
??Gyro_ZS_1:
        MOVS     R0,#+1
        MOVS     R4,R0
//   63   
//   64   if(offset_flag==1)
??Gyro_ZS_2:
        CMP      R4,#+1
        BNE      ??Gyro_ZS_3
//   65   {
//   66       gyr_offset_z=gyr_offset_z_sum/100;
        LDR      R0,??Gyro_ZS_0+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??Gyro_ZS_0+0xC  ;; 0x42c80000
        BL       __aeabi_fdiv
        LDR      R1,??Gyro_ZS_0+0x14
        STR      R0,[R1, #+0]
//   67       offset_flag=2;
        MOVS     R0,#+2
        MOVS     R4,R0
//   68   }
//   69 //�����ǽ��ٶ�=(������z������-������z�ᾲ̬ƫ����)*�����Ǳ���ϵ��
//   70   gyr_angle_speed=((float)gyro_z-gyr_offset_z)*gyr_ratio; //���ٶȣ���/��
??Gyro_ZS_3:
        LDR      R0,??Gyro_ZS_0+0x10
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x1C
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x28
        STR      R0,[R1, #+0]
//   71   gyr_angle_speed_up=((float)gyro_x-gyr_offset_x)*gyr_ratio; //���ٶȣ���/��
        LDR      R0,??Gyro_ZS_0+0x40
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x1C
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x30
        STR      R0,[R1, #+0]
//   72 
//   73 //�����ǽ��ٶȾ�̬�˲���������ٶȼ�
//   74   if(abs_f(gyr_angle_speed)<gyr_angle_speed_static)
        LDR      R0,??Gyro_ZS_0+0x28
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??Gyro_ZS_0+0x24
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Gyro_ZS_4
//   75   {
//   76     gyr_angle_speed=0;
        MOVS     R0,#+0
        LDR      R1,??Gyro_ZS_0+0x28
        STR      R0,[R1, #+0]
//   77   }
//   78 /* 1 ������� -----------------------------------------------------------  */
//   79 //������һ�γ���Ƕȹ��Ʊ��νǶ�
//   80 //���ڵĽǶ� = �ϴεĽǶ� + (������������ٶ� - ��̬ƫ��)*�����ǲ�������
//   81 //car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
//   82 //     ֮ǰ�ĽǶ�ƫ���ɿ��������˲��ͼ��ٶȼƻ��
//   83   gyr_angle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
??Gyro_ZS_4:
        LDR      R0,??Gyro_ZS_0+0x2C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??Gyro_ZS_0+0x28
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x34
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x2C
        STR      R0,[R1, #+0]
//   84   gyr_angle_up += gyr_angle_speed_up * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??Gyro_ZS_0+0x3C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??Gyro_ZS_0+0x30
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x34
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x3C
        STR      R0,[R1, #+0]
//   85  
//   86 //  if(gyr_angle>gyr_angle_static||gyr_angle<-gyr_angle_static)
//   87 //  {�Ƕ�ȷ��
//   88 //     Direction_Angle=gyr_angle;
//   89 //  }
//   90   
//   91   
//   92   
//   93 //  uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);
//   94 
//   95 //ȷ��������Z�ᾲ̬ƫ����ֵ����,�ɲɼ�4.3minƽ��ֵ
//   96 //  gg++;
//   97 //  gyr_offset__z_sum+=gyro_z;
//   98 //  gyr_offset__z_average=gyr_offset__z_sum/gg;
//   99   
//  100   gg++;
        LDR      R0,??Gyro_ZS_0+0x44
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??Gyro_ZS_0+0x44
        STR      R0,[R1, #+0]
//  101   gyr_offset__x_sum+=gyro_x;
        LDR      R0,??Gyro_ZS_0+0x40
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x48
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Gyro_ZS_0+0x48
        STR      R0,[R1, #+0]
//  102   gyr_offset__x_average=gyr_offset__x_sum/gg;
        LDR      R0,??Gyro_ZS_0+0x44
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??Gyro_ZS_0+0x48
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR      R1,??Gyro_ZS_0
        STR      R0,[R1, #+0]
//  103 //ȷ��������Z�ᾲ̬���ٶ�ƽ��ֵ���򣬿ɲɼ�4.3minƽ��ֵ��0.038
//  104 //  gg++;
//  105 //  gyr_angle_speed_static_sum+=gyr_angle_speed;
//  106 //  gyr_angle_speed_static=gyr_angle_speed_static_sum/gg;
//  107 //ȷ��������Z�ᾲ̬���ٶ����ֵ����0.89
//  108 //  if(gyr_angle_speed_static<gyr_angle_speed)
//  109 //    gyr_angle_speed_static=gyr_angle_speed;
//  110 }
        POP      {R4,R6,R7,PC}    ;; return
        DATA
??Gyro_ZS_0:
        DC32     gyr_offset__x_average
        DC32     sure_time
        DC32     gyr_offset_z_sum
        DC32     0x42c80000
        DC32     gyro_z
        DC32     gyr_offset_z
        DC32     gyr_offset_x
        DC32     0xB22D0E56,0xBFA7EF9D
        DC32     gyr_angle_speed_static
        DC32     gyr_angle_speed
        DC32     gyr_angle
        DC32     gyr_angle_speed_up
        DC32     0x47AE147B,0x3F747AE1
        DC32     gyr_angle_up
        DC32     gyro_x
        DC32     gg
        DC32     gyr_offset__x_sum

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  111 //ֱ����
//  112 //�Ƕ����=P*�����ǽǶ�ƫ��+D*�����ǽ��ٶ�
//  113 //Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;
//  114 
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 
//  121 
//  122 
//  123 
//  124 
//  125 
//  126 
//  127 
// 
//  52 bytes in section .bss
//  20 bytes in section .data
// 396 bytes in section .text
// 
// 396 bytes of CODE memory
//  72 bytes of DATA memory
//
//Errors: none
//Warnings: none
