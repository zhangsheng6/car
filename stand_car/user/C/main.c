#include "allHead.h"

extern float tly_angle,tly_cangle;
 extern float  K_00, K_11;

int test_PWM;
int zs_car=1;
//uint8 scope_send_num;
//uint8 scope_send_count=0;
//uint8 send_flag=0;
////系统
uint32  i = 0;
uint16  j = 65532;
int   uart_flag;
uint16 PIT_times = 0;           //定时次数
uint8 chice = 0;    //按键使用
uint8 carStatus = NORMAL;     //小车状态选择
char RUN_flag = 0;
int star_times;
char Balance_Time,Motor_Time;


//菜单
uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
uint8 menuSelect = MENU;//菜单选择

//调试
char testcar_flag = 0;
int16 testcar_num  = 0;

//速度
uint8 speed_control_period = 0;

/**
  * 简介
  *     小车状态设置
  * 注意

  */
void PlanSet(void)
{
    switch (carStatus)
    {
    case NORMAL:
        break;

    case STOP:
        locking_L;
        locking_R;
        PIT_DisableIrq();//关 PIT 中断
        OLED_logo();
        break;
    default :
        break;
    }
}


/**
  * 简介
  *     无对应模块的IO口初始化函数
  * 注意
  */
void IoInit()
{
    //指示灯
    GpioInit(LED_0, GPO, 1);
    GpioInit(LED_1, GPO, 1);
    GpioInit(LED_2, GPO, 1);
    GpioInit(LED_3, GPO, 1);

    //蜂鸣器
    GpioInit(BUZZER, GPO, 0);

    //电机方向
    GpioInit(ENL_L, GPO, 0);
    GpioInit(ENL_R, GPO, 0);
    GpioInit(ENR_L, GPO, 0);
    GpioInit(ENR_R, GPO, 0);

    //测方向
    GpioInit(DIR_L, GPI, 0);
    GpioInit(DIR_R, GPI, 0);
}



/*****************************************************************************************/
// ----------------------------------- MAIN -------------------------------------------- //
/*****************************************************************************************/
void main()
{
    get_clk();  //因为作用域的原因，必须加载main里面，不能加在时钟里
    /* 初始化 ------------------------------------------------------- */
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
    //OLED_Display();
    IoInit();
    PIT_Init(PIT0, 5000);//1000             //PIT0 定时 5ms

    //开定时中断之前要完成的
//    OLED_MenuFlicker();//显示菜单

    PIT_EnableIrq();                  //开PIT0 中断


    //之前的程序
    //    set_irq_priority(IRQ_PIT_CH_1, 1); //PIT_CH_1 优先级设为1

   ENABLE_INTERRUPTS;   //开总中断

    /* 初始化 -------- END ------------------------------------------ */

    while (1)
    {
        PlanSet();
       //测试电机菜单 不使用时请屏蔽
//       KEY_TestMenu();
       //调试菜单选择
       KEY_ParaMenu();
   //     KEY_ParaMenuDisplay();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略

       //平衡参数
//       KEY_balance();
       
       
        
//             adcHold = ADC_Once(MMA7361, adc12bit);
//                if (!chice)
//                {
//                    UART_Uint16(adcHold, 1);
//                }
//                UART_SendFloat(adcHold, 1);
    //        UART_Uint16((uint16)gyro_ID);

    }
}
/*****************************************************************************************/
// ------------------------------ MAIN -------- END ------------------------------------ //
/*****************************************************************************************/


/**
  * 简介
  *     PIT0 中断
  */
