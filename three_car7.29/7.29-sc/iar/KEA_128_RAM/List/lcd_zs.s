///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:41
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\lcd_zs.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\lcd_zs.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\lcd_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_inductor
        EXTERN AD_valu
        EXTERN Angle_D
        EXTERN Direction_P
        EXTERN Direction_P2
        EXTERN KEY_Scan
        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN LCD_DisplayFloat
        EXTERN LCD_Int16
        EXTERN LCD_pen
        EXTERN LCD_showStr0608
        EXTERN Speed_I
        EXTERN Speed_P
        EXTERN __aeabi_fadd
        EXTERN menuSelect
        EXTERN speed_L
        EXTERN speed_R
        EXTERN speed_set
        EXTERN zs_car

        PUBLIC LCD_Data_ZS
        PUBLIC LCD_Inductor_Dynamic
        PUBLIC LCD_Key_ZS
        PUBLIC LCD_Name_ZS
        PUBLIC LCD_Speed_Dynamic

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\lcd_zs.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"
//    4 
//    5 /**
//    6   * 简介
//    7   *     按键 多级菜单
//    8   * 注意
//    9   *     中 --- 切换菜单
//   10   *     上下左右 --- 自由控制
//   11   */

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   12 void LCD_Key_ZS(void)
//   13 {
LCD_Key_ZS:
        PUSH     {R7,LR}
//   14     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??LCD_Key_ZS_0
        BCS      .+4
        B        ??LCD_Key_ZS_1
        CMP      R0,#+3
        BNE      .+4
        B        ??LCD_Key_ZS_2
        BCC      ??LCD_Key_ZS_3
        CMP      R0,#+5
        BNE      .+4
        B        ??LCD_Key_ZS_4
        BCS      .+4
        B        ??LCD_Key_ZS_5
        B        ??LCD_Key_ZS_1
//   15 {
//   16     case 1: /* ------------------------------ 上 */
//   17         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??LCD_Key_ZS_0:
        LDR      R0,??LCD_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_7
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_8
??LCD_Key_ZS_7:
        MOVS     R0,#+0
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
//   18         switch (menuSelect)
??LCD_Key_ZS_8:
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??LCD_Key_ZS_10
        BCC      ??LCD_Key_ZS_11
        CMP      R0,#+3
        BEQ      ??LCD_Key_ZS_12
        BCC      ??LCD_Key_ZS_13
        CMP      R0,#+5
        BEQ      ??LCD_Key_ZS_14
        BCC      ??LCD_Key_ZS_15
        CMP      R0,#+7
        BEQ      ??LCD_Key_ZS_16
        BCC      ??LCD_Key_ZS_17
        B        ??LCD_Key_ZS_11
//   19         {
//   20            case MENU:
//   21             zs_car=1;
??LCD_Key_ZS_10:
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//   22             break; 
        B        ??LCD_Key_ZS_18
//   23         case MENU_1:
//   24             speed_set += 10;
??LCD_Key_ZS_13:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//   25             break;
        B        ??LCD_Key_ZS_18
//   26             
//   27         case MENU_2:
//   28             Direction_P += 10;
??LCD_Key_ZS_12:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   29             break;
        B        ??LCD_Key_ZS_18
//   30             
//   31   case MENU_3:
//   32             Direction_P2+=10;
??LCD_Key_ZS_15:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   33 //          Chazhi+=10;
//   34             break;
        B        ??LCD_Key_ZS_18
//   35             
//   36         case MENU_4:
//   37             Angle_D+=10;  
??LCD_Key_ZS_14:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   38             break;          
        B        ??LCD_Key_ZS_18
//   39             
//   40         case MENU_5:
//   41             Speed_P+=10;
??LCD_Key_ZS_17:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//   42             break;
        B        ??LCD_Key_ZS_18
//   43         
//   44         case MENU_6:
//   45           Speed_I+=10;
??LCD_Key_ZS_16:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   46             break;
        B        ??LCD_Key_ZS_18
