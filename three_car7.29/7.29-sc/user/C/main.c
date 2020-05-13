/*
很多事情都不值得你动容。不要觉得会有人相信你。
只有自己靠的住，不要轻易相信他人。
*/
#include "allHead.h"
#include "lcd.h"
#include "flash.h"
#include "BL.h"
extern uint8  KEY_sta ;//按键状态，1-按下
extern char position; 
extern float Stop_Plan_Flag;
uint32 ijk = 123, kez;
float spee[3000]={0};
float zhan[3000]={0};
int flash_time=0;
uint16 PIT_times = 0;           //定时次数
uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
uint8 carStatus = 0;     //速度方案使用
uint8 menuSelect = MENU;//菜单选择
int z=0,zz=0,man=0;
  int x=0;
  int zs_car=0;
int   speed_control_counter = 0,direction_control_counter=0;
int  iic_error=0,iic_error_counter=0;
int  Chazhi_Class=0;
int ms=0,s=0;
int delay_stop=0;
extern int Boma_num;
extern int Boma_Change;

 extern float speed_set_old,//速度设定 

      Direction_P_old,//阿克曼角P                     
      Direction_P2_old,Direction_D2_old,//差值PD                        
      Angle_P_old;
extern int  akmj_z_old,akmj_w_old;//w20
  
     
extern float     BB_Z_old,BB_W_old,BB_H_old;
extern int      BB_P_Z_old,BB_P_F_old;

 extern int    Circle_Count6_Max_old,//下次圆环间隔时间1S1000
        Circle_Inductor_M1_old,//进圆环双线值
         Circle_Inductor_M2_old,//测转弯值
         Circle_Inductor_M3_old,//转弯值
         Circle_Inductor_LR1_old; 
 int jiemian_flag=0;
/*****************************************************************************************/
// ----------------------------------- MAIN -------------------------------------------- //
/*****************************************************************************************/
void main()
{
    get_clk();  //因为作用域的原因，必须加载main里面，不能加在时钟里
    DISABLE_INTERRUPTS;  //关总中断

    ADC_Init();//一定要放在最前面，里面开了ADC时钟
    UART_Init(UART_PART, UART_BAUD);
    L3G4200_Init();//顺序随便
    FTM_PwmInit(PWM_CH0, ch0, 10, 0); //PWM 初始化
    FTM_PwmInit(PWM_CH1, ch1, 10, 0); //PWM 初始化
    FTM_SpeedInit(FTM_SPEED_L);       //测速 初始化
    FTM_SpeedInit(FTM_SPEED_R);       //测速 初始化
    //放在后面
    OLED_Init();

    KEY_Init();
    IoInit();
    PIT_Init(PIT0, 1000);             //PIT0 定时 5ms
  //开定时中断之前要完成的
   OLED_Biaoge_ZS(); 
    PIT_EnableIrq();                  //开PIT0 中断
    ENABLE_INTERRUPTS;   //开总中断   
 
    while (1)
    {
      
      

    }
}
/********PIT0 中断:自定义函数名在中断向量表中进行了替换*****************************************/
void PIT_CH0_IRQHandler(void)
{
  PIT_CLEAR;    
  if ((++PIT_times) >= 500)//每 500ms LED0翻转一次
  {
      PIT_times = 0;
      LED_0_TURN;
  }  
  
//测试电感环岛
  Inductor_analyse();//方向判断 
  Test_Huandao();    
  
/*车跑--------------------------------------------------------------------------*/
if(zs_car==1)
{  
  
//霍尔停车
   Hall(); 
   
//陀螺仪检测   
   Gyro_ZS(); 
//延时发车   
//  if(delay_stop<3)
//  {
//     delay_stop++;
//      LED_1_ON;
//   }150,1600,1000，100,50，-3040
//   else
//  {
     LED_1_OFF;
  //速度环     
     z++;
     if(z>4)//5ms,4
     {
        z=0;
        Get_CarSpeed();//获取车速  
        BangBang();   
     }
    Test_RoadInfo();
  Direction_ChaSpeed_Control();
  Controler();
  
  
  Direction_Controler();
 

  Motor_control();//电机控制输出PWM 

//}
  if(Stop_Flag==1)
  {
    speed_set=0;
    if(speed_car<20)
    {
       change_L(0);
       change_R(0);
    }
    
  }
  

//  if(Stop_Plan_Flag==1)
//  {
//  ms++; 
//      if(ms>999)
//      {
//        ms=0;
//        s++;
//      }
//  }    
  
}
/*停车--------------------------------------------------------------------------*/
else
{
  change_L(0);
  change_R(0); 
  if(Boma_Change)
  {
     OLED_Int16(110, 7, Boma_num);
  }
  
  if(jiemian==2)
  {
    Data_Old2();
    Boma_Gear_ZS();
   Oled_Data_ZS_All2();
  }
  else
  {
      OLED_Inductor_Dynamic();//线跳动，数据变化大
      Data_Old();
      Boma_Gear_ZS();
      Oled_Data_ZS_All();
  }
  

}
//界面2调参
  if(jiemian==2)

{
  if(jiemian_flag!=2)
     {
     OLED_Clear();
     OLED_Biaoge_Par_ZS();//表格，静态字母
     jiemian_flag=2;
     }
  
     OLED_Key_Par_ZS();//按键改参数//?
  
    if (KEY_sta)
    {
        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        {
            OLED_Select_Par_ZS();//三角形
            KEY_menuChange = !KEY_menuChange;
        }
        Oled_Data_Par_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
        KEY_sta = !KEY_sta;             
    }
}
//界面1调参
else 
{
    if(jiemian_flag!=1)
     {
     OLED_Clear();
     OLED_Biaoge_ZS();//表格，静态
     jiemian_flag=1;
     }
      
  OLED_Key_ZS();
  
    if (KEY_sta)
    {
        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        {
            OLED_Select_ZS();
            KEY_menuChange = !KEY_menuChange;
        }
        Oled_Data_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
        KEY_sta = !KEY_sta;             
    }
}    





}

