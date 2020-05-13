///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\main.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\main.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config H:\IAR7.3\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Init
        EXTERN BO_Scan
        EXTERN BangBang
        EXTERN Controler
        EXTERN Direction_ChaSpeed_Control
        EXTERN Direction_Controler
        EXTERN FTM_PwmDuty
        EXTERN FTM_PwmInit
        EXTERN FTM_SpeedInit
        EXTERN Get_CarSpeed
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
        EXTERN OLED_Biaoge_ZS
        EXTERN OLED_Inductor_Dynamic
        EXTERN OLED_Init
        EXTERN OLED_Int16
        EXTERN OLED_Key_ZS
        EXTERN OLED_Select_ZS
        EXTERN Oled_Data_ZS
        EXTERN PIT_EnableIrq
        EXTERN PIT_Init
        EXTERN Stop_Flag
        EXTERN Test_Huandao
        EXTERN Test_RoadInfo
        EXTERN UART_Init
        EXTERN __aeabi_cfcmpeq
        EXTERN get_clk
        EXTERN speed_set

        PUBLIC Boma_num
        PUBLIC Chazhi_Class
        PUBLIC KEY_textSelect
        PUBLIC PIT_CH0_IRQHandler
        PUBLIC PIT_times
        PUBLIC carStatus
        PUBLIC direction_control_counter
        PUBLIC flash_time
        PUBLIC iic_error
        PUBLIC iic_error_counter
        PUBLIC ijk
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

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\main.c
//    1 /*
//    2 
//    3 很多事情都不值得你动容。不要觉得会有人相信你。
//    4 只有自己靠的住，不要轻易相信他人。
//    5 
//    6 解决再次进环岛，设定差值
//    7 解决提前进弯后反转
//    8 模糊PID
//    9 
//   10 */
//   11 #include "allHead.h"
//   12 #include "lcd.h"
//   13 #include "flash.h"
//   14 #include "BL.h"
//   15 
//   16 extern uint8  KEY_sta ;//按键状态，1-按下
//   17 extern char position; 
//   18 
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 uint32 ijk = 123, kez;
ijk:
        DATA
        DC32 123

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
kez:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float spee[3000]={0};
spee:
        DS8 12000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float zhan[3000]={0};
zhan:
        DS8 12000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 int flash_time=0;
flash_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   24 uint16 PIT_times = 0;           //定时次数
PIT_times:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   25 uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
KEY_textSelect:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   26 uint8 carStatus = 0;     //速度方案使用
carStatus:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   27 uint8 menuSelect = MENU;//菜单选择
menuSelect:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 int z=0,zz=0,man=0;
z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
zz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
man:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29   int x=0;
x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30   int zs_car=0;
zs_car:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 int   speed_control_counter = 0,direction_control_counter=0;
speed_control_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
direction_control_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 int  iic_error=0,iic_error_counter=0;
iic_error:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
iic_error_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 int  Chazhi_Class=0;
Chazhi_Class:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 int ms=0,s=0;
ms:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
s:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 int Boma_num=0;
Boma_num:
        DS8 4
//   36 /*****************************************************************************************/
//   37 // ----------------------------------- MAIN -------------------------------------------- //
//   38 /*****************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   39 void main()
//   40 {
main:
        PUSH     {R7,LR}
//   41     get_clk();  //因为作用域的原因，必须加载main里面，不能加在时钟里
        BL       get_clk
//   42     DISABLE_INTERRUPTS;  //关总中断
        CPSID    I
//   43 
//   44     ADC_Init();//一定要放在最前面，里面开了ADC时钟
        BL       ADC_Init
//   45     UART_Init(UART_PART, UART_BAUD);
        MOVS     R1,#+225
        LSLS     R1,R1,#+9        ;; #+115200
        MOVS     R0,#+2
        BL       UART_Init
//   46     L3G4200_Init();//顺序随便
        BL       L3G4200_Init
//   47     FTM_PwmInit(PWM_CH0, ch0, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   48     FTM_PwmInit(PWM_CH1, ch1, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   49     FTM_SpeedInit(FTM_SPEED_L);       //测速 初始化
        MOVS     R0,#+0
        BL       FTM_SpeedInit
//   50     FTM_SpeedInit(FTM_SPEED_R);       //测速 初始化
        MOVS     R0,#+1
        BL       FTM_SpeedInit
//   51     //放在后面
//   52     OLED_Init();
        BL       OLED_Init
//   53 //    LCD_Init();
//   54 //      LCD_Name_ZS();  
//   55 //        Flash_Init(0);
//   56     KEY_Init();
        BL       KEY_Init
//   57     IoInit();
        BL       IoInit
//   58     PIT_Init(PIT0, 1000);             //PIT0 定时 5ms
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MOVS     R0,#+0
        BL       PIT_Init
//   59   //开定时中断之前要完成的
//   60    OLED_Biaoge_ZS();    
        BL       OLED_Biaoge_ZS
//   61 //OLED_MenuFlicker();//速度控制改参数显示菜单  
//   62     PIT_EnableIrq();                  //开PIT0 中断
        BL       PIT_EnableIrq