void PIT_CH0_IRQHandler(void)
{
    PIT_CLEAR;  //清除中断标志
   
    //每 500ms LED0翻转一次
    if ((++PIT_times) >= 300)
    {
        PIT_times = 0;
        LED_0_TURN;
    }
    
    //按键过后3s发车
//    if(carStatus == Runing)
//    {
//      BUZZER_ON
//      if ((++star_times) >= 3000)
//      {
//        BUZZER_OFF
//         RUN_flag = 1;
//         carStatus = NORMAL;
//      }
//    }
    
    //调车延时
//    if(testcar_flag == 1)
//    {
//      
//      testcar_num ++;
//      if(testcar_num >= 20000)
//      {
//        carStatus   = STOP;
//        testcar_num = 0;
//        testcar_flag = 0;
//      }
//    }
    
//uart_sendware_float(Chazhi,0,0,0);
//     uart_flag++;
//
//    if(uart_flag == 10)
//    {
//     uart_flag = 0;
//    //  UART_SendFloat(Direction_angle,1);
////      UART_SendFloat(car_angle_speed, 1);
////      UART_SendFloat(Chazhi,1);
////
////      for (i = 0;i < 3;i++)
////      {
////          UART_SendFloat(AD_inductor1[i],1);
////      }
////
////      for (i = 0;i < 3;i++)
////      {
////          UART_SendFloat(AD_valu[i],1);
////      }


//    UART_Send_String("........\r\n");
//
//    }
      //电感采集
//      Date_analyse();
//      //方向控制
//      Direction_Controler();

      //平衡控制  5ms 控制一次
//      if(++Balance_Time >= 5)
//      {
        Balance_Time = 0;
       Angle_Kalman();
       Angle_Controler();
//      }
       //测速
        Get_CarSpeed(); 

        //速度控制  //100ms刷新一次
        speed_control_period++;
        Speed_Controler_Output();
        /*SPEED_TIME_OUT=20*/
        if(speed_control_period >= SPEED_TIME_OUT)
        {
            Speed_Controler();
            speed_control_period = 0;
        }

        //电机控制  5ms执行一次
//        if(++Motor_Time >= 5)
//        {
          Motor_Time = 0;
           if(zs_car == 1)
      
         Motor_control();
//        }
//P
//加速度计角度                acc_angle
//陀螺仪加速度获得的角度
//滤波后的角度          car_angle
  
//D         
//陀螺仪角速度   gyr_angle_speed
//滤波后的角速度    car_angle_speed     
/*
车平放      
 car_angle_speed没有gyr_angle_speed毛刺多
 波形偏差+-1.5  ，3     
 放大图片：
 car_angle为直线，波形偏差0.5度
 acc_angle为毛刺很多的一直上下波动的曲线，波形偏差12度  
*/         
   //uart_sendware_float(gyr_angle_speed,car_angle_speed,0,0);
   //uart_sendware_float(acc_angle,car_angle,0,0);
 //  uart_sendware_float(acc_angle,car_angle,tly_cangle,tly_angle);
uart_sendware_float(gyr_angle_speed,car_angle_speed,acc_angle,car_angle);
                           
//   OLED_DisplayFloat(10,1,acc_ave, 3); //加速度计角度
//    OLED_Int16(10, 1, gyro_x); //陀螺仪值
//    OLED_DisplayFloat(10,2,gyr_angle_speed, 3);//陀螺仪角速度  
   OLED_DisplayFloat(75,2,car_angle_speed, 3); //车角速度
//   
//   
//   OLED_DisplayFloat(10,3,acc_angle, 3); //加速度计角度
  OLED_DisplayFloat(75,3,car_angle, 3); //车角度
// 
//    OLED_DisplayFloat(10,4,K_00, 3); //车角度
//    OLED_DisplayFloat(75,4,K_11, 3); //车角度
//    
//    OLED_DisplayFloat(5,5,speed_L, 3); 
//    OLED_DisplayFloat(75,5,speed_R, 3); 

    //刷OLED //使用了硬件spi速率已经缩小到了us级别
    if (KEY_sta)
    {
//        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//        {
//            OLED_MenuFlicker();
//            KEY_menuChange = !KEY_menuChange;
//        }
        KEY_ParaMenuDisplay();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
        KEY_sta = !KEY_sta;
    } 
//程序：左正转
//实际  右反转         
//     change_L(3000);
//            forward_L;//正转
//////           reversal_L;         
////            change_R(4000);
//            forward_R;//正转
////           reversal_R;
//    
//    change_L(FTM_motorDuty);//测电机使用
//    change_R(FTM_motorDuty);//不测时请屏蔽    
}
  
/*
   加速度计的角度大概上反映了车的实际角度，
但是(静态下)加速度计的角度毛刺大，角度范围大，12度左右。角度变化频率快且大。
   陀螺仪的角速度没有加速度计的角度毛刺大，
但是(静态下)陀螺仪的角速度有静态偏差，会一直累加产生错误的角度值。‘
   所以，把俩个综合起来。
   以陀螺仪积分出来的角度作为基础角度，用加速度计出来的角度差
加上卡尔曼滤波消去陀螺仪的静态角度累积和位置差(把车随便放置一个角度
打开电源，陀螺仪积分的角度都是从0度开始，所以需要加速度计出来的大概角度)，
   
    angle_error = acc_angle - car_angle;  
    gyro_error += K_1 * angle_error; //X(K|K)
   
car_angle += (gyr_angle_speed-gyro_error) * INTEGRAL_TIME_CONSTANT;
     
car_angle  += K_0 * angle_error; //X(K|K)  

   先通过陀螺仪角速度积分出角度，为了消除角度累积，
然后运用加速度计测出来的大概角度，运用angle_error微分出的角速度偏差来消除角度累积
分析：
   车平放刚开始，car_angle=0，acc_angle=110，
   angle_error=110，加速度计角度作用大 
   K_1=-2,gyro_error=-220,
   car_angle=221*0.005=1.1度   --为+，0.005s
   1s：1.1*200=110度
   实际上，在这1s过程中，每过一个0.005，会比1.1越来越小
   
   K_0=0.几，car_angle+=0.几*110

    1s时间后，car_angle=109，acc_angle=110，
   angle_error=1，加速度计角度作用小 
        K_1=-0.007,gyro_error=-0.007,
   car_angle=1.007*0.005=0.几度   --为+，0.005s
   
   过会car_angle=120，acc_angle=110，
   angle_error=-10，加速度计角度作用小 
        K_1=-0.007,gyro_error=0.07,
   car_angle=-0.07*0.005=-几.几度   ，0.005s
   
angle_error = acc_angle - car_angle;  
gyro_error += K_1 * angle_error; //X(K|K)   
car_angle_speed = gyr_angle_speed - gyro_error;
   当陀螺仪的加速度有静态差较大较小时（陀螺仪加速度不稳定）， 
加上gyro_error的处理，当陀螺仪加速度误差大，带动角度误差大，
角度误差大，带动加速度误差大，所以同过gyr_angle_speed对car_angle_speed   
的修正也大 
*/


