///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       28/Sep/2018  18:58:02
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_i2c.c
//    Command line =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_i2c.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -D DA_OLED -lCN
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -lB
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\ -o
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR��װ��\arm\INC\c\DLib_Config_Normal.h -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\device\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\user\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\system\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\lib\H\ -I
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\iar\KEA_128_FLASH\List\KEA128_i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioSet
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_uidiv
        EXTERN abs
        EXTERN bus_clk_khz

        PUBLIC I2CN
        PUBLIC MasterTransmission
        PUBLIC SlaveID
        PUBLIC i2c_Wait
        PUBLIC i2c_delay
        PUBLIC i2c_init
        PUBLIC i2c_read_reg
        PUBLIC i2c_read_reg_bytes
        PUBLIC i2c_write_reg

// I:\��ų���-ZS\���ֱ��-ZS\stand_ZS_9.28\lib\C\KEA128_i2c.c
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
        PUSH     {R4,LR}
        MOVS     R4,R0
//   32     uint16 num;
//   33     uint16 wait_num=500;//�ȴ������������趨�Ĵ������ر�Ӳ��IIC��ʹ��ģ��IIC����stop�źţ�Ȼ��������Ӳ��IIC��
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
//   34                         //�����500��ͨ������Ϊ100K��ʱ���������ʹ�ã����ͨ�����ʽϵͿ����ʵ��������ֵ��
//   35                         //�������Կ�����ͨ�ų����ʱ���Զ��ָ���
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
//   45             LED_3_ON;//�����ˣ�����
??i2c_Wait_3:
        MOVS     R1,#+0
        MOVS     R0,#+51
        BL       GpioSet
//   46 //            carStatus = STOP;
//   47 //            IIC_init();
//   48 //            IIC_stop();
//   49             if(i2cn == i2c0)    SIM->SCGC |= SIM_SCGC_I2C0_MASK;
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
//   50             else                SIM->SCGC |= SIM_SCGC_I2C1_MASK;
??i2c_Wait_4:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//   51             I2CN[i2cn]->C1 = I2C_C1_IICEN_MASK;
??i2c_Wait_5:
        MOVS     R0,#+128
        LDR      R1,??DataTable2
        UXTB     R4,R4
        MOVS     R2,#+4
        MULS     R2,R4,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//   52             break;
//   53         }
//   54     }
//   55     I2CN[i2cn]->S |= I2C_S_IICIF_MASK ;
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
//   56 }
        POP      {R4,PC}          ;; return
//   57 
//   58 //�����ź�
//   59 #define i2c_Start(NUM)             {I2CN[NUM]->C1 |= (I2C_C1_TX_MASK | I2C_C1_MST_MASK);}    //MST ��0��1��������ʼ�źţ�TX = 1 ���뷢��ģʽ
//   60 
//   61 //ֹͣ�ź�
//   62 #define i2c_Stop(NUM)              {I2CN[NUM]->C1 &= ~(I2C_C1_MST_MASK | I2C_C1_TX_MASK);}   //MST ��1��0������ֹͣ�źţ�TX = 0 �������ģʽ
//   63 
//   64 //�ظ�����
//   65 #define i2c_RepeatedStart(NUM)     {I2CN[NUM]->C1 |= I2C_C1_RSTA_MASK;}
//   66 
//   67 //�������ģʽ(Ӧ��,��Ҫ���ն�����ݣ��������һ���ֽ�ǰ��Ҫ����Ӧ��i2c_DisableAck)
//   68 #define i2c_EnterRxMode(NUM)       {I2CN[NUM]->C1 &= ~(I2C_C1_TX_MASK | I2C_C1_TXAK_MASK);}  //
//   69 
//   70 //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
//   71 #define i2c_PutinRxMode(NUM)       {I2CN[NUM]->C1 &= ~I2C_C1_TX_MASK; I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   72 
//   73 //����Ӧ��(�������һ���ֽ�)
//   74 #define i2c_DisableAck(NUM)        {I2CN[NUM]->C1 |= I2C_C1_TXAK_MASK;}
//   75 
//   76 //дһ���ֽ�
//   77 #define i2c_write_byte(NUM,data)   {I2CN[NUM]->D = data; i2c_Wait(NUM);}
//   78 
//   79 
//   80 
//   81 
//   82 //-------------------------------------------------------------------------------------------------------------------
//   83 //  @brief      I2C��ʼ��
//   84 //  @param      i2cn        I2Cģ��(i2c0,i2c1)
//   85 //  @param      baud        �����Ĳ�����
//   86 //  @return                 ʵ�ʵĲ�����
//   87 //  @return     void
//   88 //  @since      v2.0
//   89 //  Sample usage:           i2c_init(i2c0,400*1000);     // ��ʼ��i2c0�������Ĳ�����Ϊ400k
//   90 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   91 uint32 i2c_init(I2Cn_e i2cn, uint32 baud)
//   92 {
i2c_init:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+136
        MOVS     R6,R1
