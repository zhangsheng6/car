#include "Variable.h"
#include "common.h"
#include "allHead.h"
int jiemian=0;
void OLED_Key_ZS(void)
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
    case 2: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 3: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 4: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 5: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 6)//logo �� �˵���ʾֻһ��
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
    case 1: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
            Circle_Count6_Max+=500; //�´�Բ�����ʱ��1S1000
            break; 
 ////////////////////////////////////////////////////////////////           
        case MENU_6:
            Circle_Finish_Count_Max+=20; //ǿ�ƴ��ʱ�� 100Ϊ0.1s
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
    case 2: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 3: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 4: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;//����״̬OLED�Ƿ����
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
    case 5: /* ------------------------------ �� */
        KEY_sta = !KEY_sta;
        KEY_menuChange = !KEY_menuChange;
        if (++menuSelect > 13)//logo �� �˵���ʾֻһ��
        {
            menuSelect = MENU;
        }
        break;

    default :
        break;
    }
}
 
/**
  * ���
  *     ���� �˵�
  * ��ע
  *     y
  *         0 --- �ճ�
  *         1,5
  *              x  0 ~ 127 ˫����
  *         1 ~ 7
  *              x  0,67,127 --- ����
  *         1,5
  *              x  30,94 --- ��������
  *     ҳ����
  *         0       --- �ճ�
  *         1,5     --- �˵�����
  *         2~4,6~7 --- ��ʾ����
  *     ��ʾ��������
  *         �˵�     x   y --- x  y
  *           1      1   2    66  4  ����ʾ 11���ַ���3��
  *           2      68  2   126  4  ����ʾ 9 ���ַ�,3��
  *           3      1   6   126  7  ����ʾ 21���ַ�,2��
  *           4      1   6   126  7  ����ʾ 21���ַ�,2��
  */
//void OLED_Menu()
void OLED_Biaoge_ZS()
{
  uint8 i, x, y;

  for (i=0; i<10; i++)
  {
      switch (i)
      {
          //�Ȼ����ٻ����ߣ����߽����߸��ǵ�,�ٻ����ָ���
      case 0://-------------------- ��˫����
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 0);
              OLED_WrDat(0x81);//˫���Ϊ0x81
          }
          break;
      case 1://-------------------- ��˫����
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 4);
              OLED_WrDat(0x01);//����0x01
          }
          break;
      case 2://-------------------- ������
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(0, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 3://-------------------- ������
          for (y=0; y<4; y++)// 1~5
          {
              OLED_Set_Pos(67, y);
              OLED_WrDat(0xff);
          }
          break;
      case 4://-------------------- ������
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(127, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 5://-------------------- �˵�1����
//          for (x=0; x<7; x++)
//          {
//              OLED_Set_Pos(30+x, 1);//30~36
//              OLED_WrDat(menuNum[0][x]);
//          }
          break;
      case 6://-------------------- �˵�2����
//          for (x=0; x<7; x++)
//          {
//              OLED_Set_Pos(94+x, 1);//94~101
//              OLED_WrDat(menuNum[1][x]);
//          }
          break;


      case 9:/* �����˵�Ԥ����ʾ,������ */
        
         OLED_DisplaytinyStr(1, 2, "PC:");//�˵�1������ʾ
         OLED_DisplaytinyStr(1, 3, "DC:");//�˵�2������ʾ
         OLED_DisplaytinyStr(68, 1, "50*:");//�˵�3������ʾ

         OLED_DisplaytinyStr(68, 2, "25*:");//�˵�4������ʾ
         
         OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float  
         
   
       OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3��11��  
       OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//4��11��
       OLED_DisplayFloat(68+6*3+20, 1,Direction_P2_Change, 0);//3��2��� 
       OLED_DisplayFloat(68+6*3+20, 2,Angle_P_Change, 0);//3��2���


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
          //�Ȼ����ٻ����ߣ����߽����߸��ǵ�,�ٻ����ָ���
      case 0://-------------------- ��˫����
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 0);
              OLED_WrDat(0x81);//˫���Ϊ0x81
          }
          break;
      case 1://-------------------- ��˫����
          for (x=0; x<128; x++)// 0~127
          {
              OLED_Set_Pos(x, 4);
              OLED_WrDat(0x81);
          }
          break;
      case 2://-------------------- ������
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(0, y);
//              OLED_WrDat(0xff);
//          }
          break;
      case 3://-------------------- ������
          for (y=1; y<10; y++)// 1~5
          {
              OLED_Set_Pos(67, y);
              OLED_WrDat(0xff);
          }
          break;
      case 4://-------------------- ������
