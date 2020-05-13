#include "Variable.h"
#include "common.h"
#include "allHead.h"

/**
  * ���
  *     ���� �༶�˵�
  * ע��
  *     �� --- �л��˵�
  *     �������� --- ���ɿ���
  */
void LCD_Key_ZS(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
        switch (menuSelect)
        {
           case MENU:
            zs_car=1;
            break; 
        case MENU_1:
            speed_set += 10;
            break;
            
        case MENU_2:
            Direction_P += 10;
            break;
            
  case MENU_3:
            Direction_P2+=10;
//          Chazhi+=10;
            break;
            
        case MENU_4:
            Angle_D+=10;  
            break;          
            
        case MENU_5:
            Speed_P+=10;
            break;
        
        case MENU_6:
          Speed_I+=10;
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
            zs_car=0;
            break; 
        case MENU_1:
            speed_set -= 10;
            break;
            
        case MENU_2:
            Direction_P -= 10;
            break;
            
  case MENU_3:
            Direction_P2-=10;
//          Chazhi+=10;
            break;
            
        case MENU_4:
            Angle_D-=10;  
            break;          
            
        case MENU_5:
            Speed_P-=10;
            break;
        
        case MENU_6:
          Speed_I-=10;
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
            zs_car=1;
            break; 
        case MENU_1:
            speed_set += 1;
            break;
            
        case MENU_2:
            Direction_P += 1;
            break;
            
  case MENU_3:
            Direction_P2+=1;
//          Chazhi+=10;
            break;
            
        case MENU_4:
            Angle_D+=1;  
            break;          
            
        case MENU_5:
            Speed_P+=1;
            break;
        
        case MENU_6:
          Speed_I+=1;
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
            zs_car=0;
            break; 
        case MENU_1:
            speed_set-= 1;
            break;
            
        case MENU_2:
            Direction_P -= 1;
            break;
            
  case MENU_3:
            Direction_P2-=1;
//          Chazhi+=10;
            break;
            
        case MENU_4:
            Angle_D-=1;  
            break;          
            
        case MENU_5:
            Speed_P-=1;
            break;
        
        case MENU_6:
          Speed_I-=1;
            break;

        default :
            break;
        }
        break;
    case 5: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 7)//logo �� �˵���ʾֻһ��
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}





//-------������ɫ----------
//#define RED     	0XF800    //��ɫ
//#define GREEN   	0X07E0    //��ɫ
//#define BLUE    	0X001F    //��ɫ
//#define BRED    	0XF81F    //��ɫ
//#define GRED    	0XFFE0    //��ɫ
//#define GBLUE   	0X07FF    //����
//#define BLACK   	0X0000    //��ɫ
//#define WHITE   	0XFFFF    //��ɫ
//#define YELLOW  	0xFFE0    //��ɫ
//
//
//
//extern uint16 LCD_pen;//����ɫ
//extern uint16 LCD_backGround;//������ɫ


void LCD_Name_ZS(void)
{
 LCD_showStr0608(1,10, "Speed:");
 LCD_showStr0608(1,20, "P_Dir:");
 LCD_showStr0608(1,30, "P_Cha:");
 LCD_showStr0608(1,40, "D_Ang:");
 LCD_showStr0608(1,50, "P_Spe:");
 LCD_showStr0608(1,60, "I_Spe:");

   
}

