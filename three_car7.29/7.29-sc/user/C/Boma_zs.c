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
/*拨码开关程序*****************************************************************************************--*/
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
//     OLED_Biaoge_ZS();//表格，静态
//     Flag=0;
//     }
//     OLED_Key_ZS();//按键改参数
//     if (KEY_sta)
//     {
//        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//        {
//            OLED_Select_ZS();
//            KEY_menuChange = !KEY_menuChange;
//        }
//        Oled_Data_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
//        KEY_sta = !KEY_sta;             
//    }   
//     break;
/*   
打角参数
Direction_P2  Direction_D2   
Angle_P 
Direction_P2_Change  Angle_P_Change; 
   
速度参数
直道P:BB_P_Z 弯道P:BB_P_Z  
 BB_W- BB_H-
   
环岛参数 7个    
*/        
/*----------------------------------------------------------*/
   case 1:
     if(Flag!=1)
{
     speed_set  = 70;//速度设定 
/*打角参数*/    
     Direction_P2=100;  Direction_D2=-300; //差值PD                               
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0; 
/*速度参数  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=0;     BB_H=0;
/*环岛参数  */    
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=200;//强制打角时间
     Circle_Count6_Max=2000;//下次圆环间隔时间1S1000
     Circle_Inductor_LR1=100;//进环最低左右电感值
     Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
 /*暂定不调参数  */ 
     Direction_P=100;    //阿克曼角P                     
     akmj_w=0;//阿克曼角
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
     speed_set  = 75;    //速度设定
/*打角参数*/  
     Direction_P2=150;      Direction_D2=-300; //差值PD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;     
/*速度参数  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=0;     BB_H=0;//10
/*环岛参数  */ 
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=200;//强制打角时间
     Circle_Count6_Max=2000;//下次圆环间隔时间1S1000
     Circle_Inductor_LR1=100;//进环最低左右电感值
  Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
/*暂定不调参数*/
     angle_limit=60;     //0,
     akmj_w=0;//阿克曼角20
     Direction_P=100;    //阿克曼角P                     
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
     speed_set  = 90;//速度设定  
/*打角参数*/  
     Direction_P2=500; Direction_D2=-1000; //差值PD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;     
/*速度参数  */ 
     BB_P_Z=50;  BB_P_W=50;
     BB_W=-0;BB_H=-0;//10
/*环岛参数  */ 
     Circle_Chazhi=100;    
     Circle_Finish_Count_Max=140;//强制打角时间
     Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
     Circle_Inductor_LR1=100;//进环最低左右电感值
     Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
/*暂定不调参数*/  
     angle_limit=60;     //0,
     akmj_w=0;//阿克曼角20     
     Direction_P=100;    //阿克曼角P                     
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
     speed_set  = 100;//速度设定 
/*打角参数*/    
     Direction_P2=600;    Direction_D2=-1000; //差值PD                        
     Angle_P=0;
     Direction_P2_Change=0;   Angle_P_Change=0;    
/*速度参数  */ 
    BB_P_Z=50;  BB_P_W=50;
    BB_W=0;BB_H=0;   
/*环岛参数  */   
     Circle_Chazhi=100;    
     Circle_Finish_Count_Max=140;//强制打角时间
     Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
     Circle_Inductor_LR1=100;//进环最低左右电感值
    Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
/*暂定不调参数*/ 
   Direction_P=100;//阿克曼角P                     
   akmj_z=0;    
   BB_P_Z=50;BB_P_F=200;
   BB_Z=0;
   angle_limit=60;  //0,
   akmj_w=0;//阿克曼角    
   Flag=4;
}
    break;
/*---------------------------------------------130,1000100,100，-35-------------*/     
case 5:
       if(Flag!=5)
{
     speed_set  = 110;//速度设定 
/*打角参数*/     
  Direction_P2=1100;  Direction_D2=-1000; //差值PD        
  Angle_P=0;
  Direction_P2_Change=50;  Angle_P_Change=50;    
/*速度参数  */
  BB_P_Z=50;  BB_P_W=0;
  BB_W=-10;BB_H=-10;
/*环岛参数  */   
  Circle_Chazhi=90;    
  Circle_Finish_Count_Max=140;//强制打角时间
  Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
  Circle_Inductor_LR1=100;//进环最低左右电感值
  Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
/*暂定不调参数*/
  Direction_P=100;//阿克曼角P 
  akmj_z=0;   
  BB_Z=0;
 BB_P_F=200;
  akmj_w=0;//阿克曼角
  angle_limit=60;  //0,                  

          Flag=5;
}
    break;
    
    
          case 6:
       if(Flag!=6)
{
     speed_set  = 120;//速度设定 
/*打角参数*/     
  Direction_P2=1000;    Direction_D2=-1000; //差值PD         
  Angle_P=0;
  Direction_P2_Change=100;  Angle_P_Change=100;    
/*速度参数  */
    BB_P_Z=50;  BB_P_W=0;
  BB_W=-20;BB_H=-20;
/*环岛参数  */   
     Circle_Chazhi=90;    
     Circle_Finish_Count_Max=140;//强制打角时间
     Circle_Count6_Max=5000;//下次圆环间隔时间1S1000
     Circle_Inductor_LR1=100;//进环最低左右电感值
     Circle_Inductor_M1=172;//进圆环双线值178
     Circle_Inductor_M2=170;//测转弯值175
     Circle_Inductor_M3=163;//转弯值160
/*暂定不调参数*/
      Direction_P=100;//阿克曼角P 
      akmj_z=0;   
      BB_Z=0;
      BB_P_Z=50;BB_P_F=200;
      angle_limit=60;  //0,                  
     akmj_w=0;//阿克曼角

          Flag=6;
}
    break;
          
     
     
/*----------------------------------------------------------*/     
//   case 15:
//     if(Flag!=15)
//     {
//     OLED_Clear();
//     OLED_Biaoge_Par_ZS();//表格，静态
//     Flag=15;
//     }
//     OLED_Key_Par_ZS();//按键改参数
//      if (KEY_sta)
//     {
//        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//        {
//            OLED_Select_Par_ZS();
//            KEY_menuChange = !KEY_menuChange;
//        }
//        Oled_Data_Par_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
//        KEY_sta = !KEY_sta;             
//    }   
//     break;

     
     
     
   default :
      break;
 }

}



/**
  * 简介
  *     拨码按键检测
  * 备注
0     1     2    3     4
0000 0001  0010 0011  0100
通过四个IO口的不同高低电平切换，2*2*2*2=16，共0-15，16个挡位
  */
