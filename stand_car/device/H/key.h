/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    key.h
  * 文件标识：
  * 摘    要：    按键配置
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1月4日 09:43:37
  ******************************************************************************
  */

#ifndef _KEY_H
#define _KEY_H
#include "variable.h"

void  KEY_Init();      //按键初始化
uint8 KEY_Scan(void); //按键检测
void KEY_TestMenu(void); //测试专用菜单
void KEY_ParaMenu(void);//多级菜单 按键操控
void KEY_ParaMenuDisplay(void);//多级菜单 显示
void KEY_balance(void);
void  KEY_balance_Display(void);


#endif

