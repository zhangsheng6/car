///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:35
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\Control.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\Control.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN UART_Send_Byte
        EXTERN c
        EXTERN carStatus
        EXTERN menuSelect

        PUBLIC ReadDataControl
        PUBLIC g_5msFlag
        PUBLIC uartBase

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\Control.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    Control.c
//    8   * 文件标识：
//    9   * 摘    要：    菜单控制
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年4月17日 13:12:06
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "Control.h"
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19 uint8 g_5msFlag = 0;
g_5msFlag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 UART_Type * uartBase[3] = UART_BASES;
uartBase:
        DATA
        DC32 4006A000H, 4006B000H, 4006C000H
//   21 extern uint8 c;
//   22 
//   23 
//   24 /**
//   25   * 简介
//   26   *     根据串口发回的数据执行操作
//   27   * 注意
//   28   */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   29 void ReadDataControl(void)
//   30 {
ReadDataControl:
        PUSH     {R7,LR}
//   31     static uint8 menuControlFlag = 0;//菜单选择
//   32     static uint8 modJudge = 0;//菜单命令标志
//   33     static uint8 sendFlag = 0;//是否发送
//   34     static uint8 time = 1;//次数
//   35     uint8 readDataTemp = 0;    //读来的数据暂存
        MOVS     R2,#+0
//   36     static uint16 sendDate = 0;       //回传的数据
//   37     
//   38     //这两处值是懒得改函数随便放的
//   39     uint16 P_angle = 0;
        MOVS     R0,#+0
//   40     uint16 D_angle = 0;
        MOVS     R1,#+0
