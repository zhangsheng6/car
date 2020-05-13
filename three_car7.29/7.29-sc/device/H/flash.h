/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    flash.h
  * �ļ���ʶ��
  * ժ    Ҫ��    flash����
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��5��7�� 17:27:04
  ******************************************************************************
  */
#ifndef _FLASH_H
#define _FLASH_H
#include "common.h"

//��Ҫ��ӣ����żӣ���256��������ÿ��512B��һ��128KFlash
#define FLASH_BLOCK_0       255     // 0x0001fe00 ~ 0x0001 ffff
#define FLASH_BLOCK_1       254     // 0x0001fc00 ~ 0x0001 fdff


//�����ݣ����ص������Ѿ�ת�ɶ�Ӧ����
#define FLASH_READ(offset,type)      (*(type *)((uint32)(((FLASH_BLOCK_0)*512) + (offset))))


uint8 FLASH_UintFloatW(void *num);
void FLASH_Int32WriteOffset(int32 num, uint8 offset);
void Flash_Init(uint8 clear);

#endif