///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:41
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\lcd.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\lcd.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\lcd.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN F6x8
        EXTERN GpioInit
        EXTERN GpioSet
        EXTERN OLED_HEXACSII
        EXTERN OLED_WrCmd
        EXTERN OLED_WrDat
        EXTERN SystickDelayMs
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod
        EXTERN logo
        EXTERN spi_init

        PUBLIC LCD_DisplayFloat
        PUBLIC LCD_Init
        PUBLIC LCD_Int16
        PUBLIC LCD_Uint16
        PUBLIC LCD_WriteData_16Bit
        PUBLIC LCD_backGround
        PUBLIC LCD_pen
        PUBLIC LCD_showChar0608
        PUBLIC LCD_showLogo
        PUBLIC LCD_showStr0608
        PUBLIC Lcd_SetRegion
        PUBLIC dsp_single_colour

// H:\智能车程序2018\电磁三轮——ZS\7.17\device\C\lcd.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,华北科技学院
//    5   * All rights reserved.
//    6   *
//    7   * 文件名称：    lcd.c
//    8   * 文件标识：
//    9   * 摘    要：    LCD显示
//   10   *
//   11   * 当前版本：     1.0
//   12   * 负    责：     韩志伟
//   13   * 时    间：     2018年5月4日 20:54:40
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "lcd.h"
//   18 #include "oled.h"
//   19 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   20 uint16 LCD_pen = BLACK;//笔颜色
LCD_pen:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   21 uint16 LCD_backGround = GREEN;//背景颜色
LCD_backGround:
        DATA
        DC16 2016
//   22 
//   23 /**
//   24   * 简介
//   25   *    写16位数据用
//   26   * 参数
//   27   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 void  LCD_WriteData_16Bit(uint16 dat)	//向液晶屏写一个16位数据
//   29 {
LCD_WriteData_16Bit:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   30 	OLED_WrDat((uint8)(dat>>8));
        MOVS     R0,R4
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BL       OLED_WrDat
//   31 	OLED_WrDat((uint8)dat);
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_WrDat
//   32 }
        POP      {R4,PC}          ;; return
//   33 
//   34 
//   35 /**
//   36   * 简介
//   37   *    液晶坐标设置
//   38   * 参数
//   39   *      x_start     	坐标x方向的起点
//   40   *      y_start     	坐标y方向的起点
//   41   *      x_end       	坐标x方向的终点
//   42   *      y_end       	坐标y方向的终点
//   43   * 注意
//   44   *     xy被我翻转了 --- han.4.5
//   45   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void Lcd_SetRegion(uint8 x_start,uint8 y_start,uint8 x_end,uint8 y_end)
//   47 {
Lcd_SetRegion:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
//   48     OLED_WrCmd(0x2a);//y轴
        MOVS     R0,#+42
        BL       OLED_WrCmd
//   49 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//   50 	OLED_WrDat(y_start+1);
        ADDS     R7,R7,#+1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       OLED_WrDat
//   51 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//   52 	OLED_WrDat(y_end+1);
        ADDS     R6,R6,#+1
        MOVS     R0,R6
        UXTB     R0,R0
        BL       OLED_WrDat
//   53 
//   54 	OLED_WrCmd(0x2b);//x轴
        MOVS     R0,#+43
        BL       OLED_WrCmd
//   55 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//   56 	OLED_WrDat(x_start+2);
        ADDS     R4,R4,#+2
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_WrDat
//   57 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//   58 	OLED_WrDat(x_end+2);
        ADDS     R5,R5,#+2
        MOVS     R0,R5
        UXTB     R0,R0
        BL       OLED_WrDat
//   59 
//   60 	OLED_WrCmd(0x2c);
        MOVS     R0,#+44
        BL       OLED_WrCmd
//   61 }
        POP      {R0,R4-R7,PC}    ;; return
//   62 
//   63 /**
//   64   * 简介
//   65   *    液晶清屏函数
//   66   * 参数
//   67   *      color     		颜色设置
//   68   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   69 void dsp_single_colour(int color)
//   70 {
dsp_single_colour:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   71  	uint8 i,j;
//   72 	Lcd_SetRegion(0,0,TFT_X_MAX-1,TFT_Y_MAX-1);
        MOVS     R3,#+159
        MOVS     R2,#+127
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       Lcd_SetRegion
//   73  	for (i=0;i<TFT_X_MAX;i++)
        MOVS     R5,#+0
        B        ??dsp_single_colour_0
