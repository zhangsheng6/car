/**
  ******************************************************************************
  * COPYRIGHT NOTICE
  * Copyright (c) 2018,�����Ƽ�ѧԺ
  * All rights reserved.
  *
  * �ļ����ƣ�    key.c
  * �ļ���ʶ��
  * ժ    Ҫ��    ��������
  *
  * ��ǰ�汾��     1.0
  * ��    ��     ��־ΰ
  * ʱ    �䣺     2018��1��4�� 09:43:48
  * ��    ע��     ����û�����
  ******************************************************************************
  */

#include "key.h"

uint16 FTM_motorDuty = 3000;//���ת�ٲ���ʹ��
uint8  KEY_menuChange = 0;//����״̬��1-����
uint8  KEY_sta = 0;//����״̬��1-����
char  inductor_flag;

void KEY_Init()
{
    //����
    GpioInit(KEY_U, GPI, 0);
    GpioInit(KEY_D, GPI, 0);
    FTM_PwmMux(ftm2, ch3);//���ռ����ftm2_ch3 ����ĵ�C3
    GpioInit(KEY_L, GPI, 0);
    GpioInit(KEY_R, GPI, 0);
    GpioInit(KEY_M, GPI, 0);

    //����
    GpioInit(KEY_BO_0, GPI, 0);
    GpioInit(KEY_BO_1, GPI, 0);
    GpioInit(KEY_BO_2, GPI, 0);
    GpioInit(KEY_BO_3, GPI, 0);
}


/**
  * ���
  *     �������
  * ��ע
  *     1 - ��
  *     2 - ��
  *     3 - ��
  *     4 - ��
  *     5 - ��
  */
uint8 KEY_Scan(void)
{
    uint8 keyNum = 0;

    if (GpioGet(KEY_U) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_U) != UP)
        {
            BUZZER_ON;

            keyNum = 1;//���

            while (GpioGet(KEY_U) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_D) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_D) != UP)
        {
            BUZZER_ON;

            keyNum = 2;//���

            while (GpioGet(KEY_D) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_L) != UP)
    {
        SystickDelayMs(10);
        if (GpioGet(KEY_L) != UP)
        {
            BUZZER_ON;

            keyNum = 3;//���

            while (GpioGet(KEY_L) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_R) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_R) != UP)
        {
            BUZZER_ON;

            keyNum = 4;//���

            while (GpioGet(KEY_R) != UP);
            BUZZER_OFF;
        }
    }
    else if (GpioGet(KEY_M) != UP)
    {
        SystickDelayMs(10);

        if (GpioGet(KEY_M) != UP)
        {
            BUZZER_ON;

            keyNum = 5;//���

            while (GpioGet(KEY_M) != UP);
            BUZZER_OFF;
        }
    }

    return      keyNum;
}

/**
  * ���
  *     �������ð����˵�
  * ע��
  *     ���Ե��
  */
void KEY_TestMenu(void)
{
    switch (KEY_Scan())
    {
    case 1: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        FTM_motorDuty += 100;break;

    case 2: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        FTM_motorDuty -= 50;break;

    case 3: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        FTM_motorDuty += 10;break;

    case 4: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        FTM_motorDuty -= 5;break;

    case 5: /* ------------------------------ �� */
        switch (KEY_textSelect)
        {
        case TEXT_DEFAULT://Ĭ�� -> ��ʱ��
            KEY_textSelect = MOTOR_REV;
            reversal_L;
            reversal_R; break;

        case MOTOR_REV://��ʱ�� -> ˳ʱ��
            KEY_textSelect = MOTOR_LOC_R;
            forward_L;
            forward_R;  break;

        case MOTOR_LOC_R://˳ʱ�� -> ��˳ת��ͣ
            KEY_textSelect = MOTOR_LOC_L;
            locking_R;
            forward_L;  break;

        case MOTOR_LOC_L://��ת��ͣ -> ��˳ת��ͣ
            KEY_textSelect = MOTOR_LOC;
            locking_L;
            forward_R;   break;

        case MOTOR_LOC://��˳ת��ͣ -> ����
            KEY_textSelect = TEXT_DEFAULT;
            locking_L;
            locking_R;   break;

        default :
            KEY_textSelect = TEXT_DEFAULT;  break;
        }break;

    default :
        break;
    }
}

/**
  * ���
  *     ���� �༶�˵�
  * ע��
  *     �� --- �л��˵�
  *     �������� --- ���ɿ���
  */
void KEY_ParaMenu(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        switch (menuSelect)
        {
           case MENU:
            Chasu_Bili += 1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp += 10;
            break;

        case MENU_2:
            Speed_I_D += 10;
            break;
        case MENU_3:
          Speed_D_D+=10;
            break;
        case MENU_4:
          Speed_P+=10;
            break;
        
        case MENU_5:
          Speed_I+=10;
            break;
            
            case MENU_6:
          Speed_D+=10;
            break;
            
            case MENU_7:
                          Angle_P+=10;
//          k1+=0.5;
            break;
            
            case MENU_8:
//          k2+=0.5;
            Angle_D+=10;
            break;
            
            case MENU_9:
          k3+=0.5;
            break;
            
             case MENU_10:
          speed_set_Z+=10;
            break;
            
        case MENU_11:
          speed_set_W+=10;
            break;
            
        case MENU_12:
          angle_limit+=10;
            break;
            


        default :
            break;
        }
        break;
    case 2: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili -= 1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp -= 10;
            break;

        case MENU_2:
            Speed_I_D -= 10;
            break;
        case MENU_3:
          Speed_D_D-=10;
            break;
        case MENU_4:
          Speed_P-=10;
            break;
        
        case MENU_5:
          Speed_I-=10;
            break;
            
            case MENU_6:
          Speed_D-=10;
            break;
            
            case MENU_7:
                          Angle_P-=10;

//          k1-=0.5;
            break;
            
          case MENU_8:
          Angle_D-=10;
//          k2-=0.5;
            break;
            
            case MENU_9:
          k3-=0.5;
            break;
            
             case MENU_10:
          speed_set_Z-=10;
            break;
            
        case MENU_11:
          speed_set_W-=10;
            break;
            
        case MENU_12:
          angle_limit-=10;
            break;

        default :
            break;
        }
                    break;
    case 3: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili += 0.1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp += 1;
            break;

        case MENU_2:
            Speed_I_D += 1;
            break;
        case MENU_3:
          Speed_D_D+=1;
            break;
        case MENU_4:
          Speed_P+=1;
            break;
        
        case MENU_5:
          Speed_I+=1;
            break;
            
            case MENU_6:
          Speed_D+=1;
            break;
            
            case MENU_7:
                          Angle_P+=1;

