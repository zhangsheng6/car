///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       31/Jul/2018  01:25:13
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\main.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\main.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -lB
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\ -o
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\device\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\user\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\lib\H\ -I
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\..\system\coreSupport\ -On
//    List file    =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Init
        EXTERN BangBang
        EXTERN Boma_Change
        EXTERN Boma_Gear_ZS
        EXTERN Boma_num
        EXTERN Controler
        EXTERN Data_Old
        EXTERN Data_Old2
        EXTERN Direction_ChaSpeed_Control
        EXTERN Direction_Controler
        EXTERN FTM_PwmDuty
        EXTERN FTM_PwmInit
        EXTERN FTM_SpeedInit
        EXTERN Get_CarSpeed
        EXTERN GpioSet
        EXTERN GpioTurn
        EXTERN Gyro_ZS
        EXTERN Hall
        EXTERN Inductor_analyse
        EXTERN IoInit
        EXTERN KEY_Init
        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN L3G4200_Init
        EXTERN Motor_control
        EXTERN OLED_Biaoge_Par_ZS
        EXTERN OLED_Biaoge_ZS
        EXTERN OLED_Clear
        EXTERN OLED_Inductor_Dynamic
        EXTERN OLED_Init
        EXTERN OLED_Int16
        EXTERN OLED_Key_Par_ZS
        EXTERN OLED_Key_ZS
        EXTERN OLED_Select_Par_ZS
        EXTERN OLED_Select_ZS
        EXTERN Oled_Data_Par_ZS
        EXTERN Oled_Data_ZS
        EXTERN Oled_Data_ZS_All
        EXTERN Oled_Data_ZS_All2
        EXTERN PIT_EnableIrq
        EXTERN PIT_Init
        EXTERN Stop_Flag
        EXTERN Test_Huandao
        EXTERN Test_RoadInfo
        EXTERN UART_Init
        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_cfcmple
        EXTERN get_clk
        EXTERN jiemian
        EXTERN speed_car
        EXTERN speed_set

        PUBLIC Chazhi_Class
        PUBLIC KEY_textSelect
        PUBLIC PIT_CH0_IRQHandler
        PUBLIC PIT_times
        PUBLIC carStatus
        PUBLIC delay_stop
        PUBLIC direction_control_counter
        PUBLIC flash_time
        PUBLIC iic_error
        PUBLIC iic_error_counter
        PUBLIC ijk
        PUBLIC jiemian_flag
        PUBLIC kez
        PUBLIC main
        PUBLIC man
        PUBLIC menuSelect
        PUBLIC ms
        PUBLIC s
        PUBLIC spee
        PUBLIC speed_control_counter
        PUBLIC x
        PUBLIC z
        PUBLIC zhan
        PUBLIC zs_car
        PUBLIC zz

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\main.c
//    1 /*
//    2 很多事情都不值得你动容。不要觉得会有人相信你。
//    3 只有自己靠的住，不要轻易相信他人。
//    4 */
//    5 #include "allHead.h"
//    6 #include "lcd.h"
//    7 #include "flash.h"
//    8 #include "BL.h"
//    9 extern uint8  KEY_sta ;//按键状态，1-按下
//   10 extern char position; 
//   11 extern float Stop_Plan_Flag;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   12 uint32 ijk = 123, kez;
ijk:
        DATA
        DC32 123

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
kez:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float spee[3000]={0};
spee:
        DS8 12000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 float zhan[3000]={0};
zhan:
        DS8 12000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 int flash_time=0;
flash_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   16 uint16 PIT_times = 0;           //定时次数
PIT_times:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17 uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
KEY_textSelect:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   18 uint8 carStatus = 0;     //速度方案使用
carStatus:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   19 uint8 menuSelect = MENU;//菜单选择
menuSelect:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 int z=0,zz=0,man=0;
z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
zz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
man:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21   int x=0;
x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22   int zs_car=0;
zs_car:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int   speed_control_counter = 0,direction_control_counter=0;
speed_control_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
direction_control_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int  iic_error=0,iic_error_counter=0;
iic_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
iic_error_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int  Chazhi_Class=0;
Chazhi_Class:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 int ms=0,s=0;
ms:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
s:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 int delay_stop=0;
delay_stop:
        DS8 4
