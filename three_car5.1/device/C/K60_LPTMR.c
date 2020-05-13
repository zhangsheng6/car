#include "K60_LPTMR.h"

unsigned int cmp_value=65535;


//---------------------------------------超核9.3 库 LPTMR模块
/**
  * 简介
  *     LPTMR低功耗定时器初始化
  * 注意
  *     1（未验证，13级学长所留）
  *       不带Z的芯片，PORTx_PCRn寄存器的MUX段复位值是未定义，
  *       需先将其置零，再配置所选复用
  *     2
  *       此处未配置输入源
  */
void LPTMR_Init()
{
    //开时钟
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK
              |  SIM_SCGC5_PORTC_MASK;
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;

    //PTA_19, PTC_5
    PORTA_PCR19 =   PORT_PCR_MUX(0x6);  //引脚复用6,LPT0_ALT1
    PORTC_PCR5 &= ~(PORT_PCR_MUX_MASK); //此引脚似乎需要先人为复位0才能配置
    PORTC_PCR5 |=   PORT_PCR_MUX(0x4);  //引脚复用4,LPT0_ALT2

    //寄存器清零
    LPTMR0_CSR = 0x00;
    LPTMR0_PSR = 0x00;
    LPTMR0_CMR = 0x00;

    /* 寄存器配置 -------------------------------------------------------------- */
    //初始化前必须先禁止
    LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;

    //自由计数,每当定时器比较标志被置 1 时，LPTMR 计数器寄存器复位。
    LPTMR0_CSR &= ~LPTMR_CSR_TFC_MASK;

    //选择为脉冲计数器模式
    LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;

    //选择1KHz的时钟，预分频绕道
    LPTMR0_PSR = LPTMR_PSR_PCS(1)| LPTMR_PSR_PBYP_MASK;

    //设置比较值为最大
    LPTMR0_CMR = LPTMR_CMR_COMPARE(0xFFFF);

//    //选择输入源
//    LPTMR0_CSR |= LPTMR_CSR_TPS(0x1)
//                | LPTMR_CSR_TPS(0x2);

    //引脚极性选择上升沿计数
    LPTMR0_CSR &= ~LPTMR_CSR_TPP_MASK;

    //使能LPTMR计数
    LPTMR0_CSR |= LPTMR_CSR_TEN_MASK;
    /* 寄存器配置 -------- END ------------------------------------------------- */
}

/**
  * 简介
  *     选择输入源开启
  * 参数
  *     channel --- 开启 --- 对应
  *        0       PTA_19   LPT0_ALT1
  *        1       PTC_5    LPT0_ALT2
  */
void Cnt0_Cnt1_Choose(uint8 channel)
{
    LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;     //初始化前必须先禁止

    switch (channel)
    {
    case 0:
        LPTMR0_CSR  = LPTMR_CSR_TPS(0x01); //输入源选择 PTA_19
        LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;  //脉冲计数模式
        break;
    case 1:
        LPTMR0_CSR  = LPTMR_CSR_TPS(0x02); //输入源选择 PTC_5
        LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;  //脉冲计数模式
        break;
    default: break;
    }

    LPTMR0_CSR |= LPTMR_CSR_TEN_MASK;     //使能LPTMR计数
}
