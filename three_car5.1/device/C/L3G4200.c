/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     L3G4200.c
  * 文件标识：
  * 摘    要：     陀螺仪初始化
  *               陀螺仪寄存器读取相关
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月4日 19:16:43
  ******************************************************************************
  */

#include "L3G4200.h"



SPI_Type* SPI[2] = SPI_BASES; //定义两个指针数组保存 SPIx 的地址

//相关参数

  uint8 gx, gy,gz;//, gz;
    uint16 wgx, wgy,wgz;//, wgz;

uint8 gyro_ID = 0;
int16 gyro_x = 0, gyro_y = 0, gyro_z = 0;//存储最后三轴数据

uint8 a, b;



void SPI_delay(void)
{
	uint16 j=120;
	while(j--);
}

/**
  * 简介
  *     写命令
  */
void L3G4200_WrCmd(unsigned char cmd)
{
  uint8 i=8;
  CL_L3G4200_CS;
  SPI_delay();
//  CL_L3G4200_MI;
  while(i--)
  {
    CL_L3G4200_CLK;
    if(cmd&0x80)
    {
        L3G4200_MO;
    }
    else
    {
      CL_L3G4200_MO;
    }
    cmd<<=1;
  SPI_delay();
    L3G4200_CLK;
  }

//  L3G4200_MI;
  L3G4200_CS;
}

/**
  * 简介
  *     读数据
  */
uint8 L3G4200_ReData()
{
  uint8 i=8;
  uint8 byte = 0;

  CL_L3G4200_CS;
  SPI_delay();
  while(i--)
  {
    L3G4200_CLK;
    SPI_delay();
    CL_L3G4200_CLK;

    if (GpioGet(SPI1_MISO) == 1)
    {
        byte += 1;
    }

    byte<<=1;
  }

  L3G4200_CS;

  return byte;
}

/**
  * 简介
  *     读写
  */
uint8 SPI_ReadWrite(uint8 byte)
{
    uint8 temp = 0;

    L3G4200_WrCmd(byte);
    temp = L3G4200_ReData();



//    uint8 temp = 0;
//
//    while( !( SPI[1]->S & SPI_S_SPTEF_MASK ) );  //等待发送完成
//    SPI[1]->D = byte;          //清除发送完成标志位
//
//    while( !( SPI[1]->S & SPI_S_SPRF_MASK ) );   //等待接收数据
//    temp = (uint8)(SPI[1]->D);;           //读取数据，转换格式
//
    return temp;
}
/**
  * 简介
  *     写陀螺仪寄存器
  * 参数
  *     reg：寄存器地址
  *     value：写入的数据
  */
void L3G4200_Write_Reg(uint8 reg, uint8 value)
{
    SPI_ReadWrite(reg);
    SPI_ReadWrite(value);


//    SPI_ReadWrite(reg);     //高位在前，所以读 -> 最高位要写1
//    SPI_ReadWrite(value);   //此时写入的是数据
}

/**
  * 简介
  *     读取陀螺仪寄存器
  * 参数
  *     reg：寄存器地址
  *     value：保存地址
  * 注意
  *     一个读操作需16个脉冲
  *     前八位状态，后八位数据
  */
void L3G4200_Read_Reg(uint8 reg, uint8 *value)
{
    SPI_ReadWrite(0x80|reg);
    *value = SPI_ReadWrite(0xff);

//    SPI_ReadWrite(0x80|reg);        //高位在前，所以读 -> 最高位要写1
//    *value = SPI_ReadWrite(0xff);   //此时写入的是数据
}


/**
  * 简介
  *     陀螺仪初始化
  * 注意
  *     使能了2个轴
  */
void L3G4200_Init(void)
{
    i2c_init(IIC_PORT, 400*1000);

    //数据输出速率800Hz，LPF截止频率110Hz，工作在正常模式，使能X Y 轴
//    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFF);
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFB);
//    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200);

    //高通滤波器配置
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG2_4200, 0x00);

    //关闭所有中断,配置IIC DRDY
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200, 0x08);
//    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200);

    //使能block data updata功能，确保正确读出数据、使能小端模式、选择满量程250dps
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG4_4200, 0x80);

    //使能LPF2，关闭HPF（打开后不能正常使用）
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG5_4200, 0x02);

    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_TEMP_4200);
}

/**
  * 简介
  *     L3G4200 读取
  * 注意
  *     此处只使用XY轴数据
  *     使用硬件iic 读一根轴需要470us(测试使用的是内部晶振)
  *     使用模拟IIC 读一根轴需要4.9ms
  */
void L3G4200_Read(void)
{
    //存储三轴数据，每一轴两个字节，先低后高，补码形式存储
//    uint8 gx, gy;//, gz;
//    uint16 wgx, wgy;//, wgz;

    //经测试读两根轴需要 3.72 ms 三根轴更长，所以只读需要的
    if ( i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, STATUS_REG_4200)&0x80 )//查看数据是否准备好了。如果没有准备好，读取则可能读取到错误数据。读取频率最好是高于数据输出频率
    {
        //读一根轴需要470us
        wgx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_H_4200);
		gx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_L_4200);
        gyro_x = (wgx<<8) + gx;
        gyro_x >>= 3;
       
        wgz = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Z_H_4200);
		gz = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Z_L_4200);
        gyro_z = (wgz<<8) + gz;
        gyro_z >>= 3;

    

//        wgy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_H_4200);
//		gy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_L_4200);
//        gyro_y = (wgy<<8) + gy;
//        gyro_y >>= 3;
        
        
        
    }
}


