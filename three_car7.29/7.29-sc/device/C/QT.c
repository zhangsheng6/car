
#include "Variable.h"
#include "common.h"
#include "allHead.h"
uint8 chice = 0;    //����ʹ��
uint8 c=0;
uint8 cars=0;
uint8 sure=0;


/**
  * ���
  *     �޶�Ӧģ���IO�ڳ�ʼ������
  * ע��
  */
void IoInit()
{
    //ָʾ��
    GpioInit(LED_0, GPO, 1);
    GpioInit(LED_1, GPO, 1);
    GpioInit(LED_2, GPO, 1);
    GpioInit(LED_3, GPO, 1);

    //������
    GpioInit(BUZZER, GPO, 0);

    //�������
    GpioInit(ENL_L, GPO, 0);
    GpioInit(ENL_R, GPO, 0);
    GpioInit(ENR_L, GPO, 0);
    GpioInit(ENR_R, GPO, 0);

    //�ⷽ��
    GpioInit(DIR_L, GPI, 0);
    GpioInit(DIR_R, GPI, 0);
}


/**
  * ���
  *     С��״̬����
  * ע��
  */

//void PlanSet(void)
//{
//    if(c==1)
//    {
//      c=0;
//      cars++;
//      sure=1;
//    }
//    
//    if(sure==1)
//    {
//      sure=0;
//      
//      if(cars/2==0)//����
//      {
//         ENABLE_INTERRUPTS;  //�����ж�
//         OLED_MenuFlicker();//�ٶȿ��ƸĲ�����ʾ�˵�
//         LED_3_TURN;
//      }
//    
//      if(cars/2==1)//����
//      {
//        locking_L;
//        locking_R;
//        PIT_DisableIrq();//�� PIT �ж�
//        OLED_MenuFlicker();//�ٶȿ��ƸĲ�����ʾ�˵�
//        menuSelect = LOGO;
//        OLED_MenuFlicker();
//      }
//    }
//    
//    
//
////    
// }
//    
    
void PlanSet(void)
{
    switch (carStatus)
    {
    case NORMAL:
        break;

    case STOP:
        locking_L;
        locking_R;
//        BUZZER_ON;
        PIT_DisableIrq();//�� PIT �ж�

        menuSelect = LOGO;
        OLED_MenuFlicker();
        break;

    default :
        break;
    }
}