//   93     //��� ICR ��Ӧ��  SCL_divider ���� ��KEA128RM.pdf����537ҳ��I2C ��Ƶ���ͱ���ֵ
//   94     uint16 ICR_2_SCL_divider[0x40]  =
//   95     {
//   96         20, 22, 24, 26, 28, 30, 34, 40, 28, 32, 36, 40, 44, 48, 56, 68,
//   97         48, 56, 64, 72, 80, 88, 104, 128, 80, 96, 112, 128, 144, 160, 192, 240,
//   98         160, 192, 224, 256, 288, 320, 384, 480, 320, 384, 448, 512, 576, 640, 768, 960,
//   99         640, 768, 896, 1024, 1152, 1280, 1536, 1920, 1280, 1536, 1792, 2048, 2304, 2560, 3072, 3840
//  100     };
        ADD      R0,SP,#+4
        LDR      R1,??DataTable2_4
        MOVS     R2,#+128
        BL       __aeabi_memcpy4
//  101 
//  102     uint8 mult;
//  103 
//  104     uint16 scldiv =  0;  //��ѵķ�Ƶϵ��
        MOVS     R5,#+0
//  105 
//  106     //��Ҫ�� ICR_2_SCL_divider ���ҵ� ����ѷ�Ƶϵ��scldiv������� ��Ƶϵ��
//  107     uint8 icr, n;
//  108     uint16 min_Dvalue = ~0, Dvalue;
        LDR      R4,??DataTable2_5  ;; 0xffff
