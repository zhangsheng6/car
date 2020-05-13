/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�     ftm.c
  * �ļ���ʶ��
  * ժ    Ҫ��     PWM������
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1           ��8�� 16:43:36
  * ��    ע��     FtmPwmMux������KEA128_ftm.c�г�ʼ����������
  ******************************************************************************
  */
#include "ftm.h"

//ȫ�ֱ�������
//uint32_t LPLD_FTM1_MOD;
//uint32_t LPLD_FTM2_MOD;
uint16 g_mod; //PWM��������ֵ


/**
  * ���
  *     FTM ���Ÿ��� ʱ�ӿ���
  * ����
  *     ftmn --- FTMģ��
  *       ftm0
  *       ftm1
  *       ftm2
  *     ch --- ͨ��
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
        SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //��ʱ��
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
        SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //��ʱ��
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
        SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //����FTM����ʱ��
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
  * ���
  *     PWM��ʼ��
  * ����
  *     ftmn --- FTMģ��
  *       ftm0
  *       ftm1
  *       ftm2
  *     ch --- ͨ��
  *       ch0,
  *       ch0,
  *       ch1,
  *       ch2,
  *       ch3,
  *       ch4,
  *       ch5,
  *     freqKhz
  *       ����ֵ = ϵͳƵ�� / ��Ƶϵ�� / Ƶ��
  *     duty --- ռ�ձ�
  *       0-8000
  * ��ע
  *     ���Ͽ��� δʹ�ܣ�POLδ����
  */
void FTM_PwmInit(ftmX ftmn, ftmCh ch, uint8 freqKhz, uint32 duty)
{
    uint32 clk_hz;
    uint16 cv;

    FTM_PwmMux(ftmn, ch);  //��ʱ�ӣ����Ÿ���

    //Ƶ��
    clk_hz = ftm_clk_khz*1000;
    g_mod = clk_hz / 1 / (freqKhz*1000);
    g_mod = g_mod - 1;

    //ռ�ձ�
    switch (ftmn)
    {
      case ftm0:
        cv = (duty * (g_mod + 1)) / FTM0_PRECISON;
        break;

      case ftm1:
        cv = (duty * (g_mod + 1)) / FTM1_PRECISON;
        break;

      case ftm2:
        cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON����
        break;
      default:
        break;
    }


//    FTMX[ftmn]->MODE |= FTM_MODE_WPDIS_MASK; //��д����

    FTMX[ftmn]->MOD = g_mod;                  //����PWM����

    //���ض��룬ƥ��ʱ�����
    FTMX[ftmn]->CONTROLS[ch].CnSC &= ~FTM_CnSC_ELSA_MASK;
    FTMX[ftmn]->CONTROLS[ch].CnSC |= FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;

    // set FTM clock to system clock
    FTMX[ftmn]->SC = ( 0
                       //| FTM_SC_CPWMS_MASK       //0�����ض��� ��1�� ���Ķ��� ��ע���˱�ʾ 0��
                       | FTM_SC_PS(0)              //��Ƶ���ӣ���Ƶϵ�� = 2^ps
                       | FTM_SC_CLKS(1)            //ʱ��ѡ�� 0��ûѡ��ʱ�ӣ����ã� 1��ϵͳʱ�ӣ� 2���̶�ʱ�ӣ� 3���ⲿʱ��
                       //| FTM_SC_TOIE_MASK        //����ж�ʹ�ܣ�ע���˱�ʾ ��ֹ����жϣ�
                     );

    FTMX[ftmn]->CNTIN = 0;                         //��������ֵ
    FTMX[ftmn]->CONTROLS[ch].CnV = cv;             //����ռ�ձ�
    FTMX[ftmn]->CNT = 0;                           //��������д����ֵ�������CNTIN��ֵ

//    FTMX[ftmn]->FMS |= FTM_FMS_WPEN_MASK;          //��д����

}

