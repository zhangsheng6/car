///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:47
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\XS_ZS.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\XS_ZS.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\XS_ZS.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_inductor
        EXTERN Chasu_Bili
        EXTERN Chazhi
        EXTERN GpioSet
        EXTERN KEY_Scan
        EXTERN KEY_sta
        EXTERN OLED_DisplayFloat
        EXTERN OLED_DisplaytinyStr
        EXTERN OLED_Int16
        EXTERN UART_SendFloat
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
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

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\XS_ZS.c
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
//   16 
//   17 //显示数据动态

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void OLED_Inductor_Dynamic(void)
//   19 {
OLED_Inductor_Dynamic:
        PUSH     {R7,LR}
//   20   /*----------比赛---------------------------*/  
//   21   OLED_DisplayFloat(0,5,AD_inductor[0], 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+5
        MOVS     R0,#+0
        BL       OLED_DisplayFloat
//   22   
//   23   OLED_DisplayFloat(0,6,AD_inductor[1], 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+4]
        MOVS     R1,#+6
        MOVS     R0,#+0
        BL       OLED_DisplayFloat
//   24   
//   25   OLED_DisplayFloat(0,7,AD_inductor[2],1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+8]
        MOVS     R1,#+7
        MOVS     R0,#+0
        BL       OLED_DisplayFloat
//   26   
//   27 
//   28   OLED_DisplayFloat(35,5,AD_inductor[3], 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+12]
        MOVS     R1,#+5
        MOVS     R0,#+35
        BL       OLED_DisplayFloat
//   29   
//   30 
//   31   OLED_DisplayFloat(35,6,AD_inductor[4], 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_6
        LDR      R2,[R0, #+16]
        MOVS     R1,#+6
        MOVS     R0,#+35
        BL       OLED_DisplayFloat
//   32   
//   33   OLED_Int16(35, 7, Chazhi);
        LDR      R0,??DataTable5_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+35
        BL       OLED_Int16
//   34 //  OLED_DisplayFloat(110,7,gyr_angle_speed, 3); 
//   35 //  
//   36   
//   37   
//   38   
//   39 //  OLED_Int16(40, 0, AD_valu[0]);
//   40 //  OLED_DisplayFloat(80,0,AD_inductor[0], 3); 
//   41 //  
//   42 //  OLED_Int16(40, 1, AD_valu[1]);
//   43 //  OLED_DisplayFloat(80,1,AD_inductor[1], 3); 
//   44 //  
//   45 //  OLED_Int16(40, 2, AD_valu[2]);
//   46 //  OLED_DisplayFloat(80,2,AD_inductor[2], 3); 
//   47 //  
//   48 //  OLED_Int16(40, 4, AD_valu[3]);
//   49 //  OLED_DisplayFloat(80,4,AD_inductor[3], 3); 
//   50 //  
//   51 //  OLED_Int16(40, 5, AD_valu[4]);
//   52 //  OLED_DisplayFloat(80,5,AD_inductor[4], 3); 
//   53 //  
//   54 //  OLED_DisplayFloat(60,6,Chazhi, 3); 
//   55 /*
//   56     OLED_Int16(2, 5, AD_valu[0]);
//   57   OLED_DisplayFloat(35,5,AD_inductor[0], 1); 
//   58   
//   59   OLED_Int16(2, 6, AD_valu[1]);
//   60   OLED_DisplayFloat(35,6,AD_inductor[1], 1); 
//   61   
//   62   OLED_Int16(2, 7, AD_valu[2]);
//   63   OLED_DisplayFloat(35,7,AD_inductor[2],1); 
//   64   
//   65 //  OLED_Int16(75, 5, AD_valu[3]);
//   66 //  OLED_DisplayFloat(75,5,speed_L, 1); 
//   67   OLED_DisplayFloat(110,5,AD_inductor[3], 1); 
//   68   
//   69 //  OLED_Int16(75, 6, AD_valu[4]);
//   70 //  OLED_DisplayFloat(75,6,speed_R, 1); 
//   71   OLED_DisplayFloat(110,6,AD_inductor[4], 1); 
//   72 //  
//   73 //  OLED_DisplayFloat(60,7,Chazhi, 3); 
//   74   OLED_Int16(75, 7, Chazhi);
//   75   OLED_DisplayFloat(110,7,gyr_angle_speed, 3); 
//   76 
//   77   */
//   78   
//   79 //  OLED_DisplayFloat(1,7,Circle_Flag, 0); 
//   80 //  OLED_DisplayFloat(1,7,angle, 0); 
//   81 //  OLED_DisplayFloat(60,7,Chazhi_Rate, 3); 
//   82 }
        POP      {R0,PC}          ;; return
//   83 
//   84 
//   85 
//   86 
//   87 
//   88 
//   89 
//   90 
//   91 /*显示名称*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void OLED_Speed_Static(void)
//   93 {
OLED_Speed_Static:
        PUSH     {R7,LR}
//   94 //  OLED_DisplaytinyStr(1, 0, "Chzh:");
//   95   OLED_DisplaytinyStr(1, 0, "ChBi:");
        LDR      R2,??DataTable4_7
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   96   OLED_DisplaytinyStr(1, 1, "Angl:");
        LDR      R2,??DataTable4_8
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   97   OLED_DisplaytinyStr(1, 3, "S_L:");
        LDR      R2,??DataTable4_9
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   98   OLED_DisplaytinyStr(1, 4, "S_R:");
        LDR      R2,??DataTable4_10
        MOVS     R1,#+4
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//   99   
//  100 //OLED_DisplaytinyStr(1, 5, "S_ZC:");
//  101 //OLED_DisplaytinyStr(1, 7, "S_RC:");
//  102 OLED_DisplaytinyStr(1, 7, "S:");
        ADR      R2,??DataTable5_12  ;; 0x53, 0x3A, 0x00, 0x00
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  103 }
        POP      {R0,PC}          ;; return
