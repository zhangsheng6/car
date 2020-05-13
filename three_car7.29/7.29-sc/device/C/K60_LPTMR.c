#include "K60_LPTMR.h"

unsigned int cmp_value=65535;


//---------------------------------------����9.3 �� LPTMRģ��
/**
  * ���
  *     LPTMR�͹��Ķ�ʱ����ʼ��
  * ע��
  *     1��δ��֤��13��ѧ��������
  *       ����Z��оƬ��PORTx_PCRn�Ĵ�����MUX�θ�λֵ��δ���壬
  *       ���Ƚ������㣬��������ѡ����
  *     2
  *       �˴�δ��������Դ
  */
void LPTMR_Init()
{
    //��ʱ��
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK
              |  SIM_SCGC5_PORTC_MASK;
    SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;

    //PTA_19, PTC_5
    PORTA_PCR19 =   PORT_PCR_MUX(0x6);  //���Ÿ���6,LPT0_ALT1
    PORTC_PCR5 &= ~(PORT_PCR_MUX_MASK); //�������ƺ���Ҫ����Ϊ��λ0��������
    PORTC_PCR5 |=   PORT_PCR_MUX(0x4);  //���Ÿ���4,LPT0_ALT2

    //�Ĵ�������
    LPTMR0_CSR = 0x00;
    LPTMR0_PSR = 0x00;
    LPTMR0_CMR = 0x00;

    /* �Ĵ������� -------------------------------------------------------------- */
    //��ʼ��ǰ�����Ƚ�ֹ
    LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;

    //���ɼ���,ÿ����ʱ���Ƚϱ�־���� 1 ʱ��LPTMR �������Ĵ�����λ��
    LPTMR0_CSR &= ~LPTMR_CSR_TFC_MASK;

    //ѡ��Ϊ���������ģʽ
    LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;

    //ѡ��1KHz��ʱ�ӣ�Ԥ��Ƶ�Ƶ�
    LPTMR0_PSR = LPTMR_PSR_PCS(1)| LPTMR_PSR_PBYP_MASK;

    //���ñȽ�ֵΪ���
    LPTMR0_CMR = LPTMR_CMR_COMPARE(0xFFFF);

//    //ѡ������Դ
//    LPTMR0_CSR |= LPTMR_CSR_TPS(0x1)
//                | LPTMR_CSR_TPS(0x2);

    //���ż���ѡ�������ؼ���
    LPTMR0_CSR &= ~LPTMR_CSR_TPP_MASK;

    //ʹ��LPTMR����
    LPTMR0_CSR |= LPTMR_CSR_TEN_MASK;
    /* �Ĵ������� -------- END ------------------------------------------------- */
}

/**
  * ���
  *     ѡ������Դ����
  * ����
  *     channel --- ���� --- ��Ӧ
  *        0       PTA_19   LPT0_ALT1
  *        1       PTC_5    LPT0_ALT2
  */
void Cnt0_Cnt1_Choose(uint8 channel)
{
    LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;     //��ʼ��ǰ�����Ƚ�ֹ

    switch (channel)
    {
    case 0:
        LPTMR0_CSR  = LPTMR_CSR_TPS(0x01); //����Դѡ�� PTA_19
        LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;  //�������ģʽ
        break;
    case 1:
        LPTMR0_CSR  = LPTMR_CSR_TPS(0x02); //����Դѡ�� PTC_5
        LPTMR0_CSR |= LPTMR_CSR_TMS_MASK;  //�������ģʽ
        break;
    default: break;
    }

    LPTMR0_CSR |= LPTMR_CSR_TEN_MASK;     //ʹ��LPTMR����
}
