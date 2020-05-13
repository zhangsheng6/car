/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    uart.c
  * 文件标识：
  * 摘    要：
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月7日 20:47:48
  ******************************************************************************
  */

#include "uart.h"
#include "stdio.h"
#include "stdarg.h"

//char UART_SendFloatArray[FLOAT_ARRAY_NUM];//使用UART_SendFloat()函数时候用


/**
  * 简介
  *     发送一个 字节
  */
void UART_Send_Byte(char ch)
{
    //等待发送缓冲区空
    while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
    //发送数据
    uart[UART_PART]->D = (uint8)ch;
}

/**
  * 简介
  *     发送一个 回车
  * 注意
  *         代码 - ASCII - 十六进制 - 作用
  *     回车 CR  -   \r  -  0x0d   - 移动光标至该行的起始位置
  *     换行 LF  -   \n  -  0x0a   - 换行至下一行行首起始位置
  */
void UART_Send_Enter(void)
{
    UART_Send_Byte(0x0d);//返回行首
    UART_Send_Byte(0x0a);//转行
}

/**
  * 简介
  *     发送一个 字符串
  * 注意
  *     1
  *       防止当串口没有发送数据时陷入循环
  *     2
  *       发送数据时，如果太频繁，将致大部分时间都在循环中，使按键无法判断
  */
void UART_Send_String(char *str)
{
//    uint16 i = 0;

    while (*str != '\0')
    {
        //等待发送缓冲区空
        while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
//        {
//            if (++i >= 65530)   //防止没有数据发送时，陷入死循环
//                break;
//        }
        //发送数据
        uart[UART_PART]->D = (uint8)(*str++);
    }
}



///**
//  * 简介
//  *     发送数组
//  * 参数
//  *     array   数组名
//  *     len     字节数
//  */
//void UART_SendArray(char *array, uint8 len)
//{
//    while (len--)
//    {
//        UART_Send_Byte(*array++);
//    }
//}
/**
  * 简介
  *     发送数组
  * 参数
  *     array   数组名
  *     len     字节数
  */
void UART_SendArray(uint8 *array, uint32 len)
{
    while (len--)
    {
        UART_Send_Byte(*array);
        array++;
    }
}

//把一个8位数据以ASCII码形式发送
void UART_Send_Hex(uint8 data)
{
    uint8 temp;
    temp=data>>4;
    if(temp>=10)
        UART_Send_Byte(temp-10+'A');
    else
        UART_Send_Byte(temp+'0');
    temp=data&0x0F;
    if(temp>=10)
        UART_Send_Byte(temp-10+'A');
    else
        UART_Send_Byte(temp+'0');
}

/**
  * 简介
  *     UART 发送无符号数
  * 参数
  *     num         无符号数
  * 备注
  */
void UART_Uint16(uint16 num, uint8 enter)
{
	uint8 *ch1,ch[7], m[7];
    uint8 i = 0;

    if (num == 0)
    {
        m[0] = '0';
        m[1] = '\0';
    }
    else
	{
        OLED_HEXACSII(num,ch);
        ch1 =&ch[1];
        while (*ch1 == '0')
        {
            ch1++;
        }
        for (i=0; *ch1 != '\0'; i++)
        {
            m[i] = *ch1;
            ch1++;
        }
        m[i] = '\0';
    }

    UART_Send_String((char *)m);	//显示数字

    if (enter)
    {
        UART_Send_Enter();
    }
}

/**
  * 简介
  *     UART发送 有符号数 (-32768 ~ 32767)
  * 参数
  *     num         有 符号数
  * 备注
  */
void UART_Int16(int16 num, uint8 enter)
{
	if (num < 0)
    {
        num = -num;
        UART_Send_Byte('-');
    }
    UART_Uint16(num, 0);

    if (enter)
    {
        UART_Send_Enter();
    }
}

/**
  * 简介
  *     发送 float
  * 参数
  *     data    数据
  *     enter
  *         0   不发送回车
  *         1   发送回车
  * 备注
  *     float 范围 -3.40E+38 ~ 3.40E+38
  *     本函数并不能真正发送float，整数大小不能超过uint32，小数注意精度
  */
