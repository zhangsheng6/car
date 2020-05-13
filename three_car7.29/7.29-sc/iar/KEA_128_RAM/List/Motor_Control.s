///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Motor_Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Motor_Control.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\Motor_Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Control_Output_L
        EXTERN Control_Output_R
        EXTERN Direction_Control_Output_L
        EXTERN Direction_Control_Output_R
        EXTERN FTM_PwmDuty
        EXTERN GpioSet
        EXTERN Speed_PWM
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fsub
        EXTERN __aeabi_ui2f
        EXTERN abs_f

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
        PUBLIC Motor_Out_R_Temp
        PUBLIC Motor_control
        PUBLIC Wangdao_Speed_Output

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\Motor_Control.c
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
//   20 float Motor_Out_L = 0.0, Motor_Out_R = 0.0, Motor_Max = 8000, Motor_Min = -8000,Motor_Out_R_Temp=0;
Motor_Out_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_R:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Max:
        DATA
        DC32 45FA0000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Motor_Min:
        DATA
        DC32 0C5FA0000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Motor_Out_R_Temp:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 unsigned int DEAD_L = 3000;//2290
DEAD_L:
        DATA
        DC32 3000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 unsigned int DEAD_R =3000;
DEAD_R:
        DATA
        DC32 3000

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
//   34     Motor_Out_L = Direction_Control_Output_L+Control_Output_L+Speed_PWM;
        LDR      R0,??Motor_control_0
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   35     Motor_Out_R =Direction_Control_Output_R+Control_Output_R+Speed_PWM;
        LDR      R0,??Motor_control_0+0x10
        LDR      R1,[R0, #+0]
        LDR      R0,??Motor_control_0+0x14
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   36     
//   37 
//   38 //  
//   39    if(Motor_Out_L>0)  Motor_Out_L+=DEAD_L;
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_1
        LDR      R0,??Motor_control_0+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??Motor_control_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   40   if(Motor_Out_L<0)  Motor_Out_L-=DEAD_L;
??Motor_control_1:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_2
        LDR      R0,??Motor_control_0+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   41   
//   42   if(Motor_Out_R>0)  Motor_Out_R+=DEAD_R;
??Motor_control_2:
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_3
        LDR      R0,??Motor_control_0+0x20
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??Motor_control_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   43   if(Motor_Out_R<0)  Motor_Out_R-=DEAD_R;
??Motor_control_3:
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_4
        LDR      R0,??Motor_control_0+0x20
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   44 
//   45   
//   46  
//   47         /* 电机启动PWM控制 ------------------------------------------------------- */
//   48    
//   49 //        Motor_Out_L += DEAD_L; //加上启动基数
//   50 //                Motor_Out_R += DEAD_R;
//   51         if (Motor_Out_L > Motor_Max)
??Motor_control_4:
        LDR      R0,??Motor_control_0+0x24
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0xC
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_5
//   52             Motor_Out_L = Motor_Max;
        LDR      R0,??Motor_control_0+0x24
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   53 
//   54         if (Motor_Out_R > Motor_Max)
??Motor_control_5:
        LDR      R0,??Motor_control_0+0x24
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x18
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_6
//   55             Motor_Out_R = Motor_Max;  
        LDR      R0,??Motor_control_0+0x24
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   56         
//   57         if (Motor_Out_L < Motor_Min)
??Motor_control_6:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x28
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_7
//   58             Motor_Out_L = Motor_Min;
        LDR      R0,??Motor_control_0+0x28
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   59 
//   60         if (Motor_Out_R <Motor_Min)
??Motor_control_7:
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x28
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmple
        BCS      ??Motor_control_8
//   61             Motor_Out_R = Motor_Min;
        LDR      R0,??Motor_control_0+0x28
        LDR      R0,[R0, #+0]
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   62   
//   63 //    Motor_Out_R_Temp=Motor_Out_R;
//   64     /* 电机启动PWM控制 -------- END ------------------------------------------ */
//   65 
//   66         /* 电机正反转控制 -------------------------------------------- */
//   67         //左正反转控制
//   68         if (Motor_Out_L > 0)
??Motor_control_8:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_9
//   69         {
//   70             forward_L;//正转
        MOVS     R1,#+1
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+26
        BL       GpioSet
        B        ??Motor_control_10
//   71         }
//   72     
//   73         else
//   74         {
//   75 //          Motor_Out_L=0;
//   76 //          forward_L;//正转
//   77             reversal_L;//反转
??Motor_control_9:
        MOVS     R1,#+0
        MOVS     R0,#+42
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+26
        BL       GpioSet
//   78         }
//   79 
//   80         //右正反转控制
//   81         if (Motor_Out_R > 0)
??Motor_control_10:
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??Motor_control_11
//   82         {
//   83             forward_R;
        MOVS     R1,#+1
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+0
        MOVS     R0,#+28
        BL       GpioSet
        B        ??Motor_control_12
//   84         }
//   85     
//   86         else
//   87         {
//   88 //          Motor_Out_R=0;
//   89 //          forward_L;//正转
//   90             reversal_R;
??Motor_control_11:
        MOVS     R1,#+0
        MOVS     R0,#+36
        BL       GpioSet
        MOVS     R1,#+1
        MOVS     R0,#+28
        BL       GpioSet
//   91         }
//   92     Motor_Out_L=abs_f(Motor_Out_L);
??Motor_control_12:
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??Motor_control_0+0xC
        STR      R0,[R1, #+0]
//   93     Motor_Out_R=abs_f(Motor_Out_R);
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        BL       abs_f
        LDR      R1,??Motor_control_0+0x18
        STR      R0,[R1, #+0]
//   94     
//   95     
//   96         /* 电机正反转控制 -------- END ------------------------------- */  
//   97         change_L((uint32)Motor_Out_L);
        LDR      R0,??Motor_control_0+0xC
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   98         change_R((uint32)Motor_Out_R);
        LDR      R0,??Motor_control_0+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2uiz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//   99     //DataScope_Get_Channel_Data(Motor_Out_R,3);
//  100 }
        POP      {R0,PC}          ;; return
        DATA
??Motor_control_0:
        DC32     Direction_Control_Output_L
        DC32     Control_Output_L
        DC32     Speed_PWM
        DC32     Motor_Out_L
        DC32     Direction_Control_Output_R
        DC32     Control_Output_R
        DC32     Motor_Out_R
        DC32     DEAD_L
        DC32     DEAD_R
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
//  101 
//  102 
//  103 /**
//  104   * 简介
//  105   *     直道与弯道的处理方法  A2 57且A0<7
//  106   * 备注
//  107   *
//  108   */
//  109 //void  Motor_Out_control(void)
//  110 //{
//  111 //    if( ((AD_inductor[2] >= AD_2_Max) && (AD_inductor[0] <= AD_0_Min)) ||((AD_inductor[0] >= AD_0_Max) && (AD_inductor[2] <= AD_2_Min)))//调节范围
//  112 //    {
//  113 //          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//  114 //          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//  115 //          LED_1_ON;
//  116 //    }
//  117 //    else
//  118 //    {
//  119 //          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//  120 //          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  121 //    }
//  122 //    
//  123 //}
//  124 
//  125 //void  Motor_Out_control(void)
//  126 //{
//  127 //    if( (AD_inductor[0] >= AD_0_Min) && (AD_inductor[0] <= AD_0_Max) && (AD_inductor[2] >= AD_2_Min) && (AD_inductor[2] <= AD_2_Max))//调节范围
//  128 //    {
//  129 //          Motor_Out_L = Wangdao_Speed_Output - Direction_Control_Output;
//  130 //          Motor_Out_R = Wangdao_Speed_Output + Direction_Control_Output;
//  131 //    }
//  132 //    else
//  133 //    {
//  134 //          Motor_Out_L = Speed_Control_Output - Direction_Control_Output;
//  135 //          Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  136 //    }
//  137 //    
//  138 //}
//  139 /**
//  140   * 简介
//  141   *     电机控制程序
//  142   * 备注
//  143   *
//  144   */
//  145 //void Motor_control(void)
//  146 //{
//  147 //    Motor_Out_L = Direction_Control_Output_L;
//  148 //    Motor_Out_R = Direction_Control_Output_R;
//  149 //  
//  150 ////    Motor_Out_L = Speed_Control_Output +Direction_Control_Output;
//  151 ////    Motor_Out_R = Speed_Control_Output + Direction_Control_Output;
//  152 ////    Motor_Out_control();
//  153 //  
//  154 //  
//  155 //    /* 电机启动PWM控制 ------------------------------------------------------- */
//  156 //    //左电机控制
//  157 //    if (Motor_Out_L > 0)
//  158 //    {
//  159 //        Motor_Out_L += DEAD_L; //加上启动基数
//  160 //        if (Motor_Out_L > Motor_Max)
//  161 //            Motor_Out_L = Motor_Max;
//  162 //    }
//  163 //    else if (Motor_Out_L < 0)
//  164 //    {
//  165 //        Motor_Out_L -= DEAD_L;
//  166 //        if (Motor_Out_L < -Motor_Max)
//  167 //            Motor_Out_L = -Motor_Max;
//  168 //    }
//  169 //
//  170 //    //右电机控制
//  171 //    if (Motor_Out_R > 0)
//  172 //    {
//  173 //        Motor_Out_R += DEAD_R;
//  174 //        if (Motor_Out_R > Motor_Max)
//  175 //            Motor_Out_R = Motor_Max;
//  176 //    }
//  177 //    else if (Motor_Out_R < 0)
//  178 //    {
//  179 //        Motor_Out_R -= DEAD_R;
//  180 //        if (Motor_Out_R < -Motor_Max)
//  181 //            Motor_Out_R = -Motor_Max;
//  182 //    }
//  183 //    /* 电机启动PWM控制 -------- END ------------------------------------------ */
//  184 //
//  185 //        /* 电机正反转控制 -------------------------------------------- */
//  186 ////        //左正反转控制
//  187 ////        if (Motor_Out_L > 0)
//  188 ////        {
//  189 ////            forward_L;//正转
//  190 ////        }
//  191 ////    
//  192 ////        else
//  193 ////        {
//  194 ////            Motor_Out_L = -Motor_Out_L;
//  195 ////            reversal_L;//反转
//  196 ////        }
//  197 ////
//  198 ////        //右正反转控制
//  199 ////        if (Motor_Out_R > 0)
//  200 ////        {
//  201 ////            forward_R;
//  202 ////        }
//  203 ////    
//  204 ////        else
//  205 ////        {
//  206 ////            Motor_Out_R = -Motor_Out_R;
//  207 ////            reversal_R;
//  208 ////        }
//  209 //    
//  210 //    forward_L;
//  211 //    forward_R;
//  212 //    
//  213 //        /* 电机正反转控制 -------- END ------------------------------- */
//  214 //  
//  215 //        
//  216 //
//  217 //        change_L((uint32)Motor_Out_L);
//  218 //        change_R((uint32)Motor_Out_R);
//  219 //
//  220 //
//  221 //        //测试用
//  222 ////        forward_L//正转
//  223 ////        forward_R
//  224 ////        change_L(PWM)
//  225 ////        change_R(PWM)
//  226 //        
//  227 //    //DataScope_Get_Channel_Data(Motor_Out_R,3);
//  228 //}
//  229 //
//  230 //
//  231 //
//  232 //
//  233 //
//  234 //
//  235 
//  236 
//  237 
// 
//  16 bytes in section .bss
//  32 bytes in section .data
// 468 bytes in section .text
// 
// 468 bytes of CODE memory
//  48 bytes of DATA memory
//
//Errors: none
//Warnings: none