//  104 
//  105 
//  106 //显示数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  107 void OLED_Speed_Dynamic(void)
//  108 {
OLED_Speed_Dynamic:
        PUSH     {R7,LR}
//  109   
//  110 //  OLED_DisplayFloat(40,1,wgy, 3);//255
//  111 //  OLED_DisplayFloat(40,2,gy, 3);//-1
//  112 //  OLED_DisplayFloat(40,3,gyro_y, 3);//-1哦了吗                                                                                                         
//  113 ////  OLED_DisplayFloat(40,3,gyr_angle_speed, 3);
//  114 ////  OLED_DisplayFloat(40,5,gyr_angle, 3);
//  115 //  OLED_DisplayFloat(40,2,Speed_I_lntegral_L, 3);
//  116 //  OLED_DisplayFloat(40,5,Speed_I_lntegral_R, 3);
//  117 //  OLED_DisplayFloat(40,0,Chazhi, 3);   
//  118 //    OLED_DisplayFloat(40,0,Chasu_Bili, 3);   
//  119 //    OLED_DisplayFloat(40,1,angle, 3); 
//  120 ////  
//  121 //  OLED_DisplayFloat(40,1,Direction_Control_Output_L, 3); 
//  122 //  OLED_DisplayFloat(40,2,Direction_Control_Output_R, 3); 
//  123 //  OLED_DisplayFloat(40,1,speed_set_L, 3); 
//  124 //  OLED_DisplayFloat(40,2,speed_set_R, 3);
//  125 //  OLED_DisplayFloat(40,3,Speed_Error_L, 3); 
//  126 //  OLED_DisplayFloat(40,4,Speed_Error_R, 3); 
//  127 //  
//  128       OLED_DisplayFloat(40,5,speed_L, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+5
        MOVS     R0,#+40
        BL       OLED_DisplayFloat
