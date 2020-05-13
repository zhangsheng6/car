/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    uart.c
  * �ļ���ʶ��
  * ժ    Ҫ��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��7�� 20:47:48
  ******************************************************************************
  */

#include "uart.h"
#include "stdio.h"
#include "stdarg.h"

//char UART_SendFloatArray[FLOAT_ARRAY_NUM];//ʹ��UART_SendFloat()����ʱ����


/**
  * ���
  *     ����һ�� �ֽ�
  */
void UART_Send_Byte(char ch)
{
    //�ȴ����ͻ�������
    while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
    //��������
    uart[UART_PART]->D = (uint8)ch;
}

/**
  * ���
  *     ����һ�� �س�
  * ע��
  *         ���� - ASCII - ʮ������ - ����
  *     �س� CR  -   \r  -  0x0d   - �ƶ���������е���ʼλ��
  *     ���� LF  -   \n  -  0x0a   - ��������һ��������ʼλ��
  */
void UART_Send_Enter(void)
{
    UART_Send_Byte(0x0d);//��������
    UART_Send_Byte(0x0a);//ת��
}

/**
  * ���
  *     ����һ�� �ַ���
  * ע��
  *     1
  *       ��ֹ������û�з�������ʱ����ѭ��
  *     2
  *       ��������ʱ�����̫Ƶ�������´󲿷�ʱ�䶼��ѭ���У�ʹ�����޷��ж�
  */
void UART_Send_String(char *str)
{
//    uint16 i = 0;

    while (*str != '\0')
    {
        //�ȴ����ͻ�������
        while (! ((uart[UART_PART]->S1) & UART_S1_TDRE_MASK) );
//        {
//            if (++i >= 65530)   //��ֹû�����ݷ���ʱ��������ѭ��
//                break;
//        }
        //��������
        uart[UART_PART]->D = (uint8)(*str++);
    }
}



///**
//  * ���
//  *     ��������
//  * ����
//  *     array   ������
//  *     len     �ֽ���
//  */
//void UART_SendArray(char *array, uint8 len)
//{
//    while (len--)
//    {
//        UART_Send_Byte(*array++);
//    }
//}
/**
  * ���
  *     ��������
  * ����
  *     array   ������
  *     len     �ֽ���
  */
void UART_SendArray(uint8 *array, uint32 len)
{
    while (len--)
    {
        UART_Send_Byte(*array);
        array++;
    }
}

//��һ��8λ������ASCII����ʽ����
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
  * ���
  *     UART �����޷�����
  * ����
  *     num         �޷�����
  * ��ע
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

    UART_Send_String((char *)m);	//��ʾ����

    if (enter)
    {
        UART_Send_Enter();
    }
}

/**
  * ���
  *     UART���� �з����� (-32768 ~ 32767)
  * ����
  *     num         �� ������
  * ��ע
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
  * ���
  *     ���� float
  * ����
  *     data    ����
  *     enter
  *         0   �����ͻس�
  *         1   ���ͻس�
  * ��ע
  *     float ��Χ -3.40E+38 ~ 3.40E+38
  *     ��������������������float��������С���ܳ���uint32��С��ע�⾫��
  */
void UART_SendFloat(float data, uint8 enter)
{
    uint8 temp = 3;//С����ʾλ��
    uint32 integer;//�洢����
    float decimals;//�洢С��
    uint8 decimalsInterger;//С��ת��Ϊ����

    if (data < 0)
    {
        data = -data;
        UART_Send_Byte('-');
    }

    integer = (uint32)data;
    decimals = data - (float)integer;

    //��������
    if (data > 9999)
    {
        UART_Uint16(integer/10000, 0);
    }
    UART_Uint16(integer%10000, 0);

    //����С��
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
  * ���
  *     ��ȡ��������
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




/* -------------------------------------------------------------- δ��ɵĺ��� */


/* ------------------------------------------------  δ��ɵĺ��� -------- END */



/* -------------------------------------- ��BUG�ĺ��� �����򲻵��� ǧ��Ҫʹ�� */


/**
  * ���
  *     printf���ڴ�ӡ
  * ��ע
  *     �����ں��ṩ
  *     �˺�������ɿ�������ļ����޸Ķ��޷�ʹ�ã����ź����������Ƕѻ�����
  *     ������ײ�printf�Ѿ�����ָ���ˣ����Կ�ֱ��ʹ��printf
  *     printf�Ķ˿��� DEBUG_PORT�궨��������������� DEBUG_BAUD ����
  *     ���������ԣ���ɶ���� printf �޷����� %f ����
  */
//void UART_Send_Printf(const char *fmt,...)
//{
//    va_list ap;             //���������ַ
//    char string[64] = {0}; //���ý��ͺõ��ַ���
//
//    //���ַ���ת���ɴ��ڿɷ��͵�
//    va_start(ap, fmt);      //�������һ��ʵ�ʲ����ĵ�ַ
//    vsnprintf(string, 64, fmt, ap); //������ĸ�ʽ�ַ������н���
//    va_end(ap);                     //apָ�����
//
//    //���ͽ��ͺõ��ַ���
//    UART_Send_String(string);
//}

/**
  * ���
  *     ���� float ����
  * ����
  *     date    ����
  *     len     ��ʾ����
  *     enter   �Ƿ��ͻس�
  *       0  ������
  *       1  ����
  * ��ע
  *     �˺���ǧ��Ҫ�����������嶼��Ҫ����������ɿ��printf
  *     �˺��������sprintf��һ������bug����ʱ��ֻ�Ƕ����һ�£�
  *     ��һ����������������ͻῨ��
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
////    //����ʹ�÷����ַ����ĺ�����ԭ��������֮�����
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


/* -----------------------  ��BUG�ĺ��� �����򲻵��� ǧ��Ҫʹ��  -------- END */

