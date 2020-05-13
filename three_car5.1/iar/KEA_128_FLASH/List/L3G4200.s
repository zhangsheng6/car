///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  16:13:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\������֡���ZS\5.1\device\C\L3G4200.c
//    Command line =  
//        H:\���ܳ�����2018\������֡���ZS\5.1\device\C\L3G4200.c -D IAR -D
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
//        H:\���ܳ�����2018\������֡���ZS\5.1\iar\KEA_128_FLASH\List\L3G4200.s
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

// H:\���ܳ�����2018\������֡���ZS\5.1\device\C\L3G4200.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,�����Ƽ�ѧԺ
//    5   * All rights reserved.
//    6   *
//    7   * �ļ����ƣ�     L3G4200.c
//    8   * �ļ���ʶ��
//    9   * ժ    Ҫ��     �����ǳ�ʼ��
//   10   *               �����ǼĴ�����ȡ���
//   11   *
//   12   * ��ǰ�汾��     1.0
//   13   * ��    ��     ��־ΰ
//   14   * ʱ    �䣺     2018��1��4�� 19:16:43
//   15   ******************************************************************************
//   16   */
//   17 
//   18 #include "L3G4200.h"
//   19 
//   20 
//   21 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 SPI_Type* SPI[2] = SPI_BASES; //��������ָ�����鱣�� SPIx �ĵ�ַ
SPI:
        DATA
        DC32 40076000H, 40077000H
//   23 
//   24 //��ز���
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
//   30 int16 gyro_x = 0, gyro_y = 0, gyro_z = 0;//�洢�����������
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
//   43   * ���
//   44   *     д����
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
//   73   * ���
//   74   *     ������
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
//  103   * ���
//  104   *     ��д
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
//  117 //    while( !( SPI[1]->S & SPI_S_SPTEF_MASK ) );  //�ȴ��������
//  118 //    SPI[1]->D = byte;          //���������ɱ�־λ
//  119 //
//  120 //    while( !( SPI[1]->S & SPI_S_SPRF_MASK ) );   //�ȴ���������
//  121 //    temp = (uint8)(SPI[1]->D);;           //��ȡ���ݣ�ת����ʽ
//  122 //
//  123     return temp;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return
//  124 }
//  125 /**
//  126   * ���
//  127   *     д�����ǼĴ���
//  128   * ����
//  129   *     reg���Ĵ�����ַ
//  130   *     value��д�������
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
//  138 //    SPI_ReadWrite(reg);     //��λ��ǰ�����Զ� -> ���λҪд1
//  139 //    SPI_ReadWrite(value);   //��ʱд���������
//  140 }
        POP      {R0,R4,R5,PC}    ;; return
//  141 
//  142 /**
//  143   * ���
//  144   *     ��ȡ�����ǼĴ���
//  145   * ����
//  146   *     reg���Ĵ�����ַ
//  147   *     value�������ַ
//  148   * ע��
//  149   *     һ����������16������
//  150   *     ǰ��λ״̬�����λ����
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
//  157 //    SPI_ReadWrite(0x80|reg);        //��λ��ǰ�����Զ� -> ���λҪд1
//  158 //    *value = SPI_ReadWrite(0xff);   //��ʱд���������
//  159 }
        POP      {R0,R4,R5,PC}    ;; return
//  160 
//  161 
//  162 /**
//  163   * ���
//  164   *     �����ǳ�ʼ��
//  165   * ע��
//  166   *     ʹ����2����
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
//  172     //�����������800Hz��LPF��ֹƵ��110Hz������������ģʽ��ʹ��X Y ��
//  173 //    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFF);
//  174     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFB);
        MOVS     R3,#+251
        MOVS     R2,#+32
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  175 //    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200);
//  176 
//  177     //��ͨ�˲�������
//  178     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG2_4200, 0x00);
        MOVS     R3,#+0
        MOVS     R2,#+33
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  179 
//  180     //�ر������ж�,����IIC DRDY
//  181     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200, 0x08);
        MOVS     R3,#+8
        MOVS     R2,#+34
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  182 //    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200);
//  183 
//  184     //ʹ��block data updata���ܣ�ȷ����ȷ�������ݡ�ʹ��С��ģʽ��ѡ��������250dps
//  185     i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG4_4200, 0x80);
        MOVS     R3,#+128
        MOVS     R2,#+35
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_write_reg
//  186 
//  187     //ʹ��LPF2���ر�HPF���򿪺�������ʹ�ã�
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
//  194   * ���
//  195   *     L3G4200 ��ȡ
//  196   * ע��
//  197   *     �˴�ֻʹ��XY������
//  198   *     ʹ��Ӳ��iic ��һ������Ҫ470us(����ʹ�õ����ڲ�����)
//  199   *     ʹ��ģ��IIC ��һ������Ҫ4.9ms
//  200   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  201 void L3G4200_Read(void)
//  202 {
L3G4200_Read:
        PUSH     {R7,LR}
//  203     //�洢�������ݣ�ÿһ�������ֽڣ��ȵͺ�ߣ�������ʽ�洢
//  204 //    uint8 gx, gy;//, gz;
//  205 //    uint16 wgx, wgy;//, wgz;
//  206 
//  207     //�����Զ���������Ҫ 3.72 ms ���������������ֻ����Ҫ��
//  208     if ( i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, STATUS_REG_4200)&0x80 )//�鿴�����Ƿ�׼�����ˡ����û��׼���ã���ȡ����ܶ�ȡ���������ݡ���ȡƵ������Ǹ����������Ƶ��
        MOVS     R2,#+39
        MOVS     R1,#+105
        MOVS     R0,#+1
        BL       i2c_read_reg
        LSLS     R0,R0,#+24
        BPL      ??L3G4200_Read_0
//  209     {
//  210         //��һ������Ҫ470us
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
