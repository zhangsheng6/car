///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.30.3.8024/W32 for ARM       17/Jul/2018  09:40:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\oled_zs.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\oled_zs.c -D IAR -D
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
//        H:\智能车程序2018\电磁三轮——ZS\7.17\iar\KEA_128_RAM\List\oled_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_D
        EXTERN Angle_P
        EXTERN Direction_D2
        EXTERN Direction_P
        EXTERN Direction_P2
        EXTERN KEY_Scan
        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN OLED_DisplayFloat
        EXTERN OLED_DisplaytinyStr
        EXTERN OLED_Set_Pos
        EXTERN OLED_WrDat
        EXTERN __aeabi_fadd
        EXTERN menuNum
        EXTERN menuSelect
        EXTERN speed_set
        EXTERN zs_car

        PUBLIC OLED_Biaoge_ZS
        PUBLIC OLED_Key_ZS
        PUBLIC OLED_Select_ZS
        PUBLIC Oled_Data_ZS

// H:\智能车程序2018\电磁三轮——ZS\7.17\user\C\oled_zs.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    4 void OLED_Key_ZS(void)
//    5 {
OLED_Key_ZS:
        PUSH     {R7,LR}
//    6     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_0
        BCS      .+4
        B        ??OLED_Key_ZS_1
        CMP      R0,#+3
        BNE      .+4
        B        ??OLED_Key_ZS_2
        BCC      ??OLED_Key_ZS_3
        CMP      R0,#+5
        BNE      .+4
        B        ??OLED_Key_ZS_4
        BCS      .+4
        B        ??OLED_Key_ZS_5
        B        ??OLED_Key_ZS_1
//    7 {
//    8     case 1: /* ------------------------------ 上 */
//    9         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_0:
        LDR      R0,??OLED_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_7
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_8
??OLED_Key_ZS_7:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
//   10         switch (menuSelect)
??OLED_Key_ZS_8:
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_10
        BCC      ??OLED_Key_ZS_11
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_12
        BCC      ??OLED_Key_ZS_13
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_14
        BCC      ??OLED_Key_ZS_15
        CMP      R0,#+7
        BEQ      ??OLED_Key_ZS_16
        BCC      ??OLED_Key_ZS_17
        B        ??OLED_Key_ZS_11
//   11         {
//   12            case MENU:
//   13             zs_car=1;
??OLED_Key_ZS_10:
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//   14             break; 
        B        ??OLED_Key_ZS_18
//   15         case MENU_1:
//   16             speed_set += 10;
??OLED_Key_ZS_13:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//   17             break;
        B        ??OLED_Key_ZS_18
//   18             
//   19         case MENU_2:
//   20             Direction_P += 10;
??OLED_Key_ZS_12:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   21             break;
        B        ??OLED_Key_ZS_18
//   22             
//   23   case MENU_3:
//   24             Direction_P2+=10;
??OLED_Key_ZS_15:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   25 //          Chazhi+=10;
//   26             break;
        B        ??OLED_Key_ZS_18
//   27             
//   28         case MENU_4:
//   29             Direction_D2+=10;
??OLED_Key_ZS_14:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   30             break;          
        B        ??OLED_Key_ZS_18
//   31             
//   32         case MENU_5:
//   33            Angle_P+=10;  
??OLED_Key_ZS_17:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//   34             break;
        B        ??OLED_Key_ZS_18
//   35         
//   36         case MENU_6:
//   37             Angle_D+=10;  
??OLED_Key_ZS_16:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_2  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   38             break;
        B        ??OLED_Key_ZS_18
//   39                             
//   40      
//   41 
//   42         default :
//   43             break;
//   44         }
//   45         break;
??OLED_Key_ZS_11:
??OLED_Key_ZS_18:
        B        ??OLED_Key_ZS_19
