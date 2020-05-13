/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    flash.h
  * 文件标识：
  * 摘    要：    flash操作
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年5月7日 17:27:04
  ******************************************************************************
  */
#ifndef _FLASH_H
#define _FLASH_H
#include "common.h"

//若要添加，倒着加，共256个扇区，每个512B，一共128KFlash
#define FLASH_BLOCK_0       255     // 0x0001fe00 ~ 0x0001 ffff
#define FLASH_BLOCK_1       254     // 0x0001fc00 ~ 0x0001 fdff


//读数据，读回的数据已经转成对应类型
#define FLASH_READ(offset,type)      (*(type *)((uint32)(((FLASH_BLOCK_0)*512) + (offset))))


uint8 FLASH_UintFloatW(void *num);
void FLASH_Int32WriteOffset(int32 num, uint8 offset);
void Flash_Init(uint8 clear);

#endif