//   74     	for (j=0;j<TFT_Y_MAX;j++)
//   75         	LCD_WriteData_16Bit(color);
??dsp_single_colour_1:
        MOVS     R0,R4
        UXTH     R0,R0
        BL       LCD_WriteData_16Bit
        ADDS     R6,R6,#+1
??dsp_single_colour_2:
        UXTB     R6,R6
        CMP      R6,#+160
        BLT      ??dsp_single_colour_1
        ADDS     R5,R5,#+1
??dsp_single_colour_0:
        UXTB     R5,R5
        CMP      R5,#+128
        BGE      ??dsp_single_colour_3
        MOVS     R6,#+0
        B        ??dsp_single_colour_2
//   76 }
??dsp_single_colour_3:
        POP      {R4-R6,PC}       ;; return
//   77 
//   78 
//   79 /**
//   80   * 简介
//   81   *     LCD初始化
//   82   * 注意
//   83   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 void LCD_Init(void)
//   85 {
LCD_Init:
        PUSH     {R7,LR}
//   86     spi_init(SPI_PORT, USE_PCS, MASTER, 20*1000*1000);
        LDR      R3,??DataTable1  ;; 0x1312d00
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       spi_init
//   87 //    DDRCS;
//   88     DDRDC;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+70
        BL       GpioInit
//   89 //    DDRSDIN;
//   90 //    DDROSCLK;
//   91     DDRRES;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+69
        BL       GpioInit
//   92 
//   93     CL_RES;
        MOVS     R1,#+0
        MOVS     R0,#+69
        BL       GpioSet
//   94     SystickDelayMs(5);
        MOVS     R0,#+5
        BL       SystickDelayMs
//   95     RES;
        MOVS     R1,#+1
        MOVS     R0,#+69
        BL       GpioSet
//   96     SystickDelayMs(1);
        MOVS     R0,#+1
        BL       SystickDelayMs
//   97 
//   98     //LCD Init For 1.44Inch LCD Panel with ST7735R.
//   99 	OLED_WrCmd(0x11);//Sleep exit
        MOVS     R0,#+17
        BL       OLED_WrCmd
//  100     SystickDelayMs(5);
        MOVS     R0,#+5
        BL       SystickDelayMs
//  101 
//  102 	//ST7735R Frame Rate
//  103 	OLED_WrCmd(0xB1);
        MOVS     R0,#+177
        BL       OLED_WrCmd
//  104 	OLED_WrDat(0x01);
        MOVS     R0,#+1
        BL       OLED_WrDat
//  105 	OLED_WrDat(0x2C);
        MOVS     R0,#+44
        BL       OLED_WrDat
//  106 	OLED_WrDat(0x2D);
        MOVS     R0,#+45
        BL       OLED_WrDat
//  107 
//  108 	OLED_WrCmd(0xB2);
        MOVS     R0,#+178
        BL       OLED_WrCmd
//  109 	OLED_WrDat(0x01);
        MOVS     R0,#+1
        BL       OLED_WrDat
//  110 	OLED_WrDat(0x2C);
        MOVS     R0,#+44
        BL       OLED_WrDat
//  111 	OLED_WrDat(0x2D);
        MOVS     R0,#+45
        BL       OLED_WrDat
//  112 
//  113 	OLED_WrCmd(0xB3);
        MOVS     R0,#+179
        BL       OLED_WrCmd
//  114 	OLED_WrDat(0x01);
        MOVS     R0,#+1
        BL       OLED_WrDat
//  115 	OLED_WrDat(0x2C);
        MOVS     R0,#+44
        BL       OLED_WrDat
//  116 	OLED_WrDat(0x2D);
        MOVS     R0,#+45
        BL       OLED_WrDat
//  117 	OLED_WrDat(0x01);
        MOVS     R0,#+1
        BL       OLED_WrDat
//  118 	OLED_WrDat(0x2C);
        MOVS     R0,#+44
        BL       OLED_WrDat
//  119 	OLED_WrDat(0x2D);
        MOVS     R0,#+45
        BL       OLED_WrDat
//  120 
//  121 	OLED_WrCmd(0xB4); //Column inversion
        MOVS     R0,#+180
        BL       OLED_WrCmd
