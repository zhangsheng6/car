///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:37
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\lib\C\KEA128_i2c.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\lib\C\KEA128_i2c.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\KEA128_i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioSet
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_uidiv
        EXTERN abs
        EXTERN bus_clk_khz
        EXTERN carStatus
        EXTERN iic_error
        EXTERN iic_error_counter

        PUBLIC I2CN
        PUBLIC MasterTransmission
        PUBLIC SlaveID
        PUBLIC i2c_Wait
        PUBLIC i2c_delay
        PUBLIC i2c_init
        PUBLIC i2c_read_reg
        PUBLIC i2c_read_reg_bytes
        PUBLIC i2c_write_reg

// H:\智能车程序2018\电磁三轮——ZS\7.17\lib\C\KEA128_i2c.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,逐飞科技
//    4  * All rights reserved.
//    5  * 技术讨论QQ群：179029047
//    6  *
//    7  * 以下所有内容版权均属逐飞科技所有，未经允许不得用于商业用途，
//    8  * 欢迎各位使用并传播本程序，修改内容时必须保留逐飞科技的版权声明。
//    9  *
//   10  * @file       		KEA128_i2c
//   11  * @company	   		成都逐飞科技有限公司
//   12  * @author     		逐飞科技(QQ3184284598)
//   13  * @version    		v2.0
//   14  * @Software 		IAR 7.7 or MDK 5.23
//   15  * @Target core		S9KEA128AMLK
//   16  * @Taobao   		https://seekfree.taobao.com/
//   17  * @date       		2017-11-6
//   18  ********************************************************************************************************************/
//   19 
//   20 
//   21 #include "KEA128_i2c.h"
//   22 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 unsigned char MasterTransmission;
MasterTransmission:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   24 unsigned char SlaveID;
SlaveID:
        DS8 1
//   25 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 I2C_Type * I2CN[2] = I2C_BASES; //定义两个指针数组保存 I2CN 的地址
I2CN:
        DATA
        DC32 40066000H, 40067000H
