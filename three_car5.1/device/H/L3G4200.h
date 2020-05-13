/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     L3G4200.h
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��4�� 19:18:29
  ******************************************************************************
  */

#ifndef _L3G4200_H
#define _L3G4200_H
#include "allHead.h"

//L3G4200D�ڲ��Ĵ�����ַ
//#define L3G4200_Addr   0xD2	 //����������IIC�����еĴӵ�ַ,����ALT  ADDRESS��ַ���Ų�ͬ�޸�
#define WHO_AM_I        0x0F    //�豸ʶ��Ĵ���
#define CTRL_REG1       0x20    //����ʹ��
#define CTRL_REG2       0x21    //��ͨ�˲�������
#define CTRL_REG3       0x22    //�жϼĴ���
#define CTRL_REG4       0x23    //����ģʽ
#define CTRL_REG5       0x24    //��ͨ�˲���
#define REFERENCE       0x25
#define OUT_TEMP        0x26
#define STATUS_REG      0x27    //״̬�Ĵ��������ݾ����ɶ�
#define OUT_X_L         0x28
#define OUT_X_H         0x29
#define OUT_Y_L         0x2A
#define OUT_Y_H         0x2B
#define OUT_Z_L         0x2C
#define OUT_Z_H         0x2D
#define FIFO_CTRL_REG   0x2E
#define FIFO_SRC_REG    0x2F
#define INT1_CFG        0x30
#define INT1_SRC        0x31
#define INT1_TSH_XH     0x32
#define INT1_TSH_XL     0x33
#define INT1_TSH_YH     0x34
#define INT1_TSH_YL     0x35
#define INT1_TSH_ZH     0x36
#define INT1_TSH_ZL     0x37
#define INT1_DURATION   0x38


//----------L3G4200D�ڲ��Ĵ�����ַ---------
#define L3G4200D_ID             0x69
#define WHO_AM_I_4200           0x0F
#define CTRL_REG1_4200          0x20
#define CTRL_REG2_4200          0x21
#define CTRL_REG3_4200          0x22
#define CTRL_REG4_4200          0x23
#define CTRL_REG5_4200          0x24
#define REFERENCE_4200          0x25
#define OUT_TEMP_4200           0x26
#define STATUS_REG_4200         0x27
#define OUT_X_L_4200            0x28
#define OUT_X_H_4200            0x29
#define OUT_Y_L_4200            0x2A
#define OUT_Y_H_4200            0x2B
#define OUT_Z_L_4200            0x2C
#define OUT_Z_H_4200            0x2D
#define FIFO_CTRL_REG_4200      0x2E
#define FIFO_SRC_REG_4200       0x2F
#define INT1_CFG_4200           0x30
#define INT1_SRC_4200           0x31
#define INT1_TSH_XH_4200        0x32
#define INT1_TSH_XL_4200        0x33
#define INT1_TSH_YH_4200        0x34
#define INT1_TSH_YL_4200        0x35
#define INT1_TSH_ZH_4200        0x36
#define INT1_TSH_ZL_4200        0x37
#define INT1_DURATION_4200      0x38


#define	L3G4200_DEV_ADD	        0xD2>>1	  //����������IIC�����еĴӵ�ַ,����ALT  ADDRESS��ַ���Ų�ͬ�޸�

/* ���� --------------------------------------------------------------------- */
//��ʼ��
#define L3G4200_CS_I 		    { GpioInit(SPI1_PCS, GPO, 1);}
#define L3G4200_MO_I 		    { GpioInit(IIC_SDA, GPO, 1);}
#define L3G4200_MI_I         { GpioInit(SPI1_MISO, GPI, 1);prot_pull(SPI1_MISO);}
#define L3G4200_CLK_I        { GpioInit(SPI1_SCK, GPO, 1);}

//��ߵ�ƽ
#define L3G4200_CS              { GpioSet(SPI1_PCS, 1);}
#define L3G4200_MO              { GpioSet(IIC_SDA, 1);}
//#define L3G4200_MI            { GpioSet(SPI1_MISO, 1);}
#define L3G4200_CLK           { GpioSet(SPI1_SCK, 1);}

//��͵�ƽ
#define CL_L3G4200_CS           { GpioSet(SPI1_PCS, 0);}
#define CL_L3G4200_MO           { GpioSet(SPI1_MOSI, 0);}
//#define CL_L3G4200_MI         { GpioSet(SPI1_MISO, 0);}
#define CL_L3G4200_CLK        { GpioSet(SPI1_SCK, 0);}
/* ���� -------- END -------------------------------------------------------- */




void L3G4200_Init(void);//�����ǳ�ʼ��
void L3G4200_Read(void);//L3G4200 ��ȡ

#endif
