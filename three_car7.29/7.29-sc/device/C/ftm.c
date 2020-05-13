/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,华北科技学院
  * All rights reserved.
  *
  * 文件名称：     ftm.c
  * 文件标识：
  * 摘    要：     PWM波配置
  *
  * 当前版本：     1.0
  * 负    责：     韩志伟
  * 时    间：     2018年1           月8日 16:43:36
  * 备    注：     FtmPwmMux函数被KEA128_ftm.c中初始化函数调用
  ******************************************************************************
  */
#include "ftm.h"

//全局变量定义
//uint32_t LPLD_FTM1_MOD;
//uint32_t LPLD_FTM2_MOD;
uint16 g_mod; //PWM周期置入值


/**
  * 简介
  *     FTM 引脚复用 时钟开启
  * 参数
  *     ftmn --- FTM模块
  *       ftm0
  *       ftm1
  *       ftm2
  *     ch --- 通道
  *       ch0
  *       ch0,
  *       ch1,
  *       ch2,
  *       ch3,
  *       ch4,
  *       ch5,
  */
void FTM_PwmMux(ftmX ftmn, ftmCh ch)
{
    switch (ftmn)
    {
      case ftm0:
        SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //开时钟
        switch(ch)
        {
          case ch0:
            if(FTM0_CH0_PIN == A0)
            {
                SIM->PINSEL &= ~SIM_PINSEL_FTM0PS0_MASK;
            }
            else if(FTM0_CH0_PIN == B2)
            {
                SIM->PINSEL |= SIM_PINSEL_FTM0PS0_MASK;
            }
            break;
          case ch1:
            if(FTM0_CH1_PIN == A1)
            {
                SIM->PINSEL &= ~SIM_PINSEL_FTM0PS1_MASK;
            }
            else if(FTM0_CH1_PIN == B3)
            {
                SIM->PINSEL |= SIM_PINSEL_FTM0PS1_MASK;
            }
            break;

          default :
            break;
        }
        break;

      case ftm1:
        SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //开时钟
        switch(ch)
        {
          case ch0:
            if(FTM1_CH0_PIN == C4)
            {
                SIM->PINSEL &= ~SIM_PINSEL_FTM1PS0_MASK;
            }
            else if(FTM1_CH0_PIN == H2)
            {
                SIM->PINSEL |= SIM_PINSEL_FTM1PS0_MASK;
            }
            break;
          case ch1:
            if(FTM1_CH1_PIN == C5)
            {
                SIM->PINSEL &= ~SIM_PINSEL_FTM1PS1_MASK;
            }
            else if(FTM1_CH1_PIN == E7)
            {
                SIM->PINSEL |= SIM_PINSEL_FTM1PS1_MASK;
            }
            break;
          default :
            break;
        }
        break;

      case ftm2:
        SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //开启FTM外设时钟
        switch(ch)
        {
          case ch0:
            SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS0_MASK;
            if(FTM2_CH0_PIN == C0)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(0);
            }
            else if(FTM2_CH0_PIN == H0)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(1);
            }
            else if(FTM2_CH0_PIN == F0)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS0(2);
            }
            break;

          case ch1:
            SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS1_MASK;
            if(FTM2_CH1_PIN == C1)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(0);
            }
            else if(FTM2_CH1_PIN == H1)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(1);
            }
            else if(FTM2_CH1_PIN == F1)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS1(2);
            }
            break;

          case ch2:
            SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS2_MASK;
            if(FTM2_CH2_PIN == C2)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(0);
            }
            else if(FTM2_CH2_PIN == D0)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(1);
            }
            else if(FTM2_CH2_PIN == G4)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS2(2);
            }
            break;

          case ch3:
            SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS3_MASK;
            if(FTM2_CH3_PIN == C3)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(0);
            }
            else if(FTM2_CH3_PIN == D1)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(1);
            }
            else if(FTM2_CH3_PIN == G5)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS3(2);
            }
            break;

          case ch4:
            if(FTM2_CH4_PIN == B4)
            {
                SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS4_MASK;
            }
            else if(FTM2_CH4_PIN == G6)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS4_MASK;
            }
            break;

          case ch5:
            if(FTM2_CH5_PIN == B5)
            {
                SIM->PINSEL1 &= ~SIM_PINSEL1_FTM2PS5_MASK;
            }
            else if(FTM2_CH5_PIN == G7)
            {
                SIM->PINSEL1 |= SIM_PINSEL1_FTM2PS5_MASK;
            }
            break;

          default :
            break;
        }
        break;

      default :
        break;
    }
}

/**
  * 简介
  *     PWM初始化
  * 参数
  *     ftmn --- FTM模块
  *       ftm0
  *       ftm1
  *       ftm2
  *     ch --- 通道
  *       ch0,
  *       ch0,
  *       ch1,
  *       ch2,
  *       ch3,
  *       ch4,
  *       ch5,
  *     freqKhz
  *       计数值 = 系统频率 / 分频系数 / 频率
  *     duty --- 占空比
  *       0-8000
  * 备注
  *     故障控制 未使能，POL未配置
  */
