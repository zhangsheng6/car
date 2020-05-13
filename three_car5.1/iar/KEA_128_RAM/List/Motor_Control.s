///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:40
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\Motor_Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\Motor_Control.c -D
//        IAR -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\Motor_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Direction_Control_Output_L
        EXTERN Direction_Control_Output_R
        EXTERN FTM_PwmDuty
        EXTERN GpioSet
        EXTERN Speed_Control_Output_L
        EXTERN Speed_Control_Output_R
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd

        PUBLIC AD_0_Max
        PUBLIC AD_0_Min
        PUBLIC AD_2_Max
        PUBLIC AD_2_Min
        PUBLIC DEAD_L
        PUBLIC DEAD_R
        PUBLIC Motor_Max
        PUBLIC Motor_Min
        PUBLIC Motor_Out_L
        PUBLIC Motor_Out_R
        PUBLIC Motor_control
        PUBLIC Wangdao_Speed_Output

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\Motor_Control.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    Motor_Control.c
//    8   * 文件标识：
//    9   * 摘    要：
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1月29日 21:58:02
//   14   ******************************************************************************
//   15   */
//   16 #include "Motor_Control.h"
//   17 
//   18 extern float Direction_Control_Output_L ,Direction_Control_Output_R;
//   19 //电机

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 7500, Motor_Min = -7500;
Motor_Out_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Max:
        DATA
        DC32 45EA6000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Min:
        DATA
        DC32 0C5EA6000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 unsigned int DEAD_L = 2000;//2290
DEAD_L:
        DATA
        DC32 2000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 unsigned int DEAD_R =2000;
DEAD_R:
        DATA
        DC32 2000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 float AD_0_Min=10,AD_0_Max=45,AD_2_Max=45,AD_2_Min=10;//7,57
AD_0_Min:
        DATA
        DC32 41200000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AD_0_Max:
        DATA
        DC32 42340000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AD_2_Max:
        DATA
        DC32 42340000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AD_2_Min:
        DATA
        DC32 41200000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float Wangdao_Speed_Output = 0;
Wangdao_Speed_Output:
        DS8 4
//   25 
//   26 /**
//   27   * 简介
//   28   *     电机控制程序
//   29   * 备注
//   30   *
//   31   */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   32 void Motor_control(void)
//   33 {
Motor_control:
        PUSH     {R7,LR}
