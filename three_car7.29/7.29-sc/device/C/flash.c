/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：    flash.c
  * 文件标识：
  * 摘    要：    flash操作
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年5月7日 17:25:35
  ******************************************************************************
  */

#include "flash.h"
#include "KEA128_flash.h"

/**
  * @brief  flash初始化
  * @param  clear 1 清除该扇区, 0 不清除
  * @note   如果不清除扇区，则扇区内保存的内容永不丢失，
  *         包括下载程序，也不会清除掉该扇区内容，
  *         除非程序代码用到了那个扇区,但那个扇区是倒数的 512B
  *         如果程序使用到了那个扇区，请修改程序，你的程序太多了
  */
void Flash_Init(uint8 clear)
{
    FLASH_Init();
    if (clear)  FLASH_EraseSector(FLASH_BLOCK_0);
}

/**
  * @brief  顺序写入flash
  * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
  *         num     写入数据
  * @return offset  本次数据的偏移值
  * @note   将数据的偏移值保存起来，读取数据时使用
  *         一次必须要写入一个字，所以8位数据也要转换成32位
  *         不要输入 double 它需要8B，此函数不适用
  */
uint8 FLASH_UintFloatW(void *num)
{
    static uint8 time = 0;
    uint8 offset = 4*time;

    FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)num, 4, 4*time++);//每一个int32造成4B偏移

    return offset;
}

/**
  * @brief  定点写入flash
  * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
  *         num     写入数据
  *         offset  偏移值
  * @return
  */
void FLASH_Int32WriteOffset(int32 num, uint8 offset)
{
    FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)(&num), 4, offset);//每一个int32造成4B偏移
}




