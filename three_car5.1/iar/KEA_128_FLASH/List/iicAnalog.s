///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\5.1\device\C\iicAnalog.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\device\C\iicAnalog.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\iicAnalog.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioGet
        EXTERN GpioInit
        EXTERN GpioSet
        EXTERN gpio_ddr

        PUBLIC I2C_SendACK
        PUBLIC IIC_Init
        PUBLIC IIC_IoMux
        PUBLIC IIC_ad_main
        PUBLIC IIC_ad_sub
        PUBLIC IIC_buf
        PUBLIC IIC_delay
        PUBLIC IIC_num
        PUBLIC IIC_readReg
        PUBLIC IIC_start
        PUBLIC IIC_stop
        PUBLIC IIC_writeReg
        PUBLIC read_ch
        PUBLIC send_ch

// H:\���ܳ�����2018\������֡���ZS\5.1\device\C\iicAnalog.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：     iicAnalog.c
//    8   * 文件标识：
//    9   * 摘    要：
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年1月28日 16:33:14
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "iicAnalog.h"
//   18 
//   19 #define SDA             GpioGet (IIC_SDA)
//   20 #define SDA0()          GpioSet (IIC_SDA, 0)		//IO口输出低电平
//   21 #define SDA1()          GpioSet (IIC_SDA, 1)		//IO口输出高电平
//   22 #define SCL0()          GpioSet (IIC_SCL, 0)		//IO口输出低电平
//   23 #define SCL1()          GpioSet (IIC_SCL, 1)		//IO口输出高电平
//   24 #define DIR_OUT()       gpio_ddr (IIC_SDA, GPO)    //输出方向
//   25 #define DIR_IN()        gpio_ddr (IIC_SDA, GPI)    //输入方向
//   26 
//   27 
//   28 //内部数据定义

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 uint8 IIC_ad_main; //器件从地址
IIC_ad_main:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   30 uint8 IIC_ad_sub;  //器件子地址
IIC_ad_sub:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 uint8 *IIC_buf;    //发送|接收数据缓冲区
IIC_buf:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   32 uint8 IIC_num;     //发送|接收数据个数
IIC_num:
        DS8 1
//   33 
//   34 #define ack     1      //主应答
//   35 #define no_ack  0   //从应答
//   36 
//   37 
//   38 /**
//   39   * 简介
//   40   *     模拟 IIC 延时
//   41   * 备注
//   42   *     如果IIC通信失败，尝试增加 j
//   43   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void IIC_delay(void)
//   45 {
IIC_delay:
        PUSH     {LR}
//   46 	//64为100K的速率(bus频率为100M)
//   47 	//特别提示OV7725的通信速率不能太高，最好50K左右，j设置为120通信速率为60K，60K的时候可以正常通信
//   48 	//其他IIC器件一般可以400K的通信速率
//   49 	uint16 j=120;
        MOVS     R0,#+120
//   50 	while(j--);
??IIC_delay_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        UXTH     R1,R1
        CMP      R1,#+0
        BNE      ??IIC_delay_0
//   51 }
        POP      {PC}             ;; return
//   52 
//   53 /**
//   54   * 简介
//   55   *     IIC 开始函数
//   56   * 备注
//   57   *     内部使用，无需调用
//   58   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 void IIC_start(void)
//   60 {
IIC_start:
        PUSH     {R7,LR}
//   61 	SDA1();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   62 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   63 	IIC_delay();
        BL       IIC_delay
//   64 	SDA0();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//   65 	IIC_delay();
        BL       IIC_delay
//   66 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   67 }
        POP      {R0,PC}          ;; return
//   68 
//   69 /**
//   70   * 简介
//   71   *     IIC 停止函数
//   72   * 备注
//   73   *     内部使用，无需调用
//   74   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   75 void IIC_stop(void)
//   76 {
IIC_stop:
        PUSH     {R7,LR}
//   77 	SDA0();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//   78 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   79 	IIC_delay();
        BL       IIC_delay
//   80 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   81 	IIC_delay();
        BL       IIC_delay
//   82 	SDA1();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   83 	IIC_delay();
        BL       IIC_delay
//   84 }
        POP      {R0,PC}          ;; return
//   85 
//   86 //主应答(包含ack:SDA=0和no_ack:SDA=0)
//   87 //内部使用，用户无需调用

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void I2C_SendACK(unsigned char ack_dat)
//   89 {
I2C_SendACK:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   90     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   91 	IIC_delay();
        BL       IIC_delay