//   46     case 2: /* ------------------------------ 下 */
//   47         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_3:
        LDR      R0,??OLED_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_20
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_21
??OLED_Key_ZS_20:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
//   48         switch (menuSelect)
??OLED_Key_ZS_21:
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_22
        BCC      ??OLED_Key_ZS_23
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_24
        BCC      ??OLED_Key_ZS_25
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_26
        BCC      ??OLED_Key_ZS_27
        CMP      R0,#+7
        BEQ      ??OLED_Key_ZS_28
        BCC      ??OLED_Key_ZS_29
        B        ??OLED_Key_ZS_23
//   49         {
//   50    case MENU:
//   51             zs_car=0;
??OLED_Key_ZS_22:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//   52             break; 
        B        ??OLED_Key_ZS_30
//   53         case MENU_1:
//   54             speed_set -= 10;
??OLED_Key_ZS_25:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//   55             break;
        B        ??OLED_Key_ZS_30
//   56             
//   57         case MENU_2:
//   58             Direction_P -= 10;
??OLED_Key_ZS_24:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   59             break;
        B        ??OLED_Key_ZS_30
//   60             
//   61   case MENU_3:
//   62             Direction_P2-=10;
??OLED_Key_ZS_27:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//   63 //          Chazhi+=10;
//   64             break;
        B        ??OLED_Key_ZS_30
//   65             
//   66         case MENU_4:
//   67             Direction_D2-=10;
??OLED_Key_ZS_26:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   68             break;          
        B        ??OLED_Key_ZS_30
//   69             
//   70         case MENU_5:
//   71             Angle_P-=10;  
??OLED_Key_ZS_29:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//   72             break;
        B        ??OLED_Key_ZS_30
//   73         
//   74         case MENU_6:
//   75             Angle_D-=10;  
??OLED_Key_ZS_28:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   76             break;
        B        ??OLED_Key_ZS_30
//   77                             
//   78          
//   79                             
//   80             
//   81 
//   82         default :
//   83             break;
//   84         }
//   85                     break;
??OLED_Key_ZS_23:
??OLED_Key_ZS_30:
        B        ??OLED_Key_ZS_19
//   86     case 3: /* ------------------------------ 左 */
//   87         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_2:
        LDR      R0,??OLED_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_31
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_32
??OLED_Key_ZS_31:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
//   88         switch (menuSelect)
??OLED_Key_ZS_32:
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_33
        BCC      ??OLED_Key_ZS_34
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_35
        BCC      ??OLED_Key_ZS_36
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_37
        BCC      ??OLED_Key_ZS_38
        CMP      R0,#+7
        BEQ      ??OLED_Key_ZS_39
        BCC      ??OLED_Key_ZS_40
        B        ??OLED_Key_ZS_34
//   89         {
//   90      
//   91    case MENU:
//   92             zs_car=1;
??OLED_Key_ZS_33:
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//   93             break; 
        B        ??OLED_Key_ZS_41
//   94         case MENU_1:
//   95             speed_set += 5;
??OLED_Key_ZS_36:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_9  ;; 0x40a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//   96             break;
        B        ??OLED_Key_ZS_41
//   97             
//   98         case MENU_2:
//   99             Direction_P += 50;
??OLED_Key_ZS_35:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_10  ;; 0x42480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  100             break;
        B        ??OLED_Key_ZS_41
//  101             
//  102   case MENU_3:
//  103             Direction_P2+=50;
??OLED_Key_ZS_38:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_10  ;; 0x42480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//  104 //          Chazhi+=10;
//  105             break;
        B        ??OLED_Key_ZS_41
//  106             
//  107         case MENU_4:
//  108            Direction_D2+=100;
??OLED_Key_ZS_37:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_11  ;; 0x42c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  109             break;          
        B        ??OLED_Key_ZS_41
//  110             
//  111         case MENU_5:
//  112             Angle_P+=50;  
??OLED_Key_ZS_40:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_10  ;; 0x42480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//  113             break;
        B        ??OLED_Key_ZS_41
