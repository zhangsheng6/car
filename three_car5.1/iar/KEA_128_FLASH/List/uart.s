///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\uart.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\uart.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\uart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN OLED_HEXACSII
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod
        EXTERN uart

        PUBLIC UART_GetData
        PUBLIC UART_Int16
        PUBLIC UART_SendArray
        PUBLIC UART_SendFloat
        PUBLIC UART_Send_Byte
        PUBLIC UART_Send_Enter
        PUBLIC UART_Send_Hex
        PUBLIC UART_Send_String
        PUBLIC UART_Uint16

// H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\uart.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    uart.c
//    8   * 文件标识：
//    9   * 摘    要：
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1月7日 20:47:48
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "uart.h"
//   18 #include "stdio.h"
//   19 #include "stdarg.h"
//   20 
//   21 //char UART_SendFloatArray[FLOAT_ARRAY_NUM];//使用UART_SendFloat()函数时候用
//   22 
//   23 
//   24 /**
//   25   * 简介
//   26   *     发送一个 字节
//   27   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void UART_Send_Byte(char ch)
//   29 {
UART_Send_Byte:
        PUSH     {LR}
//   30     //等待发送缓冲区空
//   31     while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
??UART_Send_Byte_0:
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??UART_Send_Byte_0
//   32     //发送数据
//   33     uart[UART_PART]->D = (uint8)ch;
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        STRB     R0,[R1, #+7]
//   34 }
        POP      {PC}             ;; return
//   35 
//   36 /**
//   37   * 简介
//   38   *     发送一个 回车
//   39   * 注意
//   40   *         代码 - ASCII - 十六进制 - 作用
//   41   *     回车 CR  -   \r  -  0x0d   - 移动光标至该行的起始位置
//   42   *     换行 LF  -   \n  -  0x0a   - 换行至下一行行首起始位置
//   43   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void UART_Send_Enter(void)
//   45 {
UART_Send_Enter:
        PUSH     {R7,LR}
//   46     UART_Send_Byte(0x0d);//返回行首
        MOVS     R0,#+13
        BL       UART_Send_Byte
//   47     UART_Send_Byte(0x0a);//转行
        MOVS     R0,#+10
        BL       UART_Send_Byte
//   48 }
        POP      {R0,PC}          ;; return
//   49 
//   50 /**
//   51   * 简介
//   52   *     发送一个 字符串
//   53   * 注意
//   54   *     1
//   55   *       防止当串口没有发送数据时陷入循环
//   56   *     2
//   57   *       发送数据时，如果太频繁，将致大部分时间都在循环中，使按键无法判断
//   58   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 void UART_Send_String(char *str)
//   60 {
UART_Send_String:
        PUSH     {LR}
//   61 //    uint16 i = 0;
//   62 
//   63     while (*str != '\0')
??UART_Send_String_0:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BEQ      ??UART_Send_String_1
//   64     {
//   65         //等待发送缓冲区空
//   66         while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
??UART_Send_String_2:
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??UART_Send_String_2
//   67 //        {
//   68 //            if (++i >= 65530)   //防止没有数据发送时，陷入死循环
//   69 //                break;
//   70 //        }
//   71         //发送数据
//   72         uart[UART_PART]->D = (uint8)(*str++);
        LDRB     R1,[R0, #+0]
        LDR      R2,??DataTable3
        LDR      R2,[R2, #+8]
        STRB     R1,[R2, #+7]
        ADDS     R0,R0,#+1
        B        ??UART_Send_String_0
//   73     }
//   74 }
??UART_Send_String_1:
        POP      {PC}             ;; return
//   75 
//   76 
//   77 
//   78 ///**
//   79 //  * 简介
//   80 //  *     发送数组
//   81 //  * 参数
//   82 //  *     array   数组名
//   83 //  *     len     字节数
//   84 //  */
//   85 //void UART_SendArray(char *array, uint8 len)
//   86 //{
//   87 //    while (len--)
//   88 //    {
//   89 //        UART_Send_Byte(*array++);
//   90 //    }
//   91 //}
//   92 /**
//   93   * 简介
//   94   *     发送数组
//   95   * 参数
//   96   *     array   数组名
//   97   *     len     字节数
//   98   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   99 void UART_SendArray(uint8 *array, uint32 len)
//  100 {
UART_SendArray:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  101     while (len--)
??UART_SendArray_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BEQ      ??UART_SendArray_1
//  102     {
//  103         UART_Send_Byte(*array);
        LDRB     R0,[R5, #+0]
        BL       UART_Send_Byte
//  104         array++;
        ADDS     R5,R5,#+1
        B        ??UART_SendArray_0
//  105     }
//  106 }
??UART_SendArray_1:
        POP      {R0,R4,R5,PC}    ;; return
//  107 
//  108 //把一个8位数据以ASCII码形式发送

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 void UART_Send_Hex(uint8 data)
//  110 {
UART_Send_Hex:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
//  111     uint8 temp;
//  112     temp=data>>4;
        MOVS     R0,R5
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        MOVS     R4,R0
//  113     if(temp>=10)
        UXTB     R4,R4
        CMP      R4,#+10
        BLT      ??UART_Send_Hex_0
//  114         UART_Send_Byte(temp-10+'A');
        MOVS     R0,R4
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_1
//  115     else
//  116         UART_Send_Byte(temp+'0');
??UART_Send_Hex_0:
        MOVS     R0,R4
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  117     temp=data&0x0F;
??UART_Send_Hex_1:
        LSLS     R0,R5,#+28       ;; ZeroExtS R0,R5,#+28,#+28
        LSRS     R0,R0,#+28
        MOVS     R4,R0
//  118     if(temp>=10)
        UXTB     R4,R4
        CMP      R4,#+10
        BLT      ??UART_Send_Hex_2
//  119         UART_Send_Byte(temp-10+'A');
        MOVS     R0,R4
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_3
//  120     else
//  121         UART_Send_Byte(temp+'0');
??UART_Send_Hex_2:
        MOVS     R0,R4
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  122 }
??UART_Send_Hex_3:
        POP      {R0,R4,R5,PC}    ;; return
//  123 
//  124 /**
//  125   * 简介
//  126   *     UART 发送无符号数
//  127   * 参数
//  128   *     num         无符号数
//  129   * 备注
//  130   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void UART_Uint16(uint16 num, uint8 enter)
//  132 {
UART_Uint16:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R6,R0
        MOVS     R7,R1
//  133 	uint8 *ch1,ch[7], m[7];
//  134     uint8 i = 0;
        MOVS     R5,#+0
//  135 
//  136     if (num == 0)
        UXTH     R6,R6
        CMP      R6,#+0
        BNE      ??UART_Uint16_0
//  137     {
//  138         m[0] = '0';
        MOVS     R0,#+48
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  139         m[1] = '\0';
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??UART_Uint16_1
//  140     }
//  141     else
//  142 	{
//  143         OLED_HEXACSII(num,ch);
??UART_Uint16_0:
        ADD      R1,SP,#+8
        MOVS     R0,R6
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  144         ch1 =&ch[1];
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+1
        MOVS     R4,R0
//  145         while (*ch1 == '0')
??UART_Uint16_2:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+48
        BNE      ??UART_Uint16_3
//  146         {
//  147             ch1++;
        ADDS     R4,R4,#+1
        B        ??UART_Uint16_2
//  148         }
//  149         for (i=0; *ch1 != '\0'; i++)
??UART_Uint16_3:
        MOVS     R0,#+0
        MOVS     R5,R0
??UART_Uint16_4:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??UART_Uint16_5
//  150         {
//  151             m[i] = *ch1;
        LDRB     R0,[R4, #+0]
        MOV      R1,SP
        UXTB     R5,R5
        STRB     R0,[R1, R5]
//  152             ch1++;
        ADDS     R4,R4,#+1
//  153         }
        ADDS     R5,R5,#+1
        B        ??UART_Uint16_4
//  154         m[i] = '\0';
??UART_Uint16_5:
        MOVS     R0,#+0
        MOV      R1,SP
        UXTB     R5,R5
        STRB     R0,[R1, R5]
//  155     }
//  156 
//  157     UART_Send_String((char *)m);	//显示数字
??UART_Uint16_1:
        MOV      R0,SP
        BL       UART_Send_String
//  158 
//  159     if (enter)
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??UART_Uint16_6
//  160     {
//  161         UART_Send_Enter();
        BL       UART_Send_Enter
//  162     }
//  163 }
??UART_Uint16_6:
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return
//  164 
//  165 /**
//  166   * 简介
//  167   *     UART发送 有符号数 (-32768 ~ 32767)
//  168   * 参数
//  169   *     num         有 符号数
//  170   * 备注
//  171   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  172 void UART_Int16(int16 num, uint8 enter)
//  173 {
UART_Int16:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  174 	if (num < 0)
        SXTH     R5,R5
        CMP      R5,#+0
        BPL      ??UART_Int16_0
//  175     {
//  176         num = -num;
        MOVS     R0,R5
        SXTH     R0,R0
        RSBS     R5,R0,#+0
//  177         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  178     }
//  179     UART_Uint16(num, 0);
??UART_Int16_0:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTH     R0,R0
        BL       UART_Uint16
//  180 
//  181     if (enter)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??UART_Int16_1
//  182     {
//  183         UART_Send_Enter();
        BL       UART_Send_Enter
//  184     }
//  185 }
??UART_Int16_1:
        POP      {R0,R4,R5,PC}    ;; return
//  186 
//  187 /**
//  188   * 简介
//  189   *     发送 float
//  190   * 参数
//  191   *     data    数据
//  192   *     enter
//  193   *         0   不发送回车
//  194   *         1   发送回车
//  195   * 备注
//  196   *     float 范围 -3.40E+38 ~ 3.40E+38
//  197   *     本函数并不能真正发送float，整数大小不能超过uint32，小数注意精度
//  198   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  199 void UART_SendFloat(float data, uint8 enter)
//  200 {
UART_SendFloat:
        PUSH     {R1,R4-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R0
//  201     uint8 temp = 3;//小数显示位数
        MOVS     R5,#+3
//  202     uint32 integer;//存储整数
//  203     float decimals;//存储小数
//  204     uint8 decimalsInterger;//小数转换为整数
//  205 
//  206     if (data < 0)
        MOVS     R0,R6
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??UART_SendFloat_0
//  207     {
//  208         data = -data;
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R6,R6,R0
//  209         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  210     }
//  211 
//  212     integer = (uint32)data;
??UART_SendFloat_0:
        MOVS     R0,R6
        BL       __aeabi_f2uiz
        STR      R0,[SP, #+4]
//  213     decimals = data - (float)integer;
        LDR      R0,[SP, #+4]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fsub
        MOVS     R4,R0
//  214 
//  215     //发送整数
//  216     if (data > 9999)
        MOVS     R0,R6
        LDR      R1,??DataTable3_1  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI      ??UART_SendFloat_1
//  217     {
//  218         UART_Uint16(integer/10000, 0);
        MOVS     R1,#+0
        STR      R1,[SP, #+0]
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidiv
        LDR      R1,[SP, #+0]
        UXTH     R0,R0
        BL       UART_Uint16
//  219     }
//  220     UART_Uint16(integer%10000, 0);
??UART_SendFloat_1:
        MOVS     R1,#+0
        STR      R1,[SP, #+0]
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidivmod
        MOVS     R0,R1
        LDR      R1,[SP, #+0]
        UXTH     R0,R0
        BL       UART_Uint16
//  221 
//  222     //发送小数
//  223     UART_Send_Byte('.');
        MOVS     R0,#+46
        BL       UART_Send_Byte
//  224     while (temp)
??UART_SendFloat_2:
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??UART_SendFloat_3
//  225     {
//  226         temp --;
        SUBS     R5,R5,#+1
//  227         decimals *= 10;
        LDR      R0,??DataTable3_3  ;; 0x41200000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  228         decimalsInterger = (uint8)decimals + 0x30;
        MOVS     R0,R4
        BL       __aeabi_f2iz
        ADDS     R0,R0,#+48
        MOVS     R7,R0
//  229         UART_Send_Byte((char)decimalsInterger);
        MOVS     R0,R7
        UXTB     R0,R0
        BL       UART_Send_Byte
//  230         decimals = decimals - (float)(decimalsInterger-0x30);
        UXTB     R7,R7
        MOVS     R0,R7
        SUBS     R0,R0,#+48
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
        B        ??UART_SendFloat_2
//  231     }
//  232 
//  233     if (enter)
??UART_SendFloat_3:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ      ??UART_SendFloat_4
//  234     {
//  235         UART_Send_Enter();
        BL       UART_Send_Enter
//  236     }
//  237 }
??UART_SendFloat_4:
        POP      {R0-R2,R4-R7,PC}  ;; return
//  238 
//  239 /**
//  240   * 简介
//  241   *     获取串口数据
//  242   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  243 uint8 UART_GetData()
//  244 {
UART_GetData:
        PUSH     {LR}
//  245     uint8 temp = 0;
        MOVS     R0,#+0
//  246 
//  247     if ( uart[UART_PART]->S1 & UART_S1_RDRF_MASK)
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+26
        BPL      ??UART_GetData_0
//  248     {
//  249 
//  250         temp =  uart[UART_PART]->D;
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+7]
        MOVS     R0,R1
//  251     }
//  252 
//  253     return temp;
??UART_GetData_0:
        UXTB     R0,R0
        POP      {PC}             ;; return
//  254 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     uart

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x461c3c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x41200000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  255 
//  256 
//  257 
//  258 
//  259 /* -------------------------------------------------------------- 未完成的函数 */
//  260 
//  261 
//  262 /* ------------------------------------------------  未完成的函数 -------- END */
//  263 
//  264 
//  265 
//  266 /* -------------------------------------- 有BUG的函数 不到万不得已 千万不要使用 */
//  267 
//  268 
//  269 /**
//  270   * 简介
//  271   *     printf串口打印
//  272   * 备注
//  273   *     宏由内核提供
//  274   *     此函数因逐飞库对启动文件的修改而无法使用，很遗憾，看不懂那堆汇编代码
//  275   *     但在最底层printf已经被重指向了，所以可直接使用printf
//  276   *     printf的端口由 DEBUG_PORT宏定义决定，波特率由 DEBUG_BAUD 定义
//  277   *     但经过测试，逐飞定义的 printf 无法发送 %f 数据
//  278   */
//  279 //void UART_Send_Printf(const char *fmt,...)
//  280 //{
//  281 //    va_list ap;             //保存参数地址
//  282 //    char string[64] = {0}; //放置解释好的字符串
//  283 //
//  284 //    //将字符串转换成串口可发送的
//  285 //    va_start(ap, fmt);      //计算出第一个实际参数的地址
//  286 //    vsnprintf(string, 64, fmt, ap); //把输入的格式字符串进行解释
//  287 //    va_end(ap);                     //ap指针清空
//  288 //
//  289 //    //发送解释好的字符串
//  290 //    UART_Send_String(string);
//  291 //}
//  292 
//  293 /**
//  294   * 简介
//  295   *     发送 float 数据
//  296   * 参数
//  297   *     date    数据
//  298   *     len     显示长度
//  299   *     enter   是否发送回车
//  300   *       0  不发送
//  301   *       1  发送
//  302   * 备注
//  303   *     此函数千万不要碰，变量定义都不要动，由于逐飞库的printf
//  304   *     此函数里面的sprintf有一个超级bug，有时候只是定义变一下，
//  305   *     换一个变量，这个函数就会卡死
//  306   */
//  307 //void UART_SendFloat(float date,  uint8 len, uint8 enter)
//  308 //{
//  309 //
//  310 ////    uint8 i = 0;
//  311 ////
//  312 ////    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  313 ////    {
//  314 ////        UART_FloatArray[i] = 0;
//  315 ////    }
//  316 ////
//  317 ////    sprintf(UART_FloatArray, "%f", date);
//  318 ////
//  319 ////    //不能使用发送字符串的函数，原因不明，总之会出错
//  320 //////    UART_FloatArray[len] = '\0';
//  321 //////    UART_Send_String(UART_FloatArray);
//  322 //
//  323 //    uint8 i = 0;
//  324 //
//  325 //    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  326 //    {
//  327 //        UART_SendFloatArray[i] = 0;
//  328 //    }
//  329 //
//  330 //    sprintf(UART_SendFloatArray, "%f", date);
//  331 //
//  332 //    for (i=0; i<len; i++)
//  333 //    {
//  334 //        UART_Send_Byte(UART_SendFloatArray[i]);
//  335 //    }
//  336 //
//  337 //    if (enter)
//  338 //    {
//  339 //        UART_Send_Enter();
//  340 //    }
//  341 //}
//  342 
//  343 
//  344 /* -----------------------  有BUG的函数 不到万不得已 千万不要使用  -------- END */
//  345 
// 
// 550 bytes in section .text
// 
// 550 bytes of CODE memory
//
//Errors: none
//Warnings: none