//   92 	if(ack_dat) SDA0();
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??I2C_SendACK_0
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
        B        ??I2C_SendACK_1
//   93     else    	SDA1();
??I2C_SendACK_0:
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   94 
//   95     SCL1();
??I2C_SendACK_1:
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   96     IIC_delay();
        BL       IIC_delay
//   97     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   98     IIC_delay();
        BL       IIC_delay
//   99 }
        POP      {R4,PC}          ;; return
//  100 
//  101 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 static int SCCB_WaitAck(void)
//  103 {
SCCB_WaitAck:
        PUSH     {R7,LR}
//  104     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  105 	DIR_IN();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       gpio_ddr
//  106 	IIC_delay();
        BL       IIC_delay
//  107 
//  108 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  109     IIC_delay();
        BL       IIC_delay
//  110 
//  111     if(SDA)           //应答为高电平，异常，通信失败
        MOVS     R0,#+23
        BL       GpioGet
        CMP      R0,#+0
        BEQ      ??SCCB_WaitAck_0
//  112     {
//  113         DIR_OUT();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  114         SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  115         return 0;
        MOVS     R0,#+0
        B        ??SCCB_WaitAck_1
//  116     }
//  117     DIR_OUT();
??SCCB_WaitAck_0:
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  118     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  119 	IIC_delay();
        BL       IIC_delay
//  120     return 1;
        MOVS     R0,#+1
??SCCB_WaitAck_1:
        POP      {R1,PC}          ;; return
//  121 }
//  122 
//  123 /**
//  124   * 简介
//  125   *     IIC 字节发送程序
//  126   * 备注
//  127   *     发送c(可以是数据也可是地址)，送完后接收从应答
//  128   *     不考虑从应答位
//  129   *     内部使用，用户无需调用
//  130   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void send_ch(uint8 c)
//  132 {
send_ch:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  133 	uint8 i = 8;
        MOVS     R5,#+8
//  134     while(i--)
??send_ch_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??send_ch_1
//  135     {
//  136         if(c & 0x80)	SDA1();//SDA 输出数据
        LSLS     R0,R4,#+24
        BPL      ??send_ch_2
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
        B        ??send_ch_3
//  137         else			SDA0();
??send_ch_2:
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//  138         c <<= 1;
??send_ch_3:
        LSLS     R4,R4,#+1
//  139         IIC_delay();
        BL       IIC_delay
//  140         SCL1();                //SCL 拉高，采集信号
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  141         IIC_delay();
        BL       IIC_delay
//  142         SCL0();                //SCL 时钟线拉低
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
        B        ??send_ch_0
//  143     }
//  144 	SCCB_WaitAck();
??send_ch_1:
        BL       SCCB_WaitAck
//  145 }
        POP      {R0,R4,R5,PC}    ;; return
//  146 
//  147 /**
//  148   * 简介
//  149   *     IIC 字节接收程序
//  150   * 备注
//  151   *     接收器件传来的数据，
//  152   *     此程序应配合|主应答函数|IIC_ack_main()使用
//  153   *     内部使用，用户无需调用
//  154   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  155 uint8 read_ch(void)
//  156 {
read_ch:
        PUSH     {R3-R5,LR}
//  157     uint8 i;
//  158     uint8 c;
//  159     c=0;
        MOVS     R0,#+0
        MOVS     R5,R0
//  160     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  161     IIC_delay();
        BL       IIC_delay
//  162     SDA1();             //置数据线为输入方式
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//  163     DIR_IN();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       gpio_ddr
//  164     for(i=0;i<8;i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??read_ch_0:
        UXTB     R4,R4
        CMP      R4,#+8
        BGE      ??read_ch_1
//  165     {
//  166         IIC_delay();
        BL       IIC_delay
//  167         SCL0();         //置时钟线为低，准备接收数据位
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  168         IIC_delay();
        BL       IIC_delay
//  169         SCL1();         //置时钟线为高，使数据线上数据有效
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  170         IIC_delay();
        BL       IIC_delay
//  171         c<<=1;
        LSLS     R5,R5,#+1
//  172         if(SDA) c+=1;   //读数据位，将接收的数据存c
        MOVS     R0,#+23
        BL       GpioGet
        CMP      R0,#+0
        BEQ      ??read_ch_2
        ADDS     R5,R5,#+1
//  173     }
??read_ch_2:
        ADDS     R4,R4,#+1
        B        ??read_ch_0
