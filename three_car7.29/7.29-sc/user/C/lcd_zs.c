#include "Variable.h"
#include "common.h"
#include "allHead.h"

/**
  * 简介
  *     按键 多级菜单
  * 注意
  *     中 --- 切换菜单
  *     上下左右 --- 自由控制
  */
void LCD_Key_ZS(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
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
    case 2: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
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
    case 3: /* ------------------------------ 左 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
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
    case 4: /* ------------------------------ 右 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
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
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 7)//logo 和 菜单显示只一次
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}





//-------常用颜色----------
//#define RED     	0XF800    //红色
//#define GREEN   	0X07E0    //绿色
//#define BLUE    	0X001F    //蓝色
//#define BRED    	0XF81F    //紫色
//#define GRED    	0XFFE0    //灰色
//#define GBLUE   	0X07FF    //青蓝
//#define BLACK   	0X0000    //黑色
//#define WHITE   	0XFFFF    //白色
//#define YELLOW  	0xFFE0    //黄色
//
//
//
//extern uint16 LCD_pen;//笔颜色
//extern uint16 LCD_backGround;//背景颜色


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
  uint16 LCD_pen_one = RED;//笔颜色
  uint16 LCD_pen_other = BLACK;//笔颜色
  int menuSelect_old = menuSelect;//菜单选择
//uint16 LCD_pen = BLACK;//笔颜色

  
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
 //旧数据变成共色   
  menuSelect_old = menuSelect-1;//菜单选择
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



//LCD显示数据动态
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



//LCD显示数据
void LCD_Speed_Dynamic(void)
{
  
//  LCD_DisplayFloat(40,10,wgy, 3);//255
//  LCD_DisplayFloat(40,20,gy, 3);//-1
//  LCD_DisplayFloat(40,30,gyro_y, 3);//-1哦了吗                                                                                                         
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

