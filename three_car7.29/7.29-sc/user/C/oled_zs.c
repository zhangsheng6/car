#include "Variable.h"
#include "common.h"
#include "allHead.h"
int jiemian=0;
void OLED_Key_ZS(void)
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
            speed_set += 5;
            break;
            
        case MENU_2:
            Direction_P2 += 20;
            break;
      
        case MENU_3:
            Direction_D2 += 50;
            break;
            

            
        case MENU_4:
            Direction_P2_Change+=10;
            break;          
            
        case MENU_5:
           Angle_P_Change+=10;  
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
            speed_set -= 5;
            break;
            
        case MENU_2:
            Direction_P2 -= 20;
            break;  
      
        case MENU_3:
            Direction_D2 -= 50;
            break;
            

        case MENU_4:
            Direction_P2_Change-=10;
            break;          
            
        case MENU_5:
           Angle_P_Change-=10;  
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
            jiemian=1;
            break; 
        case MENU_1:
            speed_set += 10;
            break;
            
        case MENU_2:
            Direction_P2 += 100;
            break;
                   
        case MENU_3:
            Direction_D2 += 100;
            break;
            

     
        case MENU_4:
            Direction_P2_Change+=50;
            break;          
            
        case MENU_5:
           Angle_P_Change+=50;  
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
            jiemian=2;
            break; 
        case MENU_1:
            speed_set -= 10;
            break;
            
        case MENU_2:
            Direction_P2 -= 100;
            break;
       
        case MENU_3:
            Direction_D2 -= 100;
            break;
            

            
        case MENU_4:
            Direction_P2_Change-=50;
            break;          
            
        case MENU_5:
           Angle_P_Change-=50;  
            break;
            
 
                            
                            
     

        default :
            break;
        }
     
        break;
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 6)//logo 和 菜单显示只一次
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}
 

void OLED_Key_Par_ZS(void)
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
            speed_set += 5;
            break;
            
        case MENU_2:
            BB_P_W += 5;
            break;
            
  case MENU_3:
            BB_W+=5;
            break;
 ////////////////////////////////////////////////////////////           
        case MENU_4:
            BB_H+=5;
            break;          
            
        case MENU_5:
           Circle_Chazhi+=5;  
            break;
        
        case MENU_7:
            Circle_Count6_Max+=500; //下次圆环间隔时间1S1000
            break; 
 ////////////////////////////////////////////////////////////////           
        case MENU_6:
            Circle_Finish_Count_Max+=20; //强制打角时间 100为0.1s
            break;
            
        case MENU_8:
            Circle_Inductor_LR1+=1;  
            break;
            
         case MENU_9:
            Circle_Inductor_M1+=1;  
            break;
///////////////////////////////////////////////////////////////////////////                            
         case MENU_10:
            Circle_Inductor_M2+=1;  
            break;
            
        case MENU_11:
            Circle_Inductor_M3+=1;  
            break;
            
         case MENU_12:
            BB_P_Z+=5;  
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
            speed_set -= 5;
            break;
            
        case MENU_2:
            BB_P_W -= 5;
            break;
            
  case MENU_3:
            BB_W-=5;
//          Chazhi+=10;
            break;
 ////////////////////////////////////////////////////////////           
        case MENU_4:
            BB_H-=5;
            break;          
            
        case MENU_5:
           Circle_Chazhi-=5;  
            break;
        
        case MENU_7:
            Circle_Count6_Max-=500;  
            break; 
 ////////////////////////////////////////////////////////////////           
        case MENU_6:
            Circle_Finish_Count_Max-=20;  
            break;
            
        case MENU_8:
            Circle_Inductor_LR1-=1;  
            break;
            
         case MENU_9:
            Circle_Inductor_M1-=1;  
            break;