//   28 extern int Boma_num;
//   29 extern int Boma_Change;
//   30 
//   31  extern float speed_set_old,//速度设定 
//   32 
//   33       Direction_P_old,//阿克曼角P                     
//   34       Direction_P2_old,Direction_D2_old,//差值PD                        
//   35       Angle_P_old;
//   36 extern int  akmj_z_old,akmj_w_old;//w20
//   37   
//   38      
//   39 extern float     BB_Z_old,BB_W_old,BB_H_old;
//   40 extern int      BB_P_Z_old,BB_P_F_old;
//   41 
//   42  extern int    Circle_Count6_Max_old,//下次圆环间隔时间1S1000
//   43         Circle_Inductor_M1_old,//进圆环双线值
//   44          Circle_Inductor_M2_old,//测转弯值
//   45          Circle_Inductor_M3_old,//转弯值
//   46          Circle_Inductor_LR1_old; 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47  int jiemian_flag=0;
jiemian_flag:
        DS8 4
//   48 /*****************************************************************************************/
//   49 // ----------------------------------- MAIN -------------------------------------------- //
//   50 /*****************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void main()
//   52 {
main:
        PUSH     {R7,LR}
//   53     get_clk();  //因为作用域的原因，必须加载main里面，不能加在时钟里
        BL       get_clk
//   54     DISABLE_INTERRUPTS;  //关总中断
        CPSID    I
//   55 
//   56     ADC_Init();//一定要放在最前面，里面开了ADC时钟
        BL       ADC_Init
//   57     UART_Init(UART_PART, UART_BAUD);
        MOVS     R1,#+225
        LSLS     R1,R1,#+9        ;; #+115200
        MOVS     R0,#+2
        BL       UART_Init
//   58     L3G4200_Init();//顺序随便
        BL       L3G4200_Init
//   59     FTM_PwmInit(PWM_CH0, ch0, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   60     FTM_PwmInit(PWM_CH1, ch1, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   61     FTM_SpeedInit(FTM_SPEED_L);       //测速 初始化
        MOVS     R0,#+0
        BL       FTM_SpeedInit
//   62     FTM_SpeedInit(FTM_SPEED_R);       //测速 初始化
        MOVS     R0,#+1
        BL       FTM_SpeedInit
//   63     //放在后面
//   64     OLED_Init();
        BL       OLED_Init
//   65 
//   66     KEY_Init();
        BL       KEY_Init
//   67     IoInit();
        BL       IoInit
//   68     PIT_Init(PIT0, 1000);             //PIT0 定时 5ms
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MOVS     R0,#+0
        BL       PIT_Init
//   69   //开定时中断之前要完成的
//   70    OLED_Biaoge_ZS(); 
        BL       OLED_Biaoge_ZS
//   71     PIT_EnableIrq();                  //开PIT0 中断
        BL       PIT_EnableIrq
//   72     ENABLE_INTERRUPTS;   //开总中断   
        CPSIE    I
//   73  
//   74     while (1)
??main_0:
        B        ??main_0
//   75     {
//   76       
//   77       
//   78 
//   79     }
//   80 }
//   81 /********PIT0 中断:自定义函数名在中断向量表中进行了替换*****************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void PIT_CH0_IRQHandler(void)
//   83 {
PIT_CH0_IRQHandler:
        PUSH     {R7,LR}
