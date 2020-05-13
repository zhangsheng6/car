///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       01/May/2018  14:50:05
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\main.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\main.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_RAM\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0+ -e
//        --fpu=None --dlib_config F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h
//        -I H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\..\system\coreSupport\ -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\5.1\iar\KEA_128_RAM\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_Init
        EXTERN Direction_ChaSpeed_Control
        EXTERN Direction_Controler
        EXTERN FTM_PwmInit
        EXTERN FTM_SpeedInit
        EXTERN Get_CarSpeed
        EXTERN GpioTurn
        EXTERN Gyro_ZS
        EXTERN Inductor_analyse
        EXTERN IoInit
        EXTERN KEY_Init
        EXTERN KEY_ParaMenu
        EXTERN KEY_ParaMenuDisplay
        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN L3G4200_Init
        EXTERN Motor_control
        EXTERN OLED_Init
        EXTERN OLED_MenuFlicker
        EXTERN PIT_EnableIrq
        EXTERN PIT_Init
        EXTERN Speed_Controler
        EXTERN Test_Huandao
        EXTERN Test_RoadInfo
        EXTERN UART_Init
        EXTERN g_5msFlag
        EXTERN get_clk

        PUBLIC KEY_textSelect
        PUBLIC PIT_CH0_IRQHandler
        PUBLIC PIT_times
        PUBLIC carStatus
        PUBLIC main
        PUBLIC menuSelect
        PUBLIC speed_control_counter
        PUBLIC x
        PUBLIC z

// H:\智能车程序2018\电磁三轮——ZS\5.1\user\C\main.c
//    1 /*
//    2 很多事情都不值得你动容。不要觉得会有人相信你。
//    3 */
//    4 #include "allHead.h"
//    5 extern uint8  KEY_sta ;//按键状态，1-按下
//    6 extern char position; 
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    8 uint16 PIT_times = 0;           //定时次数
PIT_times:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    9 uint8 KEY_textSelect = TEXT_DEFAULT;  //测试菜单 使用
KEY_textSelect:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 uint8 carStatus = 0;     //速度方案使用
carStatus:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   11 uint8 menuSelect = MENU;//菜单选择
menuSelect:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   12 uint8 z=1;
z:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13   int x=0;
x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int   speed_control_counter = 0;
speed_control_counter:
        DS8 4
//   15 
//   16 /*****************************************************************************************/
//   17 // ----------------------------------- MAIN -------------------------------------------- //
//   18 /*****************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 void main()
//   20 {
main:
        PUSH     {R7,LR}
//   21     get_clk();  //因为作用域的原因，必须加载main里面，不能加在时钟里
        BL       get_clk
//   22     DISABLE_INTERRUPTS;  //关总中断
        CPSID    I
//   23 
//   24     ADC_Init();//一定要放在最前面，里面开了ADC时钟
        BL       ADC_Init
//   25     UART_Init(UART_PART, UART_BAUD);
        MOVS     R1,#+225
        LSLS     R1,R1,#+9        ;; #+115200
        MOVS     R0,#+2
        BL       UART_Init
//   26     L3G4200_Init();//顺序随便
        BL       L3G4200_Init
//   27     FTM_PwmInit(PWM_CH0, ch0, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   28     FTM_PwmInit(PWM_CH1, ch1, 10, 0); //PWM 初始化
        MOVS     R3,#+0
        MOVS     R2,#+10
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       FTM_PwmInit
//   29     FTM_SpeedInit(FTM_SPEED_L);       //测速 初始化
        MOVS     R0,#+0
        BL       FTM_SpeedInit
//   30     FTM_SpeedInit(FTM_SPEED_R);       //测速 初始化
        MOVS     R0,#+1
        BL       FTM_SpeedInit
//   31     //放在后面
//   32     OLED_Init();
        BL       OLED_Init
//   33     KEY_Init();
        BL       KEY_Init
//   34     IoInit();
        BL       IoInit