//  129   OLED_DisplayFloat(40,6,speed_R, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable5_13
        LDR      R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+40
        BL       OLED_DisplayFloat
//  130 //    OLED_DisplayFloat(40,5,speed_set, 3); 
//  131 //    OLED_DisplayFloat(40,6,Chazhi_Rate, 3); 
//  132 
//  133 
//  134 }
        POP      {R0,PC}          ;; return
//  135 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void UART_Send(void)
//  137 {
UART_Send:
        PUSH     {R7,LR}
//  138      uart_flag++;     
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_1
        STRB     R0,[R1, #+0]
//  139     if(uart_flag ==1)
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??UART_Send_0
//  140     {   
//  141        uart_flag = 0;
        MOVS     R0,#+0
        LDR      R1,??DataTable5_1
        STRB     R0,[R1, #+0]
//  142 ///////////////////////////陀螺仪////////////////////////////////////////////////////////////////////
//  143 //        UART_SendFloat(wgz,1);  
//  144 //        UART_SendFloat(gz,1);  
//  145 //        UART_SendFloat(gyro_z,1);  
//  146 //        UART_SendFloat(gyr_offset__z_average,1);  
//  147 //        UART_SendFloat(gyr_angle_speed,1);  
//  148 //        UART_SendFloat(gyr_angle_speed_static,1);  
//  149 //        UART_SendFloat(gyr_angle,1); 
//  150        
//  151 //        UART_SendFloat(gyro_x,1);  
//  152 //        UART_SendFloat(gyr_offset__x_average,1); 
//  153 //        UART_SendFloat(gyr_angle_speed_up,1);  
//  154 //        UART_SendFloat(gyr_angle_up,1); 
//  155 //          UART_Send_String("................\r\n");
//  156 ///////////////////////////电感////////////////////////////////////////////////////////////////////
//  157 
//  158 // UART_Send_String(".........实际电感值.......\r\n");      
//  159 //     for(int i = 0;i < 3;i++)
//  160 //    {
//  161 //         UART_SendFloat(AD_valu[i],1);
//  162 ////            UART_SendFloat(AD_inductor[i],1);  
//  163 
//  164 //    }
//  165 // UART_Send_String("........归一化电感值........\r\n");
//  166 //
//  167 //       for(int i = 0;i < 5;i++)
//  168 //    {
//  169 //      UART_SendFloat(AD_inductor[i],1);  
//  170 //   }
//  171 //
//  172 //         UART_SendFloat(position,1);
//  173 //
//  174 //             UART_SendFloat(Chazhi,1);
//  175 //           UART_Send_String("................\r\n");
//  176 
//  177 //             UART_SendFloat(Speed_I_lntegral_L,1);
//  178 //             UART_SendFloat(Speed_I_lntegral_R,1);
//  179 //             UART_SendFloat(Chazhi_Rate,1);
//  180 //             UART_SendFloat(angle,1);
//  181 //                            UART_SendFloat(position,1);
//  182 
//  183 //          UART_Send_String("................\r\n");
//  184 //////     UART_Send_String("差值，速度设定，速度\r\n");
//  185      UART_SendFloat(speed_L,1);
        MOVS     R1,#+1
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        BL       UART_SendFloat
//  186      UART_SendFloat(speed_R,1);
        MOVS     R1,#+1
        LDR      R0,??DataTable5_13
        LDR      R0,[R0, #+0]
        BL       UART_SendFloat
//  187 //     UART_SendFloat(speed_set,1);
//  188        
//  189 //     UART_SendFloat(Motor_Out_R_Temp,1);
//  190 //     UART_SendFloat(speed_R,1);
//  191 //////     UART_Send_String("速度偏差，电机输出\r\n");
//  192 //     UART_SendFloat(Speed_Error_L,1);     
//  193 //     UART_SendFloat(Speed_Error_R,1);
//  194 //     UART_SendFloat(Motor_Out_L,1);
//  195 //     UART_SendFloat(Motor_Out_R,1);
//  196 //     UART_SendFloat(speed_car,1);
//  197 //     UART_SendFloat(E_speed,1);
//  198 //     UART_SendFloat(Speed_Control_Output,1);
//  199 //    }      
//  200 //         UART_Send_String("................\r\n");
//  201 
//  202     //    for(i = 0;i < 3;i ++)
//  203 //    {
//  204 //      UART_SendFloat(AD_valu[i],1);
//  205 //    }
//  206     
//  207 //    UART_SendFloat(Direction_Control_Output,1);
//  208 //    
//  209 //    
//  210    
//  211 //    for(i = 0;i < 2;i ++)
//  212 //    {
//  213 //      UART_SendFloat(Position_transit[i],1);
//  214 //    }    
//  215 //    
//  216 //    for(i = 0;i < 3;i ++)
//  217 //    {
//  218 //      UART_SendFloat(AD_inductor[i],1);
//  219 //    }
//  220 
//  221     
//  222 
//  223     } 
//  224 }
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
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     ?_9
//  225 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  226 void KEY(void)
//  227 {
KEY:
        PUSH     {R7,LR}
//  228     switch (KEY_Scan())
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
//  229 {
//  230     case 1: /* ------------------------------ 上 */
//  231         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_0:
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_6
        MOVS     R0,#+1
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        B        ??KEY_7
??KEY_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
//  232         switch (menuSelect)
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
//  233         {
//  234          
//  235         case MENU:
//  236             Chasu_Bili += 1;
??KEY_8:
        LDR      R0,??DataTable5_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  237             break;
        B        ??KEY_12
//  238 
//  239         case MENU_1:
//  240             angle += 10;
??KEY_11:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  241             break;
        B        ??KEY_12
//  242             
//  243             case MENU_2:
//  244             speed_set += 10;
??KEY_10:
        LDR      R0,??DataTable5_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  245             break;
        B        ??KEY_12
//  246          
//  247 
//  248 
//  249         default :
//  250             break;
//  251         }
//  252         break;
??KEY_9:
??KEY_12:
        B        ??KEY_13
//  253     case 2: /* ------------------------------ 下 */
//  254         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_3:
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_14
        MOVS     R0,#+1
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        B        ??KEY_15
??KEY_14:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
//  255         switch (menuSelect)
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
//  256         {
//  257        case MENU:
//  258             Chasu_Bili -= 1;
??KEY_16:
        LDR      R0,??DataTable5_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_8  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  259             break;
        B        ??KEY_20
//  260 
//  261         case MENU_1:
//  262             angle -= 10;
??KEY_19:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_3  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  263             break;
        B        ??KEY_20
//  264             
//  265        case MENU_2:
//  266             speed_set -= 10;
??KEY_18:
        LDR      R0,??DataTable5_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_3  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  267             break;
        B        ??KEY_20
//  268          
//  269 
//  270 
//  271         default :
//  272             break;
//  273         }
//  274                 break;
??KEY_17:
??KEY_20:
        B        ??KEY_13
//  275 
//  276         
//  277          case 3: /* ------------------------------ 下 */
//  278         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_2:
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_21
        MOVS     R0,#+1
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        B        ??KEY_22
??KEY_21:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
//  279         switch (menuSelect)
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
//  280         {
//  281        case MENU:
//  282             Chasu_Bili += 0.1;
??KEY_23:
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable5_4
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  283             break;
        B        ??KEY_27
//  284 
//  285         case MENU_1:
//  286             angle += 1;
??KEY_26:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  287             break;
        B        ??KEY_27
//  288             
//  289          case MENU_2:
//  290             speed_set += 1;
??KEY_25:
        LDR      R0,??DataTable5_9
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  291             break;
        B        ??KEY_27
//  292          
//  293         default :
//  294             break;
//  295         }
//  296                 break;
??KEY_24:
??KEY_27:
        B        ??KEY_13
//  297 
//  298         
//  299           case 4: /* ------------------------------ 下 */
//  300         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??KEY_5:
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_28
        MOVS     R0,#+1
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        B        ??KEY_29
??KEY_28:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
//  301         switch (menuSelect)
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
//  302         {
//  303        case MENU:
//  304             Chasu_Bili -= 0.1;
??KEY_30:
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        ADR      R2,??DataTable5_5
        LDM      R2,{R2,R3}
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
//  305             break;
        B        ??KEY_34
//  306 
//  307         case MENU_1:
//  308             angle -= 1;
??KEY_33:
        LDR      R0,??DataTable5_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_8  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
//  309             break;
        B        ??KEY_34
//  310             
//  311        case MENU_2:
//  312             speed_set -= 1;
??KEY_32:
        LDR      R0,??DataTable5_9
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_8  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  313             break;
        B        ??KEY_34
//  314          
//  315         default :
//  316             break;
//  317         }
//  318                 break;
??KEY_31:
??KEY_34:
        B        ??KEY_13
//  319 
//  320         
//  321         case 5: /* ------------------------------ 中 */
//  322         KEY_sta = !KEY_sta;
??KEY_4:
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??KEY_35
        MOVS     R0,#+1
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        B        ??KEY_36
??KEY_35:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
//  323 //        KEY_menuChange = !KEY_menuChange;
//  324         if (++menuSelect > 3)//logo 和 菜单显示只一次
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
//  325         {
//  326             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??DataTable5_14
        STRB     R0,[R1, #+0]
//  327         }
//  328         break;
??KEY_37:
        B        ??KEY_13
//  329 
//  330     default :
//  331         break;
//  332     }
//  333     if(menuSelect ==MENU) 
??KEY_1:
??KEY_13:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??KEY_38
//  334           LED_1_ON
        MOVS     R1,#+0
        MOVS     R0,#+49
        BL       GpioSet
        B        ??KEY_39
//  335 //        OLED_DisplaytinyStr(80, 0, "Ch");
//  336     else
//  337          LED_1_OFF
??KEY_38:
        MOVS     R1,#+1
        MOVS     R0,#+49
        BL       GpioSet
//  338 //        OLED_DisplaytinyStr(80, 0, "No");
//  339     
//  340     if(menuSelect ==MENU_1) 
??KEY_39:
        LDR      R0,??DataTable5_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??KEY_40
//  341                 LED_2_ON
        MOVS     R1,#+0
        MOVS     R0,#+50
        BL       GpioSet
        B        ??KEY_41
//  342 //        OLED_DisplaytinyStr(80, 1, "Ch");
//  343     else
//  344                LED_2_OFF
??KEY_40:
        MOVS     R1,#+1
        MOVS     R0,#+50
        BL       GpioSet
//  345 //        OLED_DisplaytinyStr(80, 1, "No");
//  346     
//  347 //    if(menuSelect ==MENU_2) 
//  348 ////                LED_3_ON
//  349 ////        OLED_DisplaytinyStr(80, 7, "Ch");
//  350 //    else
//  351 //               LED_3_OFF
//  352 //        OLED_DisplaytinyStr(80, 7, "No");
//  353 
//  354 }       
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
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x9999999A,0x3FB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x9999999A,0xBFB99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     Chasu_Bili

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     Chazhi

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

        END
//  355         
//  356         
//  357         
//  358         
//  359         
//  360         
//  361         
//  362         
//  363         
//  364         
//  365         
//  366 
// 
//   1 byte  in section .bss
//  84 bytes in section .rodata
// 924 bytes in section .text
// 
// 924 bytes of CODE  memory
//  84 bytes of CONST memory
//   1 byte  of DATA  memory
//
//Errors: none
//Warnings: 1
