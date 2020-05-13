///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:42
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\XS_ZS.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\XS_ZS.c -D IAR -D
//        TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -lB
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\ -o
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0+ -e --fpu=None --dlib_config
//        F:\IAR安装包\arm\INC\c\DLib_Config_Normal.h -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\device\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\user\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\lib\H\ -I
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\..\system\coreSupport\
//        -Ol
//    List file    =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\XS_ZS.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_inductor
        EXTERN AD_valu
        EXTERN Chasu_Bili
        EXTERN Chazhi
        EXTERN GpioSet
        EXTERN KEY_Scan
        EXTERN KEY_sta
        EXTERN OLED_DisplayFloat
        EXTERN OLED_DisplaytinyStr
        EXTERN OLED_Int16
        EXTERN UART_SendFloat
        EXTERN UART_Send_String
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN angle
        EXTERN menuSelect
        EXTERN speed_L
        EXTERN speed_R
        EXTERN speed_set

        PUBLIC KEY
        PUBLIC OLED_Inductor_Dynamic
        PUBLIC OLED_Inductor_Static
        PUBLIC OLED_Speed_Dynamic
        PUBLIC OLED_Speed_Static
        PUBLIC UART_Send
        PUBLIC uart_flag

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\user\C\XS_ZS.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 char uart_flag = 0;
uart_flag:
        DS8 1
//    6 /*显示名称*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void OLED_Inductor_Static(void)
//    8 {
OLED_Inductor_Static:
        PUSH     {R7,LR}
//    9   OLED_DisplaytinyStr(1, 0, "Righ:");
        LDR      R2,??DataTable4
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   10   OLED_DisplaytinyStr(1, 1, "Midd:");
        LDR      R2,??DataTable4_1
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   11   OLED_DisplaytinyStr(1, 2, "Left:");
        LDR      R2,??DataTable4_2
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   12   OLED_DisplaytinyStr(1, 4, "Ri_V:");
        LDR      R2,??DataTable4_3
        MOVS     R1,#+4
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   13   OLED_DisplaytinyStr(1, 5, "Le_V:");
        LDR      R2,??DataTable4_4
        MOVS     R1,#+5
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   14   OLED_DisplaytinyStr(1, 7, "Chzh:");
        LDR      R2,??DataTable4_5
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   15 }
        POP      {R0,PC}          ;; return
//   16 //显示数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void OLED_Inductor_Dynamic(void)
//   18 {
OLED_Inductor_Dynamic:
        PUSH     {R7,LR}
//   19   OLED_Int16(40, 0, AD_valu[0]);
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+0
        MOVS     R0,#+40
        BL       OLED_Int16
//   20   OLED_DisplayFloat(80,0,AD_inductor[0], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_7
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   21   
//   22   OLED_Int16(40, 1, AD_valu[1]);
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+4]
        SXTH     R2,R2
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_Int16
//   23   OLED_DisplayFloat(80,1,AD_inductor[1], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_7
        LDR      R2,[R0, #+4]
        MOVS     R1,#+1
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   24   
//   25   OLED_Int16(40, 2, AD_valu[2]);
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+8]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+40
        BL       OLED_Int16
//   26   OLED_DisplayFloat(80,2,AD_inductor[2], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_7
        LDR      R2,[R0, #+8]
        MOVS     R1,#+2
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   27   
//   28   OLED_Int16(40, 4, AD_valu[3]);
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+12]
        SXTH     R2,R2
        MOVS     R1,#+4
        MOVS     R0,#+40
        BL       OLED_Int16
//   29   OLED_DisplayFloat(80,4,AD_inductor[3], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_7
        LDR      R2,[R0, #+12]
        MOVS     R1,#+4
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   30   
//   31   OLED_Int16(40, 5, AD_valu[4]);
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+16]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+40
        BL       OLED_Int16
