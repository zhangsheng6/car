/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    outputdata.c
  * �ļ���ʶ��
  * ժ    Ҫ��    VisualScope_V090206�ƽ�� ����ʾ���� ͨ��Э��
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��2��28�� 17:05:44
  ******************************************************************************
  */
#include "outputdata.h"
#include "uart.h"

unsigned short CRC_CHECK(unsigned char *Buf, unsigned char CRC_CNT)
{
    unsigned short CRC_Temp;
    unsigned char i,j;
    CRC_Temp = 0xffff;

    for (i=0;i<CRC_CNT; i++){
        CRC_Temp ^= Buf[i];
        for (j=0;j<8;j++) {
            if (CRC_Temp & 0x01)
                CRC_Temp = (CRC_Temp >>1 ) ^ 0xa001;
            else
                CRC_Temp = CRC_Temp >> 1;
        }
    }
    return(CRC_Temp);
}


/**
  * ���
  *     ���ͺ���
  * ע��
  *     x, y, z, w -> ͨ�� 1 2 3 4
  */
void OutPut_Data(float x, float y, float z, float w)
{
  int temp[4] = {0};
  unsigned int temp1[4] = {0};
  unsigned char databuf[10] = {0};
  unsigned char i;
  unsigned short CRC16 = 0;

  temp[0] = (int)x;
  temp[1] = (int)y;
  temp[2] = (int)z;
  temp[3] = (int)w;

  for(i=0;i<4;i++)
   {
    temp1[i] = (unsigned int)temp[i];
   }

  for(i=0;i<4;i++)
  {
    databuf[i*2]   = (unsigned char)(temp1[i]%256);
    databuf[i*2+1] = (unsigned char)(temp1[i]/256);
  }

  CRC16 = CRC_CHECK(databuf,8);
  databuf[8] = CRC16%256;
  databuf[9] = CRC16/256;

  for(i=0;i<10;i++)
    UART_Send_Byte((char)databuf[i]);
}