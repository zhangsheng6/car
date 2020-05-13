/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     iicAnalog.c
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月28日 16:33:14
  ******************************************************************************
  */

#include "iicAnalog.h"

#define SDA             GpioGet (IIC_SDA)
#define SDA0()          GpioSet (IIC_SDA, 0)		//IO口输出低电平
#define SDA1()          GpioSet (IIC_SDA, 1)		//IO口输出高电平
#define SCL0()          GpioSet (IIC_SCL, 0)		//IO口输出低电平
#define SCL1()          GpioSet (IIC_SCL, 1)		//IO口输出高电平
#define DIR_OUT()       gpio_ddr (IIC_SDA, GPO)    //输出方向
#define DIR_IN()        gpio_ddr (IIC_SDA, GPI)    //输入方向


//内部数据定义
uint8 IIC_ad_main; //器件从地址
uint8 IIC_ad_sub;  //器件子地址
uint8 *IIC_buf;    //发送|接收数据缓冲区
uint8 IIC_num;     //发送|接收数据个数

#define ack     1      //主应答
#define no_ack  0   //从应答


/**
  * 简介
  *     模拟 IIC 延时
  * 备注
  *     如果IIC通信失败，尝试增加 j
  */
void IIC_delay(void)
{
	//64为100K的速率(bus频率为100M)
	//特别提示OV7725的通信速率不能太高，最好50K左右，j设置为120通信速率为60K，60K的时候可以正常通信
	//其他IIC器件一般可以400K的通信速率
	uint16 j=120;
	while(j--);
}

/**
  * 简介
  *     IIC 开始函数
  * 备注
  *     内部使用，无需调用
  */
void IIC_start(void)
{
	SDA1();
	SCL1();
	IIC_delay();
	SDA0();
	IIC_delay();
	SCL0();
}

/**
  * 简介
  *     IIC 停止函数
  * 备注
  *     内部使用，无需调用
  */
void IIC_stop(void)
{
	SDA0();
	SCL0();
	IIC_delay();
	SCL1();
	IIC_delay();
	SDA1();
	IIC_delay();
}

//主应答(包含ack:SDA=0和no_ack:SDA=0)
//内部使用，用户无需调用
void I2C_SendACK(unsigned char ack_dat)
{
    SCL0();
	IIC_delay();
	if(ack_dat) SDA0();
    else    	SDA1();

    SCL1();
    IIC_delay();
    SCL0();
    IIC_delay();
}


static int SCCB_WaitAck(void)
{
    SCL0();
	DIR_IN();
	IIC_delay();

	SCL1();
    IIC_delay();

    if(SDA)           //应答为高电平，异常，通信失败
    {
        DIR_OUT();
        SCL0();
        return 0;
    }
    DIR_OUT();
    SCL0();
	IIC_delay();
    return 1;
}

/**
  * 简介
  *     IIC 字节发送程序
  * 备注
  *     发送c(可以是数据也可是地址)，送完后接收从应答
  *     不考虑从应答位
  *     内部使用，用户无需调用
  */
void send_ch(uint8 c)
{
	uint8 i = 8;
    while(i--)
    {
        if(c & 0x80)	SDA1();//SDA 输出数据
        else			SDA0();
        c <<= 1;
        IIC_delay();
        SCL1();                //SCL 拉高，采集信号
        IIC_delay();
        SCL0();                //SCL 时钟线拉低
    }
	SCCB_WaitAck();
}

/**
  * 简介
  *     IIC 字节接收程序
  * 备注
  *     接收器件传来的数据，
  *     此程序应配合|主应答函数|IIC_ack_main()使用
  *     内部使用，用户无需调用
  */
uint8 read_ch(void)
{
    uint8 i;
    uint8 c;
    c=0;
    SCL0();
    IIC_delay();
    SDA1();             //置数据线为输入方式
    DIR_IN();
    for(i=0;i<8;i++)
    {
        IIC_delay();
        SCL0();         //置时钟线为低，准备接收数据位
        IIC_delay();
        SCL1();         //置时钟线为高，使数据线上数据有效
        IIC_delay();
        c<<=1;
        if(SDA) c+=1;   //读数据位，将接收的数据存c
    }
    DIR_OUT();
	SCL0();
	IIC_delay();
	I2C_SendACK(no_ack);

    return c;
}

/**
  * 简介
  *     模拟IIC写数据到设备寄存器函数
  * 参数
  *     dev_add			设备地址(低七位地址)
  *     reg				寄存器地址
  *     dat				写入的数据
  */
void IIC_writeReg(uint8 dev_add, uint8 reg, uint8 dat)
{
	IIC_start();
    send_ch( (dev_add<<1) | 0x00);   //发送器件地址加写位
	send_ch( reg );   				 //发送从机寄存器地址
	send_ch( dat );   				 //发送需要写入的数据
	IIC_stop();
}

/**
  * 简介
  *     模拟 IIC 从设备寄存器读取数据
  * 参数
  *     dev_add			设备地址(低七位地址)
  *     reg				寄存器地址
  *     type			选择通信方式是IIC  还是 SCCB
  * 返回值
  *     dat             返回寄存器的数据
  */
uint8 IIC_readReg(uint8 dev_add, uint8 reg, IIC_type type)
{
	uint8 dat;
	IIC_start();
    send_ch( (dev_add<<1) | 0x00);  //发送器件地址加写位
	send_ch( reg );   				//发送从机寄存器地址
	if(type == SCCB)IIC_stop();

	IIC_start();
	send_ch( (dev_add<<1) | 0x01);  //发送器件地址加读位
	dat = read_ch();   				//发送需要写入的数据
	IIC_stop();

	return dat;
}

/**
  * 简介
  *     IIC 端口复用
  * 备注
  *
  */
void IIC_IoMux()
{
    //将 D3 变为引脚功能
    SIM->PINSEL1 |= SIM_PINSEL1_SPI1PS_MASK;

    //将 C7 变为引脚功能
    SIM->PINSEL1 |= SIM_PINSEL1_UART1PS_MASK;;
}

/**
  * 简介
  *     IIC 初始化
  * 备注
  *
  */
void IIC_Init(void)
{
    IIC_IoMux();

	GpioInit (IIC_SCL, GPO, 1);
	GpioInit (IIC_SDA, GPO, 1);
}