//  122 	OLED_WrDat(0x07);
        MOVS     R0,#+7
        BL       OLED_WrDat
//  123 
//  124 	//ST7735R Power Sequence
//  125 	OLED_WrCmd(0xC0);
        MOVS     R0,#+192
        BL       OLED_WrCmd
//  126 	OLED_WrDat(0xA2);
        MOVS     R0,#+162
        BL       OLED_WrDat
//  127 	OLED_WrDat(0x02);
        MOVS     R0,#+2
        BL       OLED_WrDat
//  128 	OLED_WrDat(0x84);
        MOVS     R0,#+132
        BL       OLED_WrDat
//  129 	OLED_WrCmd(0xC1);
        MOVS     R0,#+193
        BL       OLED_WrCmd
//  130 	OLED_WrDat(0xC5);
        MOVS     R0,#+197
        BL       OLED_WrDat
//  131 
//  132 	OLED_WrCmd(0xC2);
        MOVS     R0,#+194
        BL       OLED_WrCmd
//  133 	OLED_WrDat(0x0A);
        MOVS     R0,#+10
        BL       OLED_WrDat
//  134 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  135 
//  136 	OLED_WrCmd(0xC3);
        MOVS     R0,#+195
        BL       OLED_WrCmd
//  137 	OLED_WrDat(0x8A);
        MOVS     R0,#+138
        BL       OLED_WrDat
//  138 	OLED_WrDat(0x2A);
        MOVS     R0,#+42
        BL       OLED_WrDat
//  139 	OLED_WrCmd(0xC4);
        MOVS     R0,#+196
        BL       OLED_WrCmd
//  140 	OLED_WrDat(0x8A);
        MOVS     R0,#+138
        BL       OLED_WrDat
//  141 	OLED_WrDat(0xEE);
        MOVS     R0,#+238
        BL       OLED_WrDat
//  142 
//  143 	OLED_WrCmd(0xC5); //VCOM
        MOVS     R0,#+197
        BL       OLED_WrCmd
//  144 	OLED_WrDat(0x0E);
        MOVS     R0,#+14
        BL       OLED_WrDat
//  145 
//  146 	OLED_WrCmd(0x36); //MX, MY, RGB mode
        MOVS     R0,#+54
        BL       OLED_WrCmd
//  147 	OLED_WrDat(0xe0); //0xc0 --- L->R U->D
        MOVS     R0,#+224
        BL       OLED_WrDat
//  148 
//  149 	//ST7735R Gamma Sequence
//  150 	OLED_WrCmd(0xe0);
        MOVS     R0,#+224
        BL       OLED_WrCmd
//  151 	OLED_WrDat(0x0f);
        MOVS     R0,#+15
        BL       OLED_WrDat
//  152 	OLED_WrDat(0x1a);
        MOVS     R0,#+26
        BL       OLED_WrDat
//  153 	OLED_WrDat(0x0f);
        MOVS     R0,#+15
        BL       OLED_WrDat
//  154 	OLED_WrDat(0x18);
        MOVS     R0,#+24
        BL       OLED_WrDat
//  155 	OLED_WrDat(0x2f);
        MOVS     R0,#+47
        BL       OLED_WrDat
//  156 	OLED_WrDat(0x28);
        MOVS     R0,#+40
        BL       OLED_WrDat
//  157 	OLED_WrDat(0x20);
        MOVS     R0,#+32
        BL       OLED_WrDat
//  158 	OLED_WrDat(0x22);
        MOVS     R0,#+34
        BL       OLED_WrDat
//  159 	OLED_WrDat(0x1f);
        MOVS     R0,#+31
        BL       OLED_WrDat
//  160 	OLED_WrDat(0x1b);
        MOVS     R0,#+27
        BL       OLED_WrDat
//  161 	OLED_WrDat(0x23);
        MOVS     R0,#+35
        BL       OLED_WrDat
//  162 	OLED_WrDat(0x37);
        MOVS     R0,#+55
        BL       OLED_WrDat
//  163 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  164 	OLED_WrDat(0x07);
        MOVS     R0,#+7
        BL       OLED_WrDat
//  165 	OLED_WrDat(0x02);
        MOVS     R0,#+2
        BL       OLED_WrDat
//  166 	OLED_WrDat(0x10);
        MOVS     R0,#+16
        BL       OLED_WrDat