//  109 
//  110     if(i2cn == i2c0)
        ADD      R0,SP,#+136
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??i2c_init_0
//  111     {
//  112         // ����ʱ��
//  113         SIM->SCGC |= SIM_SCGC_I2C0_MASK;           //���� I2C0ʱ��
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  114         //��������
//  115         if(A3 == I2C0_SCL_PIN)
//  116         {
//  117             SIM->PINSEL &= ~(uint32)SIM_PINSEL_I2C0PS_MASK;
        LDR      R0,??DataTable3  ;; 0x4004800c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        BICS     R0,R0,R1
        LDR      R1,??DataTable3  ;; 0x4004800c
        STR      R0,[R1, #+0]
        B        ??i2c_init_1
//  118         }
//  119         else
//  120         {
//  121             SIM->PINSEL |= SIM_PINSEL_I2C0PS_MASK;
//  122         }
//  123 
//  124     }
//  125     else
//  126     {
//  127         // ����ʱ��
//  128         SIM->SCGC |= SIM_SCGC_I2C1_MASK;           //���� I2C1ʱ��
??i2c_init_0:
        LDR      R0,??DataTable2_1  ;; 0x40048014
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40048014
        STR      R1,[R0, #+0]
//  129         //��������
//  130         if(E1 == I2C1_SCL_PIN)
//  131         {
//  132             SIM->PINSEL1 &= ~(uint32)SIM_PINSEL1_I2C1PS_MASK;
//  133         }
//  134         else
//  135         {
//  136             SIM->PINSEL1 |= SIM_PINSEL1_I2C1PS_MASK;
        LDR      R0,??DataTable3_1  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        ORRS     R1,R1,R0
        LDR      R0,??DataTable3_1  ;; 0x40048010
        STR      R1,[R0, #+0]
//  137         }
//  138     }
//  139 
//  140     // ����Ƶ��
//  141 
//  142     // I2C baud rate = bus speed (Hz)/(mul �� SCL divider)
//  143     // SDA hold time = bus period (s) �� mul �� SDA hold value
//  144     // SCL start hold time = bus period (s) �� mul �� SCL start hold value
//  145     // SCL stop hold time = bus period (s) �� mul �� SCL stop hold value
//  146 
//  147 
//  148     mult = bus_clk_khz*1000/baud/3840;
??i2c_init_1:
        LDR      R0,??DataTable3_2
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
//  149 
//  150     scldiv =  bus_clk_khz * 1000 / ( (1<<mult) * baud );    //��ѵķ�Ƶϵ��
        LDR      R0,??DataTable3_2
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
//  151 
//  152     n = 0x40;
        MOVS     R6,#+64
        B        ??i2c_init_2
//  153     while(n)                                                //ѭ�������ɨ�裬�ҳ���ӽ��� ��Ƶϵ��
//  154     {
//  155         n--;
//  156         Dvalue = abs(scldiv - ICR_2_SCL_divider[n]);
//  157         if(Dvalue == 0)
//  158         {
//  159             icr = n;
//  160             break;                                          //�˳�whileѭ��
//  161         }
//  162 
//  163         if(Dvalue < min_Dvalue)
??i2c_init_3:
        UXTH     R0,R0
        UXTH     R4,R4
        CMP      R0,R4
        BCS      ??i2c_init_2
//  164         {
//  165             icr = n;
        MOVS     R7,R6
//  166             min_Dvalue = Dvalue;
        MOVS     R4,R0
//  167         }
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
//  168     }
//  169 
//  170     I2CN[i2cn]->F  = I2C_F_MULT(mult) | I2C_F_ICR(icr);     // I2C��Ƶ�Ĵ���
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
//  171 
//  172     // ʹ�� I2C
//  173     I2CN[i2cn]->C1 = ( 0
//  174                        | I2C_C1_IICEN_MASK       //ʹ��I2C
//  175                        //| I2C_C1_IICIE_MASK       //ʹ���ж�
//  176                      );
        MOVS     R0,#+128
        LDR      R1,??DataTable2
        ADD      R2,SP,#+136
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R1,[R1, R2]
        STRB     R0,[R1, #+2]
//  177 
//  178     return (  bus_clk_khz * 1000 / ( (1<<mult) * ICR_2_SCL_divider[icr])  );
        LDR      R0,??DataTable3_2
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
//  179 }
//  180 
//  181 //-------------------------------------------------------------------------------------------------------------------
//  182 //  @brief      I2Cͨ�Ž�������Ҫ���õĺ�������
//  183 //  @return     void
//  184 //  @since      v2.0
//  185 //  @note		���ͨ��ʧ�ܣ��ɳ����������ʱֵ��ȷ���Ƿ���ʱ���µ�
//  186 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  187 void i2c_delay(void)
//  188 {
i2c_delay:
        PUSH     {R7,LR}
//  189     volatile uint16 n = 150;     //ע�⣬�������̫С���ᵼ�¶�ȡ����
        MOVS     R0,#+150
        MOV      R1,SP
        STRH     R0,[R1, #+0]
//  190 
//  191     while(n--);
??i2c_delay_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        SUBS     R1,R0,#+1
        MOV      R2,SP
        STRH     R1,[R2, #+0]
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??i2c_delay_0
//  192 }
        POP      {R0,PC}          ;; return
//  193 
//  194 //-------------------------------------------------------------------------------------------------------------------
//  195 //  @brief      ��ȡI2C�豸ָ����ַ�Ĵ���������
//  196 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  197 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  198 //  @param      reg         �ӻ��Ĵ�����ַ
//  199 //  @return                 ��ȡ�ļĴ���ֵ
//  200 //  @since      v2.0
//  201 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50);//��ȡ0x50��ַ�����ݣ��ӻ���ַΪ0x2D
//  202 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  203 uint8 i2c_read_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg)
//  204 {
i2c_read_reg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  205 
//  206     //��д��Ĵ�����ַ,�ٶ�ȡ����,��˴˹����� I2C �ĸ��ϸ�ʽ,�ı����ݷ���ʱ��Ҫ��������
//  207     //��ַ�ǵ���λ
//  208     uint8 result;
//  209 
//  210     i2c_Start(i2cn);                                    //���������ź�
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
//  211 
//  212     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //���ʹӻ���ַ��дλ
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
//  213 
//  214     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R6,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  215 
//  216     i2c_RepeatedStart(i2cn);                            //���ϸ�ʽ���������������ź�
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
//  217 
//  218     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //���ʹӻ���ַ�Ͷ�λ
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
//  219 
//  220     i2c_PutinRxMode(i2cn);                              //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
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
//  221     result = I2CN[i2cn]->D;                             //��ٶ�ȡһ�Σ�������������
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R5,[R0, #+4]
//  222     i2c_Wait(i2cn);                                     //�ȴ��������
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  223 
//  224     i2c_Stop(i2cn);                                     //����ֹͣ�ź�
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
//  225 
//  226     result = I2CN[i2cn]->D;                             //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R4,R1,R4
        LDR      R0,[R0, R4]
        LDRB     R5,[R0, #+4]
//  227 
//  228     i2c_delay();                                        //������ʱһ�£��������
        BL       i2c_delay
//  229 
//  230     return result;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return
//  231 }

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
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0xffff
//  232 
//  233 //-------------------------------------------------------------------------------------------------------------------
//  234 //  @brief      ��ȡI2C�豸ָ����ַ�Ĵ���������
//  235 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  236 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  237 //  @param      reg         �ӻ��Ĵ�����ַ
//  238 //  @param      num         ��ȡ�ֽ���
//  239 //  @param      addr        ��ȡ�����ݴ洢�ĵ�ַ
//  240 //  @return     void
//  241 //  @since      v2.0
//  242 //  Sample usage:       	uint8 value = i2c_read_reg(i2c0, 0x2D, 0x50, 10, buf);//��ȡ0x50��ַ�����ݣ��ӻ���ַΪ0x2D��ʼ��10���ֽ�
//  243 //-------------------------------------------------------------------------------------------------------------------
//  244 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 uint8 i2c_read_reg_bytes(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 num, uint8 * addr)
//  246 {
i2c_read_reg_bytes:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
//  247     //��д��Ĵ�����ַ,�ٶ�ȡ����,��˴˹����� I2C �ĸ��ϸ�ʽ,�ı����ݷ���ʱ��Ҫ��������
//  248     //��ַ�ǵ���λ
//  249     uint8 result;
//  250 
//  251     i2c_Start(i2cn);                                    //���������ź�
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
//  252 
//  253     i2c_write_byte(i2cn, (SlaveID << 1) | MWSR);        //���ʹӻ���ַ��дλ
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
//  254 
//  255     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R5,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  256 
//  257     i2c_RepeatedStart(i2cn);                            //���ϸ�ʽ���������������ź�
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
//  258 
//  259     i2c_write_byte(i2cn, ( SlaveID << 1) | MRSW );      //���ʹӻ���ַ�Ͷ�λ
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
//  260 
//  261     i2c_EnterRxMode(i2cn);                              //�������ģʽ(��Ӧ��,ֻ����һ���ֽ�)
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
//  262 
//  263     while(num--)
//  264     {
//  265         result = I2CN[i2cn]->D;                         //��ٶ�ȡһ�Σ�������������
??i2c_read_reg_bytes_1:
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R7,[R0, #+4]
//  266         i2c_Wait(i2cn);                                 //�ȴ��������
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  267         *addr = I2CN[i2cn]->D;                         //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R5, #+0]
//  268         i2c_delay();                                    //������ʱһ�£��������
        BL       i2c_delay
//  269         addr++;
        ADDS     R5,R5,#+1
//  270     }
??i2c_read_reg_bytes_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??i2c_read_reg_bytes_1
//  271     i2c_DisableAck(i2cn);
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
//  272     i2c_PutinRxMode(i2cn);
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
//  273     result = I2CN[i2cn]->D;                             //��ٶ�ȡһ�Σ�������������
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        LDRB     R7,[R0, #+4]
//  274     i2c_Wait(i2cn);                                     //�ȴ��������
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  275     i2c_Stop(i2cn);                                     //����ֹͣ�ź�
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
//  276     *addr = I2CN[i2cn]->D;                              //��ȡ����
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R4,R1,R4
        LDR      R0,[R0, R4]
        LDRB     R0,[R0, #+4]
        STRB     R0,[R5, #+0]
//  277 
//  278     i2c_delay();                                        //������ʱһ�£��������
        BL       i2c_delay
//  279 
//  280     return result;
        MOVS     R0,R7
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return
//  281 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40048010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     bus_clk_khz
//  282 
//  283 //-------------------------------------------------------------------------------------------------------------------
//  284 //  @brief      д��һ���ֽ����ݵ�I2C�豸ָ���Ĵ�����ַ
//  285 //  @param      i2cn        I2Cģ��(i2c0��i2c1)
//  286 //  @param      SlaveID     �ӻ���ַ(7λ��ַ)
//  287 //  @param      reg         �ӻ��Ĵ�����ַ
//  288 //  @param      Data        ����
//  289 //  @return     void
//  290 //  @since      v2.0
//  291 //  Sample usage:       	i2c_write_reg(i2c0, 0x2D, 0x50,2);     //д������2��0x50��ַ���ӻ���ַΪ0x2D
//  292 //-------------------------------------------------------------------------------------------------------------------

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  293 void i2c_write_reg(I2Cn_e i2cn, uint8 SlaveID, uint8 reg, uint8 Data)
//  294 {
i2c_write_reg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
//  295 
//  296     i2c_Start(i2cn);                                    //���������ź�
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
//  297 
//  298     i2c_write_byte(i2cn, ( SlaveID << 1 ) | MWSR);      //���ʹӻ���ַ��дλ
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
//  299 
//  300     i2c_write_byte(i2cn, reg);                          //���ʹӻ���ļĴ�����ַ
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R5,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  301 
//  302     i2c_write_byte(i2cn, Data);                         //������Ҫд�������
        LDR      R0,??DataTable4
        UXTB     R4,R4
        MOVS     R1,#+4
        MULS     R1,R4,R1
        LDR      R0,[R0, R1]
        STRB     R6,[R0, #+4]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       i2c_Wait
//  303 
//  304     i2c_Stop(i2cn);
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
//  305 
//  306     i2c_delay();                                        //��ʱ̫�̵Ļ�������д����
        BL       i2c_delay
//  307 }
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
// 1 264 bytes in section .text
// 
// 1 264 bytes of CODE  memory
//   128 bytes of CONST memory
//    10 bytes of DATA  memory
//
//Errors: none
//Warnings: none
