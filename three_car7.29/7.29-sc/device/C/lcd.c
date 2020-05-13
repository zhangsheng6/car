/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    lcd.c
  * �ļ���ʶ��
  * ժ    Ҫ��    LCD��ʾ
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��5��4�� 20:54:40
  ******************************************************************************
  */

#include "lcd.h"
#include "oled.h"

uint16 LCD_pen = BLACK;//����ɫ
uint16 LCD_backGround = GREEN;//������ɫ

/**
  * ���
  *    д16λ������
  * ����
  */
void  LCD_WriteData_16Bit(uint16 dat)	//��Һ����дһ��16λ����
{
	OLED_WrDat((uint8)(dat>>8));
	OLED_WrDat((uint8)dat);
}


/**
  * ���
  *    Һ����������
  * ����
  *      x_start     	����x��������
  *      y_start     	����y��������
  *      x_end       	����x������յ�
  *      y_end       	����y������յ�
  * ע��
  *     xy���ҷ�ת�� --- han.4.5
  */
void Lcd_SetRegion(uint8 x_start,uint8 y_start,uint8 x_end,uint8 y_end)
{
    OLED_WrCmd(0x2a);//y��
	OLED_WrDat(0x00);
	OLED_WrDat(y_start+1);
	OLED_WrDat(0x00);
	OLED_WrDat(y_end+1);

	OLED_WrCmd(0x2b);//x��
	OLED_WrDat(0x00);
	OLED_WrDat(x_start+2);
	OLED_WrDat(0x00);
	OLED_WrDat(x_end+2);

	OLED_WrCmd(0x2c);
}

/**
  * ���
  *    Һ����������
  * ����
  *      color     		��ɫ����
  */
void dsp_single_colour(int color)
{
 	uint8 i,j;
	Lcd_SetRegion(0,0,TFT_X_MAX-1,TFT_Y_MAX-1);
 	for (i=0;i<TFT_X_MAX;i++)
    	for (j=0;j<TFT_Y_MAX;j++)
        	LCD_WriteData_16Bit(color);
}


/**
  * ���
  *     LCD��ʼ��
  * ע��
  */
void LCD_Init(void)
{
    spi_init(SPI_PORT, USE_PCS, MASTER, 20*1000*1000);
//    DDRCS;
    DDRDC;
//    DDRSDIN;
//    DDROSCLK;
    DDRRES;

    CL_RES;
    SystickDelayMs(5);
    RES;
    SystickDelayMs(1);

    //LCD Init For 1.44Inch LCD Panel with ST7735R.
	OLED_WrCmd(0x11);//Sleep exit
    SystickDelayMs(5);

	//ST7735R Frame Rate
	OLED_WrCmd(0xB1);
	OLED_WrDat(0x01);
	OLED_WrDat(0x2C);
	OLED_WrDat(0x2D);

	OLED_WrCmd(0xB2);
	OLED_WrDat(0x01);
	OLED_WrDat(0x2C);
	OLED_WrDat(0x2D);

	OLED_WrCmd(0xB3);
	OLED_WrDat(0x01);
	OLED_WrDat(0x2C);
	OLED_WrDat(0x2D);
	OLED_WrDat(0x01);
	OLED_WrDat(0x2C);
	OLED_WrDat(0x2D);

	OLED_WrCmd(0xB4); //Column inversion
	OLED_WrDat(0x07);

	//ST7735R Power Sequence
	OLED_WrCmd(0xC0);
	OLED_WrDat(0xA2);
	OLED_WrDat(0x02);
	OLED_WrDat(0x84);
	OLED_WrCmd(0xC1);
	OLED_WrDat(0xC5);

	OLED_WrCmd(0xC2);
	OLED_WrDat(0x0A);
	OLED_WrDat(0x00);

	OLED_WrCmd(0xC3);
	OLED_WrDat(0x8A);
	OLED_WrDat(0x2A);
	OLED_WrCmd(0xC4);
	OLED_WrDat(0x8A);
	OLED_WrDat(0xEE);

	OLED_WrCmd(0xC5); //VCOM
	OLED_WrDat(0x0E);

	OLED_WrCmd(0x36); //MX, MY, RGB mode
	OLED_WrDat(0xe0); //0xc0 --- L->R U->D

	//ST7735R Gamma Sequence
	OLED_WrCmd(0xe0);
	OLED_WrDat(0x0f);
	OLED_WrDat(0x1a);
	OLED_WrDat(0x0f);
	OLED_WrDat(0x18);
	OLED_WrDat(0x2f);
	OLED_WrDat(0x28);
	OLED_WrDat(0x20);
	OLED_WrDat(0x22);
	OLED_WrDat(0x1f);
	OLED_WrDat(0x1b);
	OLED_WrDat(0x23);
	OLED_WrDat(0x37);
	OLED_WrDat(0x00);
	OLED_WrDat(0x07);
	OLED_WrDat(0x02);
	OLED_WrDat(0x10);

	OLED_WrCmd(0xe1);
	OLED_WrDat(0x0f);
	OLED_WrDat(0x1b);
	OLED_WrDat(0x0f);
	OLED_WrDat(0x17);
	OLED_WrDat(0x33);
	OLED_WrDat(0x2c);
	OLED_WrDat(0x29);
	OLED_WrDat(0x2e);
	OLED_WrDat(0x30);
	OLED_WrDat(0x30);
	OLED_WrDat(0x39);
	OLED_WrDat(0x3f);
	OLED_WrDat(0x00);
	OLED_WrDat(0x07);
	OLED_WrDat(0x03);
	OLED_WrDat(0x10);

	OLED_WrCmd(0x2a);
	OLED_WrDat(0x00);
	OLED_WrDat(0x00+2);
	OLED_WrDat(0x00);
	OLED_WrDat(0x80+2);

	OLED_WrCmd(0x2b);
	OLED_WrDat(0x00);
	OLED_WrDat(0x00+3);
	OLED_WrDat(0x00);
	OLED_WrDat(0x80+3);

	OLED_WrCmd(0xF0); //Enable test command
	OLED_WrDat(0x01);
	OLED_WrCmd(0xF6); //Disable ram power save mode
	OLED_WrDat(0x00);

	OLED_WrCmd(0x3A); //65k mode
	OLED_WrDat(0x05);

	OLED_WrCmd(0x29);//Display on

    dsp_single_colour(LCD_backGround);
}