//   41     
//   42 
//   43     if (uartBase[UART_PART]->S1 & UART_S1_RDRF_MASK)//有数据
        LDR      R2,??ReadDataControl_0
        LDR      R2,[R2, #+8]
        LDRB     R2,[R2, #+4]
        LSLS     R2,R2,#+26
        BMI      .+4
        B        ??ReadDataControl_1
//   44     {
//   45         readDataTemp = uartBase[UART_PART]->D;
        LDR      R2,??ReadDataControl_0
        LDR      R2,[R2, #+8]
        LDRB     R2,[R2, #+7]
//   46 
//   47         if (readDataTemp == 0x1f)//通信协议，开头0x1f，之后一个菜单名字
        UXTB     R2,R2
        CMP      R2,#+31
        BNE      ??ReadDataControl_2
//   48         {
//   49             modJudge = 1;
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x4
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_1
//   50         }
//   51         else
//   52         {
//   53             if (modJudge)//菜单命令
??ReadDataControl_2:
        LDR      R3,??ReadDataControl_0+0x4
        LDRB     R3,[R3, #+0]
        CMP      R3,#+0
        BEQ      ??ReadDataControl_3
//   54             {
//   55                 switch (readDataTemp)
        UXTB     R2,R2
        CMP      R2,#+1
        BEQ      ??ReadDataControl_4
        BCC      ??ReadDataControl_5
        CMP      R2,#+3
        BEQ      ??ReadDataControl_6
        BCC      ??ReadDataControl_7
        B        ??ReadDataControl_5
//   56                 {
//   57                 case CAR_STOP:
//   58                     carStatus = STOP;
??ReadDataControl_4:
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x8
        STRB     R0,[R1, #+0]
//   59                     c=1;
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0xC
        STRB     R0,[R1, #+0]
//   60                     break;
        B        ??ReadDataControl_5
//   61                 case P_ANGLE: //------------------------------------- 调试器 菜单1
//   62                     menuControlFlag = P_ANGLE;
??ReadDataControl_7:
        MOVS     R1,#+2
        LDR      R2,??ReadDataControl_0+0x10
        STRB     R1,[R2, #+0]
//   63                     sendDate = (uint16)P_angle;
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//   64                     sendFlag = 1;
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x18
        STRB     R0,[R1, #+0]
//   65                     break;
        B        ??ReadDataControl_5
//   66                 case D_ANGLE:
//   67                     menuControlFlag = D_ANGLE;
??ReadDataControl_6:
        MOVS     R0,#+3
        LDR      R2,??ReadDataControl_0+0x10
        STRB     R0,[R2, #+0]
//   68                     sendDate = (uint16)D_angle;
        LDR      R0,??ReadDataControl_0+0x14
        STRH     R1,[R0, #+0]
//   69                     sendFlag = 1;
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x18
        STRB     R0,[R1, #+0]
//   70                     break;
//   71 
//   72                 }
//   73                 modJudge = 0;
??ReadDataControl_5:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x4
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_1
//   74             }
//   75             else
//   76             {
//   77                 switch (menuControlFlag)
??ReadDataControl_3:
        LDR      R0,??ReadDataControl_0+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??ReadDataControl_8
        CMP      R0,#+3
        BEQ      ??ReadDataControl_9
        B        ??ReadDataControl_10
//   78                 {
//   79                 case P_ANGLE: //------------------------------------- 调试器 菜单1
//   80                     switch (time)
??ReadDataControl_8:
        LDR      R0,??ReadDataControl_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??ReadDataControl_11
        CMP      R0,#+2
        BEQ      ??ReadDataControl_12
        B        ??ReadDataControl_13
//   81                     {
//   82                     case 1:
//   83                         sendDate = readDataTemp;
??ReadDataControl_11:
        UXTB     R2,R2
        LDR      R0,??ReadDataControl_0+0x14
        STRH     R2,[R0, #+0]
//   84                         sendDate <<= 8;
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//   85                         time = 2;
        MOVS     R0,#+2
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//   86                         break;
        B        ??ReadDataControl_13
//   87                     case 2:
//   88                         sendDate |= (uint16)readDataTemp;
??ReadDataControl_12:
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        UXTB     R2,R2
        ORRS     R0,R0,R2
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//   89                         P_angle = sendDate;
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
//   90                         sendDate = (uint16)P_angle;//确保参数被修改了
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//   91                         menuSelect = MENU_1;//OLED上显示，可屏蔽
        MOVS     R0,#+2
        LDR      R1,??ReadDataControl_0+0x20
        STRB     R0,[R1, #+0]
//   92                         KEY_sta = !KEY_sta;
        LDR      R0,??ReadDataControl_0+0x24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ReadDataControl_14
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x24
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_15
??ReadDataControl_14:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x24
        STRB     R0,[R1, #+0]
//   93                         KEY_menuChange = !KEY_menuChange;
??ReadDataControl_15:
        LDR      R0,??ReadDataControl_0+0x28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ReadDataControl_16
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x28
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_17
??ReadDataControl_16:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x28
        STRB     R0,[R1, #+0]
//   94                         time = 1;
??ReadDataControl_17:
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//   95                         sendFlag = 1;//接受完毕，确认回传
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x18
        STRB     R0,[R1, #+0]
//   96                         break;
//   97                     }
//   98                     break;
??ReadDataControl_13:
        B        ??ReadDataControl_1
//   99                 case D_ANGLE: //------------------------------------- 调试器 菜单1
//  100                     switch (time)
??ReadDataControl_9:
        LDR      R0,??ReadDataControl_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??ReadDataControl_18
        CMP      R0,#+2
        BEQ      ??ReadDataControl_19
        B        ??ReadDataControl_20
//  101                     {
//  102                     case 1:
//  103                         sendDate = readDataTemp;
??ReadDataControl_18:
        UXTB     R2,R2
        LDR      R0,??ReadDataControl_0+0x14
        STRH     R2,[R0, #+0]
//  104                         sendDate <<= 8;
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//  105                         time = 2;
        MOVS     R0,#+2
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//  106                         break;
        B        ??ReadDataControl_20
//  107                     case 2:
//  108                         sendDate |= (uint16)readDataTemp;
??ReadDataControl_19:
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        UXTB     R2,R2
        ORRS     R0,R0,R2
        LDR      R1,??ReadDataControl_0+0x14
        STRH     R0,[R1, #+0]
//  109                         D_angle = sendDate;
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R1,[R0, #+0]
//  110                         sendDate = (uint16)D_angle;//确保参数被修改了
        LDR      R0,??ReadDataControl_0+0x14
        STRH     R1,[R0, #+0]
//  111                         menuSelect = MENU_2;//OLED上显示，可屏蔽
        MOVS     R0,#+3
        LDR      R1,??ReadDataControl_0+0x20
        STRB     R0,[R1, #+0]
//  112                         KEY_sta = !KEY_sta;
        LDR      R0,??ReadDataControl_0+0x24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ReadDataControl_21
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x24
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_22
??ReadDataControl_21:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x24
        STRB     R0,[R1, #+0]
//  113                         KEY_menuChange = !KEY_menuChange;
??ReadDataControl_22:
        LDR      R0,??ReadDataControl_0+0x28
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??ReadDataControl_23
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x28
        STRB     R0,[R1, #+0]
        B        ??ReadDataControl_24
??ReadDataControl_23:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x28
        STRB     R0,[R1, #+0]
//  114                         time = 1;
??ReadDataControl_24:
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//  115                         sendFlag = 1;//接受完毕，确认回传
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x18
        STRB     R0,[R1, #+0]
//  116                         break;
//  117                     }
//  118                     break;
??ReadDataControl_20:
        B        ??ReadDataControl_1
//  119 
//  120                 default :
//  121                     break;
//  122                 }
//  123             }
//  124         }
//  125 
//  126     }
//  127 
//  128     if (sendFlag)
??ReadDataControl_10:
??ReadDataControl_1:
        LDR      R0,??ReadDataControl_0+0x18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ReadDataControl_25
//  129     {
//  130         if (g_5msFlag)//隔5ms发送一次数据，防止数据丢失
        LDR      R0,??ReadDataControl_0+0x2C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ReadDataControl_25
//  131         {
//  132             switch (time)
        LDR      R0,??ReadDataControl_0+0x1C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??ReadDataControl_26
        CMP      R0,#+2
        BEQ      ??ReadDataControl_27
        B        ??ReadDataControl_28
//  133             {
//  134             case 1:
//  135                 UART_Send_Byte((uint8)(sendDate>>8));
??ReadDataControl_26:
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BL       UART_Send_Byte
//  136                 time = 2;
        MOVS     R0,#+2
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//  137                 break;
        B        ??ReadDataControl_28
//  138             case 2:
//  139                 UART_Send_Byte((uint8)sendDate);
??ReadDataControl_27:
        LDR      R0,??ReadDataControl_0+0x14
        LDRH     R0,[R0, #+0]
        UXTB     R0,R0
        BL       UART_Send_Byte
//  140                 time = 1;
        MOVS     R0,#+1
        LDR      R1,??ReadDataControl_0+0x1C
        STRB     R0,[R1, #+0]
//  141                 sendFlag = 0;//发送完毕
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x18
        STRB     R0,[R1, #+0]
//  142                 break;
//  143             }
//  144 
//  145             g_5msFlag = 0;
??ReadDataControl_28:
        MOVS     R0,#+0
        LDR      R1,??ReadDataControl_0+0x2C
        STRB     R0,[R1, #+0]
//  146         }
//  147     }
//  148 }
??ReadDataControl_25:
        POP      {R0,PC}          ;; return
        DATA
??ReadDataControl_0:
        DC32     uartBase
        DC32     ??modJudge
        DC32     carStatus
        DC32     c
        DC32     ??menuControlFlag
        DC32     ??sendDate
        DC32     ??sendFlag
        DC32     ??time
        DC32     menuSelect
        DC32     KEY_sta
        DC32     KEY_menuChange
        DC32     g_5msFlag

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??menuControlFlag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??modJudge:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??sendFlag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??time:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??sendDate:
        DS8 2

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  149 
//  150 
//  151 
//  152 
//  153 
//  154 
// 
//   6 bytes in section .bss
//  13 bytes in section .data
// 508 bytes in section .text
// 
// 508 bytes of CODE memory
//  19 bytes of DATA memory
//
//Errors: none
//Warnings: none