//          for (y=1; y<8; y++)// 1~7
//          {
//              OLED_Set_Pos(127, y);
//              OLED_WrDat(0xff);
//          }
          break;

     



      case 9:/* �����˵�Ԥ����ʾ,������ */
        
            OLED_DisplaytinyStr(1, 2, "BBPW:");//�˵�1������ʾ
         OLED_DisplaytinyStr(1, 3, "BB_W:");//�˵�2������ʾ
         
         OLED_DisplaytinyStr(68, 1, "BB_H:");//�˵�3������ʾ
         OLED_DisplaytinyStr(68, 2, "O_Cha:");//�˵�4������ʾ
         OLED_DisplaytinyStr(68, 3, "O_D_ms:");//�˵�5������ʾ    
         
         OLED_DisplaytinyStr(1, 5, "O_J_ms:");//�˵�5������ʾ
         OLED_DisplaytinyStr(1, 6, "O_LR:");//�˵�5������ʾ
         OLED_DisplaytinyStr(1, 7, "O_M1:");//�˵�5������ʾ
         
         OLED_DisplaytinyStr(68, 5, "O_M2:");//�˵�5������ʾ
         OLED_DisplaytinyStr(68, 6, "O_M3:");//�˵�5������ʾ
         OLED_DisplaytinyStr(68, 7, "BBPZ:");//�˵�5������ʾ
         
         
         
//         
         OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float  
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
  * ���
  *     �˵���˸
  * ��ע
  *     ���˵���ѡ��ʱ ��˸
  */