void UART_SendFloat(float data, uint8 enter)
{
    uint8 temp = 3;//小数显示位数
    uint32 integer;//存储整数
    float decimals;//存储小数
    uint8 decimalsInterger;//小数转换为整数

    if (data < 0)
    {
        data = -data;
        UART_Send_Byte('-');
    }

    integer = (uint32)data;
    decimals = data - (float)integer;

    //发送整数
    if (data > 9999)
    {
        UART_Uint16(integer/10000, 0);
    }
    UART_Uint16(integer%10000, 0);

    //发送小数
    UART_Send_Byte('.');
    while (temp)
    {
        temp --;
        decimals *= 10;
        decimalsInterger = (uint8)decimals + 0x30;
        UART_Send_Byte((char)decimalsInterger);
        decimals = decimals - (float)(decimalsInterger-0x30);
    }

    if (enter)
    {
        UART_Send_Enter();
    }
}

/**
  * 简介
  *     获取串口数据
  */
uint8 UART_GetData()
{
    uint8 temp = 0;

    if ( uart[UART_PART]->S1 & UART_S1_RDRF_MASK)
    {

        temp =  uart[UART_PART]->D;
    }

    return temp;
}




/* -------------------------------------------------------------- 未完成的函数 */


/* ------------------------------------------------  未完成的函数 -------- END */



/* -------------------------------------- 有BUG的函数 不到万不得已 千万不要使用 */


/**
  * 简介
  *     printf串口打印
  * 备注
  *     宏由内核提供
  *     此函数因逐飞库对启动文件的修改而无法使用，很遗憾，看不懂那堆汇编代码
  *     但在最底层printf已经被重指向了，所以可直接使用printf
  *     printf的端口由 DEBUG_PORT宏定义决定，波特率由 DEBUG_BAUD 定义
  *     但经过测试，逐飞定义的 printf 无法发送 %f 数据
  */
//void UART_Send_Printf(const char *fmt,...)
//{
//    va_list ap;             //保存参数地址
//    char string[64] = {0}; //放置解释好的字符串
//
//    //将字符串转换成串口可发送的
//    va_start(ap, fmt);      //计算出第一个实际参数的地址
//    vsnprintf(string, 64, fmt, ap); //把输入的格式字符串进行解释
//    va_end(ap);                     //ap指针清空
//
//    //发送解释好的字符串
//    UART_Send_String(string);
//}

/**
  * 简介
  *     发送 float 数据
  * 参数
  *     date    数据
  *     len     显示长度
  *     enter   是否发送回车
  *       0  不发送
  *       1  发送
  * 备注
  *     此函数千万不要碰，变量定义都不要动，由于逐飞库的printf
  *     此函数里面的sprintf有一个超级bug，有时候只是定义变一下，
  *     换一个变量，这个函数就会卡死
  */
//void UART_SendFloat(float date,  uint8 len, uint8 enter)
//{
//
////    uint8 i = 0;
////
////    for (i=0; i<FLOAT_ARRAY_NUM; i++)
////    {
////        UART_FloatArray[i] = 0;
////    }
////
////    sprintf(UART_FloatArray, "%f", date);
////
////    //不能使用发送字符串的函数，原因不明，总之会出错
//////    UART_FloatArray[len] = '\0';
//////    UART_Send_String(UART_FloatArray);
//
//    uint8 i = 0;
//
//    for (i=0; i<FLOAT_ARRAY_NUM; i++)
//    {
//        UART_SendFloatArray[i] = 0;
//    }
//
//    sprintf(UART_SendFloatArray, "%f", date);
//
//    for (i=0; i<len; i++)
//    {
//        UART_Send_Byte(UART_SendFloatArray[i]);
//    }
//
//    if (enter)
//    {
//        UART_Send_Enter();
//    }
//}


/* -----------------------  有BUG的函数 不到万不得已 千万不要使用  -------- END */