//   84   PIT_CLEAR;    
        LDR      R0,??DataTable0  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x4003710c
        STR      R1,[R0, #+0]
//   85   if ((++PIT_times) >= 500)//每 500ms LED0翻转一次
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable0_1
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        CMP      R0,R1
        BLT      ??PIT_CH0_IRQHandler_0
//   86   {
//   87       PIT_times = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
//   88       LED_0_TURN;
        MOVS     R0,#+48
        BL       GpioTurn
//   89   }  
//   90   
//   91 //测试电感环岛
//   92   Inductor_analyse();//方向判断 
??PIT_CH0_IRQHandler_0:
        BL       Inductor_analyse
//   93   Test_Huandao();    
        BL       Test_Huandao
//   94   
//   95 /*车跑--------------------------------------------------------------------------*/
//   96 if(zs_car==1)
        LDR      R0,??DataTable0_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??PIT_CH0_IRQHandler_1
//   97 {  
//   98   
//   99 //霍尔停车
//  100    Hall(); 
        BL       Hall
//  101    
//  102 //陀螺仪检测   
//  103    Gyro_ZS(); 
        BL       Gyro_ZS
//  104 //延时发车   
//  105 //  if(delay_stop<3)
//  106 //  {
//  107 //     delay_stop++;
//  108 //      LED_1_ON;
//  109 //   }150,1600,1000，100,50，-3040
//  110 //   else
//  111 //  {
//  112      LED_1_OFF;
        MOVS     R1,#+1
        MOVS     R0,#+49
        BL       GpioSet
//  113   //速度环     
//  114      z++;
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  115      if(z>4)//5ms,4
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??PIT_CH0_IRQHandler_2
//  116      {
//  117         z=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  118         Get_CarSpeed();//获取车速  
        BL       Get_CarSpeed
//  119         BangBang();   
        BL       BangBang
//  120      }
//  121     Test_RoadInfo();
??PIT_CH0_IRQHandler_2:
        BL       Test_RoadInfo
//  122   Direction_ChaSpeed_Control();
        BL       Direction_ChaSpeed_Control
//  123   Controler();
        BL       Controler
//  124   
//  125   
//  126   Direction_Controler();
        BL       Direction_Controler
//  127  
//  128 
//  129   Motor_control();//电机控制输出PWM 
        BL       Motor_control
//  130 
//  131 //}
//  132   if(Stop_Flag==1)
        LDR      R0,??DataTable0_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??PIT_CH0_IRQHandler_3
//  133   {
//  134     speed_set=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  135     if(speed_car<20)
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable0_7  ;; 0x41a00000
        BL       __aeabi_cfcmple
        BCS      ??PIT_CH0_IRQHandler_3
//  136     {
//  137        change_L(0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//  138        change_R(0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
        B        ??PIT_CH0_IRQHandler_3
//  139     }
//  140     
//  141   }
//  142   
//  143 
//  144 //  if(Stop_Plan_Flag==1)
//  145 //  {
//  146 //  ms++; 
//  147 //      if(ms>999)
//  148 //      {
//  149 //        ms=0;
//  150 //        s++;
//  151 //      }
//  152 //  }    
//  153   
//  154 }
//  155 /*停车--------------------------------------------------------------------------*/
//  156 else
//  157 {
//  158   change_L(0);
??PIT_CH0_IRQHandler_1:
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//  159   change_R(0); 
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//  160   if(Boma_Change)
        LDR      R0,??DataTable0_8
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_4
//  161   {
//  162      OLED_Int16(110, 7, Boma_num);
        LDR      R0,??DataTable0_9
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+110
        BL       OLED_Int16
//  163   }
//  164   
//  165   if(jiemian==2)
??PIT_CH0_IRQHandler_4:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??PIT_CH0_IRQHandler_5
//  166   {
//  167     Data_Old2();
        BL       Data_Old2
//  168     Boma_Gear_ZS();
        BL       Boma_Gear_ZS
//  169    Oled_Data_ZS_All2();
        BL       Oled_Data_ZS_All2
        B        ??PIT_CH0_IRQHandler_3
//  170   }
//  171   else
//  172   {
//  173       OLED_Inductor_Dynamic();//线跳动，数据变化大
??PIT_CH0_IRQHandler_5:
        BL       OLED_Inductor_Dynamic
//  174       Data_Old();
        BL       Data_Old
//  175       Boma_Gear_ZS();
        BL       Boma_Gear_ZS
//  176       Oled_Data_ZS_All();
        BL       Oled_Data_ZS_All
//  177   }
//  178   
//  179 
//  180 }
//  181 //界面2调参
//  182   if(jiemian==2)
??PIT_CH0_IRQHandler_3:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??PIT_CH0_IRQHandler_6
//  183 
//  184 {
//  185   if(jiemian_flag!=2)
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+2
        BEQ      ??PIT_CH0_IRQHandler_7
//  186      {
//  187      OLED_Clear();
        BL       OLED_Clear
//  188      OLED_Biaoge_Par_ZS();//表格，静态字母
        BL       OLED_Biaoge_Par_ZS
//  189      jiemian_flag=2;
        MOVS     R0,#+2
        LDR      R1,??DataTable0_11
        STR      R0,[R1, #+0]
//  190      }
//  191   
//  192      OLED_Key_Par_ZS();//按键改参数//?
??PIT_CH0_IRQHandler_7:
        BL       OLED_Key_Par_ZS
//  193   
//  194     if (KEY_sta)
        LDR      R0,??DataTable0_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_8
//  195     {
//  196         if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        LDR      R0,??DataTable0_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_9
//  197         {
//  198             OLED_Select_Par_ZS();//三角形
        BL       OLED_Select_Par_ZS
//  199             KEY_menuChange = !KEY_menuChange;
        LDR      R0,??DataTable0_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_10
        MOVS     R0,#+1
        LDR      R1,??DataTable0_13
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_9
??PIT_CH0_IRQHandler_10:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_13
        STRB     R0,[R1, #+0]
//  200         }
//  201         Oled_Data_Par_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
??PIT_CH0_IRQHandler_9:
        BL       Oled_Data_Par_ZS
//  202         KEY_sta = !KEY_sta;             
        LDR      R0,??DataTable0_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_11
        MOVS     R0,#+1
        LDR      R1,??DataTable0_12
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_8
??PIT_CH0_IRQHandler_11:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_12
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_8
//  203     }
//  204 }
//  205 //界面1调参
//  206 else 
//  207 {
//  208     if(jiemian_flag!=1)
??PIT_CH0_IRQHandler_6:
        LDR      R0,??DataTable0_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??PIT_CH0_IRQHandler_12
//  209      {
//  210      OLED_Clear();
        BL       OLED_Clear
//  211      OLED_Biaoge_ZS();//表格，静态
        BL       OLED_Biaoge_ZS
//  212      jiemian_flag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable0_11
        STR      R0,[R1, #+0]
//  213      }
//  214       
//  215   OLED_Key_ZS();
??PIT_CH0_IRQHandler_12:
        BL       OLED_Key_ZS
//  216   
//  217     if (KEY_sta)
        LDR      R0,??DataTable0_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_8
//  218     {
//  219         if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        LDR      R0,??DataTable0_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_13
//  220         {
//  221             OLED_Select_ZS();
        BL       OLED_Select_ZS
//  222             KEY_menuChange = !KEY_menuChange;
        LDR      R0,??DataTable0_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_14
        MOVS     R0,#+1
        LDR      R1,??DataTable0_13
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_13
??PIT_CH0_IRQHandler_14:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_13
        STRB     R0,[R1, #+0]
//  223         }
//  224         Oled_Data_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
??PIT_CH0_IRQHandler_13:
        BL       Oled_Data_ZS
//  225         KEY_sta = !KEY_sta;             
        LDR      R0,??DataTable0_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_15
        MOVS     R0,#+1
        LDR      R1,??DataTable0_12
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_8
??PIT_CH0_IRQHandler_15:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_12
        STRB     R0,[R1, #+0]
//  226     }
//  227 }    
//  228 
//  229 
//  230 
//  231 
//  232 
//  233 }
??PIT_CH0_IRQHandler_8:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     PIT_times

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     Stop_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     speed_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     Boma_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Boma_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     jiemian

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     jiemian_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     KEY_menuChange

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  234 
// 
// 24 068 bytes in section .bss
//      5 bytes in section .data
//    618 bytes in section .text
// 
//    618 bytes of CODE memory
// 24 073 bytes of DATA memory
//
//Errors: none
//Warnings: none