///////////////////////////////////////////////////////////////////////////                            
         case MENU_10:
            Circle_Inductor_M2-=1;  
            break;
            
        case MENU_11:
            Circle_Inductor_M3-=1;  
            break;
            
         case MENU_12:
            BB_P_Z-=5;  
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
            jiemian=1;
            break; 
        case MENU_1:
            speed_set += 10;
            break;
            
        case MENU_2:
            BB_P_W+= 10;
            break;
            
  case MENU_3:
            BB_W+=10;
            break;
 ////////////////////////////////////////////////////////////           
        case MENU_4:
            BB_H+=10;
            break;          
            
        case MENU_5:
           Circle_Chazhi+=10;  
            break;
        
        case MENU_7:
            Circle_Count6_Max+=1000;  
            break; 
 ////////////////////////////////////////////////////////////////           
        case MENU_6:
            Circle_Finish_Count_Max+=100;  
            break;
            
        case MENU_8:
            Circle_Inductor_LR1+=5;  
            break;
            
         case MENU_9:
            Circle_Inductor_M1+=5;  
            break;
///////////////////////////////////////////////////////////////////////////                            
         case MENU_10:
            Circle_Inductor_M2+=5;  
            break;
            
        case MENU_11:
            Circle_Inductor_M3+=5;  
            break;
            
         case MENU_12:
            BB_P_Z+=10;  
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
            jiemian=2;
            break; 
        case MENU_1:
            speed_set -= 10;
            break;
            
        case MENU_2:
            BB_P_W -= 10;
            break;
            
  case MENU_3:
            BB_W-=10;
//          Chazhi+=10;
            break;
 ////////////////////////////////////////////////////////////           
        case MENU_4:
            BB_H-=10;
            break;          
            
        case MENU_5:
           Circle_Chazhi-=10;  
            break;
        
        case MENU_7:
            Circle_Count6_Max-=1000;  
            break; 
 ////////////////////////////////////////////////////////////////           
        case MENU_6:
            Circle_Finish_Count_Max-=100;  
            break;
            
        case MENU_8:
            Circle_Inductor_LR1-=5;  
            break;
            
         case MENU_9:
            Circle_Inductor_M1-=5;  
            break;
///////////////////////////////////////////////////////////////////////////                            
         case MENU_10:
            Circle_Inductor_M2-=5;  
            break;
            
        case MENU_11:
            Circle_Inductor_M3-=5;  
            break;
            
         case MENU_12:
            BB_P_Z-=10;  
            break;

        default :
            break;
        }


        break;
    case 5: /* ------------------------------ 中 */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 13)//logo 和 菜单显示只一次
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}
 
/**
  * 简介
  *     绘制 菜单
  * 备注
  *     y
  *         0 --- 空出
  *         1,5
  *              x  0 ~ 127 双横线
  *         1 ~ 7
  *              x  0,67,127 --- 竖线
  *         1,5
  *              x  30,94 --- 参数数字
  *     页分配
  *         0       --- 空出
  *         1,5     --- 菜单数字
  *         2~4,6~7 --- 显示区域
  *     显示区域坐标
  *         菜单     x   y --- x  y
  *           1      1   2    66  4  可显示 11个字符，3行
  *           2      68  2   126  4  可显示 9 个字符,3行
  *           3      1   6   126  7  可显示 21个字符,2行
  *           4      1   6   126  7  可显示 21个字符,2行
  */
