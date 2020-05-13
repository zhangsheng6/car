///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\L3G4200.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\L3G4200.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_FLASH\List\L3G4200.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioGet
        EXTERN GpioSet
        EXTERN i2c_init
        EXTERN i2c_read_reg
        EXTERN i2c_write_reg

        PUBLIC L3G4200_Init
        PUBLIC L3G4200_ReData
        PUBLIC L3G4200_Read
        PUBLIC L3G4200_Read_Reg
        PUBLIC L3G4200_WrCmd
        PUBLIC L3G4200_Write_Reg
        PUBLIC SPI
        PUBLIC SPI_ReadWrite
        PUBLIC SPI_delay
        PUBLIC a
        PUBLIC `b`
        PUBLIC gx
        PUBLIC gy
        PUBLIC gyro_ID
        PUBLIC gyro_x
        PUBLIC gyro_y
        PUBLIC gyro_z
        PUBLIC gz
        PUBLIC wgx
        PUBLIC wgy
        PUBLIC wgz

// H:\智能车程序2018\电磁三轮——ZS\5.1\device\C\L3G4200.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：     L3G4200.c
//    8   * 文件标识：
//    9   * 摘    要：     陀螺仪初始化
//   10   *               陀螺仪寄存器读取相关
//   11   *
//   12   * 当前版本：     1.0
//   13   * 负    责：     韩志伟
//   14   * 时    间：     2018年1月4日 19:16:43
//   15   ******************************************************************************
//   16   */
//   17 
//   18 #include "L3G4200.h"
//   19 
//   20 
//   21 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 SPI_Type* SPI[2] = SPI_BASES; //定义两个指针数组保存 SPIx 的地址
SPI:
        DATA
        DC32 40076000H, 40077000H
//   23 
//   24 //相关参数
//   25 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   26   uint8 gx, gy,gz;//, gz;
gx:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gy:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
gz:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   27     uint16 wgx, wgy,wgz;//, wgz;
wgx:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
wgy:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
wgz:
        DS8 2
//   28 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 uint8 gyro_ID = 0;
gyro_ID:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   30 int16 gyro_x = 0, gyro_y = 0, gyro_z = 0;//存储最后三轴数据
gyro_x:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
gyro_y:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
gyro_z:
        DS8 2
//   31 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   32 uint8 a, b;
a:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
`b`:
        DS8 1
//   33 
//   34 
//   35 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   36 void SPI_delay(void)
//   37 {
SPI_delay:
        PUSH     {LR}
//   38 	uint16 j=120;
        MOVS     R0,#+120
//   39 	while(j--);
??SPI_delay_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        UXTH     R1,R1
        CMP      R1,#+0
        BNE      ??SPI_delay_0
//   40 }
        POP      {PC}             ;; return
//   41 
//   42 /**
//   43   * 简介
//   44   *     写命令
//   45   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void L3G4200_WrCmd(unsigned char cmd)
//   47 {
L3G4200_WrCmd:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   48   uint8 i=8;
        MOVS     R5,#+8
//   49   CL_L3G4200_CS;
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       GpioSet
//   50   SPI_delay();
        BL       SPI_delay
//   51 //  CL_L3G4200_MI;
//   52   while(i--)
??L3G4200_WrCmd_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??L3G4200_WrCmd_1
//   53   {
//   54     CL_L3G4200_CLK;
        MOVS     R1,#+0
        MOVS     R0,#+52
        BL       GpioSet
//   55     if(cmd&0x80)
        LSLS     R0,R4,#+24
        BPL      ??L3G4200_WrCmd_2
//   56     {
//   57         L3G4200_MO;
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
        B        ??L3G4200_WrCmd_3
//   58     }
//   59     else
//   60     {
//   61       CL_L3G4200_MO;
??L3G4200_WrCmd_2:
        MOVS     R1,#+0
        MOVS     R0,#+53
        BL       GpioSet
//   62     }
//   63     cmd<<=1;
??L3G4200_WrCmd_3:
        LSLS     R4,R4,#+1
//   64   SPI_delay();
        BL       SPI_delay
//   65     L3G4200_CLK;
        MOVS     R1,#+1
        MOVS     R0,#+52
        BL       GpioSet
        B        ??L3G4200_WrCmd_0
//   66   }
//   67 
//   68 //  L3G4200_MI;
//   69   L3G4200_CS;
??L3G4200_WrCmd_1:
        MOVS     R1,#+1
        MOVS     R0,#+55
        BL       GpioSet
//   70 }
        POP      {R0,R4,R5,PC}    ;; return
//   71 
//   72 /**
//   73   * 简介
//   74   *     读数据
//   75   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   76 uint8 L3G4200_ReData()
//   77 {
L3G4200_ReData:
        PUSH     {R3-R5,LR}