//   47                             
//   48      
//   49 
//   50         default :
//   51             break;
//   52         }
//   53         break;
??LCD_Key_ZS_11:
??LCD_Key_ZS_18:
        B        ??LCD_Key_ZS_19
//   54     case 2: /* ------------------------------ 下 */
//   55         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??LCD_Key_ZS_3:
        LDR      R0,??LCD_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_20
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_21
??LCD_Key_ZS_20:
        MOVS     R0,#+0
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
//   56         switch (menuSelect)
??LCD_Key_ZS_21:
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??LCD_Key_ZS_22
        BCC      ??LCD_Key_ZS_23
        CMP      R0,#+3
        BEQ      ??LCD_Key_ZS_24
        BCC      ??LCD_Key_ZS_25
        CMP      R0,#+5
        BEQ      ??LCD_Key_ZS_26
        BCC      ??LCD_Key_ZS_27
        CMP      R0,#+7
        BEQ      ??LCD_Key_ZS_28
        BCC      ??LCD_Key_ZS_29
        B        ??LCD_Key_ZS_23
//   57         {
//   58    case MENU:
//   59             zs_car=0;
??LCD_Key_ZS_22:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//   60             break; 
        B        ??LCD_Key_ZS_30
//   61         case MENU_1:
//   62             speed_set -= 10;
??LCD_Key_ZS_25:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//   63             break;
        B        ??LCD_Key_ZS_30
//   64             
//   65         case MENU_2:
//   66             Direction_P -= 10;
??LCD_Key_ZS_24:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   67             break;
        B        ??LCD_Key_ZS_30
//   68             
//   69   case MENU_3:
//   70             Direction_P2-=10;
??LCD_Key_ZS_27:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   71 //          Chazhi+=10;
//   72             break;
        B        ??LCD_Key_ZS_30
//   73             
//   74         case MENU_4:
//   75             Angle_D-=10;  
??LCD_Key_ZS_26:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   76             break;          
        B        ??LCD_Key_ZS_30
//   77             
//   78         case MENU_5:
//   79             Speed_P-=10;
??LCD_Key_ZS_29:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//   80             break;
        B        ??LCD_Key_ZS_30
//   81         
//   82         case MENU_6:
//   83           Speed_I-=10;
??LCD_Key_ZS_28:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   84             break;
        B        ??LCD_Key_ZS_30
//   85                             
//   86          
//   87                             
//   88             
//   89 
//   90         default :
//   91             break;
//   92         }
//   93                     break;
??LCD_Key_ZS_23:
??LCD_Key_ZS_30:
        B        ??LCD_Key_ZS_19
//   94     case 3: /* ------------------------------ 左 */
//   95         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??LCD_Key_ZS_2:
        LDR      R0,??LCD_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_31
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_32
??LCD_Key_ZS_31:
        MOVS     R0,#+0
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
//   96         switch (menuSelect)
??LCD_Key_ZS_32:
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??LCD_Key_ZS_33
        BCC      ??LCD_Key_ZS_34
        CMP      R0,#+3
        BEQ      ??LCD_Key_ZS_35
        BCC      ??LCD_Key_ZS_36
        CMP      R0,#+5
        BEQ      ??LCD_Key_ZS_37
        BCC      ??LCD_Key_ZS_38
        CMP      R0,#+7
        BEQ      ??LCD_Key_ZS_39
        BCC      ??LCD_Key_ZS_40
        B        ??LCD_Key_ZS_34
//   97         {
//   98      
//   99    case MENU:
//  100             zs_car=1;
??LCD_Key_ZS_33:
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  101             break; 
        B        ??LCD_Key_ZS_41
//  102         case MENU_1:
//  103             speed_set += 1;
??LCD_Key_ZS_36:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  104             break;
        B        ??LCD_Key_ZS_41
//  105             
//  106         case MENU_2:
//  107             Direction_P += 1;
??LCD_Key_ZS_35:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  108             break;
        B        ??LCD_Key_ZS_41
//  109             
//  110   case MENU_3:
//  111             Direction_P2+=1;
??LCD_Key_ZS_38:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//  112 //          Chazhi+=10;
//  113             break;
        B        ??LCD_Key_ZS_41