//  167 
//  168 	OLED_WrCmd(0xe1);
        MOVS     R0,#+225
        BL       OLED_WrCmd
//  169 	OLED_WrDat(0x0f);
        MOVS     R0,#+15
        BL       OLED_WrDat
//  170 	OLED_WrDat(0x1b);
        MOVS     R0,#+27
        BL       OLED_WrDat
//  171 	OLED_WrDat(0x0f);
        MOVS     R0,#+15
        BL       OLED_WrDat
//  172 	OLED_WrDat(0x17);
        MOVS     R0,#+23
        BL       OLED_WrDat
//  173 	OLED_WrDat(0x33);
        MOVS     R0,#+51
        BL       OLED_WrDat
//  174 	OLED_WrDat(0x2c);
        MOVS     R0,#+44
        BL       OLED_WrDat
//  175 	OLED_WrDat(0x29);
        MOVS     R0,#+41
        BL       OLED_WrDat
//  176 	OLED_WrDat(0x2e);
        MOVS     R0,#+46
        BL       OLED_WrDat
//  177 	OLED_WrDat(0x30);
        MOVS     R0,#+48
        BL       OLED_WrDat
//  178 	OLED_WrDat(0x30);
        MOVS     R0,#+48
        BL       OLED_WrDat
//  179 	OLED_WrDat(0x39);
        MOVS     R0,#+57
        BL       OLED_WrDat
//  180 	OLED_WrDat(0x3f);
        MOVS     R0,#+63
        BL       OLED_WrDat
//  181 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  182 	OLED_WrDat(0x07);
        MOVS     R0,#+7
        BL       OLED_WrDat
//  183 	OLED_WrDat(0x03);
        MOVS     R0,#+3
        BL       OLED_WrDat
//  184 	OLED_WrDat(0x10);
        MOVS     R0,#+16
        BL       OLED_WrDat
//  185 
//  186 	OLED_WrCmd(0x2a);
        MOVS     R0,#+42
        BL       OLED_WrCmd
//  187 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  188 	OLED_WrDat(0x00+2);
        MOVS     R0,#+2
        BL       OLED_WrDat
//  189 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  190 	OLED_WrDat(0x80+2);
        MOVS     R0,#+130
        BL       OLED_WrDat
//  191 
//  192 	OLED_WrCmd(0x2b);
        MOVS     R0,#+43
        BL       OLED_WrCmd
//  193 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  194 	OLED_WrDat(0x00+3);
        MOVS     R0,#+3
        BL       OLED_WrDat
//  195 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  196 	OLED_WrDat(0x80+3);
        MOVS     R0,#+131
        BL       OLED_WrDat
//  197 
//  198 	OLED_WrCmd(0xF0); //Enable test command
        MOVS     R0,#+240
        BL       OLED_WrCmd
//  199 	OLED_WrDat(0x01);
        MOVS     R0,#+1
        BL       OLED_WrDat
//  200 	OLED_WrCmd(0xF6); //Disable ram power save mode
        MOVS     R0,#+246
        BL       OLED_WrCmd
//  201 	OLED_WrDat(0x00);
        MOVS     R0,#+0
        BL       OLED_WrDat
//  202 
//  203 	OLED_WrCmd(0x3A); //65k mode
        MOVS     R0,#+58
        BL       OLED_WrCmd
//  204 	OLED_WrDat(0x05);
        MOVS     R0,#+5
        BL       OLED_WrDat
//  205 
//  206 	OLED_WrCmd(0x29);//Display on
        MOVS     R0,#+41
        BL       OLED_WrCmd
