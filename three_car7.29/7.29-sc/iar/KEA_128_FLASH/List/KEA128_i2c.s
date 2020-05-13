///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Jul/2018  00:37:59
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_i2c.c
//    Command line =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_i2c.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h
//        -I H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\device\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\user\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\lib\H\ -I
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\���ܳ�����2018\���ֱ���\7.29-sc\iar\KEA_128_FLASH\List\KEA128_i2c.s
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

// H:\���ܳ�����2018\���ֱ���\7.29-sc\lib\C\KEA128_i2c.c
//    1 /*********************************************************************************************************************
//    2  * COPYRIGHT NOTICE
//    3  * Copyright (c) 2017,��ɿƼ�
//    4  * All rights reserved.
//    5  * ��������QQȺ��179029047
//    6  *
//    7  * �����������ݰ�Ȩ������ɿƼ����У�δ��������������ҵ��;��
//    8  * ��ӭ��λʹ�ò������������޸�����ʱ���뱣����ɿƼ��İ�Ȩ������
//    9  *
//   10  * @file       		KEA128_i2c
//   11  * @company	   		�ɶ���ɿƼ����޹�˾
//   12  * @author     		��ɿƼ�(QQ3184284598)
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
//   26 I2C_Type * I2CN[2] = I2C_BASES; //��������ָ�����鱣�� I2CN �ĵ�ַ
I2CN:
        DATA
        DC32 40066000H, 40067000H
//   27 
//   28 
//   29 //�ȴ� I2C_S  ������ֿ��������

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void i2c_Wait(I2Cn_e i2cn)
//   31 {
i2c_Wait:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   32     uint16 num;
//   33     uint16 wait_num=500;//�ȴ������������趨�Ĵ������ر�Ӳ��IIC��ʹ��ģ��IIC����stop�źţ�Ȼ��������Ӳ��IIC��
        MOVS     R6,#+250
        LSLS     R6,R6,#+1        ;; #+500
//   34                         //�����500��ͨ������Ϊ100K��ʱ���������ʹ�ã����ͨ�����ʽϵͿ����ʵ��������ֵ��
//   35                         //�������Կ�����ͨ�ų����ʱ���Զ��ָ���
//   36     while(( I2CN[i2cn]->S & I2C_S_IICIF_MASK)==0)
??i2c_Wait_0:
        LDR      R0,??DataTable2
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+30
        BMI      ??i2c_Wait_1
//   37     {
//   38         num++;
        ADDS     R5,R5,#+1