//  114             
//  115         case MENU_4:
//  116             Angle_D+=1;  
??LCD_Key_ZS_37:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  117             break;          
        B        ??LCD_Key_ZS_41
//  118             
//  119         case MENU_5:
//  120             Speed_P+=1;
??LCD_Key_ZS_40:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//  121             break;
        B        ??LCD_Key_ZS_41
//  122         
//  123         case MENU_6:
//  124           Speed_I+=1;
??LCD_Key_ZS_39:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+254
        LSLS     R0,R0,#+22       ;; #+1065353216
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  125             break;
        B        ??LCD_Key_ZS_41
//  126                             
//  127      
//  128             
//  129         default :
//  130             break;
//  131         }
//  132         break;
??LCD_Key_ZS_34:
??LCD_Key_ZS_41:
        B        ??LCD_Key_ZS_19
//  133     case 4: /* ------------------------------ 右 */
//  134         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??LCD_Key_ZS_5:
        LDR      R0,??LCD_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_42
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_43
??LCD_Key_ZS_42:
        MOVS     R0,#+0
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
//  135         switch (menuSelect)
??LCD_Key_ZS_43:
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??LCD_Key_ZS_44
        BCC      ??LCD_Key_ZS_45
        CMP      R0,#+3
        BEQ      ??LCD_Key_ZS_46
        BCC      ??LCD_Key_ZS_47
        CMP      R0,#+5
        BEQ      ??LCD_Key_ZS_48
        BCC      ??LCD_Key_ZS_49
        CMP      R0,#+7
        BEQ      ??LCD_Key_ZS_50
        BCC      ??LCD_Key_ZS_51
        B        ??LCD_Key_ZS_45
//  136         {
//  137     
//  138           case MENU:
//  139             zs_car=0;
??LCD_Key_ZS_44:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  140             break; 
        B        ??LCD_Key_ZS_52
//  141         case MENU_1:
//  142             speed_set-= 1;
??LCD_Key_ZS_47:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  143             break;
        B        ??LCD_Key_ZS_52
//  144             
//  145         case MENU_2:
//  146             Direction_P -= 1;
??LCD_Key_ZS_46:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  147             break;
        B        ??LCD_Key_ZS_52
//  148             
//  149   case MENU_3:
//  150             Direction_P2-=1;
??LCD_Key_ZS_49:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//  151 //          Chazhi+=10;
//  152             break;
        B        ??LCD_Key_ZS_52
//  153             
//  154         case MENU_4:
//  155             Angle_D-=1;  
??LCD_Key_ZS_48:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  156             break;          
        B        ??LCD_Key_ZS_52
//  157             
//  158         case MENU_5:
//  159             Speed_P-=1;
??LCD_Key_ZS_51:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//  160             break;
        B        ??LCD_Key_ZS_52
//  161         
//  162         case MENU_6:
//  163           Speed_I-=1;
??LCD_Key_ZS_50:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0xbf800000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  164             break;
        B        ??LCD_Key_ZS_52
//  165 
//  166         default :
//  167             break;
//  168         }
//  169         break;
??LCD_Key_ZS_45:
??LCD_Key_ZS_52:
        B        ??LCD_Key_ZS_19