//void OLED_Menu()
void OLED_Biaoge_ZS()
{
  uint8 i, x, y;

  for (i=0; i<10; i++)
  {
      switch (i)
      {
          //先画横再画竖线，竖线将横线覆盖掉,再画数字覆盖
      case 0://-------------------- 上双横线
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 0);
              OLED_WrDat(0x81);//双横杠为0x81
          }
          break;
      case 1://-------------------- 下双横线
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 4);
              OLED_WrDat(0x01);//单线0x01
          }
          break;
      case 2://-------------------- 左竖线
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(0, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 3://-------------------- 中竖线
          for (y=0; y<4; y++)// 1~5
          {
              OLED_Set_Pos(67, y);
              OLED_WrDat(0xff);
          }
          break;
      case 4://-------------------- 右竖线
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(127, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 5://-------------------- 菜单1数字
//          for (x=0; x<7; x++)
//          {
//              OLED_Set_Pos(30+x, 1);//30~36
//              OLED_WrDat(menuNum[0][x]);
//          }
          break;
      case 6://-------------------- 菜单2数字
//          for (x=0; x<7; x++)
//          {
//              OLED_Set_Pos(94+x, 1);//94~101
//              OLED_WrDat(menuNum[1][x]);
//          }
          break;


      case 9:/* 各个菜单预先显示,可屏蔽 */
        
         OLED_DisplaytinyStr(1, 2, "PC:");//菜单1内容显示
         OLED_DisplaytinyStr(1, 3, "DC:");//菜单2内容显示
         OLED_DisplaytinyStr(68, 1, "50*:");//菜单3内容显示

         OLED_DisplaytinyStr(68, 2, "25*:");//菜单4内容显示
         
         OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
         
   
       OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3行11列  
       OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//4行11列
       OLED_DisplayFloat(68+6*3+20, 1,Direction_P2_Change, 0);//3行2表格 
       OLED_DisplayFloat(68+6*3+20, 2,Angle_P_Change, 0);//3行2表格


            if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
    else
  OLED_DisplaytinyStr(40, 1, "STOP");
         
            break;

      default :
          break;
      }
  }
}

void OLED_Biaoge_Par_ZS()
{

  uint8 i, x, y;

  for (i=0; i<10; i++)
  {
      switch (i)
      {
          //先画横再画竖线，竖线将横线覆盖掉,再画数字覆盖
      case 0://-------------------- 上双横线
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 0);
              OLED_WrDat(0x81);//双横杠为0x81
          }
          break;
      case 1://-------------------- 下双横线
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 4);
              OLED_WrDat(0x81);
          }
          break;
      case 2://-------------------- 左竖线
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(0, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 3://-------------------- 中竖线
          for (y=1; y<10; y++)// 1~5
          {
              OLED_Set_Pos(67, y);
              OLED_WrDat(0xff);
          }
          break;
      case 4://-------------------- 右竖线
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(127, y);
//              OLED_WrDat(0xff);
//          }
          break;

     



      case 9:/* 各个菜单预先显示,可屏蔽 */
        
            OLED_DisplaytinyStr(1, 2, "BBPW:");//菜单1内容显示
         OLED_DisplaytinyStr(1, 3, "BB_W:");//菜单2内容显示
         
         OLED_DisplaytinyStr(68, 1, "BB_H:");//菜单3内容显示
         OLED_DisplaytinyStr(68, 2, "O_Cha:");//菜单4内容显示
         OLED_DisplaytinyStr(68, 3, "O_D_ms:");//菜单5内容显示    
         
         OLED_DisplaytinyStr(1, 5, "O_J_ms:");//菜单5内容显示
         OLED_DisplaytinyStr(1, 6, "O_LR:");//菜单5内容显示
         OLED_DisplaytinyStr(1, 7, "O_M1:");//菜单5内容显示
         
         OLED_DisplaytinyStr(68, 5, "O_M2:");//菜单5内容显示
         OLED_DisplaytinyStr(68, 6, "O_M3:");//菜单5内容显示
         OLED_DisplaytinyStr(68, 7, "BBPZ:");//菜单5内容显示
         
         
         
//         
         OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
   OLED_Int16(40, 2, BB_P_W);
   OLED_Int16(40, 3, BB_W);
   
   OLED_Int16(110, 1, BB_H);
   OLED_Int16(110, 2, Circle_Chazhi);
   OLED_Int16(110, 3, Circle_Finish_Count_Max);
   
   OLED_Int16(40, 5,Circle_Count6_Max );
   OLED_Int16(40, 6, Circle_Inductor_LR1);  
   OLED_Int16(40, 7, Circle_Inductor_M1);
   
   OLED_Int16(110, 5, Circle_Inductor_M2);
   OLED_Int16(110, 6, Circle_Inductor_M3);
   OLED_Int16(110, 7, BB_P_Z);

          if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
    else
  OLED_DisplaytinyStr(40, 1, "STOP");
          break;
     

      default :
          break;
      }
  }
}

