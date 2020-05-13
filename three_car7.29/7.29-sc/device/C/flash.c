/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    flash.c
  * �ļ���ʶ��
  * ժ    Ҫ��    flash����
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��5��7�� 17:25:35
  ******************************************************************************
  */

#include "flash.h"
#include "KEA128_flash.h"

/**
  * @brief  flash��ʼ��
  * @param  clear 1 ���������, 0 �����
  * @note   ���������������������ڱ��������������ʧ��
  *         �������س���Ҳ������������������ݣ�
  *         ���ǳ�������õ����Ǹ�����,���Ǹ������ǵ����� 512B
  *         �������ʹ�õ����Ǹ����������޸ĳ�����ĳ���̫����
  */
void Flash_Init(uint8 clear)
{
    FLASH_Init();
    if (clear)  FLASH_EraseSector(FLASH_BLOCK_0);
}

/**
  * @brief  ˳��д��flash
  * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
  *         num     д������
  * @return offset  �������ݵ�ƫ��ֵ
  * @note   �����ݵ�ƫ��ֵ������������ȡ����ʱʹ��
  *         һ�α���Ҫд��һ���֣�����8λ����ҲҪת����32λ
  *         ��Ҫ���� double ����Ҫ8B���˺���������
  */
uint8 FLASH_UintFloatW(void *num)
{
    static uint8 time = 0;
    uint8 offset = 4*time;

    FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)num, 4, 4*time++);//ÿһ��int32���4Bƫ��

    return offset;
}

/**
  * @brief  ����д��flash
  * @param  block   FLASH_BLOCK_0, FLASH_BLOCK_1
  *         num     д������
  *         offset  ƫ��ֵ
  * @return
  */
void FLASH_Int32WriteOffset(int32 num, uint8 offset)
{
    FLASH_WriteSector(FLASH_BLOCK_0, (uint8 *)(&num), 4, offset);//ÿһ��int32���4Bƫ��
}




