#include "Variable.h"
#include "common.h"
#include "allHead.h"

char uart_flag = 0;
/*显示名称*/
void OLED_Inductor_Static(void)
{
  OLED_DisplaytinyStr(1, 0, "Righ:");
  OLED_DisplaytinyStr(1, 1, "Midd:");
  OLED_DisplaytinyStr(1, 2, "Left:");
  OLED_DisplaytinyStr(1, 4, "Ri_V:");
  OLED_DisplaytinyStr(1, 5, "Le_V:");
  OLED_DisplaytinyStr(1, 7, "Chzh:");
}

//显示数据动态
void OLED_Inductor_Dynamic(void)
{
  /*----------比赛---------------------------*/  
  OLED_DisplayFloat(5,5,AD_inductor[0], 1); 
  
  OLED_DisplayFloat(5,6,AD_inductor[1], 1); 
  
  OLED_DisplayFloat(5,7,AD_inductor[2],1); 
  

  OLED_DisplayFloat(60,5,AD_inductor[3], 1); 
  

  OLED_DisplayFloat(60,6,AD_inductor[4], 1); 
  
  OLED_Int16(60, 7, Chazhi);
  OLED_Int16(60,7,gyr_angle_speed); 
//  
  
  
  
//  OLED_Int16(40, 0, AD_valu[0]);
//  OLED_DisplayFloat(80,0,AD_inductor[0], 3); 
//  
//  OLED_Int16(40, 1, AD_valu[1]);
//  OLED_DisplayFloat(80,1,AD_inductor[1], 3); 
//  
//  OLED_Int16(40, 2, AD_valu[2]);
//  OLED_DisplayFloat(80,2,AD_inductor[2], 3); 
//  
//  OLED_Int16(40, 4, AD_valu[3]);
//  OLED_DisplayFloat(80,4,AD_inductor[3], 3); 
//  
//  OLED_Int16(40, 5, AD_valu[4]);
//  OLED_DisplayFloat(80,5,AD_inductor[4], 3); 
//  
//  OLED_DisplayFloat(60,6,Chazhi, 3); 
/*
    OLED_Int16(2, 5, AD_valu[0]);
  OLED_DisplayFloat(35,5,AD_inductor[0], 1); 
  
  OLED_Int16(2, 6, AD_valu[1]);
  OLED_DisplayFloat(35,6,AD_inductor[1], 1); 
  
  OLED_Int16(2, 7, AD_valu[2]);
  OLED_DisplayFloat(35,7,AD_inductor[2],1); 
  
//  OLED_Int16(75, 5, AD_valu[3]);
//  OLED_DisplayFloat(75,5,speed_L, 1); 
  OLED_DisplayFloat(110,5,AD_inductor[3], 1); 
  
//  OLED_Int16(75, 6, AD_valu[4]);
//  OLED_DisplayFloat(75,6,speed_R, 1); 
  OLED_DisplayFloat(110,6,AD_inductor[4], 1); 
//  
//  OLED_DisplayFloat(60,7,Chazhi, 3); 
  OLED_Int16(75, 7, Chazhi);
  OLED_DisplayFloat(110,7,gyr_angle_speed, 3); 

  */
  
//  OLED_DisplayFloat(1,7,Circle_Flag, 0); 
//  OLED_DisplayFloat(1,7,angle, 0); 
//  OLED_DisplayFloat(60,7,Chazhi_Rate, 3); 
}








/*显示名称*/
void OLED_Speed_Static(void)
{
//  OLED_DisplaytinyStr(1, 0, "Chzh:");
  OLED_DisplaytinyStr(1, 0, "ChBi:");
  OLED_DisplaytinyStr(1, 1, "Angl:");
  OLED_DisplaytinyStr(1, 3, "S_L:");
  OLED_DisplaytinyStr(1, 4, "S_R:");
  
//OLED_DisplaytinyStr(1, 5, "S_ZC:");
//OLED_DisplaytinyStr(1, 7, "S_RC:");
OLED_DisplaytinyStr(1, 7, "S:");
}


//显示数据
void OLED_Speed_Dynamic(void)
{
  
//  OLED_DisplayFloat(40,1,wgy, 3);//255
//  OLED_DisplayFloat(40,2,gy, 3);//-1
//  OLED_DisplayFloat(40,3,gyro_y, 3);//-1哦了吗                                                                                                         
////  OLED_DisplayFloat(40,3,gyr_angle_speed, 3);
////  OLED_DisplayFloat(40,5,gyr_angle, 3);
//  OLED_DisplayFloat(40,2,Speed_I_lntegral_L, 3);
//  OLED_DisplayFloat(40,5,Speed_I_lntegral_R, 3);
//  OLED_DisplayFloat(40,0,Chazhi, 3);   
//    OLED_DisplayFloat(40,0,Chasu_Bili, 3);   
//    OLED_DisplayFloat(40,1,angle, 3); 
////  
//  OLED_DisplayFloat(40,1,Direction_Control_Output_L, 3); 
//  OLED_DisplayFloat(40,2,Direction_Control_Output_R, 3); 
//  OLED_DisplayFloat(40,1,speed_set_L, 3); 
//  OLED_DisplayFloat(40,2,speed_set_R, 3);
//  OLED_DisplayFloat(40,3,Speed_Error_L, 3); 
//  OLED_DisplayFloat(40,4,Speed_Error_R, 3); 
//  
      OLED_DisplayFloat(40,5,speed_L, 1); 
  OLED_DisplayFloat(40,6,speed_R, 1); 
//    OLED_DisplayFloat(40,5,speed_set, 3); 
//    OLED_DisplayFloat(40,6,Chazhi_Rate, 3); 


}

