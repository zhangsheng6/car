/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     allHead.h
  * 文件标识：
  * 摘    要：     所有头文件
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2017年12月25日 15:23:27
  ******************************************************************************
  */

#ifndef _ALL_HEAD_H
#define _ALL_HEAD_H

//逐飞库
#include "KEA128_gpio.h"
#include "KEA128_port.h"
#include "KEA128_adc.h"
#include "KEA128_irq.h"
#include "KEA128_uart.h"
#include "KEA128_kbi.h"
#include "KEA128_flash.h"
#include "KEA128_systick.h"


//外设库
#include "math.h"
#include <stdlib.h>
#include <stdio.h>
#include "key.h"
#include "oled.h"
#include "L3G4200.h"
#include "ftm.h"
#include "adc.h"
#include "pit.h"
#include "uart.h"
#include "iicAnalog.h"
#include "spi.h"
#include "KEA128_i2c.h"
#include "outputdata.h"
#include "outputdata_zs.h"
#include "lcd.h"


//用户模块
#include "Variable.h"  //所有变量
#include "common.h"
#include "Motor_Control.h"
#include "balanceControl.h"
#include "Speed_Control.h"
#include "inductor_1.h"
#include "Direction_Control.h"
#include "Fuzzy_ZS.h"
#include "Fuzzy_ZS2.h"
#include "XS_ZS.h"
#include "QT.h"
#include "SDSB_ZS.h"
#include "Control.h"
#include "L3G4200D_ZS.h"
#include "Tiaoshi_zs.h"
#include "lcd_zs.h"
#include "oled_zs.h"
#include  "Boma_zs.h"
#include  "BL.h"
#endif