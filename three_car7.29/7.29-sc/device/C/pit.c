/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     pit.c
  * 文件标识：
  * 摘    要：     周期中断定时器
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月23日 16:45:38
  ******************************************************************************
  */
#include "pit.h"

/**
  * 简介
  *     PIT0初始化
  * 参数
  *     pitn  只有PIT0有效
  *     us：表示定时溢出开始递减的值
  * 注意
  *     LDVAL写入值 =（定时周期/时钟周期）-1
  */
void PIT_Init(uint8 pitn, uint16 us)
{
//    get_clk();

    uint32 cnt = 0;
    cnt = us * (bus_clk_khz/1000) - 1;

	SIM->SCGC       |= SIM_SCGC_PIT_MASK;       //使能PIT时钟

	PIT->MCR        &= ~PIT_MCR_MDIS_MASK;      //必须在执行任何其他设置之前使能该字段
	PIT->MCR        |= PIT_MCR_FRZ_MASK;	    //调试模式下禁止运行
//    PIT->MCR        &= ~PIT_MCR_FRZ_MASK;	    //调试模式下允许运行
	PIT->CHANNEL[pitn].LDVAL  = cnt;            //设置溢出中断时间
	PIT_CLEAR;								    //清除中断标志位
	PIT->CHANNEL[pitn].TCTRL &= ~ PIT_TCTRL_TEN_MASK;       //禁止PITn定时器（用于清空计数值）
    PIT->CHANNEL[pitn].TCTRL  = ( 0
								| PIT_TCTRL_TEN_MASK        //使能 PITn定时器
								& (~PIT_TCTRL_TIE_MASK)     //关PITn中断
								);
}

/**
  * 简介
  *     使能PIT0中断
  */
void PIT_EnableIrq()
{
    PIT_CLEAR;   //清中断标志
    PIT->CHANNEL[PIT0].TCTRL |= PIT_TCTRL_TIE_MASK; //开pit中断
    enable_irq(PIT0_IRQ);
}

/**
  * 简介
  *     禁止PIT0中断
  */
void PIT_DisableIrq()
{
    PIT->CHANNEL[PIT0].TCTRL &= (~PIT_TCTRL_TIE_MASK); //关pit中断
    disable_irq(PIT0_IRQ);
}


