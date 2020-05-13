#include "Variable.h"
#include "common.h"
#include "allHead.h"
#include  "Boma_zs.h"
extern int Boma_num;
extern int  Direction_P2_Change,Angle_P_Change;  
uint8 BO_Scan(void)
{
    uint8 num = 0;

    if (GpioGet(KEY_BO_0) == UP)    num |= ((uint8)(1<<3));//num |= 1000
    if (GpioGet(KEY_BO_1) == UP)    num |= ((uint8)(1<<2));//num |= 0100
    if (GpioGet(KEY_BO_2) == UP)    num |= ((uint8)(1<<1));//num |= 0010
    if (GpioGet(KEY_BO_3) == UP)    num |= ((uint8)(1<<0));//num |= 0000

    return num;
}

uint8 Flag=0;
int Boma_num=0,Boma_num_old=0;
int Boma_Change=0;
/*���뿪�س���*****************************************************************************************--*/
void Boma_Gear_ZS(void)
{
  Boma_num_old=Boma_num;
  Boma_num=BO_Scan();
  if(Boma_num_old==Boma_num)
    Boma_Change=0;
  else
    Boma_Change=1;
 switch(BO_Scan())
 {
/*----------------------------------------------------------*/
//   case 0:
//      if(Flag!=0)
//     {
//     OLED_Clear();
//     OLED_Biaoge_ZS();//��񣬾�̬
//     Flag=0;
//     }
//     OLED_Key_ZS();//�����Ĳ���
//     if (KEY_sta)
//     {
//        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
//        {
//            OLED_Select_ZS();
//            KEY_menuChange = !KEY_menuChange;
//        }
//        Oled_Data_ZS();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
//        KEY_sta = !KEY_sta;             
//    }   
//     break;
/*   
��ǲ���
Direction_P2  Direction_D2   
Angle_P 
Direction_P2_Change  Angle_P_Change; 
   
�ٶȲ���
ֱ��P:BB_P_Z ���P:BB_P_Z  
 BB_W- BB_H-
   
�������� 7��    
*/        
/*----------------------------------------------------------*/
   case 1:
     if(Flag!=1)
{
     speed_set  = 70;//�ٶ��趨 
/*��ǲ���*/    
     Direction_P2=100;  Direction_D2=-300; //��ֵPD                               
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0; 
/*�ٶȲ���  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=0;     BB_H=0;
/*��������  */    
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=200;//ǿ�ƴ��ʱ��
     Circle_Count6_Max=2000;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_LR1=100;//����������ҵ��ֵ
     Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
 /*�ݶ���������  */ 
     Direction_P=100;    //��������P                     
     akmj_w=0;//��������
     angle_limit=60;  //0,     
     akmj_z=0;   
     BB_Z=0;
     BB_P_F=200;

     Flag=1;
}
    break; 
/*----------------------------------------------------------*/     

    case 2:
       if(Flag!=2)
{
     speed_set  = 75;    //�ٶ��趨
/*��ǲ���*/  
     Direction_P2=150;      Direction_D2=-300; //��ֵPD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;     
/*�ٶȲ���  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=0;     BB_H=0;//10
/*��������  */ 
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=200;//ǿ�ƴ��ʱ��
     Circle_Count6_Max=2000;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_LR1=100;//����������ҵ��ֵ
  Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
/*�ݶ���������*/
     angle_limit=60;     //0,
     akmj_w=0;//��������20
     Direction_P=100;    //��������P                     
     akmj_z=0;   
     BB_Z=0;
    BB_P_F=200;   
   
          Flag=2;

}     
    break; 
 /*----------------------------------------------------------*/     
   
 case 3:
       if(Flag!=3)
{
     speed_set  = 90;//�ٶ��趨  
/*��ǲ���*/  
     Direction_P2=500; Direction_D2=-1000; //��ֵPD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;     
/*�ٶȲ���  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=-0;BB_H=-0;//10
/*��������  */ 
     Circle_Chazhi=100;    
     Circle_Finish_Count_Max=140;//ǿ�ƴ��ʱ��
     Circle_Count6_Max=5000;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_LR1=100;//����������ҵ��ֵ
     Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
/*�ݶ���������*/  
     angle_limit=60;     //0,
     akmj_w=0;//��������20     
     Direction_P=100;    //��������P                     
     akmj_z=0;   
     BB_Z=0;
     BB_P_F=200;   
      
          Flag=3;
}
    break;
/*----------------------------------------------------------*/     
case 4:
       if(Flag!=4)
{
     speed_set  = 100;//�ٶ��趨 
/*��ǲ���*/    
     Direction_P2=600;    Direction_D2=-1000; //��ֵPD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;    
/*�ٶȲ���  */ 
    BB_P_Z=50;  BB_P_W=50;
    BB_W=0;BB_H=0;   
/*��������  */   
     Circle_Chazhi=100;    
     Circle_Finish_Count_Max=140;//ǿ�ƴ��ʱ��
     Circle_Count6_Max=5000;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_LR1=100;//����������ҵ��ֵ
    Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
/*�ݶ���������*/ 
   Direction_P=100;//��������P                     
   akmj_z=0;    
   BB_P_Z=50;BB_P_F=200;
   BB_Z=0;
   angle_limit=60;  //0,
   akmj_w=0;//��������    
   Flag=4;
}
    break;
/*---------------------------------------------130,1000100,100��-35-------------*/     
case 5:
       if(Flag!=5)
{
     speed_set  = 110;//�ٶ��趨 
/*��ǲ���*/     
  Direction_P2=1100;  Direction_D2=-1000; //��ֵPD        
  Angle_P=0;
  Direction_P2_Change=50;  Angle_P_Change=50;    
/*�ٶȲ���  */
  BB_P_Z=50;  BB_P_W=0;
  BB_W=-10;BB_H=-10;
/*��������  */   
  Circle_Chazhi=90;    
  Circle_Finish_Count_Max=140;//ǿ�ƴ��ʱ��
  Circle_Count6_Max=5000;//�´�Բ�����ʱ��1S1000
  Circle_Inductor_LR1=100;//����������ҵ��ֵ
  Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
/*�ݶ���������*/
  Direction_P=100;//��������P 
  akmj_z=0;   
  BB_Z=0;
 BB_P_F=200;
  akmj_w=0;//��������
  angle_limit=60;  //0,                  

          Flag=5;
}
    break;
    
    
          case 6:
       if(Flag!=6)
{
     speed_set  = 120;//�ٶ��趨 
/*��ǲ���*/     
  Direction_P2=1000;    Direction_D2=-1000; //��ֵPD         
  Angle_P=0;
  Direction_P2_Change=100;  Angle_P_Change=100;    
/*�ٶȲ���  */
    BB_P_Z=50;  BB_P_W=0;
  BB_W=-20;BB_H=-20;
/*��������  */   
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=140;//ǿ�ƴ��ʱ��
     Circle_Count6_Max=5000;//�´�Բ�����ʱ��1S1000
     Circle_Inductor_LR1=100;//����������ҵ��ֵ
     Circle_Inductor_M1=172;//��Բ��˫��ֵ178
     Circle_Inductor_M2=170;//��ת��ֵ175
     Circle_Inductor_M3=163;//ת��ֵ160
/*�ݶ���������*/
      Direction_P=100;//��������P 
      akmj_z=0;   
      BB_Z=0;
      BB_P_Z=50;BB_P_F=200;
      angle_limit=60;  //0,                  
     akmj_w=0;//��������

          Flag=6;
}
    break;
          
     
     
/*----------------------------------------------------------*/     
//   case 15:
//     if(Flag!=15)
//     {
//     OLED_Clear();
//     OLED_Biaoge_Par_ZS();//��񣬾�̬
//     Flag=15;
//     }
//     OLED_Key_Par_ZS();//�����Ĳ���
//      if (KEY_sta)
//     {
//        if (KEY_menuChange)//�˵�ѡ���������ʾ ���·����ν��� ��С������
//        {
//            OLED_Select_Par_ZS();
//            KEY_menuChange = !KEY_menuChange;
//        }
//        Oled_Data_Par_ZS();//�����Ҫ1ms����,�����ڵڶ��ΰ���������������ʱ�����Ժ���
//        KEY_sta = !KEY_sta;             
//    }   
//     break;

     
     
     
   default :
      break;
 }

}



/**
  * ���
  *     ���밴�����
  * ��ע
0     1     2    3     4
0000 0001  0010 0011  0100
ͨ���ĸ�IO�ڵĲ�ͬ�ߵ͵�ƽ�л���2*2*2*2=16����0-15��16����λ
  */