//   63     ENABLE_INTERRUPTS;   //开总中断   
        CPSIE    I
//   64 // flash_time++;
//   65 // spee[flash_time]=speed_R;
//   66 //  zhan[flash_time]=Motor_Out_R_Temp;
//   67 //        Direction_P = FLASH_READ(0,float);   
//   68     while (1)
??main_0:
        B        ??main_0
//   69     {
//   70 //      KEY_TestMenu();//测试电机       
//   71 //      KEY();//zs按键阿克曼角差速      
//   72 //        OLED_Key_ZS();
//   73 //      LCD_Key_ZS();           
//   74 //       KEY_ParaMenu();//按键改变数据1
//   75        //void OLED_Menu();//oled显示数据名称3
//   76        //void OLED_MenuFlicker();//oled菜单闪烁4
//   77        //KEY_ParaMenuDisplay();//oled显示实时数据2        
//   78       //ReadDataControl();  
//   79       //PlanSet();
//   80       //ReadDataControl();//串口控制   
//   81     }
//   82 }
//   83 /********PIT0 中断:自定义函数名在中断向量表中进行了替换*****************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 void PIT_CH0_IRQHandler(void)
//   85 {
PIT_CH0_IRQHandler:
        PUSH     {R7,LR}
//   86 //LED_0_OFF;//1.212MS正常跑//        LED_1_OFF;
//   87 //        LED_2_OFF;
//   88 //        LED_3_OFF;
//   89   PIT_CLEAR;    
        LDR      R0,??DataTable0  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x4003710c
        STR      R1,[R0, #+0]
//   90 
//   91   if ((++PIT_times) >= 500)//每 500ms LED0翻转一次
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
//   92   {
//   93       PIT_times = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_1
        STRH     R0,[R1, #+0]
//   94       LED_0_TURN;
        MOVS     R0,#+48
        BL       GpioTurn
//   95   }  
//   96  
//   97   Inductor_analyse();//方向判断 
??PIT_CH0_IRQHandler_0:
        BL       Inductor_analyse
//   98        Test_Huandao();    
        BL       Test_Huandao
//   99 
//  100   if(zs_car==1)
        LDR      R0,??DataTable0_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??PIT_CH0_IRQHandler_1
//  101 { 
//  102 //   Test_Huandao(); 
//  103    
//  104    Hall();
        BL       Hall
//  105    
//  106    Gyro_ZS(); 
        BL       Gyro_ZS
//  107    
//  108   if(Stop_Flag==1)
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        BL       __aeabi_cfcmpeq
        BNE      ??PIT_CH0_IRQHandler_2
//  109   {
//  110     speed_set=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//  111       OLED_Int16(75, 5, ms);
        LDR      R0,??DataTable0_5
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+75
        BL       OLED_Int16
//  112   OLED_Int16(75, 6, s);
        LDR      R0,??DataTable0_6
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+75
        BL       OLED_Int16
//  113   }
//  114  //棒棒10ms  阿克曼角5ms    
//  115   z++;
??PIT_CH0_IRQHandler_2:
        LDR      R0,??DataTable0_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  116   if(z>4)//5ms,4
        LDR      R0,??DataTable0_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+5
        BLT      ??PIT_CH0_IRQHandler_3
//  117  {
//  118      z=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  119      Get_CarSpeed();//获取车速  
        BL       Get_CarSpeed
//  120    
//  121 //     zz++;
//  122 //     if(zz>1)
//  123 //     {
//  124 //       zz=0;
//  125       BangBang();   
        BL       BangBang
//  126 //     }
//  127 
//  128  }
//  129 
//  130    Test_RoadInfo();
??PIT_CH0_IRQHandler_3:
        BL       Test_RoadInfo
//  131      Direction_ChaSpeed_Control();
        BL       Direction_ChaSpeed_Control
//  132      Controler();
        BL       Controler
//  133      
//  134    
//  135   Direction_Controler();
        BL       Direction_Controler
//  136 
//  137   Motor_control();//电机控制输出PWM 
        BL       Motor_control
//  138   if(Stop_Flag==0)
        LDR      R0,??DataTable0_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE      ??PIT_CH0_IRQHandler_4
//  139   {
//  140   ms++; 
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  141       if(ms>999)
        LDR      R0,??DataTable0_5
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        CMP      R0,R1
        BLT      ??PIT_CH0_IRQHandler_4
//  142       {
//  143         ms=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  144         s++;
        LDR      R0,??DataTable0_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_4
//  145       }
//  146   }
//  147       
//  148 //              AD_hall = ADC_Once(Hall,adc12bit);  //中2 通道
//  149   
//  150 //       OLED_Int16(75, 5, AD_hall);
//  151 //  OLED_Int16(75, 6, speed_set_R); 
//  152 //  OLED_Int16(75, 5, speed_L);
//  153 //  OLED_Int16(75, 6, speed_R);
//  154 
//  155 //  OLED_DisplayFloat(110,7,gyr_angle_speed, 3); 
//  156 
//  157 //  OLED_DisplayFloat(75,5,speed_car, 1); 
//  158 //  OLED_DisplayFloat(75,5,Chazhi_Rate, 1); 
//  159 //  OLED_DisplayFloat(75,5,speed_L, 1); 
//  160 //  OLED_DisplayFloat(75,6,speed_R, 1); 
//  161 }
//  162 else
//  163 {
//  164   OLED_Inductor_Dynamic();//线跳动，数据变化大
??PIT_CH0_IRQHandler_1:
        BL       OLED_Inductor_Dynamic
//  165   change_L(0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//  166   change_R(0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmDuty
//  167  }
//  168  Boma_num=BO_Scan();
??PIT_CH0_IRQHandler_4:
        BL       BO_Scan
        LDR      R1,??DataTable0_8
        STR      R0,[R1, #+0]
//  169    OLED_Int16(75, 7, Boma_num);
        LDR      R0,??DataTable0_8
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+75
        BL       OLED_Int16
//  170 
//  171  
//  172  OLED_Key_ZS();
        BL       OLED_Key_ZS
//  173 //刷OLED  OLED_Int16(75, 6, s);
//  174 //使用了硬件spi速率已经缩小到了us级别
//  175     if (KEY_sta)
        LDR      R0,??DataTable0_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_5
//  176     {
//  177         if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        LDR      R0,??DataTable0_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_6
//  178         {
//  179             OLED_Select_ZS();
        BL       OLED_Select_ZS
//  180             KEY_menuChange = !KEY_menuChange;
        LDR      R0,??DataTable0_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_7
        MOVS     R0,#+1
        LDR      R1,??DataTable0_10
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_6
??PIT_CH0_IRQHandler_7:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_10
        STRB     R0,[R1, #+0]
//  181         }
//  182         Oled_Data_ZS();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
??PIT_CH0_IRQHandler_6:
        BL       Oled_Data_ZS
//  183         KEY_sta = !KEY_sta;             
        LDR      R0,??DataTable0_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_8
        MOVS     R0,#+1
        LDR      R1,??DataTable0_9
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_5
??PIT_CH0_IRQHandler_8:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_9
        STRB     R0,[R1, #+0]
//  184     }
//  185      
//  186 //FTM_motorDuty=3000;
//  187 //   change_L(FTM_motorDuty);
//  188 //   change_R(FTM_motorDuty);
//  189 //   forward_L;
//  190 //   forward_R;
//  191 //   reversal_L;
//  192 //     reversal_R;
//  193 //        LED_0_ON;
//  194 ////        LED_1_ON;
//  195 //        LED_2_ON;
//  196 //        LED_3_ON;
//  197 }
??PIT_CH0_IRQHandler_5:
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
        DC32     Stop_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     ms

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     s

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     Boma_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
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
//  198 
//  199 
//  200 
//  201 
//  202 
//  203 
//  204 //  if(Chazhi>20)  Chazhi+=20;
//  205 //  if(Chazhi<-20)  Chazhi-=20;
//  206 //  Chazhi=1.5*Chazhi;
//  207 //    if(Chazhi>0) 
//  208 //    {
//  209 //       if(Chazhi<AD_inductor[4]&&AD_inductor[3]<10)
//  210 //         Chazhi=(Chazhi+AD_inductor[4])/2;
//  211 //    }
//  212 //   if(Chazhi<0) 
//  213 //    {
//  214 //       if(-1*Chazhi<AD_inductor[3]&&AD_inductor[4]<10)
//  215 //         Chazhi=(Chazhi-AD_inductor[3])/2;
//  216 //    }
//  217 
//  218 
//  219 
//  220 
//  221 
//  222 
//  223 //if(x++>20)
//  224 //{
//  225 //  x=0;
//  226 //// LCD_Inductor_Dynamic();//一个0.9ms
//  227 ////void LCD_Speed_Dynamic(void);
//  228 ////OLED_Inductor_Dynamic();//线跳动，数据变化大
//  229 ////OLED_Speed_Dynamic();////一个OLED显示0.158ms
//  230 ////UART_Send();//线跳动，数据变化小//1个串口发送1.068ms
//  231 ////OLED_DisplayFloat(35, 0, iic_error_counter, 2);//OLED显示 float  
//  232 
//  233 ////  UART_SendFloat(gyr_angle_speed,1);  
//  234 //}  
//  235  
//  236 
//  237 //LCD
//  238 //    if (KEY_sta)
//  239 //    {
//  240 //        if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
//  241 //        {
//  242 //       LCD_Data_ZS();  
//  243 //          KEY_menuChange = !KEY_menuChange;
//  244 //        }
//  245 //              LCD_Data_ZS();
//  246 //
//  247 //        KEY_sta = !KEY_sta;             
//  248 //    }
//  249 
// 
// 24 064 bytes in section .bss
//      5 bytes in section .data
//    484 bytes in section .text
// 
//    484 bytes of CODE memory
// 24 069 bytes of DATA memory
//
//Errors: none
//Warnings: none