//  174     DIR_OUT();
??read_ch_1:
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  175 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  176 	IIC_delay();
        BL       IIC_delay
//  177 	I2C_SendACK(no_ack);
        MOVS     R0,#+0
        BL       I2C_SendACK
//  178 
//  179     return c;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return
//  180 }
//  181 
//  182 /**
//  183   * 简介
//  184   *     模拟IIC写数据到设备寄存器函数
//  185   * 参数
//  186   *     dev_add			设备地址(低七位地址)
//  187   *     reg				寄存器地址
//  188   *     dat				写入的数据
//  189   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void IIC_writeReg(uint8 dev_add, uint8 reg, uint8 dat)
//  191 {
IIC_writeReg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  192 	IIC_start();
        BL       IIC_start
//  193     send_ch( (dev_add<<1) | 0x00);   //发送器件地址加写位
        LSLS     R0,R4,#+1
        UXTB     R0,R0
        BL       send_ch
//  194 	send_ch( reg );   				 //发送从机寄存器地址
        MOVS     R0,R5
        UXTB     R0,R0
        BL       send_ch
//  195 	send_ch( dat );   				 //发送需要写入的数据
        MOVS     R0,R6
        UXTB     R0,R0
        BL       send_ch
//  196 	IIC_stop();
        BL       IIC_stop
//  197 }
        POP      {R4-R6,PC}       ;; return
//  198 
//  199 /**
//  200   * 简介
//  201   *     模拟 IIC 从设备寄存器读取数据
//  202   * 参数
//  203   *     dev_add			设备地址(低七位地址)
//  204   *     reg				寄存器地址
//  205   *     type			选择通信方式是IIC  还是 SCCB
//  206   * 返回值
//  207   *     dat             返回寄存器的数据
//  208   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 uint8 IIC_readReg(uint8 dev_add, uint8 reg, IIC_type type)
//  210 {
IIC_readReg:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
//  211 	uint8 dat;
//  212 	IIC_start();
        BL       IIC_start
//  213     send_ch( (dev_add<<1) | 0x00);  //发送器件地址加写位
        LSLS     R0,R4,#+1
        UXTB     R0,R0
        BL       send_ch
//  214 	send_ch( reg );   				//发送从机寄存器地址
        MOVS     R0,R7
        UXTB     R0,R0
        BL       send_ch
//  215 	if(type == SCCB)IIC_stop();
        UXTB     R5,R5
        CMP      R5,#+1
        BNE      ??IIC_readReg_0
        BL       IIC_stop
//  216 
//  217 	IIC_start();
??IIC_readReg_0:
        BL       IIC_start
//  218 	send_ch( (dev_add<<1) | 0x01);  //发送器件地址加读位
        LSLS     R1,R4,#+1
        MOVS     R0,#+1
        ORRS     R0,R0,R1
        UXTB     R0,R0
        BL       send_ch
//  219 	dat = read_ch();   				//发送需要写入的数据
        BL       read_ch
        MOVS     R6,R0
//  220 	IIC_stop();
        BL       IIC_stop
//  221 
//  222 	return dat;
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  223 }
//  224 
//  225 /**
//  226   * 简介
//  227   *     IIC 端口复用
//  228   * 备注
//  229   *
//  230   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  231 void IIC_IoMux()
//  232 {
//  233     //将 D3 变为引脚功能
//  234     SIM->PINSEL1 |= SIM_PINSEL1_SPI1PS_MASK;
IIC_IoMux:
        LDR      R0,??DataTable0  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x40048010
        STR      R1,[R0, #+0]
//  235 
//  236     //将 C7 变为引脚功能
//  237     SIM->PINSEL1 |= SIM_PINSEL1_UART1PS_MASK;;
        LDR      R0,??DataTable0  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x40048010
        STR      R1,[R0, #+0]
//  238 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40048010
//  239 
//  240 /**
//  241   * 简介
//  242   *     IIC 初始化
//  243   * 备注
//  244   *
//  245   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  246 void IIC_Init(void)
//  247 {
IIC_Init:
        PUSH     {R7,LR}
//  248     IIC_IoMux();
        BL       IIC_IoMux
//  249 
//  250 	GpioInit (IIC_SCL, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioInit
//  251 	GpioInit (IIC_SDA, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioInit
//  252 }
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  253 
// 
//   7 bytes in section .bss
// 630 bytes in section .text
// 
// 630 bytes of CODE memory
//   7 bytes of DATA memory
//
//Errors: none
//Warnings: none
