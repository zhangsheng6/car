/*
很多事情都不值得你动容。不要觉得会有人相信你。
*/
#include "allHead.h"
extern uint8  KEY_sta ;//按键状态，1-按下
extern char position; 

uint16 PIT_times = 0;           //定时次数
uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
uint8 carStatus = 0;     //速度方案使用
uint8 menuSelect = MENU;//菜单选择
uint8 z=1;
  int x=0;
int   speed_control_counter = 0;

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
    PIT_Init(PIT0, 2500);             //PIT0 定时 5ms

    //开定时中断之前要完成的
    
  OLED_MenuFlicker();//速度控制改参数显示菜单
  
//OLED_Inductor_Static();//电感名称显示
//  OLED_Speed_Static();//速度名称显示

    PIT_EnableIrq();                  //开PIT0 中断
    ENABLE_INTERRUPTS;   //开总中断
    
    while (1)
    {
//       KEY();//zs按键阿克曼角  
//       ReadDataControl();
       KEY_ParaMenu();//按键改变数据1
       //void OLED_Menu();//oled显示数据名称3
       //void OLED_MenuFlicker();//oled菜单闪烁4
       //KEY_ParaMenuDisplay();//oled显示实时数据2
        
//         PlanSet();
        //ReadDataControl();//串口控制   
    }
}
/********PIT0 中断:自定义函数名在中断向量表中进行了替换*****************************************/
void PIT_CH0_IRQHandler(void)
{
//                LED_1_OFF;//1.212MS正常跑
//                                LED_0_OFF;

    PIT_CLEAR;    
    g_5msFlag=1;


    //清除中断标志   
    if ((++PIT_times) >= 200)//每 500ms LED0翻转一次
    {
        PIT_times = 0;
        LED_0_TURN;
    }  
//    
  Inductor_analyse();//方向判断
//Read_ADC();
  Test_RoadInfo();
//  Test_RoadInfo_Shuzhi(); 
  Test_Huandao(); 
  Gyro_ZS();
  Direction_ChaSpeed_Control();

//Direction_Controler_I();
z++;
if(z>1)
{
  z=0;
  Get_CarSpeed();//获取车速  
//  Direction_Controler();
  speed_control_counter++;
  if (speed_control_counter >= SPEED_CONTROL_PERIOD)//周期100ms
 {
      Speed_Controler();//速度环PI控制
      speed_control_counter = 0;
 }
 
  

}

Direction_Controler();
  
  Motor_control();//电机控制输出PWM   



if(x++>51)
{
  x=0;
//OLED_Inductor_Dynamic();//线跳动，数据变化大
// OLED_Speed_Dynamic();////一个OLED显示0.158ms
// UART_Send();//线跳动，数据变化小//1个串口发送1.068ms
          UART_SendFloat(gyr_angle_speed,1);  

}  
 
//刷OLED，使用了硬件spi速率已经缩小到了us级别
    if (KEY_sta)
    {
        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        {
            OLED_MenuFlicker();
            KEY_menuChange = !KEY_menuChange;
        }
        KEY_ParaMenuDisplay();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
        KEY_sta = !KEY_sta;
    }
//              LED_1_ON;
//   change_L(5000);
//   change_R(5000);
//   forward_L;
//   forward_R;
}


//uint8 scope_send_num;
//uint8 scope_send_count=0;
//uint8 send_flag=0;
////系统

//uint16 Runing_times=0;
//uint16 Runing_Distance = 0;
//#define Runing_Furthest  3000		//试车最远距离(单位:cm)
//uint8 Car_Status = Ready;	//开机即直立
//uint8 Stop_Car_cnt = 0;
//uint8 Stop_Car_flag=0;
//uint8 forward_flag = 0;
//float power;
//uint8 key=0;
//
//uint8 alarm_status=0;
////速度
//uint8 speed_control_period = 0;
//uint8 podao_spd_flag=0;
//uint8 podao_flag;/* 当赛道识别程序加入后，将此定义移到该文档 --- han 2017-11-1 */
////方向
//uint32 Brick_Time = 0,Podao_Time = 0,Start_Line_Time = 0,Test_Time = 0;
//uint8 boma, boma_last = 0, key_value;