//void OLED_MenuFlicker()
void OLED_Select_ZS()//������
{
  uint8 x,y;

    switch (menuSelect)
    {  
    case MENU://--------------------------- ��ʾ �˵� 38.5ms
      OLED_DisplaytinyStr(78, 4, "NO ");

    if(zs_car==1)
  OLED_DisplaytinyStr(40, 1, "RUN ");
    else
  OLED_DisplaytinyStr(40, 1, "STOP");
  
      for (x=0; x<4; x++)//84~87 �� 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(0x81);
        }      break;
    case MENU_1://--------------------------- ѡ�� �˵�1 - �����˵�4 51us
        for (x=0; x<4; x++)//20~23 ѡ 1
        {
            OLED_Set_Pos(5+x, 0);//��һ��20�е�������
            OLED_WrDat(menuNum[4][x]);
        }
//        for (x=0; x<4; x++)//84~87 �� 4
//        {
//            OLED_Set_Pos(124+x, 5);//���������99��������
//            OLED_WrDat(0x81);
//        }
        break;
        
    case MENU_2://--------------------------- ѡ�� �˵�1 - �����˵�4 51us
        for (x=0; x<4; x++)//20~23 ѡ 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 4
        {
            OLED_Set_Pos(5+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_3://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(0x81);
        }
        break;
 
        case MENU_4://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        
        case MENU_5://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_6://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_7:
  OLED_DisplaytinyStr(80, 4, "CC ");
   for (x=0; x<4; x++)//20~23 �� 1
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
    case MENU://--------------------------- ��ʾ �˵� 38.5ms
        if(zs_car==1)
        OLED_DisplaytinyStr(40, 1, "RUN ");
        else
        OLED_DisplaytinyStr(40, 1, "STOP");      
      
        
    for (x=0; x<4; x++)//84~87 �� 3
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(0x81);
        } 
  
    break;
    case MENU_1://--------------------------- ѡ�� �˵�1 - �����˵�4 51us
        for (x=0; x<4; x++)//20~23 ѡ 1
        {
            OLED_Set_Pos(5+x, 0);//��һ��20�е�������
            OLED_WrDat(menuNum[4][x]);
        }
    for (x=0; x<4; x++)//84~87 �� 3
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(0x81);
        } 
        break;
        
    case MENU_2://--------------------------- ѡ�� �˵�1 - �����˵�4 51us
        for (x=0; x<4; x++)//20~23 ѡ 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 4
        {
            OLED_Set_Pos(5+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_3://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(40+x, 0);
            OLED_WrDat(0x81);
        }
        break;
 
        case MENU_4://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(60+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        
        case MENU_5://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(84+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
        case MENU_6://--------------------------- ѡ�� �˵�2
        for (x=0; x<4; x++)//84~87 ѡ 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//20~23 �� 1
        {
            OLED_Set_Pos(104+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
    case MENU_7://--------------------------- ѡ�� �˵�3
        for (x=0; x<4; x++)//20~23 ѡ 3
        {
            OLED_Set_Pos(5+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 2
        {
            OLED_Set_Pos(124+x, 0);
            OLED_WrDat(0x81);
        }
        break;
        
   case MENU_8://--------------------------- ѡ�� �˵�3
        for (x=0; x<4; x++)//20~23 ѡ 3
        {
            OLED_Set_Pos(40+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 2
        {
            OLED_Set_Pos(5+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
          case MENU_9://--------------------------- ѡ�� �˵�3
        for (x=0; x<4; x++)//20~23 ѡ 3
        {
            OLED_Set_Pos(60+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 2
        {
            OLED_Set_Pos(40+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
        
        
    case MENU_10://--------------------------- ѡ�� �˵�4���ı��
                for (x=0; x<4; x++)//84~87 ѡ4
        {
            OLED_Set_Pos(84+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 3
        {
            OLED_Set_Pos(60+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
         case MENU_11://--------------------------- ѡ�� �˵�4���ı��
                for (x=0; x<4; x++)//84~87 ѡ4
        {
            OLED_Set_Pos(104+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 3
        {
            OLED_Set_Pos(84+x, 4);
            OLED_WrDat(0x81);
        }
        break;
        
         case MENU_12://--------------------------- ѡ�� �˵�4���ı��
                for (x=0; x<4; x++)//84~87 ѡ4
        {
            OLED_Set_Pos(124+x, 4);
            OLED_WrDat(menuNum[4][x]);
        }
        for (x=0; x<4; x++)//84~87 �� 3
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
    
    case MENU_1://����ʾ����ʼ���� + Ԥ����ʾÿ���ַ����*Ԥ����ʾ���ַ����� + һ���հ׵�
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float  
   break;
   
   case MENU_2:
OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3��11��
   break;  
   
    case MENU_3:
OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//3��11��
   break;
   

   
   case MENU_4:
OLED_DisplayFloat(68+6*3+20, 2,Direction_P2_Change, 0);//3��2��� 
   break;
 
    case MENU_5:
OLED_DisplayFloat(68+6*3+20, 3,Angle_P_Change, 0);//3��2���
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
    
    case MENU_1://����ʾ����ʼ���� + Ԥ����ʾÿ���ַ����*Ԥ����ʾ���ַ����� + һ���հ׵�
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float  
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

 float speed_set_old=0,//�ٶ��趨
        Direction_P2_old=0,Direction_D2_old=0,//��ֵPD                        
      Angle_P_old=0;
 int  Direction_P2_Change_old=0,Angle_P_Change_old=0;
void Data_Old(void)
{
     speed_set_old=speed_set;//�ٶ��趨 

      Direction_P2_old=Direction_P2;
      Direction_D2_old=Direction_D2;//��ֵPD    
      Angle_P_old=Angle_P;
      Direction_P2_Change_old=Direction_P2_Change;
      Angle_P_Change_old=Angle_P_Change;
   
}
float     BB_Z_old=0,BB_W_old=0,BB_H_old=0;
int      BB_P_Z_old=0,BB_P_F_old=0;
int  akmj_z_old=0,akmj_w_old=0;//w20
 float     Direction_P_old=0;//��������P                     
 int    Circle_Count6_Max_old=0,//�´�Բ�����ʱ��1S1000
        Circle_Inductor_M1_old=0,//��Բ��˫��ֵ
         Circle_Inductor_M2_old=0,//��ת��ֵ
         Circle_Inductor_M3_old=0,//ת��ֵ
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
      
     Direction_P_old=Direction_P;//��������P    
     BB_W_old=BB_W;
     BB_H_old=BB_H;
     
     Circle_Chazhi_old=Circle_Chazhi;    
     Circle_Finish_Count_Max_old=Circle_Finish_Count_Max;//ǿ�ƴ��ʱ��
     Circle_Count6_Max_old=Circle_Count6_Max;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_M1_old=Circle_Inductor_M1;//��Բ��˫��ֵ
     Circle_Inductor_M2_old=Circle_Inductor_M2;//��ת��ֵ
     Circle_Inductor_M3_old=Circle_Inductor_M3;//ת��ֵ
     Circle_Inductor_LR1_old=Circle_Inductor_LR1;      

}

void Oled_Data_ZS_All(void)
{
        
if( speed_set_old!=speed_set) 
OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float 


  if(      Direction_P2_old!=Direction_P2)  
OLED_DisplayFloat(1+6*3+1, 2,Direction_P2, 0);//4��11��

  if(      Direction_D2_old!=Direction_D2)  
OLED_DisplayFloat(68+6*3+1, 3,Direction_D2, 0);

if(      Angle_P_old!=Angle_P)  
OLED_DisplayFloat(68+6*3+1, 1,Angle_P, 0);//3��2���


  if(      Direction_P2_Change_old!=Direction_P2_Change)  
OLED_DisplayFloat(68+6*3+1, 2,Direction_P2_Change, 0);//3��2���

  if(      Angle_P_Change_old!=Angle_P_Change)  
OLED_DisplayFloat(68+6*3+1, 3,Angle_P_Change, 0);//3��2���//
    
    }


void Oled_Data_ZS_All2(void)
{
 
  
    if(speed_set_old!=speed_set)
      OLED_DisplayFloat(1, 1,speed_set, 0);//OLED��ʾ float  



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
  
   
   
   
   



