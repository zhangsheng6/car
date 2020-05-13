/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    Control.h
  * 文件标识：
  * 摘    要：    菜单控制
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年4月17日 13:12:30
  ******************************************************************************
  */
#ifndef _CONTROL_H
#define _CONTROL_H

#include "allHead.h"


enum//密码表
{
  CAR_STOP = 1, P_ANGLE, D_ANGLE
};
extern uint8 g_5msFlag;




void ReadDataControl(void);

#endif


