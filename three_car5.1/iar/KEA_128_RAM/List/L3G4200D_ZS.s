///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:39
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\L3G4200D_ZS.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\L3G4200D_ZS.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\L3G4200D_ZS.s
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
        PUBLIC zs

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\L3G4200D_ZS.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 #include "L3G4200D_ZS.h"
//    5 
//    6 #define INTEGRAL_TIME_CONSTANT 0.005        //积分时间
//    7 
//    8 //----------------------------陀螺仪--------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float gyr_angle_speed,gyr_angle_speed_up,//陀螺仪角速度
gyr_angle_speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_angle_speed_up:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   10       gyr_angle_speed_static=1,//陀螺仪静止时的角速度
gyr_angle_speed_static:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11       gyr_angle_speed_static_sum,//陀螺仪静止时的角速度总和
gyr_angle_speed_static_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12       gyr_angle = 0, gyr_angle_up = 0,//陀螺仪角度
gyr_angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyr_angle_up:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13       gyr_angle_static=1,//陀螺仪静止时的角度误差,4min
gyr_angle_static:
        DATA
        DC32 3F800000H
//   14  

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 gyr_offset_x = 18.8;//陀螺仪x轴偏移量0.85
gyr_offset_x:
        DATA
        DC32 41966666H
//   16 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 float gyr_offset_y =-6.000;//陀螺仪y轴偏移量
gyr_offset_y:
        DATA
        DC32 0C0C00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float gyr_offset_z =21.24;//陀螺仪z轴偏移量
gyr_offset_z:
        DATA
        DC32 41A9EB85H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int   gg=0;
gg:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float gyr_offset__z_sum=0;//陀螺仪z轴静态偏移量总和；
gyr_offset__z_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float gyr_offset__z_average=0;//陀螺仪z轴静态偏移量平均值；
gyr_offset__z_average:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float gyr_offset__x_sum=0;//陀螺仪z轴静态偏移量总和；
gyr_offset__x_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float gyr_offset__x_average=0;//陀螺仪z轴静态偏移量平均值；
gyr_offset__x_average:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int zs=0;
zs:
        DS8 4
//   25 /*****************陀螺仪测车角速度,角度******************************************************************
//   26   未滤波4分钟产生10度
//   27   滤波后4分钟产生1度
//   28   小车转90度，陀螺仪测得45度
//   29   过普通弯道，陀螺仪测得45度
//   30   小车过圆圈弯道，实际车转过了270度,
//   31                   陀螺仪测得了136度
//   32   小车转过弯后，会显示已转角度，直立车的直立环可直接通过陀螺仪解算后
//   33 的角度给P,使其直立。直立环是为了让陀螺仪显示的角度一直为0度。但三轮
//   34 车转弯与其不同，并不是让陀螺仪显示角度为0度。之前想让其显示角度抑制
//   35 漂移，但是在过圆环弯道时，显示角度已达到了135度。
//   36   故未想到用陀螺仪测得的角度抑制漂移。
//   37   用陀螺仪测得的大角速度抑制其漂移
//   38 *********************************************************************************/

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   39 void Gyro_ZS()
//   40 { 
Gyro_ZS:
        PUSH     {R3-R5,LR}
//   41 //陀螺仪Z,Y轴数据读取
//   42   L3G4200_Read();
        BL       L3G4200_Read