//   78   uint8 i=8;
        MOVS     R5,#+8
//   79   uint8 byte = 0;
        MOVS     R4,#+0
//   80 
//   81   CL_L3G4200_CS;
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       GpioSet
//   82   SPI_delay();
        BL       SPI_delay
//   83   while(i--)
??L3G4200_ReData_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??L3G4200_ReData_1
//   84   {
//   85     L3G4200_CLK;
        MOVS     R1,#+1
        MOVS     R0,#+52
        BL       GpioSet
//   86     SPI_delay();
        BL       SPI_delay
//   87     CL_L3G4200_CLK;
        MOVS     R1,#+0
        MOVS     R0,#+52
        BL       GpioSet
//   88 
//   89     if (GpioGet(SPI1_MISO) == 1)
        MOVS     R0,#+54
        BL       GpioGet
        CMP      R0,#+1
        BNE      ??L3G4200_ReData_2
//   90     {
//   91         byte += 1;
        ADDS     R4,R4,#+1
//   92     }
//   93 
//   94     byte<<=1;
??L3G4200_ReData_2:
        LSLS     R4,R4,#+1
        B        ??L3G4200_ReData_0
//   95   }
//   96 
//   97   L3G4200_CS;
??L3G4200_ReData_1:
        MOVS     R1,#+1
        MOVS     R0,#+55
        BL       GpioSet
//   98 
//   99   return byte;
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return
//  100 }
//  101 
//  102 /**
//  103   * 简介
//  104   *     读写
//  105   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  106 uint8 SPI_ReadWrite(uint8 byte)
//  107 {
SPI_ReadWrite:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  108     uint8 temp = 0;
        MOVS     R5,#+0
//  109 
//  110     L3G4200_WrCmd(byte);
        MOVS     R0,R4
        UXTB     R0,R0
        BL       L3G4200_WrCmd
//  111     temp = L3G4200_ReData();
        BL       L3G4200_ReData
        MOVS     R5,R0
//  112 
//  113 
//  114 
//  115 //    uint8 temp = 0;
//  116 //
//  117 //    while( !( SPI[1]->S & SPI_S_SPTEF_MASK ) );  //等待发送完成
//  118 //    SPI[1]->D = byte;          //清除发送完成标志位
//  119 //
//  120 //    while( !( SPI[1]->S & SPI_S_SPRF_MASK ) );   //等待接收数据
//  121 //    temp = (uint8)(SPI[1]->D);;           //读取数据，转换格式
//  122 //
//  123     return temp;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return
//  124 }
//  125 /**
//  126   * 简介
//  127   *     写陀螺仪寄存器
//  128   * 参数
//  129   *     reg：寄存器地址
//  130   *     value：写入的数据
//  131   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 void L3G4200_Write_Reg(uint8 reg, uint8 value)
//  133 {
L3G4200_Write_Reg:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  134     SPI_ReadWrite(reg);
        MOVS     R0,R5
        UXTB     R0,R0
        BL       SPI_ReadWrite
//  135     SPI_ReadWrite(value);
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SPI_ReadWrite
//  136 
//  137 
//  138 //    SPI_ReadWrite(reg);     //高位在前，所以读 -> 最高位要写1
//  139 //    SPI_ReadWrite(value);   //此时写入的是数据
//  140 }
        POP      {R0,R4,R5,PC}    ;; return
//  141 
//  142 /**
//  143   * 简介
//  144   *     读取陀螺仪寄存器
//  145   * 参数
//  146   *     reg：寄存器地址
//  147   *     value：保存地址
//  148   * 注意
//  149   *     一个读操作需16个脉冲
//  150   *     前八位状态，后八位数据
//  151   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 void L3G4200_Read_Reg(uint8 reg, uint8 *value)
//  153 {
L3G4200_Read_Reg:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
//  154     SPI_ReadWrite(0x80|reg);
        MOVS     R0,#+128
        ORRS     R0,R0,R5
        UXTB     R0,R0
        BL       SPI_ReadWrite