void LCD_Data_ZS(void)
{
  uint16 LCD_pen_one = RED;//����ɫ
  uint16 LCD_pen_other = BLACK;//����ɫ
  int menuSelect_old = menuSelect;//�˵�ѡ��
//uint16 LCD_pen = BLACK;//����ɫ

  
      LCD_pen=LCD_pen_one ;

    switch (menuSelect) 
    {
      
    case MENU:
    if(zs_car==1)
       LCD_showStr0608(1,0, "RUN");
    else
       LCD_showStr0608(1,0, "STOP");
    break;
   
    case MENU_1:
LCD_DisplayFloat(40, 10, speed_set, 1);
    break;  
    
    case MENU_2:
LCD_DisplayFloat(40, 20, Direction_P, 1);
    break;
    
       case MENU_3:
LCD_DisplayFloat(40, 30, Direction_P2, 1);
//LCD_DisplayFloat(40, 30, Chazhi, 1);         
    break;
    
    case MENU_4:
LCD_DisplayFloat(40, 40, Angle_D, 1);
    break;
    
       case MENU_5:
LCD_DisplayFloat(40, 50, Speed_P, 1);
    break;
    
       case MENU_6:
LCD_DisplayFloat(40, 60, Speed_I, 1);
    break;
    
//        case MENU_6:
//LCD_DisplayFloat(40, 60, Direction_P2, 1);
//    break;
//    
//        case MENU_7:
//LCD_DisplayFloat(40, 70, Angle_P, 1);
//    break;
//    
//        case MENU_8:
//LCD_DisplayFloat(40, 80, Angle_D, 1);
//    break;
   
    default :
        break;
    }
 //�����ݱ�ɹ�ɫ   
  menuSelect_old = menuSelect-1;//�˵�ѡ��
  if(menuSelect_old<1) 
     menuSelect_old=MENU_6;
         LCD_pen=LCD_pen_other ;
  
     switch (menuSelect_old) 
    {
      
  case MENU:
    if(zs_car==1)
       LCD_showStr0608(1,0, "RUN");
    else
       LCD_showStr0608(1,0, "STOP");
    break;
   
    case MENU_1:
LCD_DisplayFloat(40, 10, speed_set, 1);
    break;  
    
    case MENU_2:
LCD_DisplayFloat(40, 20, Direction_P, 1);
    break;
    
       case MENU_3:
LCD_DisplayFloat(40, 30, Direction_P2, 1);
//LCD_DisplayFloat(40, 30, Chazhi, 1);         
    break;
    
    case MENU_4:
LCD_DisplayFloat(40, 40, Angle_D, 1);
    break;
    
       case MENU_5:
LCD_DisplayFloat(40, 50, Speed_P, 1);
    break;
    
       case MENU_6:
LCD_DisplayFloat(40, 60, Speed_I, 1);
    break;
    
//        case MENU_6:
//LCD_DisplayFloat(40, 60, Direction_P2, 1);
//    break;
//    
//        case MENU_7:
//LCD_DisplayFloat(40, 70, Angle_P, 1);
//    break;
//    
//        case MENU_8:
//LCD_DisplayFloat(40, 80, Angle_D, 1);
//    break;
    
    
    default :
        break;
    }
    
   
    
}



//LCD��ʾ���ݶ�̬
void LCD_Inductor_Dynamic(void)
{
  LCD_Int16(0, 0, AD_valu[0]);
  LCD_DisplayFloat(80,0,AD_inductor[0], 3); 
  
  LCD_Int16(0, 10, AD_valu[1]);
  LCD_DisplayFloat(80,10,AD_inductor[1], 3); 
  
//  LCD_Int16(40, 2, AD_valu[2]);
//  LCD_DisplayFloat(80,20,AD_inductor[2], 3); 
//  
//  LCD_Int16(40, 40, AD_valu[3]);
//  LCD_DisplayFloat(80,40,AD_inductor[3], 3); 
//  
//  LCD_Int16(40, 50, AD_valu[4]);
//  LCD_DisplayFloat(80,50,AD_inductor[4], 3); 
  
//  LCD_DisplayFloat(60,60,Chazhi, 3); 
//  LCD_DisplayFloat(1,70,Circle_Flag, 0); 
//  LCD_DisplayFloat(1,70,angle, 0); 
//  LCD_DisplayFloat(60,70,Chazhi_Rate, 3); 
}



//LCD��ʾ����
void LCD_Speed_Dynamic(void)
{
  
//  LCD_DisplayFloat(40,10,wgy, 3);//255
//  LCD_DisplayFloat(40,20,gy, 3);//-1
//  LCD_DisplayFloat(40,30,gyro_y, 3);//-1Ŷ����                                                                                                         
////  LCD_DisplayFloat(40,30,gyr_angle_speed, 3);
////  LCD_DisplayFloat(40,50,gyr_angle, 3);
//  LCD_DisplayFloat(40,20,Speed_I_lntegral_L, 3);
//  LCD_DisplayFloat(40,50,Speed_I_lntegral_R, 3);
//  LCD_DisplayFloat(40,00,Chazhi, 3);   
//    LCD_DisplayFloat(40,00,Chasu_Bili, 3);   
//    LCD_DisplayFloat(40,10,angle, 3); 
////  
//  LCD_DisplayFloat(40,10,speed_set_L, 3); 
//  LCD_DisplayFloat(40,20,speed_set_R, 3); 
//  
      LCD_DisplayFloat(40,70,speed_L, 1); 
  LCD_DisplayFloat(80,70,speed_R, 1); 
//    LCD_DisplayFloat(40,50,speed_set, 3); 
//    LCD_DisplayFloat(40,60,Chazhi_Rate, 3); 


}

