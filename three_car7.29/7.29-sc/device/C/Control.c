/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    Control.c
  * �ļ���ʶ��
  * ժ    Ҫ��    �˵�����
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��4��17�� 13:12:06
  ******************************************************************************
  */

#include "Control.h"

uint8 g_5msFlag = 0;
UART_Type * uartBase[3] = UART_BASES;
extern uint8 c;


/**
  * ���
  *     ���ݴ��ڷ��ص�����ִ�в���
  * ע��
  */
void ReadDataControl(void)
{
    static uint8 menuControlFlag = 0;//�˵�ѡ��
    static uint8 modJudge = 0;//�˵������־
    static uint8 sendFlag = 0;//�Ƿ���
    static uint8 time = 1;//����
    uint8 readDataTemp = 0;    //�����������ݴ�
    static uint16 sendDate = 0;       //�ش�������
    
    //������ֵ�����øĺ������ŵ�
    uint16 P_angle = 0;
    uint16 D_angle = 0;
    

    if (uartBase[UART_PART]->S1 & UART_S1_RDRF_MASK)//������
    {
        readDataTemp = uartBase[UART_PART]->D;

        if (readDataTemp == 0x1f)//ͨ��Э�飬��ͷ0x1f��֮��һ���˵�����
        {
            modJudge = 1;
        }
        else
        {
            if (modJudge)//�˵�����
            {
                switch (readDataTemp)
                {
                case CAR_STOP:
                    carStatus = STOP;
                    c=1;
                    break;
                case P_ANGLE: //------------------------------------- ������ �˵�1
                    menuControlFlag = P_ANGLE;
                    sendDate = (uint16)P_angle;
                    sendFlag = 1;
                    break;
                case D_ANGLE:
                    menuControlFlag = D_ANGLE;
                    sendDate = (uint16)D_angle;
                    sendFlag = 1;
                    break;

                }
                modJudge = 0;
            }
            else
            {
                switch (menuControlFlag)
                {
                case P_ANGLE: //------------------------------------- ������ �˵�1
                    switch (time)
                    {
                    case 1:
                        sendDate = readDataTemp;
                        sendDate <<= 8;
                        time = 2;
                        break;
                    case 2:
                        sendDate |= (uint16)readDataTemp;
                        P_angle = sendDate;
                        sendDate = (uint16)P_angle;//ȷ���������޸���
                        menuSelect = MENU_1;//OLED����ʾ��������
                        KEY_sta = !KEY_sta;
                        KEY_menuChange = !KEY_menuChange;
                        time = 1;
                        sendFlag = 1;//������ϣ�ȷ�ϻش�
                        break;
                    }
                    break;
                case D_ANGLE: //------------------------------------- ������ �˵�1
                    switch (time)
                    {
                    case 1:
                        sendDate = readDataTemp;
                        sendDate <<= 8;
                        time = 2;
                        break;
                    case 2:
                        sendDate |= (uint16)readDataTemp;
                        D_angle = sendDate;
                        sendDate = (uint16)D_angle;//ȷ���������޸���
                        menuSelect = MENU_2;//OLED����ʾ��������
                        KEY_sta = !KEY_sta;
                        KEY_menuChange = !KEY_menuChange;
                        time = 1;
                        sendFlag = 1;//������ϣ�ȷ�ϻش�
                        break;
                    }
                    break;

                default :
                    break;
                }
            }
        }

    }

    if (sendFlag)
    {
        if (g_5msFlag)//��5ms����һ�����ݣ���ֹ���ݶ�ʧ
        {
            switch (time)
            {
            case 1:
                UART_Send_Byte((uint8)(sendDate>>8));
                time = 2;
                break;
            case 2:
                UART_Send_Byte((uint8)sendDate);
                time = 1;
                sendFlag = 0;//�������
                break;
            }

            g_5msFlag = 0;
        }
    }
}