//  155     *value = SPI_ReadWrite(0xff);
        MOVS     R0,#+255
        BL       SPI_ReadWrite
        STRB     R0,[R4, #+0]
//  156 
//  157 //    SPI_ReadWrite(0x80|reg);        //高位在前，所以读 -> 最高位要写1
//  158 //    *value = SPI_ReadWrite(0xff);   //此时写入的是数据
//  159 }
        POP      {R0,R4,R5,PC}    ;; return
//  160 
//  161 
//  162 /**
//  163   * 简介
//  164   *     陀螺仪初始化
//  165   * 注意
//  166   *     使能了2个轴
//  167   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  168 void L3G4200_Init(void)
//  169 {
L3G4200_Init:
        PUSH     {R7,LR}
//  170     i2c_init(IIC_PORT, 400*1000);
        LDR      R1,??DataTable1  ;; 0x61a80
        MOVS     R0,#+1
        BL       i2c_init
//  171 
//  172     //数据输出速率800Hz，LPF截止频率110Hz，工作在正常模式，使能X Y 轴
//  173 //    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFF);
//  174     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFB);
        MOVS     R3,#+251
        MOVS     R2,#+32
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  175 //    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200);
//  176 
//  177     //高通滤波器配置
//  178     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG2_4200, 0x00);
        MOVS     R3,#+0
        MOVS     R2,#+33
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  179 
//  180     //关闭所有中断,配置IIC DRDY
//  181     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200, 0x08);
        MOVS     R3,#+8
        MOVS     R2,#+34
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  182 //    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200);
//  183 
//  184     //使能block data updata功能，确保正确读出数据、使能小端模式、选择满量程250dps
//  185     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG4_4200, 0x80);
        MOVS     R3,#+128
        MOVS     R2,#+35
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  186 
//  187     //使能LPF2，关闭HPF（打开后不能正常使用）
//  188     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG5_4200, 0x02);
        MOVS     R3,#+2
        MOVS     R2,#+36
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  189 
//  190     gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_TEMP_4200);
        MOVS     R2,#+38
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//  191 }
        POP      {R0,PC}          ;; return
//  192 
//  193 /**
//  194   * 简介
//  195   *     L3G4200 读取
//  196   * 注意
//  197   *     此处只使用XY轴数据
//  198   *     使用硬件iic 读一根轴需要470us(测试使用的是内部晶振)
//  199   *     使用模拟IIC 读一根轴需要4.9ms
//  200   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  201 void L3G4200_Read(void)
//  202 {
L3G4200_Read:
        PUSH     {R7,LR}
//  203     //存储三轴数据，每一轴两个字节，先低后高，补码形式存储
//  204 //    uint8 gx, gy;//, gz;
//  205 //    uint16 wgx, wgy;//, wgz;
//  206 
//  207     //经测试读两根轴需要 3.72 ms 三根轴更长，所以只读需要的
//  208     if ( i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, STATUS_REG_4200)&0x80 )//查看数据是否准备好了。如果没有准备好，读取则可能读取到错误数据。读取频率最好是高于数据输出频率
        MOVS     R2,#+39
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LSLS     R0,R0,#+24
        BPL      ??L3G4200_Read_0
//  209     {
//  210         //读一根轴需要470us
//  211         wgx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_H_4200);
        MOVS     R2,#+41
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LDR      R1,??DataTable1_2
        STRH     R0,[R1, #+0]
//  212 		gx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_L_4200);
        MOVS     R2,#+40
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LDR      R1,??DataTable1_3
        STRB     R0,[R1, #+0]
//  213         gyro_x = (wgx<<8) + gx;
        LDR      R0,??DataTable1_2
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable1_3
        LDRB     R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_4
        STRH     R0,[R1, #+0]
//  214         gyro_x >>= 3;
        LDR      R0,??DataTable1_4
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        SXTH     R0,R0
        ASRS     R0,R0,#+3
        LDR      R1,??DataTable1_4
        STRH     R0,[R1, #+0]
//  215        
//  216         wgz = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Z_H_4200);
        MOVS     R2,#+45
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LDR      R1,??DataTable1_5
        STRH     R0,[R1, #+0]
//  217 		gz = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Z_L_4200);
        MOVS     R2,#+44
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+0]
//  218         gyro_z = (wgz<<8) + gz;
        LDR      R0,??DataTable1_5
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable1_6
        LDRB     R1,[R1, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable1_7
        STRH     R0,[R1, #+0]
//  219         gyro_z >>= 3;
        LDR      R0,??DataTable1_7
        MOVS     R1,#+0
        LDRSH    R0,[R0, R1]
        SXTH     R0,R0
        ASRS     R0,R0,#+3
        LDR      R1,??DataTable1_7
        STRH     R0,[R1, #+0]
//  220 
//  221     
//  222 
//  223 //        wgy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_H_4200);
//  224 //		gy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_L_4200);
//  225 //        gyro_y = (wgy<<8) + gy;
//  226 //        gyro_y >>= 3;
//  227         
//  228         
//  229         
//  230     }
//  231 }
??L3G4200_Read_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x61a80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     gyro_ID

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     wgx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     gx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     gyro_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     wgz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     gz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     gyro_z

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  232 
//  233 
// 
//  18 bytes in section .bss
//   8 bytes in section .data
// 506 bytes in section .text
// 
// 506 bytes of CODE memory
//  26 bytes of DATA memory
//
//Errors: none
//Warnings: none
