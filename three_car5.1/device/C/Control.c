/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    Control.c
  * 文件标识：
  * 摘    要：    菜单控制
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年4月17日 13:12:06
  ******************************************************************************
  */

#include "Control.h"

uint8 g_5msFlag = 0;
UART_Type * uartBase[3] = UART_BASES;
extern uint8 c;


/**
  * 简介
  *     根据串口发回的数据执行操作
  * 注意
  */
void ReadDataControl(void)
{
    static uint8 menuControlFlag = 0;//菜单选择
    static uint8 modJudge = 0;//菜单命令标志
    static uint8 sendFlag = 0;//是否发送
    static uint8 time = 1;//次数
    uint8 readDataTemp = 0;    //读来的数据暂存
    static uint16 sendDate = 0;       //回传的数据
    
    //这两处值是懒得改函数随便放的
    uint16 P_angle = 0;
    uint16 D_angle = 0;
    

    if (uartBase[UART_PART]->S1 & UART_S1_RDRF_MASK)//有数据
    {
        readDataTemp = uartBase[UART_PART]->D;

        if (readDataTemp == 0x1f)//通信协议，开头0x1f，之后一个菜单名字
        {
            modJudge = 1;
        }
        else
        {
            if (modJudge)//菜单命令
            {
                switch (readDataTemp)
                {
                case CAR_STOP:
                    carStatus = STOP;
                    c=1;
                    break;
                case P_ANGLE: //------------------------------------- 调试器 菜单1
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
                case P_ANGLE: //------------------------------------- 调试器 菜单1
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
                        sendDate = (uint16)P_angle;//确保参数被修改了
                        menuSelect = MENU_1;//OLED上显示，可屏蔽
                        KEY_sta = !KEY_sta;
                        KEY_menuChange = !KEY_menuChange;
                        time = 1;
                        sendFlag = 1;//接受完毕，确认回传
                        break;
                    }
                    break;
                case D_ANGLE: //------------------------------------- 调试器 菜单1
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
                        sendDate = (uint16)D_angle;//确保参数被修改了
                        menuSelect = MENU_2;//OLED上显示，可屏蔽
                        KEY_sta = !KEY_sta;
                        KEY_menuChange = !KEY_menuChange;
                        time = 1;
                        sendFlag = 1;//接受完毕，确认回传
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
        if (g_5msFlag)//隔5ms发送一次数据，防止数据丢失
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
                sendFlag = 0;//发送完毕
                break;
            }

            g_5msFlag = 0;
        }
    }
}