//  207 
//  208     dsp_single_colour(LCD_backGround);
        LDR      R0,??DataTable3
        LDRH     R0,[R0, #+0]
        BL       dsp_single_colour
//  209 }
        POP      {R0,PC}          ;; return
//  210 
//  211 /**
//  212   * 简介
//  213   *    显示0608字符
//  214   * 参数
//  215   *     x 0~127，若最高位置1，则不进行定位
//  216   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  217 void LCD_showChar0608(uint16 x,uint16 y,uint8 dat)
//  218 {
LCD_showChar0608:
        PUSH     {R3-R7,LR}
        MOVS     R7,R2
//  219 	uint8 i,j;
//  220 	uint8 temp;
//  221 
//  222     if (!(x&0x80))    Lcd_SetRegion(x,y,x+5,y+7);
        LSLS     R2,R0,#+24
        BMI      ??LCD_showChar0608_0
        MOVS     R3,R1
        ADDS     R3,R3,#+7
        UXTB     R3,R3
        MOVS     R2,R0
        ADDS     R2,R2,#+5
        UXTB     R2,R2
        UXTB     R1,R1
        UXTB     R0,R0
        BL       Lcd_SetRegion
//  223 	for(i=0; i<6; i++)
??LCD_showChar0608_0:
        MOVS     R4,#+0
        B        ??LCD_showChar0608_1
??LCD_showChar0608_2:
        ADDS     R4,R4,#+1
??LCD_showChar0608_1:
        UXTB     R4,R4
        CMP      R4,#+6
        BGE      ??LCD_showChar0608_3
//  224 	{
//  225 		temp = F6x8[dat-32][i];
        LDR      R0,??DataTable3_1
        UXTB     R7,R7
        MOVS     R1,#+6
        MULS     R1,R7,R1
        ADDS     R0,R0,R1
        UXTB     R4,R4
        ADDS     R0,R0,R4
        SUBS     R0,R0,#+192
        LDRB     R5,[R0, #+0]
//  226 		for(j=0; j<8; j++)
        MOVS     R6,#+0
        B        ??LCD_showChar0608_4
//  227 		{
//  228 			if(temp&0x01)	LCD_WriteData_16Bit(LCD_pen);
//  229 			else			LCD_WriteData_16Bit(LCD_backGround);
??LCD_showChar0608_5:
        LDR      R0,??DataTable3
        LDRH     R0,[R0, #+0]
        BL       LCD_WriteData_16Bit
//  230 			temp>>=1;
??LCD_showChar0608_6:
        UXTB     R5,R5
        LSRS     R5,R5,#+1
        ADDS     R6,R6,#+1
??LCD_showChar0608_4:
        UXTB     R6,R6
        CMP      R6,#+8
        BGE      ??LCD_showChar0608_2
        LSLS     R0,R5,#+31
        BPL      ??LCD_showChar0608_5
        LDR      R0,??DataTable3_2
        LDRH     R0,[R0, #+0]
        BL       LCD_WriteData_16Bit
        B        ??LCD_showChar0608_6
//  231 		}
//  232 	}
//  233 }
??LCD_showChar0608_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x1312d00
//  234 
//  235 /**
//  236   * 简介
//  237   *    显示0608字符串
//  238   * 参数
//  239   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void LCD_showStr0608(uint16 x,uint16 y, uint8 *dat)
//  241 {
LCD_showStr0608:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  242 	uint8 k;
//  243 
//  244     for (k=0; dat[k] != '\0'; k++);
        MOVS     R4,#+0
        B        ??LCD_showStr0608_0
??LCD_showStr0608_1:
        ADDS     R4,R4,#+1
??LCD_showStr0608_0:
        UXTB     R4,R4
        LDRB     R0,[R5, R4]
        CMP      R0,#+0
        BNE      ??LCD_showStr0608_1
//  245     Lcd_SetRegion(x,y,x+6*k-1,y+7);
        MOVS     R3,R6
        ADDS     R3,R3,#+7
        UXTB     R3,R3
        MOVS     R0,R7
        MOVS     R1,#+6
        MULS     R4,R1,R4
        ADDS     R0,R0,R4
        SUBS     R2,R0,#+1
        UXTB     R2,R2
        MOVS     R1,R6
        UXTB     R1,R1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       Lcd_SetRegion
//  246     k = 0;
        MOVS     R4,#+0
        B        ??LCD_showStr0608_2
//  247 	while(dat[k] != '\0')
//  248 	{
//  249         LCD_showChar0608(x|0x80, y, dat[k]);
??LCD_showStr0608_3:
        UXTB     R4,R4
        LDRB     R2,[R5, R4]
        MOVS     R1,R6
        UXTH     R1,R1
        MOVS     R0,#+128
        ORRS     R0,R0,R7
        UXTH     R0,R0
        BL       LCD_showChar0608
//  250         k++;
        ADDS     R4,R4,#+1
//  251 	}
??LCD_showStr0608_2:
        UXTB     R4,R4
        LDRB     R0,[R5, R4]
        CMP      R0,#+0
        BNE      ??LCD_showStr0608_3
//  252 }
        POP      {R0,R4-R7,PC}    ;; return
//  253 
//  254 /**
//  255   * 简介
//  256   *     LCD显示无符号数(6*8字体)
//  257   * 参数
//  258   *     x			x轴坐标设置
//  259   *     y           y轴坐标设置
//  260   *     num         无符号数
//  261   * 返回值
//  262   *     下一个值应该放置的x坐标
//  263   * 备注
//  264   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  265 void LCD_Uint16(uint8 x, uint8 y, uint16 num)
//  266 {
LCD_Uint16:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+20
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,R2
//  267 	uint8 *ch1,ch[7], m[7];
//  268     uint8 i = 0;
        MOVS     R1,#+0
//  269 
//  270     if (num == 0)
        UXTH     R0,R0
        CMP      R0,#+0
        BNE      ??LCD_Uint16_0
//  271     {
//  272         m[0] = '0';
        MOVS     R0,#+48
        MOV      R1,SP
        STRB     R0,[R1, #+0]
//  273         m[1] = '\0';
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??LCD_Uint16_1
//  274     }
//  275     else
//  276 	{
//  277         OLED_HEXACSII(num,ch);
??LCD_Uint16_0:
        ADD      R1,SP,#+8
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  278         ch1 =&ch[1];
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+1
        B        ??LCD_Uint16_2
//  279         while (*ch1 == '0')
//  280         {
//  281             ch1++;
??LCD_Uint16_3:
        ADDS     R0,R0,#+1
//  282         }
??LCD_Uint16_2:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+48
        BEQ      ??LCD_Uint16_3
//  283         for (i=0; *ch1 != '\0'; i++)
        MOVS     R1,#+0
        B        ??LCD_Uint16_4
//  284         {
//  285             m[i] = *ch1;
??LCD_Uint16_5:
        LDRB     R2,[R0, #+0]
        MOV      R3,SP
        UXTB     R1,R1
        STRB     R2,[R3, R1]
//  286             ch1++;
        ADDS     R0,R0,#+1
//  287         }
        ADDS     R1,R1,#+1
??LCD_Uint16_4:
        LDRB     R2,[R0, #+0]
        CMP      R2,#+0
        BNE      ??LCD_Uint16_5
//  288         m[i] = '\0';
        MOVS     R0,#+0
        MOV      R2,SP
        UXTB     R1,R1
        STRB     R0,[R2, R1]
//  289     }
//  290 
//  291     LCD_showStr0608(x, y, m);	//显示数字
??LCD_Uint16_1:
        MOV      R2,SP
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        UXTB     R5,R5
        MOVS     R0,R5
        UXTH     R0,R0
        BL       LCD_showStr0608
//  292 }
        ADD      SP,SP,#+20
        POP      {R4,R5,PC}       ;; return
//  293 
//  294 /**
//  295   * 简介
//  296   *     LCD显示 有符号数 (6*8字体)
//  297   * 参数
//  298   *     x			x轴坐标设置
//  299   *     y           y轴坐标设置
//  300   *     num         有 符号数
//  301   * 备注
//  302   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  303 void LCD_Int16(uint8 x, uint8 y, int16 num)
//  304 {
LCD_Int16:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  305 	if (num < 0)
        SXTH     R5,R5
        CMP      R5,#+0
        BPL      ??LCD_Int16_0
//  306     {
//  307         num = -num;
        MOVS     R0,R5
        SXTH     R0,R0
        RSBS     R5,R0,#+0
//  308         LCD_showChar0608(x, y, '-');
        MOVS     R2,#+45
        UXTB     R6,R6
        MOVS     R1,R6
        UXTH     R1,R1
        UXTB     R4,R4
        MOVS     R0,R4
        UXTH     R0,R0
        BL       LCD_showChar0608
//  309         x += 6;
        ADDS     R4,R4,#+6
//  310     }
//  311     LCD_Uint16(x, y, num);
??LCD_Int16_0:
        MOVS     R2,R5
        UXTH     R2,R2
        MOVS     R1,R6
        UXTB     R1,R1
        MOVS     R0,R4
        UXTB     R0,R0
        BL       LCD_Uint16
//  312 }
        POP      {R4-R6,PC}       ;; return
//  313 
//  314 
//  315 /**
//  316   * 简介
//  317   *     LCD显示 float (6*8字体)
//  318   * 参数
//  319   *     x			x轴坐标设置
//  320   *     y           y轴坐标设置
//  321   *     len         显示尾数长度
//  322   * 备注
//  323   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  324 void LCD_DisplayFloat(uint8 x, uint8 y, float data, uint8 len)
//  325 {
LCD_DisplayFloat:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R7,R2
        MOVS     R6,R3
//  326     uint8 numChar[12], k=0;
        MOVS     R4,#+0
//  327 	uint8 *ch1,chH[7] = {0},chL[7] = {0};
        ADD      R0,SP,#+24
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
        ADD      R0,SP,#+16
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//  328     uint32 integer;//存储整数
//  329     float decimals;//存储小数
//  330     uint8 decimalsInterger;//小数转换为整数
//  331 
//  332     if (data < 0)
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS      ??LCD_DisplayFloat_0
//  333     {
//  334         data = -data;
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R7,R7,R0
//  335         numChar[k++] = '-';
        MOVS     R0,#+45
        ADD      R1,SP,#+4
        UXTB     R4,R4
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
//  336     }
//  337 
//  338     integer = (uint32)data;
??LCD_DisplayFloat_0:
        MOVS     R0,R7
        BL       __aeabi_f2uiz
        STR      R0,[SP, #+0]
//  339     decimals = data - (float)integer;
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R5,R0
//  340     if (data > 9999)
        MOVS     R0,R7
        LDR      R1,??DataTable3_3  ;; 0x461c3c01
        BL       __aeabi_cfrcmple
        BHI      ??LCD_DisplayFloat_1
//  341     {
//  342         OLED_HEXACSII(integer/10000,chH);
        ADD      R1,SP,#+24
        MOVS     R7,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_4  ;; 0x2710
        BL       __aeabi_uidiv
        MOVS     R1,R7
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  343         ch1 = &chH[0];
        ADD      R0,SP,#+24
        B        ??LCD_DisplayFloat_2
//  344         while (*ch1 == '0')     ch1++;
??LCD_DisplayFloat_3:
        ADDS     R0,R0,#+1
??LCD_DisplayFloat_2:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+48
        BEQ      ??LCD_DisplayFloat_3
//  345         while (*ch1 != '\0')    numChar[k++] = *(ch1++);
??LCD_DisplayFloat_4:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BEQ      ??LCD_DisplayFloat_1
        LDRB     R1,[R0, #+0]
        ADD      R2,SP,#+4
        UXTB     R4,R4
        STRB     R1,[R2, R4]
        ADDS     R0,R0,#+1
        ADDS     R4,R4,#+1
        B        ??LCD_DisplayFloat_4
//  346     }
//  347     OLED_HEXACSII(integer%10000, chL);
??LCD_DisplayFloat_1:
        ADD      R1,SP,#+16
        MOVS     R7,R1
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable3_4  ;; 0x2710
        BL       __aeabi_uidivmod
        MOVS     R0,R1
        MOVS     R1,R7
        UXTH     R0,R0
        BL       OLED_HEXACSII
//  348     ch1 = &chL[0];
        ADD      R0,SP,#+16
        B        ??LCD_DisplayFloat_5
//  349     while (*ch1 == '0')         ch1++;
??LCD_DisplayFloat_6:
        ADDS     R0,R0,#+1
??LCD_DisplayFloat_5:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+48
        BEQ      ??LCD_DisplayFloat_6
//  350     while (*ch1 != '\0')        numChar[k++] = *(ch1++);
??LCD_DisplayFloat_7:
        LDRB     R1,[R0, #+0]
        CMP      R1,#+0
        BEQ      ??LCD_DisplayFloat_8
        LDRB     R1,[R0, #+0]
        ADD      R2,SP,#+4
        UXTB     R4,R4
        STRB     R1,[R2, R4]
        ADDS     R0,R0,#+1
        ADDS     R4,R4,#+1
        B        ??LCD_DisplayFloat_7
//  351 
//  352     //存储小数点
//  353     numChar[k++] = '.';
??LCD_DisplayFloat_8:
        MOVS     R0,#+46
        ADD      R1,SP,#+4
        UXTB     R4,R4
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
        B        ??LCD_DisplayFloat_9
//  354 
//  355     //发送小数
//  356     while (len)
//  357     {
//  358         len --;
??LCD_DisplayFloat_10:
        SUBS     R6,R6,#+1
//  359         decimals *= 10;
        LDR      R0,??DataTable3_5  ;; 0x41200000
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  360         decimalsInterger = (uint8)decimals + 0x30;
        MOVS     R0,R5
        BL       __aeabi_f2iz
        ADDS     R0,R0,#+48
//  361         numChar[k++] = decimalsInterger;
        ADD      R1,SP,#+4
        UXTB     R4,R4
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
//  362         decimals -= (float)(decimalsInterger-0x30);
        UXTB     R0,R0
        SUBS     R0,R0,#+48
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R5,R0
//  363     }
??LCD_DisplayFloat_9:
        UXTB     R6,R6
        CMP      R6,#+0
        BNE      ??LCD_DisplayFloat_10
//  364     numChar[k++] = '\0';
        MOVS     R0,#+0
        ADD      R1,SP,#+4
        UXTB     R4,R4
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
//  365 
//  366     LCD_showStr0608(x, y, numChar);
        ADD      R2,SP,#+4
        ADD      R0,SP,#+40
        LDRB     R1,[R0, #+0]
        UXTH     R1,R1
        ADD      R0,SP,#+36
        LDRB     R0,[R0, #+0]
        UXTH     R0,R0
        BL       LCD_showStr0608
//  367 }
        ADD      SP,SP,#+44
        POP      {R4-R7,PC}       ;; return
//  368 
//  369 /**
//  370   * 简介
//  371   *    显示logo
//  372   * 参数
//  373   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  374 void LCD_showLogo()
//  375 {
LCD_showLogo:
        PUSH     {R3-R7,LR}
//  376   	uint8 x,y,k,temp;
//  377     uint8 *p_logo = &logo[0][0];
        LDR      R7,??DataTable3_6
//  378     Lcd_SetRegion(0,48,127,48+64-1);
        MOVS     R3,#+111
        MOVS     R2,#+127
        MOVS     R1,#+48
        MOVS     R0,#+0
        BL       Lcd_SetRegion
//  379 
//  380 	for(x=0; x<128; x++)
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        B        ??LCD_showLogo_0
??LCD_showLogo_1:
        MOV      R0,SP
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        STRB     R1,[R0, #+0]
??LCD_showLogo_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+128
        BGE      ??LCD_showLogo_2
//  381 	{
//  382 	   	for(y=0; y<8; y++)
        MOVS     R4,#+0
        B        ??LCD_showLogo_3
??LCD_showLogo_4:
        ADDS     R4,R4,#+1
??LCD_showLogo_3:
        UXTB     R4,R4
        CMP      R4,#+8
        BGE      ??LCD_showLogo_1
//  383 		{
//  384             temp = *(p_logo++);//减32因为是取模是从空格开始取得 空格在ascii中序号是32
        LDRB     R5,[R7, #+0]
        ADDS     R7,R7,#+1
//  385             for(k=0; k<8; k++)
        MOVS     R6,#+0
        B        ??LCD_showLogo_5
//  386             {
//  387                 if(temp&0x01)	LCD_WriteData_16Bit(LCD_pen);
//  388                 else			LCD_WriteData_16Bit(LCD_backGround);
??LCD_showLogo_6:
        LDR      R0,??DataTable3
        LDRH     R0,[R0, #+0]
        BL       LCD_WriteData_16Bit
//  389                 temp>>=1;
??LCD_showLogo_7:
        UXTB     R5,R5
        LSRS     R5,R5,#+1
        ADDS     R6,R6,#+1
??LCD_showLogo_5:
        UXTB     R6,R6
        CMP      R6,#+8
        BGE      ??LCD_showLogo_4
        LSLS     R0,R5,#+31
        BPL      ??LCD_showLogo_6
        LDR      R0,??DataTable3_2
        LDRH     R0,[R0, #+0]
        BL       LCD_WriteData_16Bit
        B        ??LCD_showLogo_7
//  390             }
//  391 		}
//  392 	}
//  393 }
??LCD_showLogo_2:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     LCD_backGround

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     F6x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     LCD_pen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x461c3c01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x2710

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     logo

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        END
//  394 
//  395 
// 
//     2 bytes in section .bss
//     2 bytes in section .data
//    16 bytes in section .rodata
// 1 546 bytes in section .text
// 
// 1 546 bytes of CODE  memory
//    16 bytes of CONST memory
//     4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