/*
车的实际运动：改变R_angle
 R_angle =  0.008;
 //Q_angle = 0.0003;
 //Q_gyro = 0.0001;
------------------------------------------
 R_angle =  1;
    车迅速立起来，然后一直上下很硬的动

R_angle =  0.5;
    车迅速立起来，并且一直保持在92度
但是碰到桌子后，开始一直上下很硬的动

-------------------
   说明R_angle较大的话，角度收敛慢，角度跟随不及时，
导致PID调节不是当前角度应有的操作，故车受到干扰后，
角度发生变化，然后角度跟随滞后，车一直上下摆动。
   R_angle较大也有好处，角度噪点少，角度稳态值平滑，所以
当车保持在92度时，除非外界干扰，他可以一直稳定保持。 
----------------
R_angle =  0.3;
      车迅速立起来，并且一直保持在92度，
往下拉车车可以快速回复不摆动

R_angle =  0;
   车死了
----------------
   说明R_angle较小车角度收敛，角度跟随及时，所以PID调节跟得上当前
的角度。但为0卡尔曼滤波错误，车的角度计算出来是几乎垂线上升，错误。
-------------------------
R_angle总结：
   R_angle调的时候，从大往小调。大的时候角度稳定平滑，先保证
1卡尔曼滤波计算出车的正确角度。但是车受到扰动(角度跟随不及时，PID调节不及时)，
车回复不过来，一直摆动基于此，往小调。调到车碰到桌子，拿手拉都可以恢复过来。
基于此，再往下跳。因为加上速度环，方向环，他们会影响直立环，要做到细微控制。
*/


/*
角度（初始？）方差
 Q_angle = 0.0003;

 Q_angle = 0.1;
   车可以立起来，但是车一直都咚咚的响 
Q_angle = 0.2;
   车可以立起来，拿手往下拉车，车一直都咚咚的响。
Q_angle = 0.1;
   车可以立起来，拿手往下拉车，车偶尔会一直咚咚的响。
----------------------------------------------------------
   Q_angle太大，(角度方差太大，不信任程度大),角度收敛快速，动态振幅大，
噪点多车平衡时，车的角度还在一定程度上以近似正弦波改变，
PID调节太快，车一直咚咚的响，因此得往小调。
----------------------------------------------------------
Q_angle = 0.01;
  车可以立起来， 一直捣鼓它，能感觉到抖动。

Q_angle = 0.001;
   效果不错，捣鼓他，可以快速恢复到
平衡位置，车也不会摆动
-------------------------------------------------------------------------------------------------------------------------------
  Q_angle = 0.001;既保持了Q_angle角度方差较大时的
角度跟随及时，角度收敛收敛快，又保持了
Q_angle角度方差较小时的稳定性。

-----------------------------------------------
Q_angle = 0.0005;同上

Q_angle = 0;
   车出现了在平放和倒下两种状态循环。
----------------------------------
  Q_angle = 0;角度跟随虽然平滑稳定，但是角度跟随
太不及时了出现了极端现象。
*/

/*陀螺仪角速度（初始？）方差
 //Q_gyro = 0.0001;

Q_gyro = 0.5;
Q_gyro = 0.1;
   车站不稳，喝醉了
----------------------------
   滤出来的稳定角度在加速度计的中心
   Q_gyro太大，(对陀螺仪角速度不信任大)，角度变化，
不信任，跟随不及时，所以车一直摆动，喝醉了
----------------------------------------
Q_gyro = 0.01;
   车还是不稳，上下之间摆动
Q_gyro = 0.001;
   可以
Q_gyro = 0;
可以：对角速度信任大，一旦变化就调节恢复
应该抖动的，但这里没有。
*/





//调直立环总结：
//1卡尔曼3个参数从大往小调
//2直立环PD从小往大调，先调P，再D
//通过调1，2先保证只有直立环的时候能平衡
//在通过调12保证受到干扰也能平衡，最后保证
//有速度环方向环也能平衡。

//卡尔曼前俩参数有这种现象
//要么角度跟随及时，波形杂，噪点多
//要么角度跟随不及时，角度稳定平滑