void UART_Send(void)
{
     uart_flag++;     
    if(uart_flag ==1)
    {   
       uart_flag = 0;
///////////////////////////陀螺仪////////////////////////////////////////////////////////////////////
//        UART_SendFloat(wgz,1);  
//        UART_SendFloat(gz,1);  
//        UART_SendFloat(gyro_z,1);  
//        UART_SendFloat(gyr_offset__z_average,1);  
//        UART_SendFloat(gyr_angle_speed,1);  
//        UART_SendFloat(gyr_angle_speed_static,1);  
//        UART_SendFloat(gyr_angle,1); 
       
//        UART_SendFloat(gyro_x,1);  
//        UART_SendFloat(gyr_offset__x_average,1); 
//        UART_SendFloat(gyr_angle_speed_up,1);  
//        UART_SendFloat(gyr_angle_up,1); 
//          UART_Send_String("................\r\n");
///////////////////////////电感////////////////////////////////////////////////////////////////////

// UART_Send_String(".........实际电感值.......\r\n");      
//     for(int i = 0;i < 3;i++)
//    {
//         UART_SendFloat(AD_valu[i],1);
////            UART_SendFloat(AD_inductor[i],1);  

//    }
// UART_Send_String("........归一化电感值........\r\n");
//
//       for(int i = 0;i < 5;i++)
//    {
//      UART_SendFloat(AD_inductor[i],1);  
//   }
//
//         UART_SendFloat(position,1);
//
//             UART_SendFloat(Chazhi,1);
//           UART_Send_String("................\r\n");

//             UART_SendFloat(Speed_I_lntegral_L,1);
//             UART_SendFloat(Speed_I_lntegral_R,1);
//             UART_SendFloat(Chazhi_Rate,1);
//             UART_SendFloat(angle,1);
//                            UART_SendFloat(position,1);

//          UART_Send_String("................\r\n");
//////     UART_Send_String("差值，速度设定，速度\r\n");
     UART_SendFloat(speed_L,1);
     UART_SendFloat(speed_R,1);
//     UART_SendFloat(speed_set,1);
       
//     UART_SendFloat(Motor_Out_R_Temp,1);
//     UART_SendFloat(speed_R,1);
//////     UART_Send_String("速度偏差，电机输出\r\n");
//     UART_SendFloat(Speed_Error_L,1);     
//     UART_SendFloat(Speed_Error_R,1);
//     UART_SendFloat(Motor_Out_L,1);
//     UART_SendFloat(Motor_Out_R,1);
//     UART_SendFloat(speed_car,1);
//     UART_SendFloat(E_speed,1);
//     UART_SendFloat(Speed_Control_Output,1);
//    }      
//         UART_Send_String("................\r\n");

    //    for(i = 0;i < 3;i ++)
//    {
//      UART_SendFloat(AD_valu[i],1);
//    }
    
//    UART_SendFloat(Direction_Control_Output,1);
//    
//    
   
//    for(i = 0;i < 2;i ++)
//    {
//      UART_SendFloat(Position_transit[i],1);
//    }    
//    
//    for(i = 0;i < 3;i ++)
//    {
//      UART_SendFloat(AD_inductor[i],1);
//    }

    

    } 
}

void KEY(void)
{
    switch (KEY_Scan())
{
    case 1: /* ------------------------------ 上 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
         
        case MENU:
            Chasu_Bili += 1;
            break;

        case MENU_1:
            angle += 10;
            break;
            
            case MENU_2:
            speed_set += 10;
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
            Chasu_Bili -= 1;
            break;

        case MENU_1:
            angle -= 10;
            break;
            
       case MENU_2:
            speed_set -= 10;
            break;
         


        default :
            break;
        }
                break;

        
         case 3: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili += 0.1;
            break;

        case MENU_1:
            angle += 1;
            break;
            
         case MENU_2:
            speed_set += 1;
            break;
         
        default :
            break;
        }
                break;

        
          case 4: /* ------------------------------ 下 */
        KEY_sta = !KEY_sta;//控制状态OLED是否更新
        switch (menuSelect)
        {
       case MENU:
            Chasu_Bili -= 0.1;
            break;

        case MENU_1:
            angle -= 1;
            break;
            
       case MENU_2:
            speed_set -= 1;
            break;
         
        default :
            break;
        }
                break;

        
        case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
//        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 3)//logo 和 菜单显示只一次
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
    if(menuSelect ==MENU) 
          LED_1_ON
//        OLED_DisplaytinyStr(80, 0, "Ch");
    else
         LED_1_OFF
//        OLED_DisplaytinyStr(80, 0, "No");
    
    if(menuSelect ==MENU_1) 
                LED_2_ON
//        OLED_DisplaytinyStr(80, 1, "Ch");
    else
               LED_2_OFF
//        OLED_DisplaytinyStr(80, 1, "No");
    
//    if(menuSelect ==MENU_2) 
////                LED_3_ON
////        OLED_DisplaytinyStr(80, 7, "Ch");
//    else
//               LED_3_OFF
//        OLED_DisplaytinyStr(80, 7, "No");

}       
        
        
        
        
        
        
        
        
        
        
        