//   32   OLED_DisplayFloat(80,5,AD_inductor[4], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_7
        LDR      R2,[R0, #+16]
        MOVS     R1,#+5
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   33   
//   34   OLED_DisplayFloat(60,6,Chazhi, 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+60
        BL       OLED_DisplayFloat
//   35   OLED_DisplayFloat(1,7,angle, 0); 
        MOVS     R3,#+0
        LDR      R0,??DataTable5_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
//   36 //  OLED_DisplayFloat(60,7,Chazhi_Rate, 3); 
//   37 }
        POP      {R0,PC}          ;; return
//   38 
//   39 /*显示名称*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 void OLED_Speed_Static(void)
//   41 {
OLED_Speed_Static:
        PUSH     {R7,LR}
//   42 //  OLED_DisplaytinyStr(1, 0, "Chzh:");
//   43   OLED_DisplaytinyStr(1, 0, "ChBi:");
        LDR      R2,??DataTable4_9
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   44   OLED_DisplaytinyStr(1, 1, "Angl:");
        LDR      R2,??DataTable4_10
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   45   OLED_DisplaytinyStr(1, 3, "S_L:");
        LDR      R2,??DataTable4_11
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   46   OLED_DisplaytinyStr(1, 4, "S_R:");
        LDR      R2,??DataTable4_12
        MOVS     R1,#+4
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   47   
//   48 //OLED_DisplaytinyStr(1, 5, "S_ZC:");
//   49 //OLED_DisplaytinyStr(1, 7, "S_RC:");
//   50 OLED_DisplaytinyStr(1, 7, "S:");
        ADR      R2,??DataTable5_12  ;; 0x53, 0x3A, 0x00, 0x00
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   51 }
        POP      {R0,PC}          ;; return
//   52 //显示数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 void OLED_Speed_Dynamic(void)
//   54 {
OLED_Speed_Dynamic:
        PUSH     {R7,LR}
//   55   
//   56 //  OLED_DisplayFloat(40,1,wgy, 3);//255
//   57 //  OLED_DisplayFloat(40,2,gy, 3);//-1
//   58 //  OLED_DisplayFloat(40,3,gyro_y, 3);//-1哦了吗                                                                                                         
//   59 ////  OLED_DisplayFloat(40,3,gyr_angle_speed, 3);
//   60 ////  OLED_DisplayFloat(40,5,gyr_angle, 3);
//   61 //  OLED_DisplayFloat(40,2,Speed_I_lntegral_L, 3);
//   62 //  OLED_DisplayFloat(40,5,Speed_I_lntegral_R, 3);
//   63 //  OLED_DisplayFloat(40,0,Chazhi, 3);   
//   64 //    OLED_DisplayFloat(40,0,Chasu_Bili, 3);   
//   65 //    OLED_DisplayFloat(40,1,angle, 3); 
//   66 ////  
//   67 //  OLED_DisplayFloat(40,1,speed_set_L, 3); 
//   68 //  OLED_DisplayFloat(40,2,speed_set_R, 3); 
//   69 //  
//   70       OLED_DisplayFloat(40,7,speed_L, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+40
        BL       OLED_DisplayFloat
//   71   OLED_DisplayFloat(80,7,speed_R, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable5_13
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+80
        BL       OLED_DisplayFloat
//   72 //    OLED_DisplayFloat(40,5,speed_set, 3); 
//   73 //    OLED_DisplayFloat(40,6,Chazhi_Rate, 3); 
//   74 
//   75 
//   76 }
        POP      {R0,PC}          ;; return
//   77 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   78 void UART_Send(void)
//   79 {
UART_Send:
        PUSH     {R7,LR}