//          k1+=0.1;
            break;
            
          case MENU_8:
//          k2+=0.1;
           Angle_D+=1;
            break;
            
            case MENU_9:
          k3+=0.1;
            break;
            
             case MENU_10:
          speed_set_Z+=1;
            break;
            
        case MENU_11:
          speed_set_W+=1;
            break;
            
        case MENU_12:
          angle_limit+=1;
            break;
            
        default :
            break;
        }
        break;
    case 4: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        switch (menuSelect)
        {
         case MENU:
            Chasu_Bili -= 0.1;
            break;
            
        case MENU_1:
            Speed_P_D_Temp -= 1;
            break;

        case MENU_2:
            Speed_I_D -= 1;
            break;
        case MENU_3:
          Speed_D_D-=1;
            break;
        case MENU_4:
          Speed_P-=1;
            break;
        
        case MENU_5:
          Speed_I-=1;
            break;
            
            case MENU_6:
          Speed_D-=1;
            break;
            
            case MENU_7:
                          Angle_P-=1;

//          k1-=0.1;
            break;
            
         case MENU_8:
//          k2-=0.1;
         Angle_D-=1;
            break;
            
            case MENU_9:
          k3-=0.1;
            break;
            
             case MENU_10:
          speed_set_Z-=1;
            break;
            
        case MENU_11:
          speed_set_W-=1;
            break;
            
        case MENU_12:
          angle_limit-=1;
            break;

        default :
            break;
        }
        break;
    case 5: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 13)//logo �� �˵���ʾֻһ��
        {
//          menuSelect=1;
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}



/**
  * ���
  *     �༶�˵� ��ʾ
  
* ע��
  *     ���겻Ҫ���� Ԥ����ʾ������OLED_Menu���޸�,Ĭ��ǰ4���ַ�������ʾ��־
  *     ��ʾ��������
  *         �˵�     x   y --- x  y
  *           1      1   2    66  4  ����ʾ 11���ַ���3��
  *           2      68  2   126  4  ����ʾ 9 ���ַ�,3��
  *           3      1   6   126  7  ����ʾ 21���ַ�,2��
  *           4      1   6   126  7  ����ʾ 21���ַ�,2��
  */
void KEY_ParaMenuDisplay(void)
{
    switch (menuSelect) 
    {
    case MENU:
//OLED_DisplayFloat(35, 0, Chasu_Bili, 2);//OLED��ʾ float  
    break;
    
    case MENU_1://����ʾ����ʼ���� + Ԥ����ʾÿ���ַ����*Ԥ����ʾ���ַ����� + һ���հ׵�
OLED_DisplayFloat(1+6*3+1, 2,Speed_P_D_Temp, 1);//OLED��ʾ float  
   break;
   
   case MENU_2:
OLED_DisplayFloat(1+6*3+1, 3,Speed_I_D, 3);//3��11��
   break;
   
    case MENU_3:
OLED_DisplayFloat(1+6*3+1, 4,Speed_D_D, 1);//4��11��
   break;
   
   case MENU_4:
OLED_DisplayFloat(68+6*3+1, 2,Speed_P, 1);//3��2��� 
   break;
 
    case MENU_5:
OLED_DisplayFloat(68+6*3+1, 3,Speed_I, 3);//3��2���
    break;

   case MENU_6:
OLED_DisplayFloat(68+6*3+1, 4,Speed_D, 1);//3��2��� 
   break;
   
    case MENU_7:     
OLED_DisplayFloat(1+6*3+1, 6,Angle_P, 1);//OLED��ʾ float  
        break;
        
   case MENU_8:     
OLED_DisplayFloat(1+6*3+1, 7,Angle_D, 1);//OLED��ʾ float  
        break;
        
           case MENU_9:     
//OLED_DisplayFloat(1+6*3+1, 8,k3, 3);//OLED��ʾ float  
        break;
        
     
        
    case MENU_10://��4���
OLED_DisplayFloat(68+6*3+1,6,speed_set_Z, 2);//OLED��ʾ float  
//OLED_DisplayFloat(68+6*3+1,6,k1, 2);//OLED��ʾ float  
        break;
        
    case MENU_11://��4���
OLED_DisplayFloat(68+6*3+1,7,speed_set_W, 2);//OLED��ʾ float  
//OLED_DisplayFloat(68+6*3+1,7,k2, 2);//OLED��ʾ float  
        break;
        
   case MENU_12://��4���
//OLED_DisplayFloat(68+6*3+1,8,angle_limit, 0);//OLED��ʾ float  
        break;

 
        
    default :
        break;
    }
}








