///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:07
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\uart.c
//    Command line =  
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\uart.c -D IAR -D
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
//        I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\uart.s
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

// I:\电磁程序-ZS\电磁直立-ZS\stand_ZS_9.28\device\C\uart.c
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
//   28 void UART_Send_Byte(uint8 ch)
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
        B        ??UART_Send_String_0
//   61 //    uint16 i = 0;
//   62 
//   63     while (*str != '\0')
//   64     {
//   65         //等待发送缓冲区空
//   66         while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
??UART_Send_String_1:
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+24
        BPL      ??UART_Send_String_1
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
//   73     }
??UART_Send_String_0:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BNE      ??UART_Send_String_1
//   74 }
        POP      {PC}             ;; return
//   75 
//   76 
//   77 
//   78 /**
//   79   * 简介
//   80   *     发送数组
//   81   * 参数
//   82   *     array   数组名
//   83   *     len     字节数
//   84   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   85 void UART_SendArray(uint8 *array, uint32 len)
//   86 {
UART_SendArray:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        B        ??UART_SendArray_0
//   87     while (len--)
//   88     {
//   89         UART_Send_Byte(*array);
??UART_SendArray_1:
        LDRB     R0,[R5, #+0]
        BL       UART_Send_Byte
//   90         array++;
        ADDS     R5,R5,#+1
//   91     }
??UART_SendArray_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BNE      ??UART_SendArray_1
//   92 }
        POP      {R0,R4,R5,PC}    ;; return
//   93 
//   94 //把一个8位数据以ASCII码形式发送

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 void UART_Send_Hex(uint8 data)
//   96 {
UART_Send_Hex:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   97     uint8 temp;
//   98     temp=data>>4;
        MOVS     R0,R4
        UXTB     R0,R0
        LSRS     R0,R0,#+4
//   99     if(temp>=10)
        UXTB     R0,R0
        CMP      R0,#+10
        BLT      ??UART_Send_Hex_0
//  100         UART_Send_Byte(temp-10+'A');
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_1
//  101     else
//  102         UART_Send_Byte(temp+'0');
??UART_Send_Hex_0:
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  103     temp=data&0x0F;
??UART_Send_Hex_1:
        LSLS     R0,R4,#+28       ;; ZeroExtS R0,R4,#+28,#+28
        LSRS     R0,R0,#+28
//  104     if(temp>=10)
        UXTB     R0,R0
        CMP      R0,#+10
        BLT      ??UART_Send_Hex_2
//  105         UART_Send_Byte(temp-10+'A');
        ADDS     R0,R0,#+55
        UXTB     R0,R0
        BL       UART_Send_Byte
        B        ??UART_Send_Hex_3
//  106     else
//  107         UART_Send_Byte(temp+'0');
??UART_Send_Hex_2:
        ADDS     R0,R0,#+48
        UXTB     R0,R0
        BL       UART_Send_Byte
//  108 }
??UART_Send_Hex_3:
        POP      {R4,PC}          ;; return
//  109 
//  110 /**
//  111   * 简介
//  112   *     UART 发送无符号数
//  113   * 参数
//  114   *     num         无符号数
//  115   * 备注
//  116   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  117 void UART_Uint16(uint16 num, uint8 enter)
//  118 {
UART_Uint16:
        PUSH     {R0-R4,LR}
        MOVS     R4,R1
//  119 	uint8 *ch1,ch[7], m[7];
//  120     uint8 i = 0;
        MOVS     R1,#+0
//  121 
//  122     if (num == 0)
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??UART_Uint16_0
//  123     {
//  124         m[0] = '0';
        MOVS     R0,#+48
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  125         m[1] = '\0';
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??UART_Uint16_1
//  126     }
//  127     else
//  128 	{
//  129         OLED_HEXACSII(num,ch);
??UART_Uint16_0:
        ADD      R1,SP,#+8
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  130         ch1 =&ch[1];
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+1
        B        ??UART_Uint16_2
//  131         while (*ch1 == '0')
//  132         {
//  133             ch1++;
??UART_Uint16_3:
        ADDS     R0,R0,#+1
//  134         }
??UART_Uint16_2:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+48
        BEQ      ??UART_Uint16_3
//  135         for (i=0; *ch1 != '\0'; i++)
        MOVS     R1,#+0
        B        ??UART_Uint16_4
//  136         {
//  137             m[i] = *ch1;
??UART_Uint16_5:
        LDRB     R2,[R0, #+0]
        MOV      R3,SP
        UXTB     R1,R1
        STRB     R2,[R3, R1]
//  138             ch1++;
        ADDS     R0,R0,#+1
//  139         }
        ADDS     R1,R1,#+1
??UART_Uint16_4:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BNE      ??UART_Uint16_5
//  140         m[i] = '\0';
        MOVS     R0,#+0
        MOV      R2,SP
        UXTB     R1,R1
        STRB     R0,[R2, R1]
//  141     }
//  142 
//  143     UART_Send_String((char *)m);	//显示数字
??UART_Uint16_1:
        MOV      R0,SP
        BL       UART_Send_String
//  144 
//  145     if (enter)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??UART_Uint16_6
//  146     {
//  147         UART_Send_Enter();
        BL       UART_Send_Enter
//  148     }
//  149 }
??UART_Uint16_6:
        POP      {R0-R4,PC}       ;; return
//  150 
//  151 /**
//  152   * 简介
//  153   *     UART发送 有符号数 (-32768 ~ 32767)
//  154   * 参数
//  155   *     num         有 符号数
//  156   * 备注
//  157   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  158 void UART_Int16(int16 num, uint8 enter)
//  159 {
UART_Int16:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  160 	if (num < 0)
        SXTH     R5,R5
        CMP      R5,#+0
        BPL      ??UART_Int16_0
//  161     {
//  162         num = -num;
        MOVS     R0,R5
        SXTH     R0,R0
        RSBS     R5,R0,#+0
//  163         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  164     }
//  165     UART_Uint16(num, 0);
??UART_Int16_0:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTH     R0,R0
        BL       UART_Uint16
//  166 
//  167     if (enter)
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??UART_Int16_1
//  168     {
//  169         UART_Send_Enter();
        BL       UART_Send_Enter
//  170     }
//  171 }
??UART_Int16_1:
        POP      {R0,R4,R5,PC}    ;; return
//  172 
//  173 /**
//  174   * 简介
//  175   *     发送 float
//  176   * 参数
//  177   *     data    数据
//  178   *     enter
//  179   *         0   不发送回车
//  180   *         1   发送回车
//  181   * 备注
//  182   *     float 范围 -3.40E+38 ~ 3.40E+38
//  183   *     本函数并不能真正发送float，整数大小不能超过uint32，小数注意精度
//  184   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  185 void UART_SendFloat(float data, uint8 enter)
//  186 {
UART_SendFloat:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
//  187     uint8 temp = 3;//小数显示位数
        MOVS     R5,#+3
//  188     uint32 integer;//存储整数
//  189     float decimals;//存储小数
//  190     uint8 decimalsInterger;//小数转换为整数
//  191 
//  192     if (data < 0)
        MOVS     R0,R6
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??UART_SendFloat_0
//  193     {
//  194         data = -data;
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R6,R6,R0
//  195         UART_Send_Byte('-');
        MOVS     R0,#+45
        BL       UART_Send_Byte
//  196     }
//  197 
//  198     integer = (uint32)data;
??UART_SendFloat_0:
        MOVS     R0,R6
        BL       __aeabi_f2uiz
        STR      R0,[SP, #+0]
//  199     decimals = data - (float)integer;
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fsub
        MOVS     R4,R0
//  200 
//  201     //发送整数
//  202     if (data > 9999)
        MOVS     R0,R6
        LDR      R1,??DataTable3_1  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI      ??UART_SendFloat_1
//  203     {
//  204         UART_Uint16(integer/10000, 0);
        MOVS     R1,#+0
        MOVS     R6,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidiv
        MOVS     R1,R6
        UXTH     R0,R0
        BL       UART_Uint16
//  205     }
//  206     UART_Uint16(integer%10000, 0);
??UART_SendFloat_1:
        MOVS     R1,#+0
        MOVS     R6,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_2  ;; 0x2710
        BL       __aeabi_uidivmod
        MOVS     R0,R1
        MOVS     R1,R6
        UXTH     R0,R0
        BL       UART_Uint16
//  207 
//  208     //发送小数
//  209     UART_Send_Byte('.');
        MOVS     R0,#+46
        BL       UART_Send_Byte
        B        ??UART_SendFloat_2
//  210     while (temp)
//  211     {
//  212         temp --;
??UART_SendFloat_3:
        SUBS     R5,R5,#+1
//  213         decimals *= 10;
        LDR      R0,??DataTable3_3  ;; 0x41200000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  214         decimalsInterger = (uint8)decimals + 0x30;
        MOVS     R0,R4
        BL       __aeabi_f2iz
        MOVS     R6,R0
        ADDS     R6,R6,#+48
//  215         UART_Send_Byte((char)decimalsInterger);
        MOVS     R0,R6
        UXTB     R0,R0
        BL       UART_Send_Byte
//  216         decimals = decimals - (float)(decimalsInterger-0x30);
        UXTB     R6,R6
        SUBS     R6,R6,#+48
        MOVS     R0,R6
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        MOVS     R4,R0
//  217     }
??UART_SendFloat_2:
        UXTB     R5,R5
        CMP      R5,#+0
        BNE      ??UART_SendFloat_3
//  218 
//  219     if (enter)
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??UART_SendFloat_4
//  220     {
//  221         UART_Send_Enter();
        BL       UART_Send_Enter
//  222     }
//  223 }
??UART_SendFloat_4:
        POP      {R0,R4-R7,PC}    ;; return
//  224 
//  225 /**
//  226   * 简介
//  227   *     获取串口数据
//  228   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  229 uint8 UART_GetData()
//  230 {
UART_GetData:
        PUSH     {LR}
//  231     uint8 temp = 0;
        MOVS     R0,#+0
//  232 
//  233     if ( uart[UART_PART]->S1 & UART_S1_RDRF_MASK)
        LDR      R1,??DataTable3
        LDR      R1,[R1, #+8]
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+26
        BPL      ??UART_GetData_0
//  234     {
//  235 
//  236         temp =  uart[UART_PART]->D;
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+8]
        LDRB     R0,[R0, #+7]
//  237     }
//  238 
//  239     return temp;
??UART_GetData_0:
        UXTB     R0,R0
        POP      {PC}             ;; return
//  240 }

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
//  241 
//  242 
//  243 
//  244 
//  245 /* -------------------------------------------------------------- 未完成的函数 */
//  246 
//  247 
//  248 /* ------------------------------------------------  未完成的函数 -------- END */
//  249 
//  250 
//  251 
//  252 /* -------------------------------------- 有BUG的函数 不到万不得已 千万不要使用 */
//  253 
//  254 
//  255 /**
//  256   * 简介
//  257   *     printf串口打印
//  258   * 备注
//  259   *     宏由内核提供
//  260   *     此函数因逐飞库对启动文件的修改而无法使用，很遗憾，看不懂那堆汇编代码
//  261   *     但在最底层printf已经被重指向了，所以可直接使用printf
//  262   *     printf的端口由 DEBUG_PORT宏定义决定，波特率由 DEBUG_BAUD 定义
//  263   *     但经过测试，逐飞定义的 printf 无法发送 %f 数据
//  264   */
//  265 //void UART_Send_Printf(const char *fmt,...)
//  266 //{
//  267 //    va_list ap;             //保存参数地址
//  268 //    char string[64] = {0}; //放置解释好的字符串
//  269 //
//  270 //    //将字符串转换成串口可发送的
//  271 //    va_start(ap, fmt);      //计算出第一个实际参数的地址
//  272 //    vsnprintf(string, 64, fmt, ap); //把输入的格式字符串进行解释
//  273 //    va_end(ap);                     //ap指针清空
//  274 //
//  275 //    //发送解释好的字符串
//  276 //    UART_Send_String(string);
//  277 //}
//  278 
//  279 /**
//  280   * 简介
//  281   *     发送 float 数据
//  282   * 参数
//  283   *     date    数据
//  284   *     len     显示长度
//  285   *     enter   是否发送回车
//  286   *       0  不发送
//  287   *       1  发送
//  288   * 备注
//  289   *     此函数千万不要碰，变量定义都不要动，由于逐飞库的printf
//  290   *     此函数里面的sprintf有一个超级bug，有时候只是定义变一下，
//  291   *     换一个变量，这个函数就会卡死
//  292   */
//  293 //void UART_SendFloat(float date,  uint8 len, uint8 enter)
//  294 //{
//  295 //
//  296 ////    uint8 i = 0;
//  297 ////
//  298 ////    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  299 ////    {
//  300 ////        UART_FloatArray[i] = 0;
//  301 ////    }
//  302 ////
//  303 ////    sprintf(UART_FloatArray, "%f", date);
//  304 ////
//  305 ////    //不能使用发送字符串的函数，原因不明，总之会出错
//  306 //////    UART_FloatArray[len] = '\0';
//  307 //////    UART_Send_String(UART_FloatArray);
//  308 //
//  309 //    uint8 i = 0;
//  310 //
//  311 //    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//  312 //    {
//  313 //        UART_SendFloatArray[i] = 0;
//  314 //    }
//  315 //
//  316 //    sprintf(UART_SendFloatArray, "%f", date);
//  317 //
//  318 //    for (i=0; i<len; i++)
//  319 //    {
//  320 //        UART_Send_Byte(UART_SendFloatArray[i]);
//  321 //    }
//  322 //
//  323 //    if (enter)
//  324 //    {
//  325 //        UART_Send_Enter();
//  326 //    }
//  327 //}
//  328 
//  329 
//  330 /* -----------------------  有BUG的函数 不到万不得已 千万不要使用  -------- END */
//  331 
// 
// 522 bytes in section .text
// 
// 522 bytes of CODE memory
//
//Errors: none
//Warnings: none