//   35     PIT_Init(PIT0, 2500);             //PIT0 定时 5ms
        LDR      R1,??DataTable1  ;; 0x9c4
        MOVS     R0,#+0
        BL       PIT_Init
//   36 
//   37     //开定时中断之前要完成的
//   38     
//   39   OLED_MenuFlicker();//速度控制改参数显示菜单
        BL       OLED_MenuFlicker
//   40   
//   41 //OLED_Inductor_Static();//电感名称显示
//   42 //  OLED_Speed_Static();//速度名称显示
//   43 
//   44     PIT_EnableIrq();                  //开PIT0 中断
        BL       PIT_EnableIrq
//   45     ENABLE_INTERRUPTS;   //开总中断
        CPSIE    I
//   46     
//   47     while (1)
//   48     {
//   49 //       KEY();//zs按键阿克曼角  
//   50 //       ReadDataControl();
//   51        KEY_ParaMenu();//按键改变数据1
??main_0:
        BL       KEY_ParaMenu
        B        ??main_0
//   52        //void OLED_Menu();//oled显示数据名称3
//   53        //void OLED_MenuFlicker();//oled菜单闪烁4
//   54        //KEY_ParaMenuDisplay();//oled显示实时数据2
//   55         
//   56 //         PlanSet();
//   57         //ReadDataControl();//串口控制   
//   58     }
//   59 }
//   60 /********PIT0 中断:自定义函数名在中断向量表中进行了替换*****************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   61 void PIT_CH0_IRQHandler(void)
//   62 {
PIT_CH0_IRQHandler:
        PUSH     {R7,LR}