//  170     case 5: /* ------------------------------ 中 */
//  171         KEY_sta = !KEY_sta;
??LCD_Key_ZS_4:
        LDR      R0,??LCD_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_53
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_54
??LCD_Key_ZS_53:
        MOVS     R0,#+0
        LDR      R1,??LCD_Key_ZS_6
        STRB     R0,[R1, #+0]
//  172         KEY_menuChange = !KEY_menuChange;
??LCD_Key_ZS_54:
        LDR      R0,??DataTable4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??LCD_Key_ZS_55
        MOVS     R0,#+1
        LDR      R1,??DataTable4
        STRB     R0,[R1, #+0]
        B        ??LCD_Key_ZS_56
        DATA
??LCD_Key_ZS_6:
        DC32     KEY_sta
        THUMB
??LCD_Key_ZS_55:
        MOVS     R0,#+0
        LDR      R1,??DataTable4
        STRB     R0,[R1, #+0]
//  173         if (++menuSelect > 7)//logo 和 菜单显示只一次
??LCD_Key_ZS_56:
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??LCD_Key_ZS_9
        STRB     R0,[R1, #+0]
        LDR      R0,??LCD_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BLT      ??LCD_Key_ZS_57
//  174         {
//  175             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??LCD_Key_ZS_9
        STRB     R0,[R1, #+0]
//  176         }
//  177         break;
??LCD_Key_ZS_57:
        B        ??LCD_Key_ZS_19
//  178 
//  179     default :
//  180         break;
//  181     }
//  182 }
??LCD_Key_ZS_1:
??LCD_Key_ZS_19:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??LCD_Key_ZS_9:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     Speed_I
//  183 
//  184 
//  185 
//  186 
//  187 
//  188 //-------常用颜色----------
//  189 //#define RED     	0XF800    //红色
//  190 //#define GREEN   	0X07E0    //绿色
//  191 //#define BLUE    	0X001F    //蓝色
//  192 //#define BRED    	0XF81F    //紫色
//  193 //#define GRED    	0XFFE0    //灰色
//  194 //#define GBLUE   	0X07FF    //青蓝
//  195 //#define BLACK   	0X0000    //黑色
//  196 //#define WHITE   	0XFFFF    //白色
//  197 //#define YELLOW  	0xFFE0    //黄色
//  198 //
//  199 //
//  200 //
//  201 //extern uint16 LCD_pen;//笔颜色
//  202 //extern uint16 LCD_backGround;//背景颜色
//  203 
//  204 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  205 void LCD_Name_ZS(void)
//  206 {
LCD_Name_ZS:
        PUSH     {R7,LR}
//  207  LCD_showStr0608(1,10, "Speed:");
        LDR      R2,??DataTable4_1
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  208  LCD_showStr0608(1,20, "P_Dir:");
        LDR      R2,??DataTable4_2
        MOVS     R1,#+20
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  209  LCD_showStr0608(1,30, "P_Cha:");
        LDR      R2,??DataTable4_3
        MOVS     R1,#+30
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  210  LCD_showStr0608(1,40, "D_Ang:");
        LDR      R2,??DataTable4_4
        MOVS     R1,#+40
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  211  LCD_showStr0608(1,50, "P_Spe:");
        LDR      R2,??DataTable4_5
        MOVS     R1,#+50
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  212  LCD_showStr0608(1,60, "I_Spe:");
        LDR      R2,??DataTable4_6
        MOVS     R1,#+60
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  213 
//  214    
//  215 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xc1200000
//  216 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  217 void LCD_Data_ZS(void)
//  218 {
LCD_Data_ZS:
        PUSH     {R4,LR}
//  219   uint16 LCD_pen_one = RED;//笔颜色
        MOVS     R0,#+248
        LSLS     R0,R0,#+8        ;; #+63488
//  220   uint16 LCD_pen_other = BLACK;//笔颜色
        MOVS     R4,#+0
//  221   int menuSelect_old = menuSelect;//菜单选择
        LDR      R1,??DataTable4_7
        LDRB     R1,[R1, #+0]
//  222 //uint16 LCD_pen = BLACK;//笔颜色
//  223 
//  224   
//  225       LCD_pen=LCD_pen_one ;
        LDR      R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//  226 
//  227     switch (menuSelect) 
        LDR      R0,??DataTable4_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??LCD_Data_ZS_0
        BCC      ??LCD_Data_ZS_1
        CMP      R0,#+3
        BEQ      ??LCD_Data_ZS_2
        BCC      ??LCD_Data_ZS_3
        CMP      R0,#+5
        BEQ      ??LCD_Data_ZS_4
        BCC      ??LCD_Data_ZS_5
        CMP      R0,#+7
        BEQ      ??LCD_Data_ZS_6
        BCC      ??LCD_Data_ZS_7
        B        ??LCD_Data_ZS_1
//  228     {
//  229       
//  230     case MENU:
//  231     if(zs_car==1)
??LCD_Data_ZS_0:
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??LCD_Data_ZS_8
//  232        LCD_showStr0608(1,0, "RUN");
        ADR      R2,??DataTable4_10  ;; "RUN"
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_showStr0608
        B        ??LCD_Data_ZS_9
//  233     else
//  234        LCD_showStr0608(1,0, "STOP");
??LCD_Data_ZS_8:
        LDR      R2,??DataTable4_11
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  235     break;
??LCD_Data_ZS_9:
        B        ??LCD_Data_ZS_10
//  236    
//  237     case MENU_1:
//  238 LCD_DisplayFloat(40, 10, speed_set, 1);
??LCD_Data_ZS_3:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_12
        LDR      R2,[R0, #+0]
        MOVS     R1,#+10
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  239     break;  
        B        ??LCD_Data_ZS_10
//  240     
//  241     case MENU_2:
//  242 LCD_DisplayFloat(40, 20, Direction_P, 1);
??LCD_Data_ZS_2:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_13
        LDR      R2,[R0, #+0]
        MOVS     R1,#+20
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  243     break;
        B        ??LCD_Data_ZS_10
//  244     
//  245        case MENU_3:
//  246 LCD_DisplayFloat(40, 30, Direction_P2, 1);
??LCD_Data_ZS_5:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+30
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  247 //LCD_DisplayFloat(40, 30, Chazhi, 1);         
//  248     break;
        B        ??LCD_Data_ZS_10
//  249     
//  250     case MENU_4:
//  251 LCD_DisplayFloat(40, 40, Angle_D, 1);
??LCD_Data_ZS_4:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_15
        LDR      R2,[R0, #+0]
        MOVS     R1,#+40
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  252     break;
        B        ??LCD_Data_ZS_10
//  253     
//  254        case MENU_5:
//  255 LCD_DisplayFloat(40, 50, Speed_P, 1);
??LCD_Data_ZS_7:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_16
        LDR      R2,[R0, #+0]
        MOVS     R1,#+50
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  256     break;
        B        ??LCD_Data_ZS_10
//  257     
//  258        case MENU_6:
//  259 LCD_DisplayFloat(40, 60, Speed_I, 1);
??LCD_Data_ZS_6:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_17
        LDR      R2,[R0, #+0]
        MOVS     R1,#+60
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  260     break;
        B        ??LCD_Data_ZS_10
//  261     
//  262 //        case MENU_6:
//  263 //LCD_DisplayFloat(40, 60, Direction_P2, 1);
//  264 //    break;
//  265 //    
//  266 //        case MENU_7:
//  267 //LCD_DisplayFloat(40, 70, Angle_P, 1);
//  268 //    break;
//  269 //    
//  270 //        case MENU_8:
//  271 //LCD_DisplayFloat(40, 80, Angle_D, 1);
//  272 //    break;
//  273    
//  274     default :
//  275         break;
//  276     }
//  277  //旧数据变成共色   
//  278   menuSelect_old = menuSelect-1;//菜单选择
??LCD_Data_ZS_1:
??LCD_Data_ZS_10:
        LDR      R0,??DataTable4_7
        LDRB     R1,[R0, #+0]
        SUBS     R1,R1,#+1
//  279   if(menuSelect_old<1) 
        CMP      R1,#+1
        BGE      ??LCD_Data_ZS_11
//  280      menuSelect_old=MENU_6;
        MOVS     R1,#+7
//  281          LCD_pen=LCD_pen_other ;
??LCD_Data_ZS_11:
        LDR      R0,??DataTable4_8
        STRH     R4,[R0, #+0]
//  282   
//  283      switch (menuSelect_old) 
        CMP      R1,#+1
        BEQ      ??LCD_Data_ZS_12
        BCC      ??LCD_Data_ZS_13
        CMP      R1,#+3
        BEQ      ??LCD_Data_ZS_14
        BCC      ??LCD_Data_ZS_15
        CMP      R1,#+5
        BEQ      ??LCD_Data_ZS_16
        BCC      ??LCD_Data_ZS_17
        CMP      R1,#+7
        BEQ      ??LCD_Data_ZS_18
        BCC      ??LCD_Data_ZS_19
        B        ??LCD_Data_ZS_13
//  284     {
//  285       
//  286   case MENU:
//  287     if(zs_car==1)
??LCD_Data_ZS_12:
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??LCD_Data_ZS_20
//  288        LCD_showStr0608(1,0, "RUN");
        ADR      R2,??DataTable4_10  ;; "RUN"
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_showStr0608
        B        ??LCD_Data_ZS_21
//  289     else
//  290        LCD_showStr0608(1,0, "STOP");
??LCD_Data_ZS_20:
        LDR      R2,??DataTable4_11
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_showStr0608
//  291     break;
??LCD_Data_ZS_21:
        B        ??LCD_Data_ZS_22
//  292    
//  293     case MENU_1:
//  294 LCD_DisplayFloat(40, 10, speed_set, 1);
??LCD_Data_ZS_15:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_12
        LDR      R2,[R0, #+0]
        MOVS     R1,#+10
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  295     break;  
        B        ??LCD_Data_ZS_22
//  296     
//  297     case MENU_2:
//  298 LCD_DisplayFloat(40, 20, Direction_P, 1);
??LCD_Data_ZS_14:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_13
        LDR      R2,[R0, #+0]
        MOVS     R1,#+20
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  299     break;
        B        ??LCD_Data_ZS_22
//  300     
//  301        case MENU_3:
//  302 LCD_DisplayFloat(40, 30, Direction_P2, 1);
??LCD_Data_ZS_17:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_14
        LDR      R2,[R0, #+0]
        MOVS     R1,#+30
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  303 //LCD_DisplayFloat(40, 30, Chazhi, 1);         
//  304     break;
        B        ??LCD_Data_ZS_22
//  305     
//  306     case MENU_4:
//  307 LCD_DisplayFloat(40, 40, Angle_D, 1);
??LCD_Data_ZS_16:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_15
        LDR      R2,[R0, #+0]
        MOVS     R1,#+40
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  308     break;
        B        ??LCD_Data_ZS_22
//  309     
//  310        case MENU_5:
//  311 LCD_DisplayFloat(40, 50, Speed_P, 1);
??LCD_Data_ZS_19:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_16
        LDR      R2,[R0, #+0]
        MOVS     R1,#+50
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  312     break;
        B        ??LCD_Data_ZS_22
//  313     
//  314        case MENU_6:
//  315 LCD_DisplayFloat(40, 60, Speed_I, 1);
??LCD_Data_ZS_18:
        MOVS     R3,#+1
        LDR      R0,??DataTable4_17
        LDR      R2,[R0, #+0]
        MOVS     R1,#+60
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  316     break;
        B        ??LCD_Data_ZS_22
//  317     
//  318 //        case MENU_6:
//  319 //LCD_DisplayFloat(40, 60, Direction_P2, 1);
//  320 //    break;
//  321 //    
//  322 //        case MENU_7:
//  323 //LCD_DisplayFloat(40, 70, Angle_P, 1);
//  324 //    break;
//  325 //    
//  326 //        case MENU_8:
//  327 //LCD_DisplayFloat(40, 80, Angle_D, 1);
//  328 //    break;
//  329     
//  330     
//  331     default :
//  332         break;
//  333     }
//  334     
//  335    
//  336     
//  337 }
??LCD_Data_ZS_13:
??LCD_Data_ZS_22:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xbf800000
//  338 
//  339 
//  340 
//  341 //LCD显示数据动态

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  342 void LCD_Inductor_Dynamic(void)
//  343 {
LCD_Inductor_Dynamic:
        PUSH     {R7,LR}
//  344   LCD_Int16(0, 0, AD_valu[0]);
        LDR      R0,??DataTable4_18
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_Int16
//  345   LCD_DisplayFloat(80,0,AD_inductor[0], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_19
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+80
        BL       LCD_DisplayFloat
//  346   
//  347   LCD_Int16(0, 10, AD_valu[1]);
        LDR      R0,??DataTable4_18
        LDR      R2,[R0, #+4]
        SXTH     R2,R2
        MOVS     R1,#+10
        MOVS     R0,#+0
        BL       LCD_Int16
//  348   LCD_DisplayFloat(80,10,AD_inductor[1], 3); 
        MOVS     R3,#+3
        LDR      R0,??DataTable4_19
        LDR      R2,[R0, #+4]
        MOVS     R1,#+10
        MOVS     R0,#+80
        BL       LCD_DisplayFloat
//  349   
//  350 //  LCD_Int16(40, 2, AD_valu[2]);
//  351 //  LCD_DisplayFloat(80,20,AD_inductor[2], 3); 
//  352 //  
//  353 //  LCD_Int16(40, 40, AD_valu[3]);
//  354 //  LCD_DisplayFloat(80,40,AD_inductor[3], 3); 
//  355 //  
//  356 //  LCD_Int16(40, 50, AD_valu[4]);
//  357 //  LCD_DisplayFloat(80,50,AD_inductor[4], 3); 
//  358   
//  359 //  LCD_DisplayFloat(60,60,Chazhi, 3); 
//  360 //  LCD_DisplayFloat(1,70,Circle_Flag, 0); 
//  361 //  LCD_DisplayFloat(1,70,angle, 0); 
//  362 //  LCD_DisplayFloat(60,70,Chazhi_Rate, 3); 
//  363 }
        POP      {R0,PC}          ;; return
//  364 
//  365 
//  366 
//  367 //LCD显示数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  368 void LCD_Speed_Dynamic(void)
//  369 {
LCD_Speed_Dynamic:
        PUSH     {R7,LR}
//  370   
//  371 //  LCD_DisplayFloat(40,10,wgy, 3);//255
//  372 //  LCD_DisplayFloat(40,20,gy, 3);//-1
//  373 //  LCD_DisplayFloat(40,30,gyro_y, 3);//-1哦了吗                                                                                                         
//  374 ////  LCD_DisplayFloat(40,30,gyr_angle_speed, 3);
//  375 ////  LCD_DisplayFloat(40,50,gyr_angle, 3);
//  376 //  LCD_DisplayFloat(40,20,Speed_I_lntegral_L, 3);
//  377 //  LCD_DisplayFloat(40,50,Speed_I_lntegral_R, 3);
//  378 //  LCD_DisplayFloat(40,00,Chazhi, 3);   
//  379 //    LCD_DisplayFloat(40,00,Chasu_Bili, 3);   
//  380 //    LCD_DisplayFloat(40,10,angle, 3); 
//  381 ////  
//  382 //  LCD_DisplayFloat(40,10,speed_set_L, 3); 
//  383 //  LCD_DisplayFloat(40,20,speed_set_R, 3); 
//  384 //  
//  385       LCD_DisplayFloat(40,70,speed_L, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_20
        LDR      R2,[R0, #+0]
        MOVS     R1,#+70
        MOVS     R0,#+40
        BL       LCD_DisplayFloat
//  386   LCD_DisplayFloat(80,70,speed_R, 1); 
        MOVS     R3,#+1
        LDR      R0,??DataTable4_21
        LDR      R2,[R0, #+0]
        MOVS     R1,#+70
        MOVS     R0,#+80
        BL       LCD_DisplayFloat
//  387 //    LCD_DisplayFloat(40,50,speed_set, 3); 
//  388 //    LCD_DisplayFloat(40,60,Chazhi_Rate, 3); 
//  389 
//  390 
//  391 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     KEY_menuChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     LCD_pen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC8      "RUN"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     Speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     Speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     AD_valu

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     AD_inductor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     speed_R

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
        DC8 "Speed:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "P_Dir:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "P_Cha:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "D_Ang:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "P_Spe:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "I_Spe:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "RUN"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "STOP"
        DC8 0, 0, 0

        END
//  392 
// 
//    60 bytes in section .rodata
// 1 390 bytes in section .text
// 
// 1 390 bytes of CODE  memory
//    60 bytes of CONST memory
//
//Errors: none
//Warnings: none