//  114         
//  115         case MENU_6:
//  116             Angle_D+=50;  
??OLED_Key_ZS_39:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_10  ;; 0x42480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  117             break;
        B        ??OLED_Key_ZS_41
//  118                             
//  119      
//  120             
//  121         default :
//  122             break;
//  123         }
//  124         break;
??OLED_Key_ZS_34:
??OLED_Key_ZS_41:
        B        ??OLED_Key_ZS_19
//  125     case 4: /* ------------------------------ 右 */
//  126         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_5:
        LDR      R0,??OLED_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_42
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_43
??OLED_Key_ZS_42:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
//  127         switch (menuSelect)
??OLED_Key_ZS_43:
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_44
        BCC      ??OLED_Key_ZS_45
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_46
        BCC      ??OLED_Key_ZS_47
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_48
        BCC      ??OLED_Key_ZS_49
        CMP      R0,#+7
        BEQ      ??OLED_Key_ZS_50
        BCC      ??OLED_Key_ZS_51
        B        ??OLED_Key_ZS_45
//  128         {
//  129     
//  130           case MENU:
//  131             zs_car=0;
??OLED_Key_ZS_44:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STR      R0,[R1, #+0]
//  132             break; 
        B        ??OLED_Key_ZS_52
//  133         case MENU_1:
//  134             speed_set-= 5;
??OLED_Key_ZS_47:
        LDR      R0,??DataTable0_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1  ;; 0xc0a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_1
        STR      R0,[R1, #+0]
//  135             break;
        B        ??OLED_Key_ZS_52
//  136             
//  137         case MENU_2:
//  138             Direction_P -= 50;
??OLED_Key_ZS_46:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  139             break;
        B        ??OLED_Key_ZS_52
//  140             
//  141   case MENU_3:
//  142             Direction_P2-=50;
??OLED_Key_ZS_49:
        LDR      R0,??DataTable0_4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_4
        STR      R0,[R1, #+0]
//  143 //          Chazhi+=10;
//  144             break;
        B        ??OLED_Key_ZS_52
//  145             
//  146         case MENU_4:
//  147             Direction_D2-=100;
??OLED_Key_ZS_48:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_2  ;; 0xc2c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  148             break;          
        B        ??OLED_Key_ZS_52
//  149             
//  150         case MENU_5:
//  151             Angle_P-=50;  
??OLED_Key_ZS_51:
        LDR      R0,??DataTable0_6
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_6
        STR      R0,[R1, #+0]
//  152             break;
        B        ??OLED_Key_ZS_52
//  153         
//  154         case MENU_6:
//  155             Angle_D-=50 ; 
??OLED_Key_ZS_50:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_1  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  156             break;
        B        ??OLED_Key_ZS_52
//  157 
//  158         default :
//  159             break;
//  160         }
//  161         break;
??OLED_Key_ZS_45:
??OLED_Key_ZS_52:
        B        ??OLED_Key_ZS_19
//  162     case 5: /* ------------------------------ 中 */
//  163         KEY_sta = !KEY_sta;
??OLED_Key_ZS_4:
        LDR      R0,??OLED_Key_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_53
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_54
??OLED_Key_ZS_53:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_ZS_6
        STRB     R0,[R1, #+0]
//  164         KEY_menuChange = !KEY_menuChange;
??OLED_Key_ZS_54:
        LDR      R0,??DataTable1_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_55
        MOVS     R0,#+1
        LDR      R1,??DataTable1_3
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_56
        DATA
??OLED_Key_ZS_6:
        DC32     KEY_sta
        THUMB
??OLED_Key_ZS_55:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_3
        STRB     R0,[R1, #+0]
//  165         if (++menuSelect > 7)//logo 和 菜单显示只一次
??OLED_Key_ZS_56:
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??OLED_Key_ZS_9
        STRB     R0,[R1, #+0]
        LDR      R0,??OLED_Key_ZS_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BLT      ??OLED_Key_ZS_57
//  166         {
//  167             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_ZS_9
        STRB     R0,[R1, #+0]
//  168         }
//  169         break;
??OLED_Key_ZS_57:
        B        ??OLED_Key_ZS_19
//  170 
//  171     default :
//  172         break;
//  173     }
//  174 }
??OLED_Key_ZS_1:
??OLED_Key_ZS_19:
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??OLED_Key_ZS_9:
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
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0x42c80000
//  175  
//  176 /**
//  177   * 简介
//  178   *     绘制 菜单
//  179   * 备注
//  180   *     y
//  181   *         0 --- 空出
//  182   *         1,5
//  183   *              x  0 ~ 127 双横线
//  184   *         1 ~ 7
//  185   *              x  0,67,127 --- 竖线
//  186   *         1,5
//  187   *              x  30,94 --- 参数数字
//  188   *     页分配
//  189   *         0       --- 空出
//  190   *         1,5     --- 菜单数字
//  191   *         2~4,6~7 --- 显示区域
//  192   *     显示区域坐标
//  193   *         菜单     x   y --- x  y
//  194   *           1      1   2    66  4  可显示 11个字符，3行
//  195   *           2      68  2   126  4  可显示 9 个字符,3行
//  196   *           3      1   6   126  7  可显示 21个字符,2行
//  197   *           4      1   6   126  7  可显示 21个字符,2行
//  198   */
//  199 //void OLED_Menu()

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  200 void OLED_Biaoge_ZS()
//  201 {
OLED_Biaoge_ZS:
        PUSH     {R3-R5,LR}
//  202   uint8 i, x, y;
//  203 
//  204   for (i=0; i<10; i++)
        MOVS     R4,#+0
        B        ??OLED_Biaoge_ZS_0
//  205   {
//  206       switch (i)
//  207       {
//  208           //先画横再画竖线，竖线将横线覆盖掉,再画数字覆盖
//  209       case 0://-------------------- 上双横线
//  210           for (x=0; x<128; x++)// 0~127
//  211           {
//  212               OLED_Set_Pos(x, 0);
//  213               OLED_WrDat(0x81);//双横杠为0x81
//  214           }
//  215           break;
//  216       case 1://-------------------- 下双横线
//  217           for (x=0; x<128; x++)// 0~127
//  218           {
//  219               OLED_Set_Pos(x, 4);
//  220               OLED_WrDat(0x01);//单线0x01
//  221           }
//  222           break;
//  223       case 2://-------------------- 左竖线
//  224 //          for (y=1; y<8; y++)// 1~7
//  225 //          {
//  226 //              OLED_Set_Pos(0, y);
//  227 //              OLED_WrDat(0xff);
//  228 //          }
//  229           break;
//  230       case 3://-------------------- 中竖线
//  231           for (y=0; y<4; y++)// 1~5
//  232           {
//  233               OLED_Set_Pos(67, y);
//  234               OLED_WrDat(0xff);
//  235           }
//  236           break;
//  237       case 4://-------------------- 右竖线
//  238 //          for (y=1; y<8; y++)// 1~7
//  239 //          {
//  240 //              OLED_Set_Pos(127, y);
//  241 //              OLED_WrDat(0xff);
//  242 //          }
//  243           break;
//  244       case 5://-------------------- 菜单1数字
//  245 //          for (x=0; x<7; x++)
//  246 //          {
//  247 //              OLED_Set_Pos(30+x, 1);//30~36
//  248 //              OLED_WrDat(menuNum[0][x]);
//  249 //          }
//  250           break;
//  251       case 6://-------------------- 菜单2数字
//  252 //          for (x=0; x<7; x++)
//  253 //          {
//  254 //              OLED_Set_Pos(94+x, 1);//94~101
//  255 //              OLED_WrDat(menuNum[1][x]);
//  256 //          }
//  257           break;
//  258 
//  259 
//  260       case 9:/* 各个菜单预先显示,可屏蔽 */
//  261         
//  262 
//  263          OLED_DisplaytinyStr(1, 2, "P:");//菜单1内容显示
//  264          OLED_DisplaytinyStr(1, 3, "Pc:");//菜单2内容显示
//  265          OLED_DisplaytinyStr(68, 1, "Dc:");//菜单3内容显示
//  266 
//  267          OLED_DisplaytinyStr(68, 2, "AP:");//菜单4内容显示
//  268          OLED_DisplaytinyStr(68, 3, "AD:");//菜单5内容显示
//  269          
//  270          OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
//  271    
//  272 OLED_DisplayFloat(1+6*3+1, 2,Direction_P, 0);//3行11列
//  273    
//  274    
//  275 OLED_DisplayFloat(1+6*3+1, 3,Direction_P2, 0);//4行11列
//  276    
//  277 OLED_DisplayFloat(68+6*3+1, 1,Direction_D2, 0);//3行2表格 
//  278  
//  279 OLED_DisplayFloat(68+6*3+1, 2,Angle_P, 0);//3行2表格
//  280 
//  281 OLED_DisplayFloat(68+6*3+1, 3,Angle_D, 1);//3行2表格 
//  282 
//  283             if(zs_car==1)
//  284   OLED_DisplaytinyStr(40, 1, "RUN ");
//  285     else
//  286   OLED_DisplaytinyStr(40, 1, "STOP");
//  287          
//  288             break;
//  289 
//  290       default :
//  291           break;
??OLED_Biaoge_ZS_1:
??OLED_Biaoge_ZS_2:
        ADDS     R4,R4,#+1
??OLED_Biaoge_ZS_0:
        UXTB     R4,R4
        CMP      R4,#+10
        BLT      .+4
        B        ??OLED_Biaoge_ZS_3
        UXTB     R4,R4
        MOVS     R0,R4
        CMP      R0,#+0
        BEQ      ??OLED_Biaoge_ZS_4
        CMP      R0,#+1
        BEQ      ??OLED_Biaoge_ZS_5
        CMP      R0,#+2
        BEQ      ??OLED_Biaoge_ZS_6
        CMP      R0,#+3
        BEQ      ??OLED_Biaoge_ZS_7
        CMP      R0,#+4
        BEQ      ??OLED_Biaoge_ZS_8
        CMP      R0,#+5
        BEQ      ??OLED_Biaoge_ZS_9
        CMP      R0,#+6
        BEQ      ??OLED_Biaoge_ZS_10
        CMP      R0,#+9
        BEQ      ??OLED_Biaoge_ZS_11
        B        ??OLED_Biaoge_ZS_1
??OLED_Biaoge_ZS_4:
        MOVS     R5,#+0
        B        ??OLED_Biaoge_ZS_12
??OLED_Biaoge_ZS_13:
        MOVS     R1,#+0
        MOVS     R0,R5
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+129
        BL       OLED_WrDat
        ADDS     R5,R5,#+1
??OLED_Biaoge_ZS_12:
        UXTB     R5,R5
        CMP      R5,#+128
        BLT      ??OLED_Biaoge_ZS_13
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_5:
        MOVS     R5,#+0
        B        ??OLED_Biaoge_ZS_14
??OLED_Biaoge_ZS_15:
        MOVS     R1,#+4
        MOVS     R0,R5
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+1
        BL       OLED_WrDat
        ADDS     R5,R5,#+1
??OLED_Biaoge_ZS_14:
        UXTB     R5,R5
        CMP      R5,#+128
        BLT      ??OLED_Biaoge_ZS_15
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_6:
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_7:
        MOVS     R5,#+0
        B        ??OLED_Biaoge_ZS_16
??OLED_Biaoge_ZS_17:
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,#+67
        BL       OLED_Set_Pos
        MOVS     R0,#+255
        BL       OLED_WrDat
        ADDS     R5,R5,#+1
??OLED_Biaoge_ZS_16:
        UXTB     R5,R5
        CMP      R5,#+4
        BLT      ??OLED_Biaoge_ZS_17
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_8:
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_9:
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_10:
        B        ??OLED_Biaoge_ZS_2
??OLED_Biaoge_ZS_11:
        ADR      R2,??DataTable2  ;; 0x50, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
        ADR      R2,??DataTable2_1  ;; "Pc:"
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
        ADR      R2,??DataTable2_2  ;; "Dc:"
        MOVS     R1,#+1
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
        ADR      R2,??DataTable2_3  ;; "AP:"
        MOVS     R1,#+2
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
        ADR      R2,??DataTable2_4  ;; "AD:"
        MOVS     R1,#+3
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
        MOVS     R3,#+0
        LDR      R0,??DataTable2_5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
        MOVS     R3,#+0
        LDR      R0,??DataTable2_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
        MOVS     R3,#+0
        LDR      R0,??DataTable2_7
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
        MOVS     R3,#+0
        LDR      R0,??DataTable2_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
        MOVS     R3,#+0
        LDR      R0,??DataTable2_9
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
        MOVS     R3,#+1
        LDR      R0,??DataTable2_10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
        LDR      R0,??DataTable2_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Biaoge_ZS_18
        LDR      R2,??DataTable2_12
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Biaoge_ZS_19
??OLED_Biaoge_ZS_18:
        LDR      R2,??DataTable3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
??OLED_Biaoge_ZS_19:
        B        ??OLED_Biaoge_ZS_2
//  292       }
//  293   }
//  294 }
??OLED_Biaoge_ZS_3:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xc0a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xc2480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xc2c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     KEY_menuChange
//  295 
//  296 /**
//  297   * 简介
//  298   *     菜单闪烁
//  299   * 备注
//  300   *     当菜单被选中时 闪烁
//  301   */
//  302 //void OLED_MenuFlicker()

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  303 void OLED_Select_ZS()
//  304 {
OLED_Select_ZS:
        PUSH     {R4,LR}
//  305   uint8 x,y;
//  306 
//  307     switch (menuSelect)
        LDR      R0,??DataTable3_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Select_ZS_0
        BCS      .+4
        B        ??OLED_Select_ZS_1
        CMP      R0,#+3
        BEQ      ??OLED_Select_ZS_2
        BCC      ??OLED_Select_ZS_3
        CMP      R0,#+5
        BEQ      ??OLED_Select_ZS_4
        BCC      ??OLED_Select_ZS_5
        CMP      R0,#+7
        BNE      .+4
        B        ??OLED_Select_ZS_6
        BCS      .+4
        B        ??OLED_Select_ZS_7
        B        ??OLED_Select_ZS_1
//  308     {  
//  309     case MENU://--------------------------- 显示 菜单 38.5ms
//  310   
//  311     if(zs_car==1)
??OLED_Select_ZS_0:
        LDR      R0,??DataTable2_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Select_ZS_8
//  312   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable2_12
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Select_ZS_9
//  313     else
//  314   OLED_DisplaytinyStr(40, 1, "STOP");
??OLED_Select_ZS_8:
        LDR      R2,??DataTable3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  315   
//  316       for (x=0; x<4; x++)//84~87 消 2
??OLED_Select_ZS_9:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_10
//  317         {
//  318             OLED_Set_Pos(124+x, 0);
??OLED_Select_ZS_11:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  319             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  320         }      break;
        ADDS     R4,R4,#+1
??OLED_Select_ZS_10:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_11
        B        ??OLED_Select_ZS_12
//  321     case MENU_1://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  322         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_ZS_3:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_13
//  323         {
//  324             OLED_Set_Pos(5+x, 0);//第一行20列的三角形
??OLED_Select_ZS_14:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  325             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  326         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_13:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_14
//  327 //        for (x=0; x<4; x++)//84~87 消 4
//  328 //        {
//  329 //            OLED_Set_Pos(124+x, 5);//消灭第五行99列三角形
//  330 //            OLED_WrDat(0x81);
//  331 //        }
//  332         break;
        B        ??OLED_Select_ZS_12
//  333         
//  334     case MENU_2://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  335         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_ZS_2:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_15
//  336         {
//  337             OLED_Set_Pos(40+x, 0);
??OLED_Select_ZS_16:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  338             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  339         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_15:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_16
//  340         for (x=0; x<4; x++)//84~87 消 4
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_17
//  341         {
//  342             OLED_Set_Pos(5+x, 0);
??OLED_Select_ZS_18:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  343             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  344         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_17:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_18
//  345         break;
        B        ??OLED_Select_ZS_12
//  346         
//  347     case MENU_3://--------------------------- 选择 菜单2
//  348         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_5:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_19
//  349         {
//  350             OLED_Set_Pos(60+x, 0);
??OLED_Select_ZS_20:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  351             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  352         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_19:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_20
//  353         for (x=0; x<4; x++)//20~23 消 1
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_21
//  354         {
//  355             OLED_Set_Pos(40+x, 0);
??OLED_Select_ZS_22:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  356             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  357         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_21:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_22
//  358         break;
        B        ??OLED_Select_ZS_12
//  359  
//  360         case MENU_4://--------------------------- 选择 菜单2
//  361         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_4:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_23
//  362         {
//  363             OLED_Set_Pos(84+x, 0);
??OLED_Select_ZS_24:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  364             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  365         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_23:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_24
//  366         for (x=0; x<4; x++)//20~23 消 1
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_25
//  367         {
//  368             OLED_Set_Pos(60+x, 0);
??OLED_Select_ZS_26:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  369             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  370         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_25:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_26
//  371         break;
        B        ??OLED_Select_ZS_12
//  372         
//  373         
//  374         case MENU_5://--------------------------- 选择 菜单2
//  375         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_7:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_27
//  376         {
//  377             OLED_Set_Pos(104+x, 0);
??OLED_Select_ZS_28:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  378             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  379         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_27:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_28
//  380         for (x=0; x<4; x++)//20~23 消 1
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_29
//  381         {
//  382             OLED_Set_Pos(84+x, 0);
??OLED_Select_ZS_30:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  383             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  384         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_29:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_30
//  385         break;
        B        ??OLED_Select_ZS_12
//  386         
//  387         case MENU_6://--------------------------- 选择 菜单2
//  388         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_6:
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_31
//  389         {
//  390             OLED_Set_Pos(124+x, 0);
??OLED_Select_ZS_32:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  391             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable3_2
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  392         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_31:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_32
//  393         for (x=0; x<4; x++)//20~23 消 1
        MOVS     R4,#+0
        B        ??OLED_Select_ZS_33
//  394         {
//  395             OLED_Set_Pos(104+x, 0);
??OLED_Select_ZS_34:
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  396             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  397         }
        ADDS     R4,R4,#+1
??OLED_Select_ZS_33:
        UXTB     R4,R4
        CMP      R4,#+4
        BLT      ??OLED_Select_ZS_34
//  398         break;
        B        ??OLED_Select_ZS_12
//  399         
//  400     default :
//  401         break;
//  402     }
//  403 }
??OLED_Select_ZS_1:
??OLED_Select_ZS_12:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC8      0x50, 0x3A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC8      "Pc:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC8      "Dc:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC8      "AP:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC8      "AD:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ?_5
//  404 
//  405 
//  406 /**
//  407   * 简介
//  408   *     多级菜单 显示
//  409   
//  410 * 注意
//  411   *     坐标不要随便改 预先显示内容在OLED_Menu中修改,默认前4个字符用于显示标志
//  412   *     显示区域坐标
//  413   *         菜单     x   y --- x  y
//  414   *           1      1   2    66  4  可显示 11个字符，3行
//  415   *           2      68  2   126  4  可显示 9 个字符,3行
//  416   *           3      1   6   126  7  可显示 21个字符,2行
//  417   *           4      1   6   126  7  可显示 21个字符,2行
//  418   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  419 void Oled_Data_ZS(void)
//  420 {
Oled_Data_ZS:
        PUSH     {R7,LR}
//  421     switch (menuSelect) 
        LDR      R0,??DataTable3_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??Oled_Data_ZS_0
        BCC      ??Oled_Data_ZS_1
        CMP      R0,#+3
        BEQ      ??Oled_Data_ZS_2
        BCC      ??Oled_Data_ZS_3
        CMP      R0,#+5
        BEQ      ??Oled_Data_ZS_4
        BCC      ??Oled_Data_ZS_5
        CMP      R0,#+7
        BEQ      ??Oled_Data_ZS_6
        BCC      ??Oled_Data_ZS_7
        B        ??Oled_Data_ZS_1
//  422     {
//  423     case MENU:
//  424           if(zs_car==1)
??Oled_Data_ZS_0:
        LDR      R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Oled_Data_ZS_8
//  425   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable3_4
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??Oled_Data_ZS_9
//  426           else
//  427   OLED_DisplaytinyStr(40, 1, "STOP");
??Oled_Data_ZS_8:
        LDR      R2,??DataTable3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  428  
//  429   break;
??Oled_Data_ZS_9:
        B        ??Oled_Data_ZS_10
//  430     
//  431     case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
//  432 OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
??Oled_Data_ZS_3:
        MOVS     R3,#+0
        LDR      R0,??DataTable3_5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
//  433    break;
        B        ??Oled_Data_ZS_10
//  434    
//  435    case MENU_2:
//  436 OLED_DisplayFloat(1+6*3+1, 2,Direction_P, 0);//3行11列
??Oled_Data_ZS_2:
        MOVS     R3,#+0
        LDR      R0,??DataTable3_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  437    break;
        B        ??Oled_Data_ZS_10
//  438    
//  439     case MENU_3:
//  440 OLED_DisplayFloat(1+6*3+1, 3,Direction_P2, 0);//4行11列
??Oled_Data_ZS_5:
        MOVS     R3,#+0
        LDR      R0,??DataTable3_7
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
//  441    break;
        B        ??Oled_Data_ZS_10
//  442    
//  443    case MENU_4:
//  444 OLED_DisplayFloat(68+6*3+1, 1,Direction_D2, 0);//3行2表格 
??Oled_Data_ZS_4:
        MOVS     R3,#+0
        LDR      R0,??DataTable3_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  445    break;
        B        ??Oled_Data_ZS_10
//  446  
//  447     case MENU_5:
//  448 OLED_DisplayFloat(68+6*3+1, 2,Angle_P, 0);//3行2表格
??Oled_Data_ZS_7:
        MOVS     R3,#+0
        LDR      R0,??DataTable3_9
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  449     break;
        B        ??Oled_Data_ZS_10
//  450 
//  451    case MENU_6:
//  452 OLED_DisplayFloat(68+6*3+1, 3,Angle_D , 1);//3行2表格 
??Oled_Data_ZS_6:
        MOVS     R3,#+1
        LDR      R0,??DataTable3_10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
//  453    break;
        B        ??Oled_Data_ZS_10
//  454    
//  455     
//  456     default :
//  457         break;
//  458     }
//  459 }
??Oled_Data_ZS_1:
??Oled_Data_ZS_10:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     menuNum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     Angle_D

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "P:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "Pc:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "Dc:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "AP:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "AD:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "RUN "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "STOP"
        DC8 0, 0, 0

        END
//  460 
//  461 
//  462 
//  463 
//  464 
//  465 
//  466 
//  467 
// 
//    36 bytes in section .rodata
// 1 870 bytes in section .text
// 
// 1 870 bytes of CODE  memory
//    36 bytes of CONST memory
//
//Errors: none
//Warnings: 1