//   34     Motor_Out_L = Direction_Control_Output_L+Speed_Control_Output_L;
        LDR      R0,??Motor_control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   35     Motor_Out_R =Direction_Control_Output_R+Speed_Control_Output_R;
        LDR      R0,??Motor_control_0+0xC
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x14
        STR      R0,[R1, #+0]
//   36   
//   37   
//   38     /* 电机启动PWM控制 ------------------------------------------------------- */
//   39    
//   40 //        Motor_Out_L += DEAD_L; //加上启动基数
//   41 //                Motor_Out_R += DEAD_R;
//   42         if (Motor_Out_L > Motor_Max)
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_1
//   43             Motor_Out_L = Motor_Max;
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   44 
//   45         if (Motor_Out_R > Motor_Max)
??Motor_control_1:
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x14
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_2
//   46             Motor_Out_R = Motor_Max;  
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x14
        STR      R0,[R1, #+0]
//   47         
//   48         if (Motor_Out_L < Motor_Min)
??Motor_control_2:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x1C
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_3
//   49             Motor_Out_L = Motor_Min;
        LDR      R0,??Motor_control_0+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   50 
//   51         if (Motor_Out_R <Motor_Min)
??Motor_control_3:
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x1C
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_4
//   52             Motor_Out_R = Motor_Min;
        LDR      R0,??Motor_control_0+0x1C
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x14
        STR      R0,[R1, #+0]
//   53   
//   54     
//   55     /* 电机启动PWM控制 -------- END ------------------------------------------ */
//   56 
//   57         /* 电机正反转控制 -------------------------------------------- */
//   58         //左正反转控制
//   59         if (Motor_Out_L > 0)
??Motor_control_4:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_5
//   60         {
//   61             forward_L;//正转
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
        B        ??Motor_control_6
//   62         }
//   63     
//   64         else
//   65         {
//   66 //          Motor_Out_L=0;
//   67 //          forward_L;//正转
//   68             Motor_Out_L = -Motor_Out_L;
??Motor_control_5:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0x8
        STR      R0,[R1, #+0]
//   69             reversal_L;//反转
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+26
        BL       GpioSet
//   70         }
//   71 
//   72         //右正反转控制
//   73         if (Motor_Out_R > 0)
??Motor_control_6:
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_7
//   74         {
//   75             forward_R;
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
        B        ??Motor_control_8
//   76         }
//   77     
//   78         else
//   79         {
//   80 //          Motor_Out_R=0;
//   81 //          forward_L;//正转
//   82             Motor_Out_R = -Motor_Out_R;
??Motor_control_7:
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        LDR      R1,??Motor_control_0+0x14
        STR      R0,[R1, #+0]
//   83             reversal_R;
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       GpioSet
//   84         }
//   85     
//   86 //    forward_L;
//   87 //    forward_R;
//   88     
//   89         /* 电机正反转控制 -------- END ------------------------------- */  
//   90         change_L((uint32)Motor_Out_L);
??Motor_control_8:
        LDR      R0,??Motor_control_0+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   91         change_R((uint32)Motor_Out_R);
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   92     //DataScope_Get_Channel_Data(Motor_Out_R,3);
//   93 }
        POP      {R0,PC}          ;; return
        DATA
??Motor_control_0:
        DC32     Direction_Control_Output_L
        DC32     Speed_Control_Output_L
        DC32     Motor_Out_L
        DC32     Direction_Control_Output_R
        DC32     Speed_Control_Output_R
        DC32     Motor_Out_R
        DC32     Motor_Max
        DC32     Motor_Min

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   94 
//   95 
//   96 /**
//   97   * 简介
//   98   *     直道与弯道的处理方法  A2 57且A0<7
//   99   * 备注
//  100   *
//  101   */
//  102 //void  Motor_Out_control(void)
//  103 //{
//  104 //    if( ((AD_inductor[2] >= AD_2_Max) && (AD_inductor[0] <= AD_0_Min)) ||((AD_inductor[0] >= AD_0_Max) && (AD_inductor[2] <= AD_2_Min)))//调节范围
//  105 //    {
//  106 //          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//  107 //          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//  108 //          LED_1_ON;
//  109 //    }
//  110 //    else
//  111 //    {
//  112 //          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//  113 //          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  114 //    }
//  115 //    
//  116 //}
//  117 
//  118 //void  Motor_Out_control(void)
//  119 //{
//  120 //    if( (AD_inductor[0] >= AD_0_Min) && (AD_inductor[0] <= AD_0_Max) && (AD_inductor[2] >= AD_2_Min) && (AD_inductor[2] <= AD_2_Max))//调节范围
//  121 //    {
//  122 //          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//  123 //          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//  124 //    }
//  125 //    else
//  126 //    {
//  127 //          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//  128 //          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  129 //    }
//  130 //    
//  131 //}
//  132 /**
//  133   * 简介
//  134   *     电机控制程序
//  135   * 备注
//  136   *
//  137   */
//  138 //void Motor_control(void)
//  139 //{
//  140 //    Motor_Out_L = Direction_Control_Output_L;
//  141 //    Motor_Out_R = Direction_Control_Output_R;
//  142 //  
//  143 ////    Motor_Out_L = Speed_Control_Output +Direction_Control_Output;
//  144 ////    Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  145 ////    Motor_Out_control();
//  146 //  
//  147 //  
//  148 //    /* 电机启动PWM控制 ------------------------------------------------------- */
//  149 //    //左电机控制
//  150 //    if (Motor_Out_L > 0)
//  151 //    {
//  152 //        Motor_Out_L += DEAD_L; //加上启动基数
//  153 //        if (Motor_Out_L > Motor_Max)
//  154 //            Motor_Out_L = Motor_Max;
//  155 //    }
//  156 //    else if (Motor_Out_L < 0)
//  157 //    {
//  158 //        Motor_Out_L -= DEAD_L;
//  159 //        if (Motor_Out_L < -Motor_Max)
//  160 //            Motor_Out_L = -Motor_Max;
//  161 //    }
//  162 //
//  163 //    //右电机控制
//  164 //    if (Motor_Out_R > 0)
//  165 //    {
//  166 //        Motor_Out_R += DEAD_R;
//  167 //        if (Motor_Out_R > Motor_Max)
//  168 //            Motor_Out_R = Motor_Max;
//  169 //    }
//  170 //    else if (Motor_Out_R < 0)
//  171 //    {
//  172 //        Motor_Out_R -= DEAD_R;
//  173 //        if (Motor_Out_R < -Motor_Max)
//  174 //            Motor_Out_R = -Motor_Max;
//  175 //    }
//  176 //    /* 电机启动PWM控制 -------- END ------------------------------------------ */
//  177 //
//  178 //        /* 电机正反转控制 -------------------------------------------- */
//  179 ////        //左正反转控制
//  180 ////        if (Motor_Out_L > 0)
//  181 ////        {
//  182 ////            forward_L;//正转
//  183 ////        }
//  184 ////    
//  185 ////        else
//  186 ////        {
//  187 ////            Motor_Out_L = -Motor_Out_L;
//  188 ////            reversal_L;//反转
//  189 ////        }
//  190 ////
//  191 ////        //右正反转控制
//  192 ////        if (Motor_Out_R > 0)
//  193 ////        {
//  194 ////            forward_R;
//  195 ////        }
//  196 ////    
//  197 ////        else
//  198 ////        {
//  199 ////            Motor_Out_R = -Motor_Out_R;
//  200 ////            reversal_R;
//  201 ////        }
//  202 //    
//  203 //    forward_L;
//  204 //    forward_R;
//  205 //    
//  206 //        /* 电机正反转控制 -------- END ------------------------------- */
//  207 //  
//  208 //        
//  209 //
//  210 //        change_L((uint32)Motor_Out_L);
//  211 //        change_R((uint32)Motor_Out_R);
//  212 //
//  213 //
//  214 //        //测试用
//  215 ////        forward_L//正转
//  216 ////        forward_R
//  217 ////        change_L(PWM)
//  218 ////        change_R(PWM)
//  219 //        
//  220 //    //DataScope_Get_Channel_Data(Motor_Out_R,3);
//  221 //}
//  222 //
//  223 //
//  224 //
//  225 //
//  226 //
//  227 //
//  228 
//  229 
//  230 
// 
//  12 bytes in section .bss
//  32 bytes in section .data
// 312 bytes in section .text
// 
// 312 bytes of CODE memory
//  44 bytes of DATA memory
//
//Errors: none
//Warnings: none