void FTM_PwmInit(ftmX ftmn, ftmCh ch, uint8 freqKhz, uint32 duty)
{
    uint32 clk_hz;
    uint16 cv;

    FTM_PwmMux(ftmn, ch);  //开时钟，引脚复用

    //频率
    clk_hz = ftm_clk_khz*1000;
    g_mod = clk_hz / 1 / (freqKhz*1000);
    g_mod = g_mod - 1;

    //占空比
    switch (ftmn)
    {
      case ftm0:
        cv = (duty * (g_mod + 1)) / FTM0_PRECISON;
        break;

      case ftm1:
        cv = (duty * (g_mod + 1)) / FTM1_PRECISON;
        break;

      case ftm2:
        cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON精度
        break;
      default:
        break;
    }


//    FTMX[ftmn]->MODE |= FTM_MODE_WPDIS_MASK; //关写保护

    FTMX[ftmn]->MOD = g_mod;                  //设置PWM周期

    //边沿对齐，匹配时输出低
    FTMX[ftmn]->CONTROLS[ch].CnSC &= ~FTM_CnSC_ELSA_MASK;
    FTMX[ftmn]->CONTROLS[ch].CnSC |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;

    // set FTM clock to system clock
    FTMX[ftmn]->SC = ( 0
                       //| FTM_SC_CPWMS_MASK       //0：边沿对齐 ，1： 中心对齐 （注释了表示 0）
                       | FTM_SC_PS(0)              //分频因子，分频系数 = 2^ps
                       | FTM_SC_CLKS(1)            //时钟选择， 0：没选择时钟，禁用； 1：系统时钟； 2：固定时钟； 3：外部时钟
                       //| FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断）
                     );

    FTMX[ftmn]->CNTIN = 0;                         //计数器初值
    FTMX[ftmn]->CONTROLS[ch].CnV = cv;             //设置占空比
    FTMX[ftmn]->CNT = 0;                           //计数器，写任意值都会加载CNTIN的值

//    FTMX[ftmn]->FMS |= FTM_FMS_WPEN_MASK;          //开写保护

}

/**
  * 简介
  *     占空比修改
  * 参数
  *     ftmn --- 只有ftm2有效
  *       ftmX0
  *       ftmX1
  *       ftmX2
  *     ch --- 只配置了ch0和ch1
  *       ch0
  *       ch1
  *     freqKhz
  *       计数值 = 总线频率 / 分频系数 / 频率
  *     duty --- 占空比
  *       0-6000
  */
void FTM_PwmDuty(ftmX ftmn, ftmCh ch, uint32 duty)
{
    uint16 cv;

    switch (ftmn)
    {
      case ftm0:
        cv = (duty * (g_mod + 1)) / FTM0_PRECISON;
        break;

      case ftm1:
        cv = (duty * (g_mod + 1)) / FTM1_PRECISON;
        break;

      case ftm2:
        cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON精度
        break;
      default:
        break;
    }

    FTMX[ftmn]->CONTROLS[ch].CnV = cv;       //设置占空比
}


/**
  * 简介
  *     测速引脚复用
  */
void FTM_SpeedMux(ftmX ftmn)
{
    switch(ftmn)
    {
        case ftm0:
        {
            SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //开时钟
            SIM->PINSEL &= ~SIM_PINSEL_FTM0CLKPS_MASK;
            if(FTM0_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(0);     //选择外部时钟输入引脚 A5
            }

            else if(FTM0_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(1);     //选择外部时钟输入引脚 E0
            }

            else if(FTM0_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(2);     //选择外部时钟输入引脚 E7
            }
        }break;

        case ftm1:
        {
            SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //开启FTM外设时钟
            SIM->PINSEL &= ~SIM_PINSEL_FTM1CLKPS_MASK;      //清除外部时钟引脚选择
            if(FTM1_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(0);     //选择外部时钟输入引脚 A5
            }

            else if(FTM1_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(1);     //选择外部时钟输入引脚 E0
            }

            else if(FTM1_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(2);     //选择外部时钟输入引脚 E7
            }
        }break;

        case ftm2:
        {
            SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //开启FTM外设时钟
            SIM->PINSEL &= ~SIM_PINSEL_FTM2CLKPS_MASK;      //清除外部时钟引脚选择
            FTM2->CNTIN = 0;
            if(FTM2_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(0);     //选择外部时钟输入引脚 A5
            }

            else if(FTM2_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(1);     //选择外部时钟输入引脚 E0
            }

            else if(FTM2_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(2);     //选择外部时钟输入引脚 E7
            }
        }break;

    }
}

/**
  * 简介
  *     测速初始化
  * 参数
  *     ftmn --- FTM模块
  *       ftm0
  *       ftm1
  *       ftm2
  */
void FTM_SpeedInit(ftmX ftmn)
{
    FTM_SpeedMux(ftmn);                                    //引脚复用 开启上拉 开启对应外设时钟

    FTMX[ftmn]->SC |= FTM_SC_PS(0);	                        //分频系数
    FTMX[ftmn]->SC |= FTM_SC_CLKS(3);                       //选择外部时钟作为FTM输入时钟

    FTMX[ftmn]->CNT = 0;                                    //加载初始化值
}

/**
  * 简介
  *     获取速度值
  */
uint16 FTM_SpeedGet(ftmX ftmn)
{
    return FTMX[ftmn]->CNT ;
}

/**
  * 简介
  *     测速 计数清0
  */
void FTM_CountClean(ftmX ftmn)
{
    FTMX[ftmn]->CNT = 0;
}