//   80      uart_flag++;     
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_1
        STRB     R0,[R1, #+0]
//   81     if(uart_flag ==1)
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??UART_Send_0
//   82     {   
//   83        uart_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_1
        STRB     R0,[R1, #+0]
//   84 ///////////////////////////陀螺仪////////////////////////////////////////////////////////////////////
//   85 //        UART_SendFloat(wgz,1);  
//   86 //        UART_SendFloat(gz,1);  
//   87 //        UART_SendFloat(gyro_z,1);  
//   88 //        UART_SendFloat(gyr_offset__z_average,1);  
//   89 //        UART_SendFloat(gyr_angle_speed,1);  
//   90 //        UART_SendFloat(gyr_angle_speed_static,1);  
//   91 //        UART_SendFloat(gyr_angle,1); 
//   92        
//   93 //        UART_SendFloat(gyro_x,1);  
//   94 //        UART_SendFloat(gyr_offset__x_average,1); 
//   95 //        UART_SendFloat(gyr_angle_speed_up,1);  
//   96 //        UART_SendFloat(gyr_angle_up,1); 
//   97           UART_Send_String("................\r\n");
        LDR      R0,??DataTable5_2
        BL       UART_Send_String
//   98 ///////////////////////////电感////////////////////////////////////////////////////////////////////
//   99 
//  100 // UART_Send_String(".........实际电感值.......\r\n");      
//  101 //     for(int i = 0;i < 5;i++)
//  102 //    {
//  103 //   UART_SendFloat(AD_valu[i],1);
//  104 //    }
//  105 // UART_Send_String("........归一化电感值........\r\n");
//  106 //
//  107 //       for(int i = 0;i < 5;i++)
//  108 //    {
//  109 //      UART_SendFloat(AD_inductor[i],1);  
//  110 //   }
//  111 //
//  112 //         UART_SendFloat(position,1);
//  113 //
//  114 //             UART_SendFloat(Chazhi,1);
//  115 //           UART_Send_String("................\r\n");
//  116 
//  117 //             UART_SendFloat(Speed_I_lntegral_L,1);
//  118 //             UART_SendFloat(Speed_I_lntegral_R,1);
//  119 //             UART_SendFloat(Chazhi_Rate,1);
//  120 //             UART_SendFloat(angle,1);
//  121 //                            UART_SendFloat(position,1);
//  122 
//  123 //          UART_Send_String("................\r\n");
//  124 //////     UART_Send_String("差值，速度设定，速度\r\n");
//  125 //     UART_SendFloat(speed_set_L_Z,1);
//  126 //     UART_SendFloat(speed_set_R_Z,1);
//  127 //     UART_SendFloat(speed_set,1);
//  128      UART_SendFloat(speed_L,1);
        MOVS     R1,#+1
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        BL       UART_SendFloat
//  129      UART_SendFloat(speed_R,1);
        MOVS     R1,#+1
        LDR      R0,??DataTable5_13
        LDR      R0,[R0, #+0]
        BL       UART_SendFloat
//  130 //////     UART_Send_String("速度偏差，电机输出\r\n");
//  131 //     UART_SendFloat(Speed_Error_L,1);     
//  132 //     UART_SendFloat(Speed_Error_R,1);
//  133 //     UART_SendFloat(Motor_Out_L,1);
//  134 //     UART_SendFloat(Motor_Out_R,1);
//  135 //     UART_SendFloat(speed_car,1);
//  136 //     UART_SendFloat(E_speed,1);
//  137 //     UART_SendFloat(Speed_Control_Output,1);
//  138 //    }      
//  139 //         UART_Send_String("................\r\n");
//  140 
//  141     //    for(i = 0;i < 3;i ++)
//  142 //    {
//  143 //      UART_SendFloat(AD_valu[i],1);
//  144 //    }
//  145     
//  146 //    UART_SendFloat(Direction_Control_Output,1);
//  147 //    
//  148 //    
//  149    
//  150 //    for(i = 0;i < 2;i ++)
//  151 //    {
//  152 //      UART_SendFloat(Position_transit[i],1);
//  153 //    }    
//  154 //    
//  155 //    for(i = 0;i < 3;i ++)
//  156 //    {
//  157 //      UART_SendFloat(AD_inductor[i],1);
//  158 //    }
//  159 
//  160     
//  161 
//  162     } 
//  163 }
??UART_Send_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     AD_valu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     ?_9
//  164 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 void KEY(void)
//  166 {
KEY:
        PUSH     {R7,LR}
//  167     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??KEY_0
        BCS      .+4
        B        ??KEY_1
        CMP      R0,#+3
        BEQ      ??KEY_2
        BCC      ??KEY_3
        CMP      R0,#+5
        BNE      .+4
        B        ??KEY_4
        BCS      .+4
        B        ??KEY_5
        B        ??KEY_1
//  168 {
//  169     case 1: /* ------------------------------ 上 */
//  170         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_0:
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_6
        MOVS     R0,#+1
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
        B        ??KEY_7
??KEY_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  171         switch (menuSelect)
??KEY_7:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_8
        BCC      ??KEY_9
        CMP      R0,#+3
        BEQ      ??KEY_10
        BCC      ??KEY_11
        B        ??KEY_9
//  172         {
//  173          
//  174         case MENU:
//  175             Chasu_Bili += 1;
??KEY_8:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  176             break;
        B        ??KEY_12
//  177 
//  178         case MENU_1:
//  179             angle += 10;
??KEY_11:
        LDR      R0,??DataTable5_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_3  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  180             break;
        B        ??KEY_12
//  181             
//  182             case MENU_2:
//  183             speed_set += 10;
??KEY_10:
        LDR      R0,??DataTable5_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_3  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  184             break;
        B        ??KEY_12
//  185          
//  186 
//  187 
//  188         default :
//  189             break;
//  190         }
//  191         break;
??KEY_9:
??KEY_12:
        B        ??KEY_13
//  192     case 2: /* ------------------------------ 下 */
//  193         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_3:
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_14
        MOVS     R0,#+1
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
        B        ??KEY_15
??KEY_14:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  194         switch (menuSelect)
??KEY_15:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_16
        BCC      ??KEY_17
        CMP      R0,#+3
        BEQ      ??KEY_18
        BCC      ??KEY_19
        B        ??KEY_17
//  195         {
//  196        case MENU:
//  197             Chasu_Bili -= 1;
??KEY_16:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_9  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  198             break;
        B        ??KEY_20
//  199 
//  200         case MENU_1:
//  201             angle -= 10;
??KEY_19:
        LDR      R0,??DataTable5_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_4  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  202             break;
        B        ??KEY_20
//  203             
//  204        case MENU_2:
//  205             speed_set -= 10;
??KEY_18:
        LDR      R0,??DataTable5_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_4  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  206             break;
        B        ??KEY_20
//  207          
//  208 
//  209 
//  210         default :
//  211             break;
//  212         }
//  213                 break;
??KEY_17:
??KEY_20:
        B        ??KEY_13
//  214 
//  215         
//  216          case 3: /* ------------------------------ 下 */
//  217         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_2:
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_21
        MOVS     R0,#+1
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
        B        ??KEY_22
??KEY_21:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  218         switch (menuSelect)
??KEY_22:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_23
        BCC      ??KEY_24
        CMP      R0,#+3
        BEQ      ??KEY_25
        BCC      ??KEY_26
        B        ??KEY_24
//  219         {
//  220        case MENU:
//  221             Chasu_Bili += 0.1;
??KEY_23:
        LDR      R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable5_5
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  222             break;
        B        ??KEY_27
//  223 
//  224         case MENU_1:
//  225             angle += 1;
??KEY_26:
        LDR      R0,??DataTable5_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  226             break;
        B        ??KEY_27
//  227             
//  228          case MENU_2:
//  229             speed_set += 1;
??KEY_25:
        LDR      R0,??DataTable5_10
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  230             break;
        B        ??KEY_27
//  231          
//  232         default :
//  233             break;
//  234         }
//  235                 break;
??KEY_24:
??KEY_27:
        B        ??KEY_13
//  236 
//  237         
//  238           case 4: /* ------------------------------ 下 */
//  239         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_5:
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_28
        MOVS     R0,#+1
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
        B        ??KEY_29
??KEY_28:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  240         switch (menuSelect)
??KEY_29:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??KEY_30
        BCC      ??KEY_31
        CMP      R0,#+3
        BEQ      ??KEY_32
        BCC      ??KEY_33
        B        ??KEY_31
//  241         {
//  242        case MENU:
//  243             Chasu_Bili -= 0.1;
??KEY_30:
        LDR      R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable5_6
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  244             break;
        B        ??KEY_34
//  245 
//  246         case MENU_1:
//  247             angle -= 1;
??KEY_33:
        LDR      R0,??DataTable5_8
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_9  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  248             break;
        B        ??KEY_34
//  249             
//  250        case MENU_2:
//  251             speed_set -= 1;
??KEY_32:
        LDR      R0,??DataTable5_10
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_9  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  252             break;
        B        ??KEY_34
//  253          
//  254         default :
//  255             break;
//  256         }
//  257                 break;
??KEY_31:
??KEY_34:
        B        ??KEY_13
//  258 
//  259         
//  260         case 5: /* ------------------------------ 中 */
//  261         KEY_sta = !KEY_sta;
??KEY_4:
        LDR      R0,??DataTable5_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_35
        MOVS     R0,#+1
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
        B        ??KEY_36
??KEY_35:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_11
        STRB     R0,[R1, #+0]
//  262 //        KEY_menuChange = !KEY_menuChange;
//  263         if (++menuSelect > 3)//logo 和 菜单显示只一次
??KEY_36:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_14
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+4
        BLT      ??KEY_37
//  264         {
//  265             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_14
        STRB     R0,[R1, #+0]
//  266         }
//  267         break;
??KEY_37:
        B        ??KEY_13
//  268 
//  269     default :
//  270         break;
//  271     }
//  272     if(menuSelect ==MENU) 
??KEY_1:
??KEY_13:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??KEY_38
//  273           LED_1_ON
        MOVS     R1,#+0
        MOVS     R0,#+49
        BL       GpioSet
        B        ??KEY_39
//  274 //        OLED_DisplaytinyStr(80, 0, "Ch");
//  275     else
//  276          LED_1_OFF
??KEY_38:
        MOVS     R1,#+1
        MOVS     R0,#+49
        BL       GpioSet
//  277 //        OLED_DisplaytinyStr(80, 0, "No");
//  278     
//  279     if(menuSelect ==MENU_1) 
??KEY_39:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??KEY_40
//  280                 LED_2_ON
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       GpioSet
        B        ??KEY_41
//  281 //        OLED_DisplaytinyStr(80, 1, "Ch");
//  282     else
//  283                LED_2_OFF
??KEY_40:
        MOVS     R1,#+1
        MOVS     R0,#+50
        BL       GpioSet
//  284 //        OLED_DisplaytinyStr(80, 1, "No");
//  285     
//  286 //    if(menuSelect ==MENU_2) 
//  287 ////                LED_3_ON
//  288 ////        OLED_DisplaytinyStr(80, 7, "Ch");
//  289 //    else
//  290 //               LED_3_OFF
//  291 //        OLED_DisplaytinyStr(80, 7, "No");
//  292 
//  293 }       
??KEY_41:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     uart_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x9999999A,0x3FB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x9999999A,0xBFB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC8      0x53, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     menuSelect

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "Righ:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "Midd:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "Left:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "Ri_V:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "Le_V:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "Chzh:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "ChBi:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "Angl:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "S_L:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "S_R:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "S:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "................\015\012"
        DC8 0

        END
//  294         
//  295         
//  296         
//  297         
//  298         
//  299         
//  300         
//  301         
//  302         
//  303         
//  304         
//  305 
// 
//     1 byte  in section .bss
//   104 bytes in section .rodata
// 1 016 bytes in section .text
// 
// 1 016 bytes of CODE  memory
//   104 bytes of CONST memory
//     1 byte  of DATA  memory
//
//Errors: none
//Warnings: none