//   27 
//   28 
//   29 //等待 I2C_S  不会出现卡死的情况

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void i2c_Wait(I2Cn_e i2cn)
//   31 {
i2c_Wait:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   32     uint16 num;
//   33     uint16 wait_num=500;//等待次数，超过设定的次数将关闭硬件IIC，使用模拟IIC发出stop信号，然后在启动硬件IIC。
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
//   34                         //这里的500在通信速率为100K的时候可以正常使用，如果通信速率较低可以适当增加这个值。
//   35                         //经过测试可以在通信出错的时候，自动恢复。
//   36     while(( I2CN[i2cn]->S & I2C_S_IICIF_MASK)==0)
??i2c_Wait_0:
        LDR      R2,??DataTable2
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        LDRB     R2,[R2, #+3]
        LSLS     R2,R2,#+30
        BMI      ??i2c_Wait_1
//   37     {
//   38         num++;
        ADDS     R0,R0,#+1
//   39         if(num>wait_num)
        UXTH     R1,R1
        UXTH     R0,R0
        CMP      R1,R0
        BCS      ??i2c_Wait_0
//   40         {
//   41             I2CN[i2cn]->C1 = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable2
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//   42             if(i2cn == i2c0)    SIM->SCGC &= ~(uint32)SIM_SCGC_I2C0_MASK;
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??i2c_Wait_2
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0xfffeffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
        B        ??i2c_Wait_3
//   43             else                SIM->SCGC &= ~(uint32)SIM_SCGC_I2C1_MASK;
??i2c_Wait_2:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_3  ;; 0xfffdffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//   44 
//   45             LED_3_ON;//出错了，闪灯
??i2c_Wait_3:
        MOVS     R1,#+0
        MOVS     R0,#+51
        BL       GpioSet
//   46             iic_error++;
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   47             iic_error_counter++;
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable2_5
        STR      R0,[R1, #+0]
//   48 //            BUZZER_TURN;
//   49             carStatus = STOP;
        MOVS     R0,#+1
        LDR      R1,??DataTable2_6
        STRB     R0,[R1, #+0]
//   50 //            IIC_init();
//   51 //            IIC_stop();
//   52             if(i2cn == i2c0)    SIM->SCGC |= SIM_SCGC_I2C0_MASK;
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??i2c_Wait_4
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
        B        ??i2c_Wait_5
//   53             else                SIM->SCGC |= SIM_SCGC_I2C1_MASK;
??i2c_Wait_4:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//   54             I2CN[i2cn]->C1 = I2C_C1_IICEN_MASK;
??i2c_Wait_5:
        MOVS     R0,#+128
        LDR      R1,??DataTable2
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//   55             break;
//   56         }
//   57     }
//   58     I2CN[i2cn]->S |= I2C_S_IICIF_MASK ;
??i2c_Wait_1:
        LDR      R0,??DataTable2
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+3]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R0,[R0, R4]
        STRB     R1,[R0, #+3]
//   59 }
        POP      {R4,PC}          ;; return
//   60 
//   61 //启动信号
//   62 #define i2c_Start(NUM)             {I2CN[NUM]->C1 |= (I2C_C1_TX_MASK | I2C_C1_MST_MASK);}    //MST 由0变1，产生起始信号，TX = 1 进入发送模式
//   63 
//   64 //停止信号
//   65 #define i2c_Stop(NUM)              {I2CN[NUM]->C1 &= ~(I2C_C1_MST_MASK | I2C_C1_TX_MASK);}   //MST 由1变0，产生停止信号，TX = 0 进入接收模式
//   66 
//   67 //重复启动
//   68 #define i2c_RepeatedStart(NUM)     {I2CN[NUM]->C1 |= I2C_C1_RSTA_MASK;}
//   69 
//   70 //进入接收模式(应答,需要接收多个数据，接收最后一个字节前需要禁用应答i2c_DisableAck)
//   71 #define i2c_EnterRxMode(NUM)       {I2CN[NUM]->C1 &= ~(I2C_C1_TX_MASK | I2C_C1_TXAK_MASK);}  //
//   72 
//   73 //进入接收模式(不应答,只接收一个字节)
//   74 #define i2c_PutinRxMode(NUM)       {I2CN[NUM]->C1 &= ~I2C_C1_TX_MASK; I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   75 
//   76 //禁用应答(接收最后一个字节)
//   77 #define i2c_DisableAck(NUM)        {I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   78 
//   79 //写一个字节
//   80 #define i2c_write_byte(NUM,data)   {I2CN[NUM]->D = data; i2c_Wait(NUM);}
//   81 
//   82 
//   83 
//   84 
//   85 //-------------------------------------------------------------------------------------------------------------------
//   86 //  @brief      I2C初始化
//   87 //  @param      i2cn        I2C模块(i2c0,i2c1)
//   88 //  @param      baud        期望的波特率
//   89 //  @return                 实际的波特率
//   90 //  @return     void
//   91 //  @since      v2.0
//   92 //  Sample usage:           i2c_init(i2c0,400*1000);     // 初始化i2c0，期望的波特率为400k
//   93 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 uint32 i2c_init(I2Cn_e i2cn, uint32 baud)
//   95 {
i2c_init:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+136
        MOVS     R6,R1
//   96     //查表 ICR 对应的  SCL_divider ，见 《KEA128RM.pdf》第537页的I2C 分频器和保持值
//   97     uint16 ICR_2_SCL_divider[0x40]  =
//   98     {
//   99         20, 22, 24, 26, 28, 30, 34, 40, 28, 32, 36, 40, 44, 48, 56, 68,
//  100         48, 56, 64, 72, 80, 88, 104, 128, 80, 96, 112, 128, 144, 160, 192, 240,
//  101         160, 192, 224, 256, 288, 320, 384, 480, 320, 384, 448, 512, 576, 640, 768, 960,
//  102         640, 768, 896, 1024, 1152, 1280, 1536, 1920, 1280, 1536, 1792, 2048, 2304, 2560, 3072, 3840
//  103     };
        ADD      R0,SP,#+4
        LDR      R1,??DataTable2_7
        MOVS     R2,#+128
        BL       __aeabi_memcpy4
//  104 
//  105     uint8 mult;
//  106 
//  107     uint16 scldiv =  0;  //最佳的分频系数
        MOVS     R5,#+0
//  108 
//  109     //需要从 ICR_2_SCL_divider 里找到 与最佳分频系数scldiv最相近的 分频系数
//  110     uint8 icr, n;
//  111     uint16 min_Dvalue = ~0, Dvalue;
        LDR      R4,??DataTable2_8  ;; 0xffff
//  112 
//  113     if(i2cn == i2c0)
        ADD      R0,SP,#+136
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??i2c_init_0
//  114     {
//  115         // 开启时钟
//  116         SIM->SCGC |= SIM_SCGC_I2C0_MASK;           //开启 I2C0时钟
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  117         //复用引脚
//  118         if(A3 == I2C0_SCL_PIN)
//  119         {
//  120             SIM->PINSEL &= ~(uint32)SIM_PINSEL_I2C0PS_MASK;
        LDR      R0,??DataTable2_9  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        BICS     R0,R0,R1
        LDR      R1,??DataTable2_9  ;; 0x4004800c
        STR      R0,[R1, #+0]
        B        ??i2c_init_1
//  121         }
//  122         else
//  123         {
//  124             SIM->PINSEL |= SIM_PINSEL_I2C0PS_MASK;
//  125         }
//  126 
//  127     }
//  128     else
//  129     {
//  130         // 开启时钟
//  131         SIM->SCGC |= SIM_SCGC_I2C1_MASK;           //开启 I2C1时钟
??i2c_init_0:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  132         //复用引脚
//  133         if(E1 == I2C1_SCL_PIN)
//  134         {
//  135             SIM->PINSEL1 &= ~(uint32)SIM_PINSEL1_I2C1PS_MASK;
//  136         }
//  137         else
//  138         {
//  139             SIM->PINSEL1 |= SIM_PINSEL1_I2C1PS_MASK;
        LDR      R0,??DataTable3  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3  ;; 0x40048010
        STR      R1,[R0, #+0]
//  140         }
//  141     }
//  142 
//  143     // 设置频率
//  144 
//  145     // I2C baud rate = bus speed (Hz)/(mul × SCL divider)
//  146     // SDA hold time = bus period (s) × mul × SDA hold value
//  147     // SCL start hold time = bus period (s) × mul × SCL start hold value
//  148     // SCL stop hold time = bus period (s) × mul × SCL stop hold value
//  149 
//  150 
//  151     mult = bus_clk_khz*1000/baud/3840;
??i2c_init_1:
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,R6
        BL       __aeabi_uidiv
        MOVS     R1,#+240
        LSLS     R1,R1,#+4        ;; #+3840
        BL       __aeabi_uidiv
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  152 
//  153     scldiv =  bus_clk_khz * 1000 / ( (1<<mult) * baud );    //最佳的分频系数
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        LSLS     R1,R1,R2
        MULS     R1,R6,R1
        BL       __aeabi_uidiv
        MOVS     R5,R0
//  154 
//  155     n = 0x40;
        MOVS     R6,#+64
        B        ??i2c_init_2
//  156     while(n)                                                //循环里逐个扫描，找出最接近的 分频系数
//  157     {
//  158         n--;
//  159         Dvalue = abs(scldiv - ICR_2_SCL_divider[n]);
//  160         if(Dvalue == 0)
//  161         {
//  162             icr = n;
//  163             break;                                          //退出while循环
//  164         }
//  165 
//  166         if(Dvalue < min_Dvalue)
??i2c_init_3:
        UXTH     R0,R0
        UXTH     R4,R4
        CMP      R0,R4
        BCS      ??i2c_init_2
//  167         {
//  168             icr = n;
        MOVS     R7,R6
//  169             min_Dvalue = Dvalue;
        MOVS     R4,R0
//  170         }
??i2c_init_2:
        UXTB     R6,R6
        CMP      R6,#+0
        BEQ      ??i2c_init_4
        SUBS     R6,R6,#+1
        UXTH     R5,R5
        ADD      R0,SP,#+4
        UXTB     R6,R6
        MOVS     R1,#+2
        MULS     R1,R6,R1
        LDRH     R0,[R0, R1]
        SUBS     R0,R5,R0
        BL       abs
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??i2c_init_3
        MOVS     R7,R6
//  171     }
//  172 
//  173     I2CN[i2cn]->F  = I2C_F_MULT(mult) | I2C_F_ICR(icr);     // I2C分频寄存器
??i2c_init_4:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+6
        LSLS     R1,R7,#+26       ;; ZeroExtS R1,R7,#+26,#+26
        LSRS     R1,R1,#+26
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2
        ADD      R2,SP,#+136
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+1]
//  174 
//  175     // 使能 I2C
//  176     I2CN[i2cn]->C1 = ( 0
//  177                        | I2C_C1_IICEN_MASK       //使能I2C
//  178                        //| I2C_C1_IICIE_MASK       //使能中断
//  179                      );
        MOVS     R0,#+128
        LDR      R1,??DataTable2
        ADD      R2,SP,#+136
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  180 
//  181     return (  bus_clk_khz * 1000 / ( (1<<mult) * ICR_2_SCL_divider[icr])  );
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+0]
        LSLS     R1,R1,R2
        ADD      R2,SP,#+4
        UXTB     R7,R7
        MOVS     R3,#+2
        MULS     R7,R3,R7
        LDRH     R2,[R2, R7]
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        ADD      SP,SP,#+140
        POP      {R4-R7,PC}       ;; return
//  182 }
//  183 
//  184 //-------------------------------------------------------------------------------------------------------------------
//  185 //  @brief      I2C通信结束后需要调用的函数函数
//  186 //  @return     void
//  187 //  @since      v2.0
//  188 //  @note		如果通信失败，可尝试增大此延时值，确认是否延时导致的
//  189 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void i2c_delay(void)
//  191 {
i2c_delay:
        PUSH     {R7,LR}
//  192     volatile uint16 n = 150;     //注意，这个数据太小，会导致读取错误。
        MOVS     R0,#+150
        MOV      R1,SP
        STRH     R0,[R1, #+0]
//  193 
//  194     while(n--);
??i2c_delay_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        SUBS     R1,R0,#+1
        MOV      R2,SP
        STRH     R1,[R2, #+0]
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??i2c_delay_0
//  195 }
        POP      {R0,PC}          ;; return
//  196 
//  197 //-------------------------------------------------------------------------------------------------------------------
//  198 //  @brief      读取I2C设备指定地址寄存器的数据
//  199 //  @param      i2cn        I2C模块(i2c0、i2c1)
//  200 //  @param      SlaveID     从机地址(7位地址)
//  201 //  @param      reg         从机寄存器地址
//  202 //  @return                 读取的寄存器值
//  203 //  @since      v2.0
//  204 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50);//读取0x50地址的数据，从机地址为0x2D
//  205 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 uint8 i2c_read_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg)
//  207 {
i2c_read_reg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  208 
//  209     //先写入寄存器地址,再读取数据,因此此过程是 I2C 的复合格式,改变数据方向时需要重新启动
//  210     //地址是低七位
//  211     uint8 result;
//  212 
//  213     i2c_Start(i2cn);                                    //发送启动信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+48
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  214 
//  215     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //发送从机地址和写位
        LSLS     R0,R5,#+1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  216 
//  217     i2c_write_byte(i2cn, reg);                          //发送从机里的寄存器地址
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R6,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  218 
//  219     i2c_RepeatedStart(i2cn);                            //复合格式，发送重新启动信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  220 
//  221     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //发送从机地址和读位
        LSLS     R0,R5,#+1
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  222 
//  223     i2c_PutinRxMode(i2cn);                              //进入接收模式(不应答,只接收一个字节)
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+239
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  224     result = I2CN[i2cn]->D;                             //虚假读取一次，启动接收数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R5,[R0, #+4]
//  225     i2c_Wait(i2cn);                                     //等待接收完成
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  226 
//  227     i2c_Stop(i2cn);                                     //发送停止信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+207
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  228 
//  229     result = I2CN[i2cn]->D;                             //读取数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R4,R1,R4
        LDR      R0,[R0, R4]
        LDRB     R5,[R0, #+4]
//  230 
//  231     i2c_delay();                                        //必须延时一下，否则出错
        BL       i2c_delay
//  232 
//  233     return result;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return
//  234 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     I2CN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40048014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xfffeffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xfffdffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     iic_error

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     iic_error_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     carStatus

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x4004800c
//  235 
//  236 //-------------------------------------------------------------------------------------------------------------------
//  237 //  @brief      读取I2C设备指定地址寄存器的数据
//  238 //  @param      i2cn        I2C模块(i2c0、i2c1)
//  239 //  @param      SlaveID     从机地址(7位地址)
//  240 //  @param      reg         从机寄存器地址
//  241 //  @param      num         读取字节数
//  242 //  @param      addr        读取的数据存储的地址
//  243 //  @return     void
//  244 //  @since      v2.0
//  245 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50, 10, buf);//读取0x50地址的数据，从机地址为0x2D开始的10个字节
//  246 //-------------------------------------------------------------------------------------------------------------------
//  247 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  248 uint8 i2c_read_reg_bytes(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 num, uint8 * addr)
//  249 {
i2c_read_reg_bytes:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  250     //先写入寄存器地址,再读取数据,因此此过程是 I2C 的复合格式,改变数据方向时需要重新启动
//  251     //地址是低七位
//  252     uint8 result;
//  253 
//  254     i2c_Start(i2cn);                                    //发送启动信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+48
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  255 
//  256     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //发送从机地址和写位
        LSLS     R0,R7,#+1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  257 
//  258     i2c_write_byte(i2cn, reg);                          //发送从机里的寄存器地址
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R5,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  259 
//  260     i2c_RepeatedStart(i2cn);                            //复合格式，发送重新启动信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  261 
//  262     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //发送从机地址和读位
        LSLS     R0,R7,#+1
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  263 
//  264     i2c_EnterRxMode(i2cn);                              //进入接收模式(不应答,只接收一个字节)
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+231
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
        LDR      R5,[SP, #+24]
        B        ??i2c_read_reg_bytes_0
//  265 
//  266     while(num--)
//  267     {
//  268         result = I2CN[i2cn]->D;                         //虚假读取一次，启动接收数据
??i2c_read_reg_bytes_1:
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R7,[R0, #+4]
//  269         i2c_Wait(i2cn);                                 //等待接收完成
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  270         *addr = I2CN[i2cn]->D;                         //读取数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R5, #+0]
//  271         i2c_delay();                                    //必须延时一下，否则出错
        BL       i2c_delay
//  272         addr++;
        ADDS     R5,R5,#+1
//  273     }
??i2c_read_reg_bytes_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??i2c_read_reg_bytes_1
//  274     i2c_DisableAck(i2cn);
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  275     i2c_PutinRxMode(i2cn);
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+239
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  276     result = I2CN[i2cn]->D;                             //虚假读取一次，启动接收数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R7,[R0, #+4]
//  277     i2c_Wait(i2cn);                                     //等待接收完成
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  278     i2c_Stop(i2cn);                                     //发送停止信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+207
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+2]
//  279     *addr = I2CN[i2cn]->D;                              //读取数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R4,R1,R4
        LDR      R0,[R0, R4]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R5, #+0]
//  280 
//  281     i2c_delay();                                        //必须延时一下，否则出错
        BL       i2c_delay
//  282 
//  283     return result;
        MOVS     R0,R7
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  284 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40048010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     bus_clk_khz
//  285 
//  286 //-------------------------------------------------------------------------------------------------------------------
//  287 //  @brief      写入一个字节数据到I2C设备指定寄存器地址
//  288 //  @param      i2cn        I2C模块(i2c0、i2c1)
//  289 //  @param      SlaveID     从机地址(7位地址)
//  290 //  @param      reg         从机寄存器地址
//  291 //  @param      Data        数据
//  292 //  @return     void
//  293 //  @since      v2.0
//  294 //  Sample usage:       	i2c_write_reg(i2c0, 0x2D, 0x50,2);     //写入数据2到0x50地址，从机地址为0x2D
//  295 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  296 void i2c_write_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 Data)
//  297 {
i2c_write_reg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
//  298 
//  299     i2c_Start(i2cn);                                    //发送启动信号
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        LDRB     R2,[R0, #+2]
        MOVS     R0,#+48
        ORRS     R0,R0,R2
        LDR      R2,??DataTable4
        UXTB     R4,R4
        MOVS     R3,#+4
        MULS     R3,R4,R3
        LDR      R2,[R2, R3]
        STRB     R0,[R2, #+2]
//  300 
//  301     i2c_write_byte(i2cn, ( SlaveID << 1 ) | MWSR);      //发送从机地址和写位
        LSLS     R0,R1,#+1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  302 
//  303     i2c_write_byte(i2cn, reg);                          //发送从机里的寄存器地址
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R5,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  304 
//  305     i2c_write_byte(i2cn, Data);                         //发送需要写入的数据
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R6,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  306 
//  307     i2c_Stop(i2cn);
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+2]
        MOVS     R1,#+207
        ANDS     R1,R1,R0
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R4,R2,R4
        LDR      R0,[R0, R4]
        STRB     R1,[R0, #+2]
//  308 
//  309     i2c_delay();                                        //延时太短的话，可能写出错
        BL       i2c_delay
//  310 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     I2CN

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC16 20, 22, 24, 26, 28, 30, 34, 40, 28, 32, 36, 40, 44, 48, 56, 68, 48
        DC16 56, 64, 72, 80, 88, 104, 128, 80, 96, 112, 128, 144, 160, 192, 240
        DC16 160, 192, 224, 256, 288, 320, 384, 480, 320, 384, 448, 512, 576
        DC16 640, 768, 960, 640, 768, 896, 1024, 1152, 1280, 1536, 1920, 1280
        DC16 1536, 1792, 2048, 2304, 2560, 3072, 3840

        END
// 
//     2 bytes in section .bss
//     8 bytes in section .data
//   128 bytes in section .rodata
// 1 302 bytes in section .text
// 
// 1 302 bytes of CODE  memory
//   128 bytes of CONST memory
//    10 bytes of DATA  memory
//
//Errors: none
//Warnings: none