//   43  
//   44 //陀螺仪角速度=(陀螺仪z轴数据-陀螺仪z轴静态偏移量)*陀螺仪比例系数
//   45   gyr_angle_speed=((float)gyro_z-gyr_offset_z)*gyr_ratio; //角速度，度/秒
        LDR      R0,??Gyro_ZS_0+0x4
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x1C
        STR      R0,[R1, #+0]
//   46   gyr_angle_speed_up=((float)gyro_x-gyr_offset_x)*gyr_ratio; //角速度，度/秒
        LDR      R0,??Gyro_ZS_0+0x34
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x10
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x24
        STR      R0,[R1, #+0]
//   47 
//   48 //陀螺仪角速度静态滤波，代替加速度计
//   49   if(gyr_angle_speed<gyr_angle_speed_static&&gyr_angle_speed>-gyr_angle_speed_static)
        LDR      R0,??Gyro_ZS_0+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Gyro_ZS_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Gyro_ZS_1
        LDR      R0,??Gyro_ZS_0+0x18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Gyro_ZS_0+0x1C
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Gyro_ZS_1
//   50   {
//   51     gyr_angle_speed=0;
        MOVS     R0,#+0
        LDR      R1,??Gyro_ZS_0+0x1C
        STR      R0,[R1, #+0]
//   52   }
//   53 /* 1 先验估计 -----------------------------------------------------------  */
//   54 //根据上一次车体角度估计本次角度
//   55 //现在的角度 = 上次的角度 + (陀螺仪所测角速度 - 静态偏移)*陀螺仪采样周期
//   56 //car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
//   57 //     之前的角度偏差由卡尔额曼滤波和加速度计获得
//   58   gyr_angle += gyr_angle_speed * INTEGRAL_TIME_CONSTANT;
??Gyro_ZS_1:
        LDR      R0,??Gyro_ZS_0+0x20
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Gyro_ZS_0+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x28
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x20
        STR      R0,[R1, #+0]
//   59   gyr_angle_up += gyr_angle_speed_up * INTEGRAL_TIME_CONSTANT;
        LDR      R0,??Gyro_ZS_0+0x30
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??Gyro_ZS_0+0x24
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??Gyro_ZS_0+0x28
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??Gyro_ZS_0+0x30
        STR      R0,[R1, #+0]
//   60  
//   61 //  if(gyr_angle>gyr_angle_static||gyr_angle<-gyr_angle_static)
//   62 //  {角度确定
//   63 //     Direction_Angle=gyr_angle;
//   64 //  }
//   65   
//   66   
//   67   
//   68 //  uart_sendware_float(car_angle,acc_angle,car_angle_speed,0);
//   69 
//   70 //确定陀螺仪Z轴静态偏移量值程序,可采集4.3min平均值
//   71 //  gg++;
//   72 //  gyr_offset__z_sum+=gyro_z;
//   73 //  gyr_offset__z_average=gyr_offset__z_sum/gg;
//   74   
//   75   gg++;
        LDR      R0,??Gyro_ZS_0+0x38
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??Gyro_ZS_0+0x38
        STR      R0,[R1, #+0]
//   76   gyr_offset__x_sum+=gyro_x;
        LDR      R0,??Gyro_ZS_0+0x34
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        BL       __aeabi_i2f
        LDR      R1,??Gyro_ZS_0+0x3C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Gyro_ZS_0+0x3C
        STR      R0,[R1, #+0]
//   77   gyr_offset__x_average=gyr_offset__x_sum/gg;
        LDR      R0,??Gyro_ZS_0+0x38
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??Gyro_ZS_0+0x3C
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR      R1,??Gyro_ZS_0
        STR      R0,[R1, #+0]
//   78 //确定陀螺仪Z轴静态角速度平均值程序，可采集4.3min平均值，0.038
//   79 //  gg++;
//   80 //  gyr_angle_speed_static_sum+=gyr_angle_speed;
//   81 //  gyr_angle_speed_static=gyr_angle_speed_static_sum/gg;
//   82 //确定陀螺仪Z轴静态角速度最大值程序，0.89
//   83 //  if(gyr_angle_speed_static<gyr_angle_speed)
//   84 //    gyr_angle_speed_static=gyr_angle_speed;
//   85 }
        POP      {R0,R4,R5,PC}    ;; return
        Nop      
        DATA
??Gyro_ZS_0:
        DC32     gyr_offset__x_average
        DC32     gyro_z
        DC32     gyr_offset_z
        DC32     gyr_offset_x
        DC32     0x60418937,0xBFA2D0E5
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
//   86 //直立车
//   87 //角度输出=P*陀螺仪角度偏差+D*陀螺仪角速度
//   88 //Angle_Out = P_angle*angle_E + D_angle*car_angle_speed;
//   89 
//   90 
//   91 
//   92 
//   93 
//   94 
//   95 
//   96 
//   97 
//   98 
//   99 
//  100 
//  101 
//  102 
// 
//  44 bytes in section .bss
//  20 bytes in section .data
// 332 bytes in section .text
// 
// 332 bytes of CODE memory
//  64 bytes of DATA memory
//
//Errors: none
//Warnings: none