/**
  * 简介
  *     菜单闪烁
  * 备注
  *     当菜单被选中时 闪烁
  */
//void OLED_MenuFlicker()
void OLED_Select_ZS()//三角形
{
  uint8 x,y;

    switch (menuSelect)
    {  
    case MENU://--------------------------- 显示 菜单 38.5ms
      OLED_DisplaytinyStr(78, 4, "NO ");

    if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
    else
  OLED_DisplaytinyStr(40, 1, "STOP");
  
      for (x=0; x<4; x++)//84~87 消 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(0x81);
        }      break;
    case MENU_1://--------------------------- 选择 菜单1 - 消掉菜单4 51us
        for (x=0; x<4; x++)//20~23 选 1
        {
            OLED_Set_Pos(5+x, 0);//第一行20列的三角形
            OLED_WrDat(menuNum[4][x]);
        }
//        for (x=0; x<4; x++)//84~87 消 4
//        {
//            OLED_Set_Pos(124+x, 5);//消灭第五行99列三角形
//            OLED_WrDat(0x81);
//        }
        break;
        
    case MENU_2://--------------------------- 选择 菜单1 - 消掉菜单4 51us
        for (x=0; x<4; x++)//20~23 选 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 4
        {
            OLED_Set_Pos(5+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_3://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(0x81);
        }
        break;
 
        case MENU_4://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        
        case MENU_5://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_6://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_7:
  OLED_DisplaytinyStr(80, 4, "CC ");
   for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(0x81);
        }
   
        break;
        
    default :
        break;
    }
}

