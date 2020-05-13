/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     L3G4200.h
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月4日 19:18:29
  ******************************************************************************
  */

#ifndef _L3G4200_H
#define _L3G4200_H
#include "allHead.h"

//L3G4200D内部寄存器地址
//#define L3G4200_Addr   0xD2	 //定义器件在IIC总线中的从地址,根据ALT  ADDRESS地址引脚不同修改
#define WHO_AM_I        0x0F    //设备识别寄存器
#define CTRL_REG1       0x20    //三轴使能
#define CTRL_REG2       0x21    //高通滤波器配置
#define CTRL_REG3       0x22    //中断寄存器
#define CTRL_REG4       0x23    //三线模式
#define CTRL_REG5       0x24    //高通滤波器
#define REFERENCE       0x25
#define OUT_TEMP        0x26
#define STATUS_REG      0x27    //状态寄存器，数据就绪可读
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


//----------L3G4200D内部寄存器地址---------
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


#define	L3G4200_DEV_ADD	        0xD2>>1	  //定义器件在IIC总线中的从地址,根据ALT  ADDRESS地址引脚不同修改

/* 引脚 --------------------------------------------------------------------- */
//初始化
#define L3G4200_CS_I 		    { GpioInit(SPI1_PCS, GPO, 1);}
#define L3G4200_MO_I 		    { GpioInit(IIC_SDA, GPO, 1);}
#define L3G4200_MI_I         { GpioInit(SPI1_MISO, GPI, 1);prot_pull(SPI1_MISO);}
#define L3G4200_CLK_I        { GpioInit(SPI1_SCK, GPO, 1);}

//变高电平
#define L3G4200_CS              { GpioSet(SPI1_PCS, 1);}
#define L3G4200_MO              { GpioSet(IIC_SDA, 1);}
//#define L3G4200_MI            { GpioSet(SPI1_MISO, 1);}
#define L3G4200_CLK           { GpioSet(SPI1_SCK, 1);}

//变低电平
#define CL_L3G4200_CS           { GpioSet(SPI1_PCS, 0);}
#define CL_L3G4200_MO           { GpioSet(SPI1_MOSI, 0);}
//#define CL_L3G4200_MI         { GpioSet(SPI1_MISO, 0);}
#define CL_L3G4200_CLK        { GpioSet(SPI1_SCK, 0);}
/* 引脚 -------- END -------------------------------------------------------- */




void L3G4200_Init(void);//陀螺仪初始化
void L3G4200_Read(void);//L3G4200 读取

#endif