//   63 //                LED_1_OFF;//1.212MS正常跑
//   64 //                                LED_0_OFF;
//   65 
//   66     PIT_CLEAR;    
        LDR      R0,??DataTable1_1  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable1_1  ;; 0x4003710c
        STR      R1,[R0, #+0]
//   67     g_5msFlag=1;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//   68 
//   69 
//   70     //清除中断标志   
//   71     if ((++PIT_times) >= 100)//每 500ms LED0翻转一次
        LDR      R0,??DataTable1_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_3
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable1_3
        LDRH     R0,[R0, #+0]
        CMP      R0,#+100
        BLT      ??PIT_CH0_IRQHandler_0
//   72     {
//   73         PIT_times = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_3
        STRH     R0,[R1, #+0]
//   74         LED_0_TURN;
        MOVS     R0,#+48
        BL       GpioTurn
//   75     }  
//   76 //    
//   77   Inductor_analyse();//方向判断
??PIT_CH0_IRQHandler_0:
        BL       Inductor_analyse
//   78 //Read_ADC();
//   79   Test_RoadInfo();
        BL       Test_RoadInfo
//   80 //  Test_RoadInfo_Shuzhi(); 
//   81   Test_Huandao(); 
        BL       Test_Huandao
//   82   Gyro_ZS();
        BL       Gyro_ZS
//   83   Direction_ChaSpeed_Control();
        BL       Direction_ChaSpeed_Control
//   84 
//   85 //Direction_Controler_I();
//   86 z++;
        LDR      R0,??DataTable1_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_4
        STRB     R0,[R1, #+0]
//   87 if(z>1)
        LDR      R0,??DataTable1_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BLT      ??PIT_CH0_IRQHandler_1
//   88 {
//   89   z=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_4
        STRB     R0,[R1, #+0]
//   90   Get_CarSpeed();//获取车速  
        BL       Get_CarSpeed
//   91 //  Direction_Controler();
//   92   speed_control_counter++;
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//   93   if (speed_control_counter >= SPEED_CONTROL_PERIOD)//周期100ms
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+20
        BLT      ??PIT_CH0_IRQHandler_1
//   94  {
//   95       Speed_Controler();//速度环PI控制
        BL       Speed_Controler
//   96       speed_control_counter = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
//   97  }
//   98  
//   99   
//  100 
//  101 }
//  102 
//  103 Direction_Controler();
??PIT_CH0_IRQHandler_1:
        BL       Direction_Controler
//  104   
//  105   Motor_control();//电机控制输出PWM   
        BL       Motor_control
//  106 
//  107 
//  108 
//  109 if(x++>1)
        LDR      R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        LDR      R2,??DataTable1_6
        STR      R1,[R2, #+0]
        CMP      R0,#+2
        BLT      ??PIT_CH0_IRQHandler_2
//  110 {
//  111   x=0;
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  112 //OLED_Inductor_Dynamic();//线跳动，数据变化大
//  113 // OLED_Speed_Dynamic();////一个OLED显示0.158ms
//  114 // UART_Send();//线跳动，数据变化小//1个串口发送1.068ms
//  115 }  
//  116  
//  117 //刷OLED，使用了硬件spi速率已经缩小到了us级别
//  118     if (KEY_sta)
??PIT_CH0_IRQHandler_2:
        LDR      R0,??DataTable1_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_3
//  119     {
//  120         if (KEY_menuChange)//菜单选择和数据显示 更新分两次进行 减小数据量
        LDR      R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??PIT_CH0_IRQHandler_4
//  121         {
//  122             OLED_MenuFlicker();
        BL       OLED_MenuFlicker
//  123             KEY_menuChange = !KEY_menuChange;
        LDR      R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_5
        MOVS     R0,#+1
        LDR      R1,??DataTable1_8
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_4
??PIT_CH0_IRQHandler_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_8
        STRB     R0,[R1, #+0]
//  124         }
//  125         KEY_ParaMenuDisplay();//大概需要1ms左右,但由于第二次按键不操作，所以时间差可以忽略
??PIT_CH0_IRQHandler_4:
        BL       KEY_ParaMenuDisplay
//  126         KEY_sta = !KEY_sta;
        LDR      R0,??DataTable1_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??PIT_CH0_IRQHandler_6
        MOVS     R0,#+1
        LDR      R1,??DataTable1_7
        STRB     R0,[R1, #+0]
        B        ??PIT_CH0_IRQHandler_3
??PIT_CH0_IRQHandler_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_7
        STRB     R0,[R1, #+0]
//  127     }
//  128 //              LED_1_ON;
//  129 //   change_L(5000);
//  130 //   change_R(5000);
//  131 //   forward_L;
//  132 //   forward_R;
//  133 }
??PIT_CH0_IRQHandler_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x9c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     g_5msFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     PIT_times

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     speed_control_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
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
//  134 
//  135 
//  136 //uint8 scope_send_num;
//  137 //uint8 scope_send_count=0;
//  138 //uint8 send_flag=0;
//  139 ////系统
//  140 
//  141 //uint16 Runing_times=0;
//  142 //uint16 Runing_Distance = 0;
//  143 //#define Runing_Furthest  3000		//试车最远距离(单位:cm)
//  144 //uint8 Car_Status = Ready;	//开机即直立
//  145 //uint8 Stop_Car_cnt = 0;
//  146 //uint8 Stop_Car_flag=0;
//  147 //uint8 forward_flag = 0;
//  148 //float power;
//  149 //uint8 key=0;
//  150 //
//  151 //uint8 alarm_status=0;
//  152 ////速度
//  153 //uint8 speed_control_period = 0;
//  154 //uint8 podao_spd_flag=0;
//  155 //uint8 podao_flag;/* 当赛道识别程序加入后，将此定义移到该文档 --- han 2017-11-1 */
//  156 ////方向
//  157 //uint32 Brick_Time = 0,Podao_Time = 0,Start_Line_Time = 0,Test_Time = 0;
//  158 //uint8 boma, boma_last = 0, key_value;
// 
//  12 bytes in section .bss
//   2 bytes in section .data
// 360 bytes in section .text
// 
// 360 bytes of CODE memory
//  14 bytes of DATA memory
//
//Errors: none
//Warnings: none