void OLED_Select_Par_ZS()
{
  uint8 x, y;

    switch (menuSelect)
    {
    case MENU://--------------------------- 显示 菜单 38.5ms
        if(zs_car==1)
        OLED_DisplaytinyStr(40, 1, "RUN ");
        else
        OLED_DisplaytinyStr(40, 1, "STOP");      
      
        
    for (x=0; x<4; x++)//84~87 消 3
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(0x81);
        } 
  
    break;
    case MENU_1://--------------------------- 选择 菜单1 - 消掉菜单4 51us
        for (x=0; x<4; x++)//20~23 选 1
        {
            OLED_Set_Pos(5+x, 0);//第一行20列的三角形
            OLED_WrDat(menuNum[4][x]);
        }
    for (x=0; x<4; x++)//84~87 消 3
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(0x81);
        } 
        break;
        
    case MENU_2://--------------------------- 选择 菜单1 - 消掉菜单4 51us
        for (x=0; x<4; x++)//20~23 选 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 4
        {
            OLED_Set_Pos(5+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_3://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(0x81);
        }
        break;
 
        case MENU_4://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        
        case MENU_5://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_6://--------------------------- 选择 菜单2
        for (x=0; x<4; x++)//84~87 选 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 消 1
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_7://--------------------------- 选择 菜单3
        for (x=0; x<4; x++)//20~23 选 3
        {
            OLED_Set_Pos(5+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
   case MENU_8://--------------------------- 选择 菜单3
        for (x=0; x<4; x++)//20~23 选 3
        {
            OLED_Set_Pos(40+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 2
        {
            OLED_Set_Pos(5+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
          case MENU_9://--------------------------- 选择 菜单3
        for (x=0; x<4; x++)//20~23 选 3
        {
            OLED_Set_Pos(60+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 2
        {
            OLED_Set_Pos(40+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
        
        
    case MENU_10://--------------------------- 选择 菜单4第四表格
                for (x=0; x<4; x++)//84~87 选4
        {
            OLED_Set_Pos(84+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 3
        {
            OLED_Set_Pos(60+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
         case MENU_11://--------------------------- 选择 菜单4第四表格
                for (x=0; x<4; x++)//84~87 选4
        {
            OLED_Set_Pos(104+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 3
        {
            OLED_Set_Pos(84+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
         case MENU_12://--------------------------- 选择 菜单4第四表格
                for (x=0; x<4; x++)//84~87 选4
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 消 3
        {
            OLED_Set_Pos(104+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
    
    default :
        break;
    }
}


/**
  * 简介
  *     多级菜单 显示
  
* 注意
  *     坐标不要随便改 预先显示内容在OLED_Menu中修改,默认前4个字符用于显示标志
  *     显示区域坐标
  *         菜单     x   y --- x  y
  *           1      1   2    66  4  可显示 11个字符，3行
  *           2      68  2   126  4  可显示 9 个字符,3行
  *           3      1   6   126  7  可显示 21个字符,2行
  *           4      1   6   126  7  可显示 21个字符,2行
  */
void Oled_Data_ZS(void)
{
    switch (menuSelect) 
    {
    case MENU:
          if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
          else
  OLED_DisplaytinyStr(40, 1, "STOP");
 
  break;
    
    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
   break;
   
   case MENU_2:
OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3行11列
   break;  
   
    case MENU_3:
OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//3行11列
   break;
   

   
   case MENU_4:
OLED_DisplayFloat(68+6*3+20, 2,Direction_P2_Change, 0);//3行2表格 
   break;
 
    case MENU_5:
OLED_DisplayFloat(68+6*3+20, 3,Angle_P_Change, 0);//3行2表格
    break;


    
    default :
        break;
    }
}

void Oled_Data_Par_ZS(void)
{
    switch (menuSelect) 
    {
    case MENU:
          if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
          else
  OLED_DisplaytinyStr(40, 1, "STOP");
 
  break;
    
    case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
   break;
   
   case MENU_2:
   OLED_Int16(40, 2, BB_P_W);
   break;
   
    case MENU_3:
   OLED_Int16(40, 3, BB_W);
   break;
/////////////////////////////////////////
   case MENU_4:
   OLED_Int16(110, 1, BB_H);
   break;
 
    case MENU_5:
   OLED_Int16(110, 2, Circle_Chazhi);
    break;

   case MENU_6:
      OLED_Int16(110, 3, Circle_Finish_Count_Max);
   
   break;
 /////////////////////////////////////////   
    case MENU_7:
   OLED_Int16(40, 5,Circle_Count6_Max );
   break;
 
    case MENU_8:
   OLED_Int16(40, 6, Circle_Inductor_LR1);  
    break;

   case MENU_9:
   OLED_Int16(40, 7, Circle_Inductor_M1);
   break;
   
   
    case MENU_10:
   OLED_Int16(110, 5, Circle_Inductor_M2);
   break;
 
    case MENU_11:
   OLED_Int16(110, 6, Circle_Inductor_M3);
    break;

   case MENU_12:
   OLED_Int16(110, 7, BB_P_Z);
   break;
   
    
    default :
        break;
    }
}

 float speed_set_old=0,//速度设定
        Direction_P2_old=0,Direction_D2_old=0,//差值PD                        
      Angle_P_old=0;
 int  Direction_P2_Change_old=0,Angle_P_Change_old=0;
void Data_Old(void)
{
     speed_set_old=speed_set;//速度设定 

      Direction_P2_old=Direction_P2;
      Direction_D2_old=Direction_D2;//差值PD    
      Angle_P_old=Angle_P;
      Direction_P2_Change_old=Direction_P2_Change;
      Angle_P_Change_old=Angle_P_Change;
   
}
float     BB_Z_old=0,BB_W_old=0,BB_H_old=0;
int      BB_P_Z_old=0,BB_P_F_old=0;
int  akmj_z_old=0,akmj_w_old=0;//w20
 float     Direction_P_old=0;//阿克曼角P                     
 int    Circle_Count6_Max_old=0,//下次圆环间隔时间1S1000
        Circle_Inductor_M1_old=0,//进圆环双线值
         Circle_Inductor_M2_old=0,//测转弯值
         Circle_Inductor_M3_old=0,//转弯值
         Circle_Finish_Count_Max_old=0,
         Circle_Chazhi_old=0,
         Circle_Inductor_LR1_old=0; 

void Data_Old2(void)
{
        akmj_z_old=akmj_z;
  akmj_w_old=akmj_w;//w20
     BB_Z_old=BB_Z;
   
      BB_P_Z_old=BB_P_Z;
      BB_P_F_old=BB_P_F;
      
     Direction_P_old=Direction_P;//阿克曼角P    
     BB_W_old=BB_W;
     BB_H_old=BB_H;
     
     Circle_Chazhi_old=Circle_Chazhi;    
     Circle_Finish_Count_Max_old=Circle_Finish_Count_Max;//强制打角时间
     Circle_Count6_Max_old=Circle_Count6_Max;//下次圆环间隔时间1S1000
     Circle_Inductor_M1_old=Circle_Inductor_M1;//进圆环双线值
     Circle_Inductor_M2_old=Circle_Inductor_M2;//测转弯值
     Circle_Inductor_M3_old=Circle_Inductor_M3;//转弯值
     Circle_Inductor_LR1_old=Circle_Inductor_LR1;      

}

void Oled_Data_ZS_All(void)
{
        
if( speed_set_old!=speed_set) 
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float 


  if(      Direction_P2_old!=Direction_P2)  
OLED_DisplayFloat(1+6*3+1, 2,Direction_P2, 0);//4行11列

  if(      Direction_D2_old!=Direction_D2)  
OLED_DisplayFloat(68+6*3+1, 3,Direction_D2, 0);

if(      Angle_P_old!=Angle_P)  
OLED_DisplayFloat(68+6*3+1, 1,Angle_P, 0);//3行2表格


  if(      Direction_P2_Change_old!=Direction_P2_Change)  
OLED_DisplayFloat(68+6*3+1, 2,Direction_P2_Change, 0);//3行2表格

  if(      Angle_P_Change_old!=Angle_P_Change)  
OLED_DisplayFloat(68+6*3+1, 3,Angle_P_Change, 0);//3行2表格//
    
    }


void Oled_Data_ZS_All2(void)
{
 
  
    if(speed_set_old!=speed_set)
      OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  



    if(BB_Z_old!=BB_Z)
         OLED_Int16(30, 2, BB_Z);
   
    if(BB_W_old!=BB_W)
         OLED_Int16(30, 3, BB_W);

      
    if(BB_H_old!=BB_H)
         OLED_Int16(100, 1, BB_H);

    if(Circle_Chazhi_old!=Circle_Chazhi)
         OLED_Int16(100, 2, Circle_Chazhi);

    if(Circle_Finish_Count_Max_old!=Circle_Finish_Count_Max)
         OLED_Int16(30, 5, Circle_Count6_Max);

 
    if(Circle_Count6_Max_old!=Circle_Count6_Max)
         OLED_Int16(100, 3, Circle_Finish_Count_Max);

          if(Circle_Inductor_LR1_old!=Circle_Inductor_LR1)
               OLED_Int16(30, 6, Circle_Inductor_LR1);  

    if(Circle_Inductor_M1_old!=Circle_Inductor_M1)
         OLED_Int16(30,7 , Circle_Inductor_M1);

      
    if(Circle_Inductor_M2_old!=Circle_Inductor_M2)
         OLED_Int16(100, 5, Circle_Inductor_M2);

    if(Circle_Inductor_M3_old!=Circle_Inductor_M3)    
         OLED_Int16(100, 6, Circle_Inductor_M3);

    if(Direction_P_old!=Direction_P)
         OLED_Int16(100, 7, Direction_P);


}
  
   
   
   
   