//   39         if(num>wait_num)
        UXTH     R6,R6
        UXTH     R5,R5
        CMP      R6,R5
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
//   45             LED_3_ON;//�����ˣ�����
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
        MULS     R2,R4,R2
        LDR      R0,[R0, R2]
        STRB     R1,[R0, #+3]
//   59 }
        POP      {R4-R6,PC}       ;; return
//   60 
//   61 //�����ź�
//   62 #define i2c_Start(NUM)             {I2CN[NUM]->C1 |= (I2C_C1_TX_MASK | I2C_C1_MST_MASK);}    //MST ��0��1��������ʼ�źţ�TX = 1 ���뷢��ģʽ
//   63 
//   64 //ֹͣ�ź�
//   65 #define i2c_Stop(NUM)              {I2CN[NUM]->C1 &= ~(I2C_C1_MST_MASK | I2C_C1_TX_MASK);}   //MST ��1��0������ֹͣ�źţ�TX = 0 �������ģʽ
//   66 
//   67 //�ظ�����
//   68 #define i2c_RepeatedStart(NUM)     {I2CN[NUM]->C1 |= I2C_C1_RSTA_MASK;}
//   69 
//   70 //�������ģʽ(Ӧ��,��Ҫ���ն�����ݣ��������һ���ֽ�ǰ��Ҫ����Ӧ��i2c_DisableAck)
//   71 #define i2c_EnterRxMode(NUM)       {I2CN[NUM]->C1 &= ~(I2C_C1_TX_MASK | I2C_C1_TXAK_MASK);}  //
//   72 
//   73 //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
//   74 #define i2c_PutinRxMode(NUM)       {I2CN[NUM]->C1 &= ~I2C_C1_TX_MASK; I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   75 
//   76 //����Ӧ��(�������һ���ֽ�)
//   77 #define i2c_DisableAck(NUM)        {I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   78 
//   79 //дһ���ֽ�
//   80 #define i2c_write_byte(NUM,data)   {I2CN[NUM]->D = data; i2c_Wait(NUM);}
//   81 
//   82 
//   83 
//   84 
//   85 //-------------------------------------------------------------------------------------------------------------------
//   86 //  @brief      I2C��ʼ��
//   87 //  @param      i2cn        I2Cģ��(i2c0,i2c1)
//   88 //  @param      baud        �����Ĳ�����
//   89 //  @return                 ʵ�ʵĲ�����
//   90 //  @return     void
//   91 //  @since      v2.0
//   92 //  Sample usage:           i2c_init(i2c0,400*1000);     // ��ʼ��i2c0�������Ĳ�����Ϊ400k
//   93 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 uint32 i2c_init(I2Cn_e i2cn, uint32 baud)
//   95 {
i2c_init:
        PUSH     {R1,R4-R7,LR}
        SUB      SP,SP,#+136
        MOVS     R7,R0
//   96     //��� ICR ��Ӧ��  SCL_divider ���� ��KEA128RM.pdf����537ҳ��I2C ��Ƶ���ͱ���ֵ
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
//  107     uint16 scldiv =  0;  //��ѵķ�Ƶϵ��
        MOVS     R6,#+0
//  108 
//  109     //��Ҫ�� ICR_2_SCL_divider ���ҵ� ����ѷ�Ƶϵ��scldiv������� ��Ƶϵ��
//  110     uint8 icr, n;
//  111     uint16 min_Dvalue = ~0, Dvalue;
        LDR      R5,??DataTable2_8  ;; 0xffff
//  112 
//  113     if(i2cn == i2c0)
        UXTB     R7,R7
        CMP      R7,#+0
        BNE      ??i2c_init_0
//  114     {
//  115         // ����ʱ��
//  116         SIM->SCGC |= SIM_SCGC_I2C0_MASK;           //���� I2C0ʱ��
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  117         //��������
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
//  130         // ����ʱ��
//  131         SIM->SCGC |= SIM_SCGC_I2C1_MASK;           //���� I2C1ʱ��
??i2c_init_0:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  132         //��������
//  133         if(E1 == I2C1_SCL_PIN)
//  134         {
//  135             SIM->PINSEL1 &= ~(uint32)SIM_PINSEL1_I2C1PS_MASK;
//  136         }
//  137         else
//  138         {
//  139             SIM->PINSEL1 |= SIM_PINSEL1_I2C1PS_MASK;
        LDR      R0,??DataTable2_10  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_10  ;; 0x40048010
        STR      R1,[R0, #+0]
//  140         }
//  141     }
//  142 
//  143     // ����Ƶ��
//  144 
//  145     // I2C baud rate = bus speed (Hz)/(mul �� SCL divider)
//  146     // SDA hold time = bus period (s) �� mul �� SDA hold value
//  147     // SCL start hold time = bus period (s) �� mul �� SCL start hold value
//  148     // SCL stop hold time = bus period (s) �� mul �� SCL stop hold value
//  149 
//  150 
//  151     mult = bus_clk_khz*1000/baud/3840;
??i2c_init_1:
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        LDR      R1,[SP, #+136]
        BL       __aeabi_uidiv
        MOVS     R1,#+240
        LSLS     R1,R1,#+4        ;; #+3840
        BL       __aeabi_uidiv
        MOV      R1,SP
        STRB     R0,[R1, #+1]
//  152 
//  153     scldiv =  bus_clk_khz * 1000 / ( (1<<mult) * baud );    //��ѵķ�Ƶϵ��
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        LDR      R2,[SP, #+136]
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        MOVS     R6,R0
//  154 
//  155     n = 0x40;
        MOVS     R0,#+64
        MOVS     R4,R0
//  156     while(n)                                                //ѭ�������ɨ�裬�ҳ���ӽ��� ��Ƶϵ��
??i2c_init_2:
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??i2c_init_3
//  157     {
//  158         n--;
        SUBS     R4,R4,#+1
//  159         Dvalue = abs(scldiv - ICR_2_SCL_divider[n]);
        UXTH     R6,R6
        ADD      R0,SP,#+4
        UXTB     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDRH     R0,[R0, R1]
        SUBS     R0,R6,R0
        BL       abs
        MOV      R1,SP
        STRH     R0,[R1, #+2]
//  160         if(Dvalue == 0)
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        CMP      R0,#+0
        BNE      ??i2c_init_4
//  161         {
//  162             icr = n;
        MOV      R0,SP
        STRB     R4,[R0, #+0]
//  163             break;                                          //�˳�whileѭ��
        B        ??i2c_init_3
//  164         }
//  165 
//  166         if(Dvalue < min_Dvalue)
??i2c_init_4:
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        UXTH     R5,R5
        CMP      R0,R5
        BCS      ??i2c_init_2
//  167         {
//  168             icr = n;
        MOV      R0,SP
        STRB     R4,[R0, #+0]
//  169             min_Dvalue = Dvalue;
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        MOVS     R5,R0
        B        ??i2c_init_2
//  170         }
//  171     }
//  172 
//  173     I2CN[i2cn]->F  = I2C_F_MULT(mult) | I2C_F_ICR(icr);     // I2C��Ƶ�Ĵ���
??i2c_init_3:
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R1,R0,#+6
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        ORRS     R0,R0,R1
        LDR      R1,??DataTable2
        UXTB     R7,R7
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+1]
//  174 
//  175     // ʹ�� I2C
//  176     I2CN[i2cn]->C1 = ( 0
//  177                        | I2C_C1_IICEN_MASK       //ʹ��I2C
//  178                        //| I2C_C1_IICIE_MASK       //ʹ���ж�
//  179                      );
        MOVS     R0,#+128
        LDR      R1,??DataTable2
        UXTB     R7,R7
        MOVS     R2,#+4
        MULS     R2,R7,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  180 
//  181     return (  bus_clk_khz * 1000 / ( (1<<mult) * ICR_2_SCL_divider[icr])  );
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,#+1
        MOV      R2,SP
        LDRB     R2,[R2, #+1]
        LSLS     R1,R1,R2
        ADD      R2,SP,#+4
        MOV      R12,R2
        MOV      R2,SP
        LDRB     R3,[R2, #+0]
        MOVS     R2,#+2
        MULS     R3,R2,R3
        MOV      R2,R12
        LDRH     R2,[R2, R3]
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        ADD      SP,SP,#+140
        POP      {R4-R7,PC}       ;; return
//  182 }
//  183 
//  184 //-------------------------------------------------------------------------------------------------------------------
//  185 //  @brief      I2Cͨ�Ž�������Ҫ���õĺ�������
//  186 //  @return     void
//  187 //  @since      v2.0
//  188 //  @note		���ͨ��ʧ�ܣ��ɳ����������ʱֵ��ȷ���Ƿ���ʱ���µ�
//  189 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void i2c_delay(void)
//  191 {
i2c_delay:
        PUSH     {R7,LR}
//  192     volatile uint16 n = 150;     //ע�⣬�������̫С���ᵼ�¶�ȡ����
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
//  198 //  @brief      ��ȡI2C�豸ָ����ַ�Ĵ���������
//  199 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  200 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  201 //  @param      reg         �ӻ��Ĵ�����ַ
//  202 //  @return                 ��ȡ�ļĴ���ֵ
//  203 //  @since      v2.0
//  204 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50);//��ȡ0x50��ַ�����ݣ��ӻ���ַΪ0x2D
//  205 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 uint8 i2c_read_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg)
//  207 {
i2c_read_reg:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
//  208 
//  209     //��д��Ĵ�����ַ,�ٶ�ȡ����,��˴˹����� I2C �ĸ��ϸ�ʽ,�ı����ݷ���ʱ��Ҫ��������
//  210     //��ַ�ǵ���λ
//  211     uint8 result;
//  212 
//  213     i2c_Start(i2cn);                                    //���������ź�
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
//  214 
//  215     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //���ʹӻ���ַ��дλ
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
//  217     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R7,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  218 
//  219     i2c_RepeatedStart(i2cn);                            //���ϸ�ʽ���������������ź�
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+4
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  220 
//  221     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //���ʹӻ���ַ�Ͷ�λ
        LSLS     R1,R5,#+1
        MOVS     R0,#+1
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  222 
//  223     i2c_PutinRxMode(i2cn);                              //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+239
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+8
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  224     result = I2CN[i2cn]->D;                             //��ٶ�ȡһ�Σ�������������
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        MOVS     R6,R0
//  225     i2c_Wait(i2cn);                                     //�ȴ��������
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  226 
//  227     i2c_Stop(i2cn);                                     //����ֹͣ�ź�
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+207
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  228 
//  229     result = I2CN[i2cn]->D;                             //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        MOVS     R6,R0
//  230 
//  231     i2c_delay();                                        //������ʱһ�£��������
        BL       i2c_delay
//  232 
//  233     return result;
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40048010
//  235 
//  236 //-------------------------------------------------------------------------------------------------------------------
//  237 //  @brief      ��ȡI2C�豸ָ����ַ�Ĵ���������
//  238 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  239 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  240 //  @param      reg         �ӻ��Ĵ�����ַ
//  241 //  @param      num         ��ȡ�ֽ���
//  242 //  @param      addr        ��ȡ�����ݴ洢�ĵ�ַ
//  243 //  @return     void
//  244 //  @since      v2.0
//  245 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50, 10, buf);//��ȡ0x50��ַ�����ݣ��ӻ���ַΪ0x2D��ʼ��10���ֽ�
//  246 //-------------------------------------------------------------------------------------------------------------------
//  247 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  248 uint8 i2c_read_reg_bytes(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 num, uint8 * addr)
//  249 {
i2c_read_reg_bytes:
        PUSH     {R0-R2,R4-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R3
        LDR      R6,[SP, #+32]
//  250     //��д��Ĵ�����ַ,�ٶ�ȡ����,��˴˹����� I2C �ĸ��ϸ�ʽ,�ı����ݷ���ʱ��Ҫ��������
//  251     //��ַ�ǵ���λ
//  252     uint8 result;
//  253 
//  254     i2c_Start(i2cn);                                    //���������ź�
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+48
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  255 
//  256     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //���ʹӻ���ַ��дλ
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R5
        UXTB     R0,R0
        BL       i2c_Wait
//  257 
//  258     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R5
        UXTB     R0,R0
        BL       i2c_Wait
//  259 
//  260     i2c_RepeatedStart(i2cn);                            //���ϸ�ʽ���������������ź�
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+4
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  261 
//  262     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //���ʹӻ���ַ�Ͷ�λ
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LSLS     R1,R0,#+1
        MOVS     R0,#+1
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+4]
        MOVS     R0,R5
        UXTB     R0,R0
        BL       i2c_Wait
//  263 
//  264     i2c_EnterRxMode(i2cn);                              //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+231
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  265 
//  266     while(num--)
??i2c_read_reg_bytes_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??i2c_read_reg_bytes_1
//  267     {
//  268         result = I2CN[i2cn]->D;                         //��ٶ�ȡһ�Σ�������������
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        MOVS     R7,R0
//  269         i2c_Wait(i2cn);                                 //�ȴ��������
        MOVS     R0,R5
        UXTB     R0,R0
        BL       i2c_Wait
//  270         *addr = I2CN[i2cn]->D;                         //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R6, #+0]
//  271         i2c_delay();                                    //������ʱһ�£��������
        BL       i2c_delay
//  272         addr++;
        ADDS     R6,R6,#+1
        B        ??i2c_read_reg_bytes_0
//  273     }
//  274     i2c_DisableAck(i2cn);
??i2c_read_reg_bytes_1:
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+8
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  275     i2c_PutinRxMode(i2cn);
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+239
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+8
        ORRS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  276     result = I2CN[i2cn]->D;                             //��ٶ�ȡһ�Σ�������������
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        MOVS     R7,R0
//  277     i2c_Wait(i2cn);                                     //�ȴ��������
        MOVS     R0,R5
        UXTB     R0,R0
        BL       i2c_Wait
//  278     i2c_Stop(i2cn);                                     //����ֹͣ�ź�
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+207
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R5,R5
        MOVS     R2,#+4
        MULS     R2,R5,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  279     *addr = I2CN[i2cn]->D;                              //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R5,R5
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R6, #+0]
//  280 
//  281     i2c_delay();                                        //������ʱһ�£��������
        BL       i2c_delay
//  282 
//  283     return result;
        MOVS     R0,R7
        UXTB     R0,R0
        POP      {R1-R7,PC}       ;; return
//  284 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     bus_clk_khz
//  285 
//  286 //-------------------------------------------------------------------------------------------------------------------
//  287 //  @brief      д��һ���ֽ����ݵ�I2C�豸ָ���Ĵ�����ַ
//  288 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  289 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  290 //  @param      reg         �ӻ��Ĵ�����ַ
//  291 //  @param      Data        ����
//  292 //  @return     void
//  293 //  @since      v2.0
//  294 //  Sample usage:       	i2c_write_reg(i2c0, 0x2D, 0x50,2);     //д������2��0x50��ַ���ӻ���ַΪ0x2D
//  295 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  296 void i2c_write_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 Data)
//  297 {
i2c_write_reg:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  298 
//  299     i2c_Start(i2cn);                                    //���������ź�
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
//  300 
//  301     i2c_write_byte(i2cn, ( SlaveID << 1 ) | MWSR);      //���ʹӻ���ַ��дλ
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
//  302 
//  303     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
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
//  305     i2c_write_byte(i2cn, Data);                         //������Ҫд�������
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
        LDRB     R1,[R0, #+2]
        MOVS     R0,#+207
        ANDS     R0,R0,R1
        LDR      R1,??DataTable4
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  308 
//  309     i2c_delay();                                        //��ʱ̫�̵Ļ�������д����
        BL       i2c_delay
//  310 }
        POP      {R0,R4-R7,PC}    ;; return

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
// 1 346 bytes in section .text
// 
// 1 346 bytes of CODE  memory
//   128 bytes of CONST memory
//    10 bytes of DATA  memory
//
//Errors: none
//Warnings: none