/**
  * ���
  *     ռ�ձ��޸�
  * ����
  *     ftmn --- ֻ��ftm2��Ч
  *       ftmX0
  *       ftmX1
  *       ftmX2
  *     ch --- ֻ������ch0��ch1
  *       ch0
  *       ch1
  *     freqKhz
  *       ����ֵ = ����Ƶ�� / ��Ƶϵ�� / Ƶ��
  *     duty --- ռ�ձ�
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
        cv = (duty * (g_mod + 1)) / FTM2_PRECISON;//FTM2_PRECISON����
        break;
      default:
        break;
    }

    FTMX[ftmn]->CONTROLS[ch].CnV = cv;       //����ռ�ձ�
}


/**
  * ���
  *     �������Ÿ���
  */
void FTM_SpeedMux(ftmX ftmn)
{
    switch(ftmn)
    {
        case ftm0:
        {
            SIM->SCGC |= SIM_SCGC_FTM0_MASK;                //��ʱ��
            SIM->PINSEL &= ~SIM_PINSEL_FTM0CLKPS_MASK;
            if(FTM0_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(0);     //ѡ���ⲿʱ���������� A5
            }

            else if(FTM0_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(1);     //ѡ���ⲿʱ���������� E0
            }

            else if(FTM0_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM0CLKPS(2);     //ѡ���ⲿʱ���������� E7
            }
        }break;

        case ftm1:
        {
            SIM->SCGC |= SIM_SCGC_FTM1_MASK;                //����FTM����ʱ��
            SIM->PINSEL &= ~SIM_PINSEL_FTM1CLKPS_MASK;      //����ⲿʱ������ѡ��
            if(FTM1_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(0);     //ѡ���ⲿʱ���������� A5
            }

            else if(FTM1_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(1);     //ѡ���ⲿʱ���������� E0
            }

            else if(FTM1_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM1CLKPS(2);     //ѡ���ⲿʱ���������� E7
            }
        }break;

        case ftm2:
        {
            SIM->SCGC |= SIM_SCGC_FTM2_MASK;                //����FTM����ʱ��
            SIM->PINSEL &= ~SIM_PINSEL_FTM2CLKPS_MASK;      //����ⲿʱ������ѡ��
            FTM2->CNTIN = 0;
            if(FTM2_COUNT_PIN == A5)
            {
                prot_pull(A5);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(0);     //ѡ���ⲿʱ���������� A5
            }

            else if(FTM2_COUNT_PIN == E0)
            {
                prot_pull(E0);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(1);     //ѡ���ⲿʱ���������� E0
            }

            else if(FTM2_COUNT_PIN == E7)
            {
                prot_pull(E7);
                SIM->PINSEL |= SIM_PINSEL_FTM2CLKPS(2);     //ѡ���ⲿʱ���������� E7
            }
        }break;

    }
}

/**
  * ���
  *     ���ٳ�ʼ��
  * ����
  *     ftmn --- FTMģ��
  *       ftm0
  *       ftm1
  *       ftm2
  */
void FTM_SpeedInit(ftmX ftmn)
{
    FTM_SpeedMux(ftmn);                                    //���Ÿ��� �������� ������Ӧ����ʱ��

    FTMX[ftmn]->SC |= FTM_SC_PS(0);	                        //��Ƶϵ��
    FTMX[ftmn]->SC |= FTM_SC_CLKS(3);                       //ѡ���ⲿʱ����ΪFTM����ʱ��

    FTMX[ftmn]->CNT = 0;                                    //���س�ʼ��ֵ
}

/**
  * ���
  *     ��ȡ�ٶ�ֵ
  */
uint16 FTM_SpeedGet(ftmX ftmn)
{
    return FTMX[ftmn]->CNT ;
}

/**
  * ���
  *     ���� ������0
  */
void FTM_CountClean(ftmX ftmn)
{
    FTMX[ftmn]->CNT = 0;
}