/**
  * ���
  *    ��ʾ0608�ַ�
  * ����
  *     x 0~127�������λ��1���򲻽��ж�λ
  */
void LCD_showChar0608(uint16 x,uint16 y,uint8 dat)
{
	uint8 i,j;
	uint8 temp;

    if (!(x&0x80))    Lcd_SetRegion(x,y,x+5,y+7);
	for(i=0; i<6; i++)
	{
		temp = F6x8[dat-32][i];
		for(j=0; j<8; j++)
		{
			if(temp&0x01)	LCD_WriteData_16Bit(LCD_pen);
			else			LCD_WriteData_16Bit(LCD_backGround);
			temp>>=1;
		}
	}
}

/**
  * ���
  *    ��ʾ0608�ַ���
  * ����
  */
void LCD_showStr0608(uint16 x,uint16 y, uint8 *dat)
{
	uint8 k;

    for (k=0; dat[k] != '\0'; k++);
    Lcd_SetRegion(x,y,x+6*k-1,y+7);
    k = 0;
	while(dat[k] != '\0')
	{
        LCD_showChar0608(x|0x80, y, dat[k]);
        k++;
	}
}

/**
  * ���
  *     LCD��ʾ�޷�����(6*8����)
  * ����
  *     x			x����������
  *     y           y����������
  *     num         �޷�����
  * ����ֵ
  *     ��һ��ֵӦ�÷��õ�x����
  * ��ע
  */
void LCD_Uint16(uint8 x, uint8 y, uint16 num)
{
	uint8 *ch1,ch[7], m[7];
    uint8 i = 0;

    if (num == 0)
    {
        m[0] = '0';
        m[1] = '\0';
    }
    else
	{
        OLED_HEXACSII(num,ch);
        ch1 =&ch[1];
        while (*ch1 == '0')
        {
            ch1++;
        }
        for (i=0; *ch1 != '\0'; i++)
        {
            m[i] = *ch1;
            ch1++;
        }
        m[i] = '\0';
    }

    LCD_showStr0608(x, y, m);	//��ʾ����
}

/**
  * ���
  *     LCD��ʾ �з����� (6*8����)
  * ����
  *     x			x����������
  *     y           y����������
  *     num         �� ������
  * ��ע
  */
void LCD_Int16(uint8 x, uint8 y, int16 num)
{
	if (num < 0)
    {
        num = -num;
        LCD_showChar0608(x, y, '-');
        x += 6;
    }
    LCD_Uint16(x, y, num);
}


/**
  * ���
  *     LCD��ʾ float (6*8����)
  * ����
  *     x			x����������
  *     y           y����������
  *     len         ��ʾβ������
  * ��ע
  */
void LCD_DisplayFloat(uint8 x, uint8 y, float data, uint8 len)
{
    uint8 numChar[12], k=0;
	uint8 *ch1,chH[7] = {0},chL[7] = {0};
    uint32 integer;//�洢����
    float decimals;//�洢С��
    uint8 decimalsInterger;//С��ת��Ϊ����

    if (data < 0)
    {
        data = -data;
        numChar[k++] = '-';
    }

    integer = (uint32)data;
    decimals = data - (float)integer;
    if (data > 9999)
    {
        OLED_HEXACSII(integer/10000,chH);
        ch1 = &chH[0];
        while (*ch1 == '0')     ch1++;
        while (*ch1 != '\0')    numChar[k++] = *(ch1++);
    }
    OLED_HEXACSII(integer%10000, chL);
    ch1 = &chL[0];
    while (*ch1 == '0')         ch1++;
    while (*ch1 != '\0')        numChar[k++] = *(ch1++);

    //�洢С����
    numChar[k++] = '.';

    //����С��
    while (len)
    {
        len --;
        decimals *= 10;
        decimalsInterger = (uint8)decimals + 0x30;
        numChar[k++] = decimalsInterger;
        decimals -= (float)(decimalsInterger-0x30);
    }
    numChar[k++] = '\0';

    LCD_showStr0608(x, y, numChar);
}

/**
  * ���
  *    ��ʾlogo
  * ����
  */
void LCD_showLogo()
{
  	uint8 x,y,k,temp;
    uint8 *p_logo = &logo[0][0];
    Lcd_SetRegion(0,48,127,48+64-1);

	for(x=0; x<128; x++)
	{
	   	for(y=0; y<8; y++)
		{
            temp = *(p_logo++);//��32��Ϊ��ȡģ�Ǵӿո�ʼȡ�� �ո���ascii�������32
            for(k=0; k<8; k++)
            {
                if(temp&0x01)	LCD_WriteData_16Bit(LCD_pen);
                else			LCD_WriteData_16Bit(LCD_backGround);
                temp>>=1;
            }
		}
	}
}


