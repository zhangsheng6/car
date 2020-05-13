///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       31/Jul/2018  01:25:13
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  H:\智能车程序2018\三轮比赛\7.29-sc\user\C\oled_zs.c
//    Command line =  
//        H:\智能车程序2018\三轮比赛\7.29-sc\user\C\oled_zs.c -D IAR -D
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
//        H:\智能车程序2018\三轮比赛\7.29-sc\iar\KEA_128_FLASH\List\oled_zs.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Angle_P
        EXTERN Angle_P_Change
        EXTERN BB_H
        EXTERN BB_P_F
        EXTERN BB_P_W
        EXTERN BB_P_Z
        EXTERN BB_W
        EXTERN BB_Z
        EXTERN Circle_Chazhi
        EXTERN Circle_Count6_Max
        EXTERN Circle_Finish_Count_Max
        EXTERN Circle_Inductor_LR1
        EXTERN Circle_Inductor_M1
        EXTERN Circle_Inductor_M2
        EXTERN Circle_Inductor_M3
        EXTERN Direction_D2
        EXTERN Direction_P
        EXTERN Direction_P2
        EXTERN Direction_P2_Change
        EXTERN KEY_Scan
        EXTERN KEY_menuChange
        EXTERN KEY_sta
        EXTERN OLED_DisplayFloat
        EXTERN OLED_DisplaytinyStr
        EXTERN OLED_Int16
        EXTERN OLED_Set_Pos
        EXTERN OLED_WrDat
        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_i2f
        EXTERN akmj_w
        EXTERN akmj_z
        EXTERN menuNum
        EXTERN menuSelect
        EXTERN speed_set
        EXTERN zs_car

        PUBLIC Angle_P_Change_old
        PUBLIC Angle_P_old
        PUBLIC BB_H_old
        PUBLIC BB_P_F_old
        PUBLIC BB_P_Z_old
        PUBLIC BB_W_old
        PUBLIC BB_Z_old
        PUBLIC Circle_Chazhi_old
        PUBLIC Circle_Count6_Max_old
        PUBLIC Circle_Finish_Count_Max_old
        PUBLIC Circle_Inductor_LR1_old
        PUBLIC Circle_Inductor_M1_old
        PUBLIC Circle_Inductor_M2_old
        PUBLIC Circle_Inductor_M3_old
        PUBLIC Data_Old
        PUBLIC Data_Old2
        PUBLIC Direction_D2_old
        PUBLIC Direction_P2_Change_old
        PUBLIC Direction_P2_old
        PUBLIC Direction_P_old
        PUBLIC OLED_Biaoge_Par_ZS
        PUBLIC OLED_Biaoge_ZS
        PUBLIC OLED_Key_Par_ZS
        PUBLIC OLED_Key_ZS
        PUBLIC OLED_Select_Par_ZS
        PUBLIC OLED_Select_ZS
        PUBLIC Oled_Data_Par_ZS
        PUBLIC Oled_Data_ZS
        PUBLIC Oled_Data_ZS_All
        PUBLIC Oled_Data_ZS_All2
        PUBLIC akmj_w_old
        PUBLIC akmj_z_old
        PUBLIC jiemian
        PUBLIC speed_set_old

// H:\智能车程序2018\三轮比赛\7.29-sc\user\C\oled_zs.c
//    1 #include "Variable.h"
//    2 #include "common.h"
//    3 #include "allHead.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 int jiemian=0;
jiemian:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void OLED_Key_ZS(void)
//    6 {
OLED_Key_ZS:
        PUSH     {R7,LR}
//    7     switch (KEY_Scan())
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
//    8 {
//    9     case 1: /* ------------------------------ 上 */
//   10         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_0:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_6
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_7
??OLED_Key_ZS_6:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//   11         switch (menuSelect)
??OLED_Key_ZS_7:
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_8
        BCC      ??OLED_Key_ZS_9
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_10
        BCC      ??OLED_Key_ZS_11
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_12
        BCC      ??OLED_Key_ZS_13
        CMP      R0,#+6
        BEQ      ??OLED_Key_ZS_14
        B        ??OLED_Key_ZS_9
//   12         {
//   13            case MENU:
//   14             zs_car=1;
??OLED_Key_ZS_8:
        MOVS     R0,#+1
        LDR      R1,??DataTable0_2
        STR      R0,[R1, #+0]
//   15             break; 
        B        ??OLED_Key_ZS_15
//   16         case MENU_1:
//   17             speed_set += 5;
??OLED_Key_ZS_11:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_4  ;; 0x40a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   18             break;
        B        ??OLED_Key_ZS_15
//   19             
//   20         case MENU_2:
//   21             Direction_P2 += 20;
??OLED_Key_ZS_10:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_6  ;; 0x41a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   22             break;
        B        ??OLED_Key_ZS_15
//   23       
//   24         case MENU_3:
//   25             Direction_D2 += 50;
??OLED_Key_ZS_13:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_8  ;; 0x42480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   26             break;
        B        ??OLED_Key_ZS_15
//   27             
//   28 
//   29             
//   30         case MENU_4:
//   31             Direction_P2_Change+=10;
??OLED_Key_ZS_12:
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
//   32             break;          
        B        ??OLED_Key_ZS_15
//   33             
//   34         case MENU_5:
//   35            Angle_P_Change+=10;  
??OLED_Key_ZS_14:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//   36             break;
        B        ??OLED_Key_ZS_15
//   37              
//   38          
//   39      
//   40 
//   41         default :
//   42             break;
//   43         }
//   44   
//   45         break;
??OLED_Key_ZS_9:
??OLED_Key_ZS_15:
        B        ??OLED_Key_ZS_16
//   46     case 2: /* ------------------------------ 下 */
//   47         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_3:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_17
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_18
??OLED_Key_ZS_17:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//   48        switch (menuSelect)
??OLED_Key_ZS_18:
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_19
        BCC      ??OLED_Key_ZS_20
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_21
        BCC      ??OLED_Key_ZS_22
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_23
        BCC      ??OLED_Key_ZS_24
        CMP      R0,#+6
        BEQ      ??OLED_Key_ZS_25
        B        ??OLED_Key_ZS_20
//   49         {
//   50            case MENU:
//   51             zs_car=0;
??OLED_Key_ZS_19:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_2
        STR      R0,[R1, #+0]
//   52             break; 
        B        ??OLED_Key_ZS_26
//   53         case MENU_1:
//   54             speed_set -= 5;
??OLED_Key_ZS_22:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_11  ;; 0xc0a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   55             break;
        B        ??OLED_Key_ZS_26
//   56             
//   57         case MENU_2:
//   58             Direction_P2 -= 20;
??OLED_Key_ZS_21:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_12  ;; 0xc1a00000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   59             break;  
        B        ??OLED_Key_ZS_26
//   60       
//   61         case MENU_3:
//   62             Direction_D2 -= 50;
??OLED_Key_ZS_24:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_13  ;; 0xc2480000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   63             break;
        B        ??OLED_Key_ZS_26
//   64             
//   65 
//   66         case MENU_4:
//   67             Direction_P2_Change-=10;
??OLED_Key_ZS_23:
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
//   68             break;          
        B        ??OLED_Key_ZS_26
//   69             
//   70         case MENU_5:
//   71            Angle_P_Change-=10;  
??OLED_Key_ZS_25:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//   72             break;
        B        ??OLED_Key_ZS_26
//   73 
//   74                             
//   75      
//   76 
//   77         default :
//   78             break;
//   79         }
//   80   
//   81         break;
??OLED_Key_ZS_20:
??OLED_Key_ZS_26:
        B        ??OLED_Key_ZS_16
//   82     case 3: /* ------------------------------ 左 */
//   83         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_2:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_27
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_28
??OLED_Key_ZS_27:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//   84         switch (menuSelect)
??OLED_Key_ZS_28:
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_29
        BCC      ??OLED_Key_ZS_30
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_31
        BCC      ??OLED_Key_ZS_32
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_33
        BCC      ??OLED_Key_ZS_34
        CMP      R0,#+6
        BEQ      ??OLED_Key_ZS_35
        B        ??OLED_Key_ZS_30
//   85         {
//   86            case MENU:
//   87             jiemian=1;
??OLED_Key_ZS_29:
        MOVS     R0,#+1
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
//   88             break; 
        B        ??OLED_Key_ZS_36
//   89         case MENU_1:
//   90             speed_set += 10;
??OLED_Key_ZS_32:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_15  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//   91             break;
        B        ??OLED_Key_ZS_36
//   92             
//   93         case MENU_2:
//   94             Direction_P2 += 100;
??OLED_Key_ZS_31:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_16  ;; 0x42c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//   95             break;
        B        ??OLED_Key_ZS_36
//   96                    
//   97         case MENU_3:
//   98             Direction_D2 += 100;
??OLED_Key_ZS_34:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_16  ;; 0x42c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//   99             break;
        B        ??OLED_Key_ZS_36
//  100             
//  101 
//  102      
//  103         case MENU_4:
//  104             Direction_P2_Change+=50;
??OLED_Key_ZS_33:
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+50
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
//  105             break;          
        B        ??OLED_Key_ZS_36
//  106             
//  107         case MENU_5:
//  108            Angle_P_Change+=50;  
??OLED_Key_ZS_35:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+50
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//  109             break;
        B        ??OLED_Key_ZS_36
//  110         
//  111               
//  112      
//  113 
//  114         default :
//  115             break;
//  116         }
//  117   
//  118         break;
??OLED_Key_ZS_30:
??OLED_Key_ZS_36:
        B        ??OLED_Key_ZS_16
//  119     case 4: /* ------------------------------ 右 */
//  120         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_ZS_5:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_37
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_38
??OLED_Key_ZS_37:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  121          switch (menuSelect)
??OLED_Key_ZS_38:
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_ZS_39
        BCC      ??OLED_Key_ZS_40
        CMP      R0,#+3
        BEQ      ??OLED_Key_ZS_41
        BCC      ??OLED_Key_ZS_42
        CMP      R0,#+5
        BEQ      ??OLED_Key_ZS_43
        BCC      ??OLED_Key_ZS_44
        CMP      R0,#+6
        BEQ      ??OLED_Key_ZS_45
        B        ??OLED_Key_ZS_40
//  122         {
//  123            case MENU:
//  124             jiemian=2;
??OLED_Key_ZS_39:
        MOVS     R0,#+2
        LDR      R1,??DataTable0_14
        STR      R0,[R1, #+0]
//  125             break; 
        B        ??OLED_Key_ZS_46
//  126         case MENU_1:
//  127             speed_set -= 10;
??OLED_Key_ZS_42:
        LDR      R0,??DataTable0_3
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_17  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_3
        STR      R0,[R1, #+0]
//  128             break;
        B        ??OLED_Key_ZS_46
//  129             
//  130         case MENU_2:
//  131             Direction_P2 -= 100;
??OLED_Key_ZS_41:
        LDR      R0,??DataTable0_5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_18  ;; 0xc2c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_5
        STR      R0,[R1, #+0]
//  132             break;
        B        ??OLED_Key_ZS_46
//  133        
//  134         case MENU_3:
//  135             Direction_D2 -= 100;
??OLED_Key_ZS_44:
        LDR      R0,??DataTable0_7
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable0_18  ;; 0xc2c80000
        BL       __aeabi_fadd
        LDR      R1,??DataTable0_7
        STR      R0,[R1, #+0]
//  136             break;
        B        ??OLED_Key_ZS_46
//  137             
//  138 
//  139             
//  140         case MENU_4:
//  141             Direction_P2_Change-=50;
??OLED_Key_ZS_43:
        LDR      R0,??DataTable0_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+50
        LDR      R1,??DataTable0_9
        STR      R0,[R1, #+0]
//  142             break;          
        B        ??OLED_Key_ZS_46
//  143             
//  144         case MENU_5:
//  145            Angle_P_Change-=50;  
??OLED_Key_ZS_45:
        LDR      R0,??DataTable0_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+50
        LDR      R1,??DataTable0_10
        STR      R0,[R1, #+0]
//  146             break;
        B        ??OLED_Key_ZS_46
//  147             
//  148  
//  149                             
//  150                             
//  151      
//  152 
//  153         default :
//  154             break;
//  155         }
//  156      
//  157         break;
??OLED_Key_ZS_40:
??OLED_Key_ZS_46:
        B        ??OLED_Key_ZS_16
//  158     case 5: /* ------------------------------ 中 */
//  159         KEY_sta = !KEY_sta;
??OLED_Key_ZS_4:
        LDR      R0,??DataTable0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_47
        MOVS     R0,#+1
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_48
??OLED_Key_ZS_47:
        MOVS     R0,#+0
        LDR      R1,??DataTable0
        STRB     R0,[R1, #+0]
//  160         KEY_menuChange = !KEY_menuChange;
??OLED_Key_ZS_48:
        LDR      R0,??DataTable0_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_ZS_49
        MOVS     R0,#+1
        LDR      R1,??DataTable0_19
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_ZS_50
??OLED_Key_ZS_49:
        MOVS     R0,#+0
        LDR      R1,??DataTable0_19
        STRB     R0,[R1, #+0]
//  161         if (++menuSelect > 6)//logo 和 菜单显示只一次
??OLED_Key_ZS_50:
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable0_1
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable0_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT      ??OLED_Key_ZS_51
//  162         {
//  163             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??DataTable0_1
        STRB     R0,[R1, #+0]
//  164         }
//  165         break;
??OLED_Key_ZS_51:
        B        ??OLED_Key_ZS_16
//  166 
//  167     default :
//  168         break;
//  169     }
//  170 }
??OLED_Key_ZS_1:
??OLED_Key_ZS_16:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     Direction_P2_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_10:
        DC32     Angle_P_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_11:
        DC32     0xc0a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_12:
        DC32     0xc1a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_13:
        DC32     0xc2480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_14:
        DC32     jiemian

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_15:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_16:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_17:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_18:
        DC32     0xc2c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_19:
        DC32     KEY_menuChange
//  171  
//  172 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  173 void OLED_Key_Par_ZS(void)
//  174 {
OLED_Key_Par_ZS:
        PUSH     {R7,LR}
//  175     switch (KEY_Scan())
        BL       KEY_Scan
        CMP      R0,#+1
        BEQ      ??OLED_Key_Par_ZS_0
        BCS      .+4
        B        ??OLED_Key_Par_ZS_1
        CMP      R0,#+3
        BNE      .+4
        B        ??OLED_Key_Par_ZS_2
        BCC      ??OLED_Key_Par_ZS_3
        CMP      R0,#+5
        BNE      .+4
        B        ??OLED_Key_Par_ZS_4
        BCS      .+4
        B        ??OLED_Key_Par_ZS_5
        B        ??OLED_Key_Par_ZS_1
//  176 {
//  177     case 1: /* ------------------------------ 上 */
//  178         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_Par_ZS_0:
        LDR      R0,??OLED_Key_Par_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_7
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_8
??OLED_Key_Par_ZS_7:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_Par_ZS_6
        STRB     R0,[R1, #+0]
//  179         switch (menuSelect)
??OLED_Key_Par_ZS_8:
        LDR      R0,??OLED_Key_Par_ZS_6+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_Par_ZS_9
        BCC      ??OLED_Key_Par_ZS_10
        CMP      R0,#+3
        BEQ      ??OLED_Key_Par_ZS_11
        BCC      ??OLED_Key_Par_ZS_12
        CMP      R0,#+5
        BEQ      ??OLED_Key_Par_ZS_13
        BCC      ??OLED_Key_Par_ZS_14
        CMP      R0,#+7
        BEQ      ??OLED_Key_Par_ZS_15
        BCC      ??OLED_Key_Par_ZS_16
        CMP      R0,#+9
        BEQ      ??OLED_Key_Par_ZS_17
        BCC      ??OLED_Key_Par_ZS_18
        CMP      R0,#+11
        BEQ      ??OLED_Key_Par_ZS_19
        BCC      ??OLED_Key_Par_ZS_20
        CMP      R0,#+13
        BEQ      ??OLED_Key_Par_ZS_21
        BCC      ??OLED_Key_Par_ZS_22
        B        ??OLED_Key_Par_ZS_10
//  180         {
//  181            case MENU:
//  182             zs_car=1;
??OLED_Key_Par_ZS_9:
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_23
        STR      R0,[R1, #+0]
//  183             break; 
        B        ??OLED_Key_Par_ZS_24
//  184         case MENU_1:
//  185             speed_set += 5;
??OLED_Key_Par_ZS_12:
        LDR      R0,??OLED_Key_Par_ZS_23+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??OLED_Key_Par_ZS_23+0x8  ;; 0x40a00000
        BL       __aeabi_fadd
        LDR      R1,??OLED_Key_Par_ZS_23+0x4
        STR      R0,[R1, #+0]
//  186             break;
        B        ??OLED_Key_Par_ZS_24
//  187             
//  188         case MENU_2:
//  189             BB_P_W += 5;
??OLED_Key_Par_ZS_11:
        LDR      R0,??OLED_Key_Par_ZS_23+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_23+0xC
        STR      R0,[R1, #+0]
//  190             break;
        B        ??OLED_Key_Par_ZS_24
//  191             
//  192   case MENU_3:
//  193             BB_W+=5;
??OLED_Key_Par_ZS_14:
        LDR      R0,??OLED_Key_Par_ZS_23+0x10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_23+0x10
        STR      R0,[R1, #+0]
//  194             break;
        B        ??OLED_Key_Par_ZS_24
//  195  ////////////////////////////////////////////////////////////           
//  196         case MENU_4:
//  197             BB_H+=5;
??OLED_Key_Par_ZS_13:
        LDR      R0,??OLED_Key_Par_ZS_25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_25
        STR      R0,[R1, #+0]
//  198             break;          
        B        ??OLED_Key_Par_ZS_24
//  199             
//  200         case MENU_5:
//  201            Circle_Chazhi+=5;  
??OLED_Key_Par_ZS_16:
        LDR      R0,??OLED_Key_Par_ZS_25+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_25+0x4
        STR      R0,[R1, #+0]
//  202             break;
        B        ??OLED_Key_Par_ZS_24
//  203         
//  204         case MENU_7:
//  205             Circle_Count6_Max+=500; //下次圆环间隔时间1S1000
??OLED_Key_Par_ZS_18:
        LDR      R0,??OLED_Key_Par_ZS_25+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        ADDS     R0,R0,R1
        LDR      R1,??OLED_Key_Par_ZS_25+0x8
        STR      R0,[R1, #+0]
//  206             break; 
        B        ??OLED_Key_Par_ZS_24
//  207  ////////////////////////////////////////////////////////////////           
//  208         case MENU_6:
//  209             Circle_Finish_Count_Max+=20; //强制打角时间 100为0.1s
??OLED_Key_Par_ZS_15:
        LDR      R0,??OLED_Key_Par_ZS_26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+20
        LDR      R1,??OLED_Key_Par_ZS_26
        STR      R0,[R1, #+0]
//  210             break;
        B        ??OLED_Key_Par_ZS_24
//  211             
//  212         case MENU_8:
//  213             Circle_Inductor_LR1+=1;  
??OLED_Key_Par_ZS_17:
        LDR      R0,??OLED_Key_Par_ZS_26+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_26+0x4
        STR      R0,[R1, #+0]
//  214             break;
        B        ??OLED_Key_Par_ZS_24
//  215             
//  216          case MENU_9:
//  217             Circle_Inductor_M1+=1;  
??OLED_Key_Par_ZS_20:
        LDR      R0,??OLED_Key_Par_ZS_27
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_27
        STR      R0,[R1, #+0]
//  218             break;
        B        ??OLED_Key_Par_ZS_24
//  219 ///////////////////////////////////////////////////////////////////////////                            
//  220          case MENU_10:
//  221             Circle_Inductor_M2+=1;  
??OLED_Key_Par_ZS_19:
        LDR      R0,??OLED_Key_Par_ZS_28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_28
        STR      R0,[R1, #+0]
//  222             break;
        B        ??OLED_Key_Par_ZS_24
//  223             
//  224         case MENU_11:
//  225             Circle_Inductor_M3+=1;  
??OLED_Key_Par_ZS_22:
        LDR      R0,??OLED_Key_Par_ZS_29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_29
        STR      R0,[R1, #+0]
//  226             break;
        B        ??OLED_Key_Par_ZS_24
//  227             
//  228          case MENU_12:
//  229             BB_P_Z+=5;  
??OLED_Key_Par_ZS_21:
        LDR      R0,??OLED_Key_Par_ZS_29+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_29+0x4
        STR      R0,[R1, #+0]
//  230             break;
        B        ??OLED_Key_Par_ZS_24
//  231 
//  232         default :
//  233             break;
//  234         }
//  235 
//  236         break;
??OLED_Key_Par_ZS_10:
??OLED_Key_Par_ZS_24:
        B        ??OLED_Key_Par_ZS_30
//  237     case 2: /* ------------------------------ 下 */
//  238         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_Par_ZS_3:
        LDR      R0,??OLED_Key_Par_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_31
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_32
??OLED_Key_Par_ZS_31:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_Par_ZS_6
        STRB     R0,[R1, #+0]
//  239         switch (menuSelect)
??OLED_Key_Par_ZS_32:
        LDR      R0,??OLED_Key_Par_ZS_6+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_Par_ZS_33
        BCC      ??OLED_Key_Par_ZS_34
        CMP      R0,#+3
        BEQ      ??OLED_Key_Par_ZS_35
        BCC      ??OLED_Key_Par_ZS_36
        CMP      R0,#+5
        BEQ      ??OLED_Key_Par_ZS_37
        BCC      ??OLED_Key_Par_ZS_38
        CMP      R0,#+7
        BEQ      ??OLED_Key_Par_ZS_39
        BCC      ??OLED_Key_Par_ZS_40
        CMP      R0,#+9
        BEQ      ??OLED_Key_Par_ZS_41
        BCC      ??OLED_Key_Par_ZS_42
        CMP      R0,#+11
        BEQ      ??OLED_Key_Par_ZS_43
        BCC      ??OLED_Key_Par_ZS_44
        CMP      R0,#+13
        BEQ      ??OLED_Key_Par_ZS_45
        BCC      ??OLED_Key_Par_ZS_46
        B        ??OLED_Key_Par_ZS_34
//  240         {
//  241     case MENU:
//  242             zs_car=0;
??OLED_Key_Par_ZS_33:
        MOVS     R0,#+0
        LDR      R1,??OLED_Key_Par_ZS_23
        STR      R0,[R1, #+0]
//  243             break; 
        B        ??OLED_Key_Par_ZS_47
//  244         case MENU_1:
//  245             speed_set -= 5;
??OLED_Key_Par_ZS_36:
        LDR      R0,??OLED_Key_Par_ZS_23+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??OLED_Key_Par_ZS_48  ;; 0xc0a00000
        BL       __aeabi_fadd
        LDR      R1,??OLED_Key_Par_ZS_23+0x4
        STR      R0,[R1, #+0]
//  246             break;
        B        ??OLED_Key_Par_ZS_47
//  247             
//  248         case MENU_2:
//  249             BB_P_W -= 5;
??OLED_Key_Par_ZS_35:
        LDR      R0,??OLED_Key_Par_ZS_23+0xC
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_23+0xC
        STR      R0,[R1, #+0]
//  250             break;
        B        ??OLED_Key_Par_ZS_47
//  251             
//  252   case MENU_3:
//  253             BB_W-=5;
??OLED_Key_Par_ZS_38:
        LDR      R0,??OLED_Key_Par_ZS_23+0x10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_23+0x10
        STR      R0,[R1, #+0]
//  254 //          Chazhi+=10;
//  255             break;
        B        ??OLED_Key_Par_ZS_47
//  256  ////////////////////////////////////////////////////////////           
//  257         case MENU_4:
//  258             BB_H-=5;
??OLED_Key_Par_ZS_37:
        LDR      R0,??OLED_Key_Par_ZS_25
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_25
        STR      R0,[R1, #+0]
//  259             break;          
        B        ??OLED_Key_Par_ZS_47
//  260             
//  261         case MENU_5:
//  262            Circle_Chazhi-=5;  
??OLED_Key_Par_ZS_40:
        LDR      R0,??OLED_Key_Par_ZS_25+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_25+0x4
        STR      R0,[R1, #+0]
//  263             break;
        B        ??OLED_Key_Par_ZS_47
//  264         
//  265         case MENU_7:
//  266             Circle_Count6_Max-=500;  
??OLED_Key_Par_ZS_42:
        LDR      R0,??OLED_Key_Par_ZS_25+0x8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable1  ;; 0xfffffe0c
        ADDS     R0,R0,R1
        LDR      R1,??OLED_Key_Par_ZS_25+0x8
        STR      R0,[R1, #+0]
//  267             break; 
        B        ??OLED_Key_Par_ZS_47
//  268  ////////////////////////////////////////////////////////////////           
//  269         case MENU_6:
//  270             Circle_Finish_Count_Max-=20;  
??OLED_Key_Par_ZS_39:
        LDR      R0,??OLED_Key_Par_ZS_26
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+20
        LDR      R1,??OLED_Key_Par_ZS_26
        STR      R0,[R1, #+0]
//  271             break;
        B        ??OLED_Key_Par_ZS_47
//  272             
//  273         case MENU_8:
//  274             Circle_Inductor_LR1-=1;  
??OLED_Key_Par_ZS_41:
        LDR      R0,??OLED_Key_Par_ZS_26+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_26+0x4
        STR      R0,[R1, #+0]
//  275             break;
        B        ??OLED_Key_Par_ZS_47
//  276             
//  277          case MENU_9:
//  278             Circle_Inductor_M1-=1;  
??OLED_Key_Par_ZS_44:
        LDR      R0,??OLED_Key_Par_ZS_27
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_27
        STR      R0,[R1, #+0]
//  279             break;
        B        ??OLED_Key_Par_ZS_47
//  280 ///////////////////////////////////////////////////////////////////////////                            
//  281          case MENU_10:
//  282             Circle_Inductor_M2-=1;  
??OLED_Key_Par_ZS_43:
        LDR      R0,??OLED_Key_Par_ZS_28
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_28
        STR      R0,[R1, #+0]
//  283             break;
        B        ??OLED_Key_Par_ZS_47
//  284             
//  285         case MENU_11:
//  286             Circle_Inductor_M3-=1;  
??OLED_Key_Par_ZS_46:
        LDR      R0,??OLED_Key_Par_ZS_29
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_29
        STR      R0,[R1, #+0]
//  287             break;
        B        ??OLED_Key_Par_ZS_47
//  288             
//  289          case MENU_12:
//  290             BB_P_Z-=5;  
??OLED_Key_Par_ZS_45:
        LDR      R0,??OLED_Key_Par_ZS_29+0x4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_29+0x4
        STR      R0,[R1, #+0]
//  291             break;
        B        ??OLED_Key_Par_ZS_47
//  292 
//  293                         
//  294         default :
//  295             break;
//  296         }
//  297                     break;
??OLED_Key_Par_ZS_34:
??OLED_Key_Par_ZS_47:
        B        ??OLED_Key_Par_ZS_30
//  298     case 3: /* ------------------------------ 左 */
//  299         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_Par_ZS_2:
        LDR      R0,??OLED_Key_Par_ZS_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_49
        MOVS     R0,#+1
        LDR      R1,??OLED_Key_Par_ZS_6
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_50
        DATA
??OLED_Key_Par_ZS_6:
        DC32     KEY_sta
        DC32     menuSelect
        THUMB
??OLED_Key_Par_ZS_49:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//  300         switch (menuSelect)
??OLED_Key_Par_ZS_50:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_Par_ZS_51
        BCC      ??OLED_Key_Par_ZS_52
        CMP      R0,#+3
        BEQ      ??OLED_Key_Par_ZS_53
        BCC      ??OLED_Key_Par_ZS_54
        CMP      R0,#+5
        BEQ      ??OLED_Key_Par_ZS_55
        BCC      ??OLED_Key_Par_ZS_56
        CMP      R0,#+7
        BEQ      ??OLED_Key_Par_ZS_57
        BCC      ??OLED_Key_Par_ZS_58
        CMP      R0,#+9
        BEQ      ??OLED_Key_Par_ZS_59
        BCC      ??OLED_Key_Par_ZS_60
        CMP      R0,#+11
        BEQ      ??OLED_Key_Par_ZS_61
        BCC      ??OLED_Key_Par_ZS_62
        CMP      R0,#+13
        BEQ      ??OLED_Key_Par_ZS_63
        BCC      ??OLED_Key_Par_ZS_64
        B        ??OLED_Key_Par_ZS_52
//  301         {
//  302            case MENU:
//  303             jiemian=1;
??OLED_Key_Par_ZS_51:
        MOVS     R0,#+1
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  304             break; 
        B        ??OLED_Key_Par_ZS_65
//  305         case MENU_1:
//  306             speed_set += 10;
??OLED_Key_Par_ZS_54:
        LDR      R0,??OLED_Key_Par_ZS_23+0x4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable1_4  ;; 0x41200000
        BL       __aeabi_fadd
        LDR      R1,??OLED_Key_Par_ZS_23+0x4
        STR      R0,[R1, #+0]
//  307             break;
        B        ??OLED_Key_Par_ZS_65
//  308             
//  309         case MENU_2:
//  310             BB_P_W+= 10;
??OLED_Key_Par_ZS_53:
        LDR      R0,??OLED_Key_Par_ZS_23+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??OLED_Key_Par_ZS_23+0xC
        STR      R0,[R1, #+0]
//  311             break;
        B        ??OLED_Key_Par_ZS_65
//  312             
//  313   case MENU_3:
//  314             BB_W+=10;
??OLED_Key_Par_ZS_56:
        LDR      R0,??OLED_Key_Par_ZS_23+0x10
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??OLED_Key_Par_ZS_23+0x10
        STR      R0,[R1, #+0]
//  315             break;
        B        ??OLED_Key_Par_ZS_65
//  316  ////////////////////////////////////////////////////////////           
//  317         case MENU_4:
//  318             BB_H+=10;
??OLED_Key_Par_ZS_55:
        LDR      R0,??OLED_Key_Par_ZS_25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??OLED_Key_Par_ZS_25
        STR      R0,[R1, #+0]
//  319             break;          
        B        ??OLED_Key_Par_ZS_65
//  320             
//  321         case MENU_5:
//  322            Circle_Chazhi+=10;  
??OLED_Key_Par_ZS_58:
        LDR      R0,??OLED_Key_Par_ZS_25+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??OLED_Key_Par_ZS_25+0x4
        STR      R0,[R1, #+0]
//  323             break;
        B        ??OLED_Key_Par_ZS_65
//  324         
//  325         case MENU_7:
//  326             Circle_Count6_Max+=1000;  
??OLED_Key_Par_ZS_60:
        LDR      R0,??OLED_Key_Par_ZS_25+0x8
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        ADDS     R0,R0,R1
        LDR      R1,??OLED_Key_Par_ZS_25+0x8
        STR      R0,[R1, #+0]
//  327             break; 
        B        ??OLED_Key_Par_ZS_65
//  328  ////////////////////////////////////////////////////////////////           
//  329         case MENU_6:
//  330             Circle_Finish_Count_Max+=100;  
??OLED_Key_Par_ZS_57:
        LDR      R0,??OLED_Key_Par_ZS_26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR      R1,??OLED_Key_Par_ZS_26
        STR      R0,[R1, #+0]
//  331             break;
        B        ??OLED_Key_Par_ZS_65
//  332             
//  333         case MENU_8:
//  334             Circle_Inductor_LR1+=5;  
??OLED_Key_Par_ZS_59:
        LDR      R0,??OLED_Key_Par_ZS_26+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_26+0x4
        STR      R0,[R1, #+0]
//  335             break;
        B        ??OLED_Key_Par_ZS_65
//  336             
//  337          case MENU_9:
//  338             Circle_Inductor_M1+=5;  
??OLED_Key_Par_ZS_62:
        LDR      R0,??OLED_Key_Par_ZS_27
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_27
        STR      R0,[R1, #+0]
//  339             break;
        B        ??OLED_Key_Par_ZS_65
//  340 ///////////////////////////////////////////////////////////////////////////                            
//  341          case MENU_10:
//  342             Circle_Inductor_M2+=5;  
??OLED_Key_Par_ZS_61:
        LDR      R0,??OLED_Key_Par_ZS_28
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_28
        STR      R0,[R1, #+0]
//  343             break;
        B        ??OLED_Key_Par_ZS_65
//  344             
//  345         case MENU_11:
//  346             Circle_Inductor_M3+=5;  
??OLED_Key_Par_ZS_64:
        LDR      R0,??OLED_Key_Par_ZS_29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+5
        LDR      R1,??OLED_Key_Par_ZS_29
        STR      R0,[R1, #+0]
//  347             break;
        B        ??OLED_Key_Par_ZS_65
//  348             
//  349          case MENU_12:
//  350             BB_P_Z+=10;  
??OLED_Key_Par_ZS_63:
        LDR      R0,??OLED_Key_Par_ZS_29+0x4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR      R1,??OLED_Key_Par_ZS_29+0x4
        STR      R0,[R1, #+0]
//  351             break;
        B        ??OLED_Key_Par_ZS_65
//  352 
//  353         default :
//  354             break;
//  355         }
//  356 
//  357         break;
??OLED_Key_Par_ZS_52:
??OLED_Key_Par_ZS_65:
        B        ??OLED_Key_Par_ZS_30
//  358     case 4: /* ------------------------------ 右 */
//  359         KEY_sta = !KEY_sta;//控制状态OLED是否更新
??OLED_Key_Par_ZS_5:
        LDR      R0,??DataTable1_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_66
        MOVS     R0,#+1
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_67
        DATA
??OLED_Key_Par_ZS_23:
        DC32     zs_car
        DC32     speed_set
        DC32     0x40a00000
        DC32     BB_P_W
        DC32     BB_W
        THUMB
??OLED_Key_Par_ZS_66:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//  360         switch (menuSelect)
??OLED_Key_Par_ZS_67:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Key_Par_ZS_68
        BCC      ??OLED_Key_Par_ZS_69
        CMP      R0,#+3
        BEQ      ??OLED_Key_Par_ZS_70
        BCC      ??OLED_Key_Par_ZS_71
        CMP      R0,#+5
        BEQ      ??OLED_Key_Par_ZS_72
        BCC      ??OLED_Key_Par_ZS_73
        CMP      R0,#+7
        BEQ      ??OLED_Key_Par_ZS_74
        BCC      ??OLED_Key_Par_ZS_75
        CMP      R0,#+9
        BEQ      ??OLED_Key_Par_ZS_76
        BCC      ??OLED_Key_Par_ZS_77
        CMP      R0,#+11
        BEQ      ??OLED_Key_Par_ZS_78
        BCC      ??OLED_Key_Par_ZS_79
        CMP      R0,#+13
        BEQ      ??OLED_Key_Par_ZS_80
        BCC      ??OLED_Key_Par_ZS_81
        B        ??OLED_Key_Par_ZS_69
        Nop      
        DATA
??OLED_Key_Par_ZS_25:
        DC32     BB_H
        DC32     Circle_Chazhi
        DC32     Circle_Count6_Max
        THUMB
//  361         {
//  362            case MENU:
//  363             jiemian=2;
??OLED_Key_Par_ZS_68:
        MOVS     R0,#+2
        LDR      R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  364             break; 
        B        ??OLED_Key_Par_ZS_82
//  365         case MENU_1:
//  366             speed_set -= 10;
??OLED_Key_Par_ZS_71:
        LDR      R0,??DataTable2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0xc1200000
        BL       __aeabi_fadd
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
//  367             break;
        B        ??OLED_Key_Par_ZS_82
        DATA
??OLED_Key_Par_ZS_26:
        DC32     Circle_Finish_Count_Max
        DC32     Circle_Inductor_LR1
        THUMB
//  368             
//  369         case MENU_2:
//  370             BB_P_W -= 10;
??OLED_Key_Par_ZS_70:
        LDR      R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable2_2
        STR      R0,[R1, #+0]
//  371             break;
        B        ??OLED_Key_Par_ZS_82
        DATA
??OLED_Key_Par_ZS_27:
        DC32     Circle_Inductor_M1
        THUMB
//  372             
//  373   case MENU_3:
//  374             BB_W-=10;
??OLED_Key_Par_ZS_73:
        LDR      R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  375 //          Chazhi+=10;
//  376             break;
        B        ??OLED_Key_Par_ZS_82
        DATA
??OLED_Key_Par_ZS_28:
        DC32     Circle_Inductor_M2
        THUMB
//  377  ////////////////////////////////////////////////////////////           
//  378         case MENU_4:
//  379             BB_H-=10;
??OLED_Key_Par_ZS_72:
        LDR      R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable2_4
        STR      R0,[R1, #+0]
//  380             break;          
        B        ??OLED_Key_Par_ZS_82
        DATA
??OLED_Key_Par_ZS_29:
        DC32     Circle_Inductor_M3
        DC32     BB_P_Z
        THUMB
//  381             
//  382         case MENU_5:
//  383            Circle_Chazhi-=10;  
??OLED_Key_Par_ZS_75:
        LDR      R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable2_5
        STR      R0,[R1, #+0]
//  384             break;
        B        ??OLED_Key_Par_ZS_82
//  385         
//  386         case MENU_7:
//  387             Circle_Count6_Max-=1000;  
??OLED_Key_Par_ZS_77:
        LDR      R0,??DataTable2_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_7  ;; 0xfffffc18
        ADDS     R0,R0,R1
        LDR      R1,??DataTable2_6
        STR      R0,[R1, #+0]
//  388             break; 
        B        ??OLED_Key_Par_ZS_82
//  389  ////////////////////////////////////////////////////////////////           
//  390         case MENU_6:
//  391             Circle_Finish_Count_Max-=100;  
??OLED_Key_Par_ZS_74:
        LDR      R0,??DataTable2_8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR      R1,??DataTable2_8
        STR      R0,[R1, #+0]
//  392             break;
        B        ??OLED_Key_Par_ZS_82
//  393             
//  394         case MENU_8:
//  395             Circle_Inductor_LR1-=5;  
??OLED_Key_Par_ZS_76:
        LDR      R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??DataTable2_9
        STR      R0,[R1, #+0]
//  396             break;
        B        ??OLED_Key_Par_ZS_82
//  397             
//  398          case MENU_9:
//  399             Circle_Inductor_M1-=5;  
??OLED_Key_Par_ZS_79:
        LDR      R0,??DataTable2_10
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??DataTable2_10
        STR      R0,[R1, #+0]
//  400             break;
        B        ??OLED_Key_Par_ZS_82
//  401 ///////////////////////////////////////////////////////////////////////////                            
//  402          case MENU_10:
//  403             Circle_Inductor_M2-=5;  
??OLED_Key_Par_ZS_78:
        LDR      R0,??DataTable2_11
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??DataTable2_11
        STR      R0,[R1, #+0]
//  404             break;
        B        ??OLED_Key_Par_ZS_82
//  405             
//  406         case MENU_11:
//  407             Circle_Inductor_M3-=5;  
??OLED_Key_Par_ZS_81:
        LDR      R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+5
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
//  408             break;
        B        ??OLED_Key_Par_ZS_82
//  409             
//  410          case MENU_12:
//  411             BB_P_Z-=10;  
??OLED_Key_Par_ZS_80:
        LDR      R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR      R1,??DataTable2_13
        STR      R0,[R1, #+0]
//  412             break;
        B        ??OLED_Key_Par_ZS_82
//  413 
//  414         default :
//  415             break;
//  416         }
//  417 
//  418 
//  419         break;
??OLED_Key_Par_ZS_69:
??OLED_Key_Par_ZS_82:
        B        ??OLED_Key_Par_ZS_30
//  420     case 5: /* ------------------------------ 中 */
//  421         KEY_sta = !KEY_sta;
??OLED_Key_Par_ZS_4:
        LDR      R0,??DataTable1_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_83
        MOVS     R0,#+1
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_84
        DATA
??OLED_Key_Par_ZS_48:
        DC32     0xc0a00000
        THUMB
??OLED_Key_Par_ZS_83:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//  422         KEY_menuChange = !KEY_menuChange;
??OLED_Key_Par_ZS_84:
        LDR      R0,??DataTable2_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??OLED_Key_Par_ZS_85
        MOVS     R0,#+1
        LDR      R1,??DataTable2_14
        STRB     R0,[R1, #+0]
        B        ??OLED_Key_Par_ZS_86
??OLED_Key_Par_ZS_85:
        MOVS     R0,#+0
        LDR      R1,??DataTable2_14
        STRB     R0,[R1, #+0]
//  423         if (++menuSelect > 13)//logo 和 菜单显示只一次
??OLED_Key_Par_ZS_86:
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable1_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable1_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+14
        BLT      ??OLED_Key_Par_ZS_87
//  424         {
//  425             menuSelect = MENU;
        MOVS     R0,#+1
        LDR      R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//  426         }
//  427         break;
??OLED_Key_Par_ZS_87:
        B        ??OLED_Key_Par_ZS_30
//  428 
//  429     default :
//  430         break;
//  431     }
//  432 }
??OLED_Key_Par_ZS_1:
??OLED_Key_Par_ZS_30:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0xfffffe0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     KEY_sta

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     jiemian

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x41200000
//  433  
//  434 /**
//  435   * 简介
//  436   *     绘制 菜单
//  437   * 备注
//  438   *     y
//  439   *         0 --- 空出
//  440   *         1,5
//  441   *              x  0 ~ 127 双横线
//  442   *         1 ~ 7
//  443   *              x  0,67,127 --- 竖线
//  444   *         1,5
//  445   *              x  30,94 --- 参数数字
//  446   *     页分配
//  447   *         0       --- 空出
//  448   *         1,5     --- 菜单数字
//  449   *         2~4,6~7 --- 显示区域
//  450   *     显示区域坐标
//  451   *         菜单     x   y --- x  y
//  452   *           1      1   2    66  4  可显示 11个字符，3行
//  453   *           2      68  2   126  4  可显示 9 个字符,3行
//  454   *           3      1   6   126  7  可显示 21个字符,2行
//  455   *           4      1   6   126  7  可显示 21个字符,2行
//  456   */
//  457 //void OLED_Menu()

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  458 void OLED_Biaoge_ZS()
//  459 {
OLED_Biaoge_ZS:
        PUSH     {R3-R7,LR}
//  460   uint8 i, x, y;
//  461 
//  462   for (i=0; i<10; i++)
        MOVS     R0,#+0
        MOVS     R6,R0
??OLED_Biaoge_ZS_0:
        UXTB     R6,R6
        CMP      R6,#+10
        BLT      .+4
        B        ??OLED_Biaoge_ZS_1
//  463   {
//  464       switch (i)
        UXTB     R6,R6
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??OLED_Biaoge_ZS_2
        CMP      R0,#+1
        BEQ      ??OLED_Biaoge_ZS_3
        CMP      R0,#+2
        BEQ      ??OLED_Biaoge_ZS_4
        CMP      R0,#+3
        BEQ      ??OLED_Biaoge_ZS_5
        CMP      R0,#+4
        BEQ      ??OLED_Biaoge_ZS_6
        CMP      R0,#+5
        BEQ      ??OLED_Biaoge_ZS_7
        CMP      R0,#+6
        BEQ      ??OLED_Biaoge_ZS_8
        CMP      R0,#+9
        BEQ      ??OLED_Biaoge_ZS_9
        B        ??OLED_Biaoge_ZS_10
//  465       {
//  466           //先画横再画竖线，竖线将横线覆盖掉,再画数字覆盖
//  467       case 0://-------------------- 上双横线
//  468           for (x=0; x<128; x++)// 0~127
??OLED_Biaoge_ZS_2:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Biaoge_ZS_11:
        UXTB     R4,R4
        CMP      R4,#+128
        BGE      ??OLED_Biaoge_ZS_12
//  469           {
//  470               OLED_Set_Pos(x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  471               OLED_WrDat(0x81);//双横杠为0x81
        MOVS     R0,#+129
        BL       OLED_WrDat
//  472           }
        ADDS     R4,R4,#+1
        B        ??OLED_Biaoge_ZS_11
//  473           break;
??OLED_Biaoge_ZS_12:
        B        ??OLED_Biaoge_ZS_13
//  474       case 1://-------------------- 下双横线
//  475           for (x=0; x<128; x++)// 0~127
??OLED_Biaoge_ZS_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Biaoge_ZS_14:
        UXTB     R4,R4
        CMP      R4,#+128
        BGE      ??OLED_Biaoge_ZS_15
//  476           {
//  477               OLED_Set_Pos(x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  478               OLED_WrDat(0x01);//单线0x01
        MOVS     R0,#+1
        BL       OLED_WrDat
//  479           }
        ADDS     R4,R4,#+1
        B        ??OLED_Biaoge_ZS_14
//  480           break;
??OLED_Biaoge_ZS_15:
        B        ??OLED_Biaoge_ZS_13
//  481       case 2://-------------------- 左竖线
//  482 //          for (y=1; y<8; y++)// 1~7
//  483 //          {
//  484 //              OLED_Set_Pos(0, y);
//  485 //              OLED_WrDat(0xff);
//  486 //          }
//  487           break;
??OLED_Biaoge_ZS_4:
        B        ??OLED_Biaoge_ZS_13
//  488       case 3://-------------------- 中竖线
//  489           for (y=0; y<4; y++)// 1~5
??OLED_Biaoge_ZS_5:
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_Biaoge_ZS_16:
        UXTB     R5,R5
        CMP      R5,#+4
        BGE      ??OLED_Biaoge_ZS_17
//  490           {
//  491               OLED_Set_Pos(67, y);
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,#+67
        BL       OLED_Set_Pos
//  492               OLED_WrDat(0xff);
        MOVS     R0,#+255
        BL       OLED_WrDat
//  493           }
        ADDS     R5,R5,#+1
        B        ??OLED_Biaoge_ZS_16
//  494           break;
??OLED_Biaoge_ZS_17:
        B        ??OLED_Biaoge_ZS_13
//  495       case 4://-------------------- 右竖线
//  496 //          for (y=1; y<8; y++)// 1~7
//  497 //          {
//  498 //              OLED_Set_Pos(127, y);
//  499 //              OLED_WrDat(0xff);
//  500 //          }
//  501           break;
??OLED_Biaoge_ZS_6:
        B        ??OLED_Biaoge_ZS_13
//  502       case 5://-------------------- 菜单1数字
//  503 //          for (x=0; x<7; x++)
//  504 //          {
//  505 //              OLED_Set_Pos(30+x, 1);//30~36
//  506 //              OLED_WrDat(menuNum[0][x]);
//  507 //          }
//  508           break;
??OLED_Biaoge_ZS_7:
        B        ??OLED_Biaoge_ZS_13
//  509       case 6://-------------------- 菜单2数字
//  510 //          for (x=0; x<7; x++)
//  511 //          {
//  512 //              OLED_Set_Pos(94+x, 1);//94~101
//  513 //              OLED_WrDat(menuNum[1][x]);
//  514 //          }
//  515           break;
??OLED_Biaoge_ZS_8:
        B        ??OLED_Biaoge_ZS_13
//  516 
//  517 
//  518       case 9:/* 各个菜单预先显示,可屏蔽 */
//  519         
//  520          OLED_DisplaytinyStr(1, 2, "PC:");//菜单1内容显示
??OLED_Biaoge_ZS_9:
        ADR      R2,??DataTable2_15  ;; "PC:"
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  521          OLED_DisplaytinyStr(1, 3, "DC:");//菜单2内容显示
        ADR      R2,??DataTable2_16  ;; "DC:"
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  522          OLED_DisplaytinyStr(68, 1, "50*:");//菜单3内容显示
        LDR      R2,??DataTable2_17
        MOVS     R1,#+1
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  523 
//  524          OLED_DisplaytinyStr(68, 2, "25*:");//菜单4内容显示
        LDR      R2,??DataTable2_18
        MOVS     R1,#+2
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  525          
//  526          OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
        MOVS     R3,#+0
        LDR      R0,??DataTable2
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
//  527          
//  528    
//  529        OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3行11列  
        MOVS     R3,#+0
        LDR      R0,??DataTable2_19
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+29
        BL       OLED_DisplayFloat
//  530        OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//4行11列
        MOVS     R3,#+0
        LDR      R0,??DataTable2_20
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+29
        BL       OLED_DisplayFloat
//  531        OLED_DisplayFloat(68+6*3+20, 1,Direction_P2_Change, 0);//3行2表格 
        MOVS     R3,#+0
        MOVS     R7,R3
        LDR      R0,??DataTable2_21
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R7
        MOVS     R1,#+1
        MOVS     R0,#+106
        BL       OLED_DisplayFloat
//  532        OLED_DisplayFloat(68+6*3+20, 2,Angle_P_Change, 0);//3行2表格
        MOVS     R3,#+0
        MOVS     R7,R3
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R7
        MOVS     R1,#+2
        MOVS     R0,#+106
        BL       OLED_DisplayFloat
//  533 
//  534 
//  535             if(zs_car==1)
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Biaoge_ZS_18
//  536   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable3_2
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Biaoge_ZS_19
//  537     else
//  538   OLED_DisplaytinyStr(40, 1, "STOP");
??OLED_Biaoge_ZS_18:
        LDR      R2,??DataTable3_3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  539          
//  540             break;
??OLED_Biaoge_ZS_19:
        B        ??OLED_Biaoge_ZS_13
//  541 
//  542       default :
//  543           break;
//  544       }
//  545   }
??OLED_Biaoge_ZS_10:
??OLED_Biaoge_ZS_13:
        ADDS     R6,R6,#+1
        B        ??OLED_Biaoge_ZS_0
//  546 }
??OLED_Biaoge_ZS_1:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     BB_P_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     Circle_Count6_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0xfffffc18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     Circle_Inductor_M1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     Circle_Inductor_M3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     BB_P_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     KEY_menuChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC8      "PC:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC8      "DC:"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     Direction_P2_Change
//  547 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  548 void OLED_Biaoge_Par_ZS()
//  549 {
OLED_Biaoge_Par_ZS:
        PUSH     {R4-R6,LR}
//  550 
//  551   uint8 i, x, y;
//  552 
//  553   for (i=0; i<10; i++)
        MOVS     R0,#+0
        MOVS     R6,R0
??OLED_Biaoge_Par_ZS_0:
        UXTB     R6,R6
        CMP      R6,#+10
        BLT      .+4
        B        ??OLED_Biaoge_Par_ZS_1
//  554   {
//  555       switch (i)
        UXTB     R6,R6
        MOVS     R0,R6
        CMP      R0,#+0
        BEQ      ??OLED_Biaoge_Par_ZS_2
        CMP      R0,#+1
        BEQ      ??OLED_Biaoge_Par_ZS_3
        CMP      R0,#+2
        BEQ      ??OLED_Biaoge_Par_ZS_4
        CMP      R0,#+3
        BEQ      ??OLED_Biaoge_Par_ZS_5
        CMP      R0,#+4
        BEQ      ??OLED_Biaoge_Par_ZS_6
        CMP      R0,#+9
        BEQ      ??OLED_Biaoge_Par_ZS_7
        B        ??OLED_Biaoge_Par_ZS_8
//  556       {
//  557           //先画横再画竖线，竖线将横线覆盖掉,再画数字覆盖
//  558       case 0://-------------------- 上双横线
//  559           for (x=0; x<128; x++)// 0~127
??OLED_Biaoge_Par_ZS_2:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Biaoge_Par_ZS_9:
        UXTB     R4,R4
        CMP      R4,#+128
        BGE      ??OLED_Biaoge_Par_ZS_10
//  560           {
//  561               OLED_Set_Pos(x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  562               OLED_WrDat(0x81);//双横杠为0x81
        MOVS     R0,#+129
        BL       OLED_WrDat
//  563           }
        ADDS     R4,R4,#+1
        B        ??OLED_Biaoge_Par_ZS_9
//  564           break;
??OLED_Biaoge_Par_ZS_10:
        B        ??OLED_Biaoge_Par_ZS_11
//  565       case 1://-------------------- 下双横线
//  566           for (x=0; x<128; x++)// 0~127
??OLED_Biaoge_Par_ZS_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Biaoge_Par_ZS_12:
        UXTB     R4,R4
        CMP      R4,#+128
        BGE      ??OLED_Biaoge_Par_ZS_13
//  567           {
//  568               OLED_Set_Pos(x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  569               OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  570           }
        ADDS     R4,R4,#+1
        B        ??OLED_Biaoge_Par_ZS_12
//  571           break;
??OLED_Biaoge_Par_ZS_13:
        B        ??OLED_Biaoge_Par_ZS_11
//  572       case 2://-------------------- 左竖线
//  573 //          for (y=1; y<8; y++)// 1~7
//  574 //          {
//  575 //              OLED_Set_Pos(0, y);
//  576 //              OLED_WrDat(0xff);
//  577 //          }
//  578           break;
??OLED_Biaoge_Par_ZS_4:
        B        ??OLED_Biaoge_Par_ZS_11
//  579       case 3://-------------------- 中竖线
//  580           for (y=1; y<10; y++)// 1~5
??OLED_Biaoge_Par_ZS_5:
        MOVS     R0,#+1
        MOVS     R5,R0
??OLED_Biaoge_Par_ZS_14:
        UXTB     R5,R5
        CMP      R5,#+10
        BGE      ??OLED_Biaoge_Par_ZS_15
//  581           {
//  582               OLED_Set_Pos(67, y);
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,#+67
        BL       OLED_Set_Pos
//  583               OLED_WrDat(0xff);
        MOVS     R0,#+255
        BL       OLED_WrDat
//  584           }
        ADDS     R5,R5,#+1
        B        ??OLED_Biaoge_Par_ZS_14
//  585           break;
??OLED_Biaoge_Par_ZS_15:
        B        ??OLED_Biaoge_Par_ZS_11
//  586       case 4://-------------------- 右竖线
//  587 //          for (y=1; y<8; y++)// 1~7
//  588 //          {
//  589 //              OLED_Set_Pos(127, y);
//  590 //              OLED_WrDat(0xff);
//  591 //          }
//  592           break;
??OLED_Biaoge_Par_ZS_6:
        B        ??OLED_Biaoge_Par_ZS_11
//  593 
//  594      
//  595 
//  596 
//  597 
//  598       case 9:/* 各个菜单预先显示,可屏蔽 */
//  599         
//  600             OLED_DisplaytinyStr(1, 2, "BBPW:");//菜单1内容显示
??OLED_Biaoge_Par_ZS_7:
        LDR      R2,??DataTable3_4
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  601          OLED_DisplaytinyStr(1, 3, "BB_W:");//菜单2内容显示
        LDR      R2,??DataTable3_5
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  602          
//  603          OLED_DisplaytinyStr(68, 1, "BB_H:");//菜单3内容显示
        LDR      R2,??DataTable3_6
        MOVS     R1,#+1
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  604          OLED_DisplaytinyStr(68, 2, "O_Cha:");//菜单4内容显示
        LDR      R2,??DataTable3_7
        MOVS     R1,#+2
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  605          OLED_DisplaytinyStr(68, 3, "O_D_ms:");//菜单5内容显示    
        LDR      R2,??DataTable3_8
        MOVS     R1,#+3
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  606          
//  607          OLED_DisplaytinyStr(1, 5, "O_J_ms:");//菜单5内容显示
        LDR      R2,??DataTable3_9
        MOVS     R1,#+5
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  608          OLED_DisplaytinyStr(1, 6, "O_LR:");//菜单5内容显示
        LDR      R2,??DataTable3_10
        MOVS     R1,#+6
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  609          OLED_DisplaytinyStr(1, 7, "O_M1:");//菜单5内容显示
        LDR      R2,??DataTable3_11
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       OLED_DisplaytinyStr
//  610          
//  611          OLED_DisplaytinyStr(68, 5, "O_M2:");//菜单5内容显示
        LDR      R2,??DataTable3_12
        MOVS     R1,#+5
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  612          OLED_DisplaytinyStr(68, 6, "O_M3:");//菜单5内容显示
        LDR      R2,??DataTable3_13
        MOVS     R1,#+6
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  613          OLED_DisplaytinyStr(68, 7, "BBPZ:");//菜单5内容显示
        LDR      R2,??DataTable3_14
        MOVS     R1,#+7
        MOVS     R0,#+68
        BL       OLED_DisplaytinyStr
//  614          
//  615          
//  616          
//  617 //         
//  618          OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
        MOVS     R3,#+0
        LDR      R0,??DataTable3_15
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
//  619    OLED_Int16(40, 2, BB_P_W);
        LDR      R0,??DataTable3_16
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+40
        BL       OLED_Int16
//  620    OLED_Int16(40, 3, BB_W);
        LDR      R0,??DataTable3_17
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+40
        BL       OLED_Int16
//  621    
//  622    OLED_Int16(110, 1, BB_H);
        LDR      R0,??DataTable3_18
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+1
        MOVS     R0,#+110
        BL       OLED_Int16
//  623    OLED_Int16(110, 2, Circle_Chazhi);
        LDR      R0,??DataTable3_19
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+110
        BL       OLED_Int16
//  624    OLED_Int16(110, 3, Circle_Finish_Count_Max);
        LDR      R0,??DataTable3_20
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+110
        BL       OLED_Int16
//  625    
//  626    OLED_Int16(40, 5,Circle_Count6_Max );
        LDR      R0,??DataTable3_21
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+40
        BL       OLED_Int16
//  627    OLED_Int16(40, 6, Circle_Inductor_LR1);  
        LDR      R0,??DataTable3_22
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+40
        BL       OLED_Int16
//  628    OLED_Int16(40, 7, Circle_Inductor_M1);
        LDR      R0,??DataTable3_23
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+40
        BL       OLED_Int16
//  629    
//  630    OLED_Int16(110, 5, Circle_Inductor_M2);
        LDR      R0,??DataTable4
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+110
        BL       OLED_Int16
//  631    OLED_Int16(110, 6, Circle_Inductor_M3);
        LDR      R0,??DataTable4_1
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+110
        BL       OLED_Int16
//  632    OLED_Int16(110, 7, BB_P_Z);
        LDR      R0,??DataTable4_2
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+110
        BL       OLED_Int16
//  633 
//  634           if(zs_car==1)
        LDR      R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Biaoge_Par_ZS_16
//  635   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable3_2
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Biaoge_Par_ZS_17
//  636     else
//  637   OLED_DisplaytinyStr(40, 1, "STOP");
??OLED_Biaoge_Par_ZS_16:
        LDR      R2,??DataTable4_3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  638           break;
??OLED_Biaoge_Par_ZS_17:
        B        ??OLED_Biaoge_Par_ZS_11
//  639      
//  640 
//  641       default :
//  642           break;
//  643       }
//  644   }
??OLED_Biaoge_Par_ZS_8:
??OLED_Biaoge_Par_ZS_11:
        ADDS     R6,R6,#+1
        B        ??OLED_Biaoge_Par_ZS_0
//  645 }
??OLED_Biaoge_Par_ZS_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     Angle_P_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     BB_P_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     Circle_Count6_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     Circle_Inductor_M1
//  646 
//  647 /**
//  648   * 简介
//  649   *     菜单闪烁
//  650   * 备注
//  651   *     当菜单被选中时 闪烁
//  652   */
//  653 //void OLED_MenuFlicker()

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  654 void OLED_Select_ZS()//三角形
//  655 {
OLED_Select_ZS:
        PUSH     {R4,LR}
//  656   uint8 x,y;
//  657 
//  658     switch (menuSelect)
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Select_ZS_0
        BCS      .+4
        B        ??OLED_Select_ZS_1
        CMP      R0,#+3
        BEQ      ??OLED_Select_ZS_2
        BCC      ??OLED_Select_ZS_3
        CMP      R0,#+5
        BNE      .+4
        B        ??OLED_Select_ZS_4
        BCC      ??OLED_Select_ZS_5
        CMP      R0,#+7
        BNE      .+4
        B        ??OLED_Select_ZS_6
        BCS      .+4
        B        ??OLED_Select_ZS_7
        CMP      R0,#+8
        BNE      .+4
        B        ??OLED_Select_ZS_8
        B        ??OLED_Select_ZS_1
//  659     {  
//  660     case MENU://--------------------------- 显示 菜单 38.5ms
//  661       OLED_DisplaytinyStr(78, 4, "NO ");
??OLED_Select_ZS_0:
        ADR      R2,??DataTable4_5  ;; "NO "
        MOVS     R1,#+4
        MOVS     R0,#+78
        BL       OLED_DisplaytinyStr
//  662 
//  663     if(zs_car==1)
        LDR      R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Select_ZS_9
//  664   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable4_7
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Select_ZS_10
//  665     else
//  666   OLED_DisplaytinyStr(40, 1, "STOP");
??OLED_Select_ZS_9:
        LDR      R2,??DataTable4_3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  667   
//  668       for (x=0; x<4; x++)//84~87 消 2
??OLED_Select_ZS_10:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_11:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_12
//  669         {
//  670             OLED_Set_Pos(124+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  671             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  672         }      break;
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_11
??OLED_Select_ZS_12:
        B        ??OLED_Select_ZS_13
//  673     case MENU_1://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  674         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_ZS_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_14:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_15
//  675         {
//  676             OLED_Set_Pos(5+x, 0);//第一行20列的三角形
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  677             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  678         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_14
//  679 //        for (x=0; x<4; x++)//84~87 消 4
//  680 //        {
//  681 //            OLED_Set_Pos(124+x, 5);//消灭第五行99列三角形
//  682 //            OLED_WrDat(0x81);
//  683 //        }
//  684         break;
??OLED_Select_ZS_15:
        B        ??OLED_Select_ZS_13
//  685         
//  686     case MENU_2://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  687         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_ZS_2:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_16:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_17
//  688         {
//  689             OLED_Set_Pos(40+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  690             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  691         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_16
//  692         for (x=0; x<4; x++)//84~87 消 4
??OLED_Select_ZS_17:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_18:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_19
//  693         {
//  694             OLED_Set_Pos(5+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  695             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  696         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_18
//  697         break;
??OLED_Select_ZS_19:
        B        ??OLED_Select_ZS_13
//  698         
//  699     case MENU_3://--------------------------- 选择 菜单2
//  700         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_5:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_20:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_21
//  701         {
//  702             OLED_Set_Pos(60+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  703             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  704         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_20
//  705         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_ZS_21:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_22:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_23
//  706         {
//  707             OLED_Set_Pos(40+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  708             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  709         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_22
//  710         break;
??OLED_Select_ZS_23:
        B        ??OLED_Select_ZS_13
//  711  
//  712         case MENU_4://--------------------------- 选择 菜单2
//  713         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_4:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_24:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_25
//  714         {
//  715             OLED_Set_Pos(84+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  716             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  717         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_24
//  718         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_ZS_25:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_26:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_27
//  719         {
//  720             OLED_Set_Pos(60+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  721             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  722         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_26
//  723         break;
??OLED_Select_ZS_27:
        B        ??OLED_Select_ZS_13
//  724         
//  725         
//  726         case MENU_5://--------------------------- 选择 菜单2
//  727         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_7:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_28:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_29
//  728         {
//  729             OLED_Set_Pos(104+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  730             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  731         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_28
//  732         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_ZS_29:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_30:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_31
//  733         {
//  734             OLED_Set_Pos(84+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  735             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  736         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_30
//  737         break;
??OLED_Select_ZS_31:
        B        ??OLED_Select_ZS_13
//  738         
//  739         case MENU_6://--------------------------- 选择 菜单2
//  740         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_ZS_6:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_32:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_33
//  741         {
//  742             OLED_Set_Pos(124+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  743             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable4_8
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  744         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_32
//  745         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_ZS_33:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_34:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_35
//  746         {
//  747             OLED_Set_Pos(104+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  748             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  749         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_34
//  750         break;
??OLED_Select_ZS_35:
        B        ??OLED_Select_ZS_13
//  751         
//  752         case MENU_7:
//  753   OLED_DisplaytinyStr(80, 4, "CC ");
??OLED_Select_ZS_8:
        ADR      R2,??DataTable4_9  ;; "CC "
        MOVS     R1,#+4
        MOVS     R0,#+80
        BL       OLED_DisplaytinyStr
//  754    for (x=0; x<4; x++)//20~23 消 1
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_ZS_36:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_ZS_37
//  755         {
//  756             OLED_Set_Pos(124+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  757             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  758         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_ZS_36
//  759    
//  760         break;
??OLED_Select_ZS_37:
        B        ??OLED_Select_ZS_13
//  761         
//  762     default :
//  763         break;
//  764     }
//  765 }
??OLED_Select_ZS_1:
??OLED_Select_ZS_13:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     Circle_Inductor_M3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     BB_P_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC8      "NO "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     menuNum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC8      "CC "
//  766 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  767 void OLED_Select_Par_ZS()
//  768 {
OLED_Select_Par_ZS:
        PUSH     {R4,LR}
//  769   uint8 x, y;
//  770 
//  771     switch (menuSelect)
        LDR      R0,??OLED_Select_Par_ZS_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??OLED_Select_Par_ZS_1
        BCS      .+4
        B        ??OLED_Select_Par_ZS_2
        CMP      R0,#+3
        BEQ      ??OLED_Select_Par_ZS_3
        BCC      ??OLED_Select_Par_ZS_4
        CMP      R0,#+5
        BNE      .+4
        B        ??OLED_Select_Par_ZS_5
        BCS      .+4
        B        ??OLED_Select_Par_ZS_6
        CMP      R0,#+7
        BNE      .+4
        B        ??OLED_Select_Par_ZS_7
        BCS      .+4
        B        ??OLED_Select_Par_ZS_8
        CMP      R0,#+9
        BNE      .+4
        B        ??OLED_Select_Par_ZS_9
        BCS      .+4
        B        ??OLED_Select_Par_ZS_10
        CMP      R0,#+11
        BNE      .+4
        B        ??OLED_Select_Par_ZS_11
        BCS      .+4
        B        ??OLED_Select_Par_ZS_12
        CMP      R0,#+13
        BNE      .+4
        B        ??OLED_Select_Par_ZS_13
        BCS      .+4
        B        ??OLED_Select_Par_ZS_14
        B        ??OLED_Select_Par_ZS_2
//  772     {
//  773     case MENU://--------------------------- 显示 菜单 38.5ms
//  774         if(zs_car==1)
??OLED_Select_Par_ZS_1:
        LDR      R0,??OLED_Select_Par_ZS_0+0x4
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??OLED_Select_Par_ZS_15
//  775         OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??OLED_Select_Par_ZS_0+0x8
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??OLED_Select_Par_ZS_16
//  776         else
//  777         OLED_DisplaytinyStr(40, 1, "STOP");      
??OLED_Select_Par_ZS_15:
        LDR      R2,??OLED_Select_Par_ZS_17
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  778       
//  779         
//  780     for (x=0; x<4; x++)//84~87 消 3
??OLED_Select_Par_ZS_16:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_18:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_19
//  781         {
//  782             OLED_Set_Pos(124+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  783             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  784         } 
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_18
        Nop      
        DATA
??OLED_Select_Par_ZS_0:
        DC32     menuSelect
        DC32     zs_car
        DC32     ?_4
        THUMB
//  785   
//  786     break;
??OLED_Select_Par_ZS_19:
        B        ??OLED_Select_Par_ZS_20
//  787     case MENU_1://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  788         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_Par_ZS_4:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_21:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_22
//  789         {
//  790             OLED_Set_Pos(5+x, 0);//第一行20列的三角形
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  791             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  792         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_21
//  793     for (x=0; x<4; x++)//84~87 消 3
??OLED_Select_Par_ZS_22:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_23:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_24
//  794         {
//  795             OLED_Set_Pos(124+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  796             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  797         } 
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_23
//  798         break;
??OLED_Select_Par_ZS_24:
        B        ??OLED_Select_Par_ZS_20
//  799         
//  800     case MENU_2://--------------------------- 选择 菜单1 - 消掉菜单4 51us
//  801         for (x=0; x<4; x++)//20~23 选 1
??OLED_Select_Par_ZS_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_25:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_26
//  802         {
//  803             OLED_Set_Pos(40+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  804             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  805         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_25
//  806         for (x=0; x<4; x++)//84~87 消 4
??OLED_Select_Par_ZS_26:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_27:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_28
//  807         {
//  808             OLED_Set_Pos(5+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  809             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  810         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_27
//  811         break;
??OLED_Select_Par_ZS_28:
        B        ??OLED_Select_Par_ZS_20
//  812         
//  813     case MENU_3://--------------------------- 选择 菜单2
//  814         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_Par_ZS_6:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_29:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_30
//  815         {
//  816             OLED_Set_Pos(60+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  817             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  818         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_29
//  819         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_Par_ZS_30:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_31:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_32
//  820         {
//  821             OLED_Set_Pos(40+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  822             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  823         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_31
//  824         break;
??OLED_Select_Par_ZS_32:
        B        ??OLED_Select_Par_ZS_20
//  825  
//  826         case MENU_4://--------------------------- 选择 菜单2
//  827         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_Par_ZS_5:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_33:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_34
//  828         {
//  829             OLED_Set_Pos(84+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  830             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  831         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_33
//  832         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_Par_ZS_34:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_35:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_36
//  833         {
//  834             OLED_Set_Pos(60+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  835             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  836         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_35
//  837         break;
??OLED_Select_Par_ZS_36:
        B        ??OLED_Select_Par_ZS_20
//  838         
//  839         
//  840         case MENU_5://--------------------------- 选择 菜单2
//  841         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_Par_ZS_8:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_37:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_38
//  842         {
//  843             OLED_Set_Pos(104+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  844             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  845         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_37
//  846         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_Par_ZS_38:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_39:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_40
//  847         {
//  848             OLED_Set_Pos(84+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  849             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  850         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_39
//  851         break;
??OLED_Select_Par_ZS_40:
        B        ??OLED_Select_Par_ZS_20
//  852         
//  853         case MENU_6://--------------------------- 选择 菜单2
//  854         for (x=0; x<4; x++)//84~87 选 2
??OLED_Select_Par_ZS_7:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_41:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_42
//  855         {
//  856             OLED_Set_Pos(124+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  857             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  858         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_41
//  859         for (x=0; x<4; x++)//20~23 消 1
??OLED_Select_Par_ZS_42:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_43:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_44
//  860         {
//  861             OLED_Set_Pos(104+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  862             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  863         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_43
//  864         break;
??OLED_Select_Par_ZS_44:
        B        ??OLED_Select_Par_ZS_20
//  865         
//  866     case MENU_7://--------------------------- 选择 菜单3
//  867         for (x=0; x<4; x++)//20~23 选 3
??OLED_Select_Par_ZS_10:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_45:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_46
//  868         {
//  869             OLED_Set_Pos(5+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  870             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  871         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_45
//  872         for (x=0; x<4; x++)//84~87 消 2
??OLED_Select_Par_ZS_46:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_47:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_48
//  873         {
//  874             OLED_Set_Pos(124+x, 0);
        MOVS     R1,#+0
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  875             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  876         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_47
//  877         break;
??OLED_Select_Par_ZS_48:
        B        ??OLED_Select_Par_ZS_20
//  878         
//  879    case MENU_8://--------------------------- 选择 菜单3
//  880         for (x=0; x<4; x++)//20~23 选 3
??OLED_Select_Par_ZS_9:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_49:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_50
//  881         {
//  882             OLED_Set_Pos(40+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  883             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  884         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_49
//  885         for (x=0; x<4; x++)//84~87 消 2
??OLED_Select_Par_ZS_50:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_51:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_52
//  886         {
//  887             OLED_Set_Pos(5+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+5
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  888             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  889         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_51
//  890         break;
??OLED_Select_Par_ZS_52:
        B        ??OLED_Select_Par_ZS_20
//  891         
//  892           case MENU_9://--------------------------- 选择 菜单3
//  893         for (x=0; x<4; x++)//20~23 选 3
??OLED_Select_Par_ZS_12:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_53:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_54
//  894         {
//  895             OLED_Set_Pos(60+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  896             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  897         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_53
//  898         for (x=0; x<4; x++)//84~87 消 2
??OLED_Select_Par_ZS_54:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_55:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_56
//  899         {
//  900             OLED_Set_Pos(40+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+40
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  901             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  902         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_55
//  903         break;
??OLED_Select_Par_ZS_56:
        B        ??OLED_Select_Par_ZS_20
//  904         
//  905         
//  906         
//  907     case MENU_10://--------------------------- 选择 菜单4第四表格
//  908                 for (x=0; x<4; x++)//84~87 选4
??OLED_Select_Par_ZS_11:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_57:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_58
//  909         {
//  910             OLED_Set_Pos(84+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  911             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  912         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_57
//  913         for (x=0; x<4; x++)//84~87 消 3
??OLED_Select_Par_ZS_58:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_59:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_60
//  914         {
//  915             OLED_Set_Pos(60+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+60
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  916             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  917         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_59
//  918         break;
??OLED_Select_Par_ZS_60:
        B        ??OLED_Select_Par_ZS_20
//  919         
//  920          case MENU_11://--------------------------- 选择 菜单4第四表格
//  921                 for (x=0; x<4; x++)//84~87 选4
??OLED_Select_Par_ZS_14:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_61:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_62
//  922         {
//  923             OLED_Set_Pos(104+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  924             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??OLED_Select_Par_ZS_17+0x4
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  925         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_61
        DATA
??OLED_Select_Par_ZS_17:
        DC32     ?_5
        DC32     menuNum
        THUMB
//  926         for (x=0; x<4; x++)//84~87 消 3
??OLED_Select_Par_ZS_62:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_63:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_64
//  927         {
//  928             OLED_Set_Pos(84+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+84
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  929             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  930         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_63
//  931         break;
??OLED_Select_Par_ZS_64:
        B        ??OLED_Select_Par_ZS_20
//  932         
//  933          case MENU_12://--------------------------- 选择 菜单4第四表格
//  934                 for (x=0; x<4; x++)//84~87 选4
??OLED_Select_Par_ZS_13:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_65:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_66
//  935         {
//  936             OLED_Set_Pos(124+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+124
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  937             OLED_WrDat(menuNum[4][x]);
        LDR      R0,??DataTable9
        UXTB     R4,R4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+28]
        BL       OLED_WrDat
//  938         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_65
//  939         for (x=0; x<4; x++)//84~87 消 3
??OLED_Select_Par_ZS_66:
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Select_Par_ZS_67:
        UXTB     R4,R4
        CMP      R4,#+4
        BGE      ??OLED_Select_Par_ZS_68
//  940         {
//  941             OLED_Set_Pos(104+x, 4);
        MOVS     R1,#+4
        MOVS     R0,R4
        ADDS     R0,R0,#+104
        UXTB     R0,R0
        BL       OLED_Set_Pos
//  942             OLED_WrDat(0x81);
        MOVS     R0,#+129
        BL       OLED_WrDat
//  943         }
        ADDS     R4,R4,#+1
        B        ??OLED_Select_Par_ZS_67
//  944         break;
??OLED_Select_Par_ZS_68:
        B        ??OLED_Select_Par_ZS_20
//  945         
//  946     
//  947     default :
//  948         break;
//  949     }
//  950 }
??OLED_Select_Par_ZS_2:
??OLED_Select_Par_ZS_20:
        POP      {R4,PC}          ;; return
//  951 
//  952 
//  953 /**
//  954   * 简介
//  955   *     多级菜单 显示
//  956   
//  957 * 注意
//  958   *     坐标不要随便改 预先显示内容在OLED_Menu中修改,默认前4个字符用于显示标志
//  959   *     显示区域坐标
//  960   *         菜单     x   y --- x  y
//  961   *           1      1   2    66  4  可显示 11个字符，3行
//  962   *           2      68  2   126  4  可显示 9 个字符,3行
//  963   *           3      1   6   126  7  可显示 21个字符,2行
//  964   *           4      1   6   126  7  可显示 21个字符,2行
//  965   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  966 void Oled_Data_ZS(void)
//  967 {
Oled_Data_ZS:
        PUSH     {R4,LR}
//  968     switch (menuSelect) 
        LDR      R0,??DataTable8
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
        CMP      R0,#+6
        BEQ      ??Oled_Data_ZS_6
        B        ??Oled_Data_ZS_1
//  969     {
//  970     case MENU:
//  971           if(zs_car==1)
??Oled_Data_ZS_0:
        LDR      R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Oled_Data_ZS_7
//  972   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable8_2
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??Oled_Data_ZS_8
//  973           else
//  974   OLED_DisplaytinyStr(40, 1, "STOP");
??Oled_Data_ZS_7:
        LDR      R2,??DataTable8_3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
//  975  
//  976   break;
??Oled_Data_ZS_8:
        B        ??Oled_Data_ZS_9
//  977     
//  978     case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
//  979 OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
??Oled_Data_ZS_3:
        MOVS     R3,#+0
        LDR      R0,??DataTable8_4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
//  980    break;
        B        ??Oled_Data_ZS_9
//  981    
//  982    case MENU_2:
//  983 OLED_DisplayFloat(1+6*3+10, 2,Direction_P2, 0);//3行11列
??Oled_Data_ZS_2:
        MOVS     R3,#+0
        LDR      R0,??DataTable8_5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+29
        BL       OLED_DisplayFloat
//  984    break;  
        B        ??Oled_Data_ZS_9
//  985    
//  986     case MENU_3:
//  987 OLED_DisplayFloat(1+6*3+10, 3,Direction_D2, 0);//3行11列
??Oled_Data_ZS_5:
        MOVS     R3,#+0
        LDR      R0,??DataTable8_6
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+29
        BL       OLED_DisplayFloat
//  988    break;
        B        ??Oled_Data_ZS_9
//  989    
//  990 
//  991    
//  992    case MENU_4:
//  993 OLED_DisplayFloat(68+6*3+20, 2,Direction_P2_Change, 0);//3行2表格 
??Oled_Data_ZS_4:
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR      R0,??DataTable8_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+2
        MOVS     R0,#+106
        BL       OLED_DisplayFloat
//  994    break;
        B        ??Oled_Data_ZS_9
//  995  
//  996     case MENU_5:
//  997 OLED_DisplayFloat(68+6*3+20, 3,Angle_P_Change, 0);//3行2表格
??Oled_Data_ZS_6:
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+3
        MOVS     R0,#+106
        BL       OLED_DisplayFloat
//  998     break;
        B        ??Oled_Data_ZS_9
//  999 
// 1000 
// 1001     
// 1002     default :
// 1003         break;
// 1004     }
// 1005 }
??Oled_Data_ZS_1:
??Oled_Data_ZS_9:
        POP      {R4,PC}          ;; return
// 1006 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1007 void Oled_Data_Par_ZS(void)
// 1008 {
Oled_Data_Par_ZS:
        PUSH     {R7,LR}
// 1009     switch (menuSelect) 
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ      ??Oled_Data_Par_ZS_0
        BCS      .+4
        B        ??Oled_Data_Par_ZS_1
        CMP      R0,#+3
        BEQ      ??Oled_Data_Par_ZS_2
        BCC      ??Oled_Data_Par_ZS_3
        CMP      R0,#+5
        BEQ      ??Oled_Data_Par_ZS_4
        BCC      ??Oled_Data_Par_ZS_5
        CMP      R0,#+7
        BEQ      ??Oled_Data_Par_ZS_6
        BCC      ??Oled_Data_Par_ZS_7
        CMP      R0,#+9
        BEQ      ??Oled_Data_Par_ZS_8
        BCC      ??Oled_Data_Par_ZS_9
        CMP      R0,#+11
        BEQ      ??Oled_Data_Par_ZS_10
        BCC      ??Oled_Data_Par_ZS_11
        CMP      R0,#+13
        BEQ      ??Oled_Data_Par_ZS_12
        BCC      ??Oled_Data_Par_ZS_13
        B        ??Oled_Data_Par_ZS_1
// 1010     {
// 1011     case MENU:
// 1012           if(zs_car==1)
??Oled_Data_Par_ZS_0:
        LDR      R0,??DataTable8_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??Oled_Data_Par_ZS_14
// 1013   OLED_DisplaytinyStr(40, 1, "RUN ");
        LDR      R2,??DataTable8_2
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
        B        ??Oled_Data_Par_ZS_15
// 1014           else
// 1015   OLED_DisplaytinyStr(40, 1, "STOP");
??Oled_Data_Par_ZS_14:
        LDR      R2,??DataTable8_3
        MOVS     R1,#+1
        MOVS     R0,#+40
        BL       OLED_DisplaytinyStr
// 1016  
// 1017   break;
??Oled_Data_Par_ZS_15:
        B        ??Oled_Data_Par_ZS_16
// 1018     
// 1019     case MENU_1://可显示区域开始坐标 + 预先显示每个字符宽度*预先显示的字符个数 + 一个空白点
// 1020 OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
??Oled_Data_Par_ZS_3:
        MOVS     R3,#+0
        LDR      R0,??DataTable8_4
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
// 1021    break;
        B        ??Oled_Data_Par_ZS_16
// 1022    
// 1023    case MENU_2:
// 1024    OLED_Int16(40, 2, BB_P_W);
??Oled_Data_Par_ZS_2:
        LDR      R0,??DataTable9_1
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+40
        BL       OLED_Int16
// 1025    break;
        B        ??Oled_Data_Par_ZS_16
// 1026    
// 1027     case MENU_3:
// 1028    OLED_Int16(40, 3, BB_W);
??Oled_Data_Par_ZS_5:
        LDR      R0,??DataTable9_2
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+40
        BL       OLED_Int16
// 1029    break;
        B        ??Oled_Data_Par_ZS_16
// 1030 /////////////////////////////////////////
// 1031    case MENU_4:
// 1032    OLED_Int16(110, 1, BB_H);
??Oled_Data_Par_ZS_4:
        LDR      R0,??DataTable9_3
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+1
        MOVS     R0,#+110
        BL       OLED_Int16
// 1033    break;
        B        ??Oled_Data_Par_ZS_16
// 1034  
// 1035     case MENU_5:
// 1036    OLED_Int16(110, 2, Circle_Chazhi);
??Oled_Data_Par_ZS_7:
        LDR      R0,??DataTable9_4
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+110
        BL       OLED_Int16
// 1037     break;
        B        ??Oled_Data_Par_ZS_16
// 1038 
// 1039    case MENU_6:
// 1040       OLED_Int16(110, 3, Circle_Finish_Count_Max);
??Oled_Data_Par_ZS_6:
        LDR      R0,??DataTable9_5
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+110
        BL       OLED_Int16
// 1041    
// 1042    break;
        B        ??Oled_Data_Par_ZS_16
// 1043  /////////////////////////////////////////   
// 1044     case MENU_7:
// 1045    OLED_Int16(40, 5,Circle_Count6_Max );
??Oled_Data_Par_ZS_9:
        LDR      R0,??DataTable9_6
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+40
        BL       OLED_Int16
// 1046    break;
        B        ??Oled_Data_Par_ZS_16
// 1047  
// 1048     case MENU_8:
// 1049    OLED_Int16(40, 6, Circle_Inductor_LR1);  
??Oled_Data_Par_ZS_8:
        LDR      R0,??DataTable9_7
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+40
        BL       OLED_Int16
// 1050     break;
        B        ??Oled_Data_Par_ZS_16
// 1051 
// 1052    case MENU_9:
// 1053    OLED_Int16(40, 7, Circle_Inductor_M1);
??Oled_Data_Par_ZS_11:
        LDR      R0,??DataTable9_8
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+40
        BL       OLED_Int16
// 1054    break;
        B        ??Oled_Data_Par_ZS_16
// 1055    
// 1056    
// 1057     case MENU_10:
// 1058    OLED_Int16(110, 5, Circle_Inductor_M2);
??Oled_Data_Par_ZS_10:
        LDR      R0,??DataTable9_9
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+110
        BL       OLED_Int16
// 1059    break;
        B        ??Oled_Data_Par_ZS_16
// 1060  
// 1061     case MENU_11:
// 1062    OLED_Int16(110, 6, Circle_Inductor_M3);
??Oled_Data_Par_ZS_13:
        LDR      R0,??DataTable9_10
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+110
        BL       OLED_Int16
// 1063     break;
        B        ??Oled_Data_Par_ZS_16
// 1064 
// 1065    case MENU_12:
// 1066    OLED_Int16(110, 7, BB_P_Z);
??Oled_Data_Par_ZS_12:
        LDR      R0,??DataTable10_1
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+110
        BL       OLED_Int16
// 1067    break;
        B        ??Oled_Data_Par_ZS_16
// 1068    
// 1069     
// 1070     default :
// 1071         break;
// 1072     }
// 1073 }
??Oled_Data_Par_ZS_1:
??Oled_Data_Par_ZS_16:
        POP      {R0,PC}          ;; return
// 1074 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1075  float speed_set_old=0,//速度设定
speed_set_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1076         Direction_P2_old=0,Direction_D2_old=0,//差值PD                        
Direction_P2_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Direction_D2_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1077       Angle_P_old=0;
Angle_P_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1078  int  Direction_P2_Change_old=0,Angle_P_Change_old=0;
Direction_P2_Change_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_P_Change_old:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1079 void Data_Old(void)
// 1080 {
// 1081      speed_set_old=speed_set;//速度设定 
Data_Old:
        LDR      R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_2
        STR      R0,[R1, #+0]
// 1082 
// 1083       Direction_P2_old=Direction_P2;
        LDR      R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_3
        STR      R0,[R1, #+0]
// 1084       Direction_D2_old=Direction_D2;//差值PD    
        LDR      R0,??DataTable8_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_4
        STR      R0,[R1, #+0]
// 1085       Angle_P_old=Angle_P;
        LDR      R0,??DataTable10_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_6
        STR      R0,[R1, #+0]
// 1086       Direction_P2_Change_old=Direction_P2_Change;
        LDR      R0,??DataTable8_7
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_7
        STR      R0,[R1, #+0]
// 1087       Angle_P_Change_old=Angle_P_Change;
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11
        STR      R0,[R1, #+0]
// 1088    
// 1089 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     menuSelect

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     zs_car

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     Direction_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     Direction_P2_Change

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1090 float     BB_Z_old=0,BB_W_old=0,BB_H_old=0;
BB_Z_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BB_W_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BB_H_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1091 int      BB_P_Z_old=0,BB_P_F_old=0;
BB_P_Z_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
BB_P_F_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1092 int  akmj_z_old=0,akmj_w_old=0;//w20
akmj_z_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
akmj_w_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1093  float     Direction_P_old=0;//阿克曼角P                     
Direction_P_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1094  int    Circle_Count6_Max_old=0,//下次圆环间隔时间1S1000
Circle_Count6_Max_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1095         Circle_Inductor_M1_old=0,//进圆环双线值
Circle_Inductor_M1_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1096          Circle_Inductor_M2_old=0,//测转弯值
Circle_Inductor_M2_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1097          Circle_Inductor_M3_old=0,//转弯值
Circle_Inductor_M3_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1098          Circle_Finish_Count_Max_old=0,
Circle_Finish_Count_Max_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1099          Circle_Chazhi_old=0,
Circle_Chazhi_old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// 1100          Circle_Inductor_LR1_old=0; 
Circle_Inductor_LR1_old:
        DS8 4
// 1101 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1102 void Data_Old2(void)
// 1103 {
Data_Old2:
        PUSH     {R7,LR}
// 1104         akmj_z_old=akmj_z;
        LDR      R0,??DataTable10_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_9
        STR      R0,[R1, #+0]
// 1105   akmj_w_old=akmj_w;//w20
        LDR      R0,??DataTable10_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_11
        STR      R0,[R1, #+0]
// 1106      BB_Z_old=BB_Z;
        LDR      R0,??DataTable10_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable10_13
        STR      R0,[R1, #+0]
// 1107    
// 1108       BB_P_Z_old=BB_P_Z;
        LDR      R0,??DataTable10_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_14
        STR      R0,[R1, #+0]
// 1109       BB_P_F_old=BB_P_F;
        LDR      R0,??DataTable10_15
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_16
        STR      R0,[R1, #+0]
// 1110       
// 1111      Direction_P_old=Direction_P;//阿克曼角P    
        LDR      R0,??DataTable10_17
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_18
        STR      R0,[R1, #+0]
// 1112      BB_W_old=BB_W;
        LDR      R0,??DataTable9_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable10_19
        STR      R0,[R1, #+0]
// 1113      BB_H_old=BB_H;
        LDR      R0,??DataTable9_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR      R1,??DataTable10_20
        STR      R0,[R1, #+0]
// 1114      
// 1115      Circle_Chazhi_old=Circle_Chazhi;    
        LDR      R0,??DataTable9_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_21
        STR      R0,[R1, #+0]
// 1116      Circle_Finish_Count_Max_old=Circle_Finish_Count_Max;//强制打角时间
        LDR      R0,??DataTable9_5
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_22
        STR      R0,[R1, #+0]
// 1117      Circle_Count6_Max_old=Circle_Count6_Max;//下次圆环间隔时间1S1000
        LDR      R0,??DataTable9_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_23
        STR      R0,[R1, #+0]
// 1118      Circle_Inductor_M1_old=Circle_Inductor_M1;//进圆环双线值
        LDR      R0,??DataTable9_8
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_24
        STR      R0,[R1, #+0]
// 1119      Circle_Inductor_M2_old=Circle_Inductor_M2;//测转弯值
        LDR      R0,??DataTable9_9
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_25
        STR      R0,[R1, #+0]
// 1120      Circle_Inductor_M3_old=Circle_Inductor_M3;//转弯值
        LDR      R0,??DataTable9_10
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_26
        STR      R0,[R1, #+0]
// 1121      Circle_Inductor_LR1_old=Circle_Inductor_LR1;      
        LDR      R0,??DataTable9_7
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_1
        STR      R0,[R1, #+0]
// 1122 
// 1123 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     menuNum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     BB_P_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_5:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_6:
        DC32     Circle_Count6_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_7:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_8:
        DC32     Circle_Inductor_M1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_9:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_10:
        DC32     Circle_Inductor_M3
// 1124 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1125 void Oled_Data_ZS_All(void)
// 1126 {
Oled_Data_ZS_All:
        PUSH     {R4,LR}
// 1127         
// 1128 if( speed_set_old!=speed_set) 
        LDR      R0,??DataTable10_2
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All_0
// 1129 OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float 
        MOVS     R3,#+0
        LDR      R0,??DataTable10_27
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
// 1130 
// 1131 
// 1132   if(      Direction_P2_old!=Direction_P2)  
??Oled_Data_ZS_All_0:
        LDR      R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All_1
// 1133 OLED_DisplayFloat(1+6*3+1, 2,Direction_P2, 0);//4行11列
        MOVS     R3,#+0
        LDR      R0,??DataTable10_28
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+20
        BL       OLED_DisplayFloat
// 1134 
// 1135   if(      Direction_D2_old!=Direction_D2)  
??Oled_Data_ZS_All_1:
        LDR      R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All_2
// 1136 OLED_DisplayFloat(68+6*3+1, 3,Direction_D2, 0);
        MOVS     R3,#+0
        LDR      R0,??DataTable11_2
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
// 1137 
// 1138 if(      Angle_P_old!=Angle_P)  
??Oled_Data_ZS_All_2:
        LDR      R0,??DataTable10_6
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All_3
// 1139 OLED_DisplayFloat(68+6*3+1, 1,Angle_P, 0);//3行2表格
        MOVS     R3,#+0
        LDR      R0,??DataTable10_5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
// 1140 
// 1141 
// 1142   if(      Direction_P2_Change_old!=Direction_P2_Change)  
??Oled_Data_ZS_All_3:
        LDR      R0,??DataTable10_7
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All_4
// 1143 OLED_DisplayFloat(68+6*3+1, 2,Direction_P2_Change, 0);//3行2表格
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR      R0,??DataTable11_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+2
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
// 1144 
// 1145   if(      Angle_P_Change_old!=Angle_P_Change)  
??Oled_Data_ZS_All_4:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable10
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All_5
// 1146 OLED_DisplayFloat(68+6*3+1, 3,Angle_P_Change, 0);//3行2表格//
        MOVS     R3,#+0
        MOVS     R4,R3
        LDR      R0,??DataTable10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R2,R0
        MOVS     R3,R4
        MOVS     R1,#+3
        MOVS     R0,#+87
        BL       OLED_DisplayFloat
// 1147     
// 1148     }
??Oled_Data_ZS_All_5:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     Angle_P_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     BB_P_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     speed_set_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     Direction_P2_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     Direction_D2_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     Angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     Angle_P_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     Direction_P2_Change_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     akmj_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     akmj_z_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     akmj_w

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     akmj_w_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     BB_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     BB_Z_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     BB_P_Z_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     BB_P_F

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     BB_P_F_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     Direction_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     Direction_P_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     BB_W_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     BB_H_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     Circle_Chazhi_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     Circle_Finish_Count_Max_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     Circle_Count6_Max_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     Circle_Inductor_M1_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     Circle_Inductor_M2_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     Circle_Inductor_M3_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     Direction_P2
// 1149 
// 1150 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1151 void Oled_Data_ZS_All2(void)
// 1152 {
Oled_Data_ZS_All2:
        PUSH     {R7,LR}
// 1153  
// 1154   
// 1155     if(speed_set_old!=speed_set)
        LDR      R0,??DataTable11_4
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All2_0
// 1156       OLED_DisplayFloat(1, 1,speed_set, 0);//OLED显示 float  
        MOVS     R3,#+0
        LDR      R0,??DataTable11_5
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       OLED_DisplayFloat
// 1157 
// 1158 
// 1159 
// 1160     if(BB_Z_old!=BB_Z)
??Oled_Data_ZS_All2_0:
        LDR      R0,??DataTable11_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable11_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All2_1
// 1161          OLED_Int16(30, 2, BB_Z);
        LDR      R0,??DataTable11_6
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+30
        BL       OLED_Int16
// 1162    
// 1163     if(BB_W_old!=BB_W)
??Oled_Data_ZS_All2_1:
        LDR      R0,??DataTable11_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable11_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All2_2
// 1164          OLED_Int16(30, 3, BB_W);
        LDR      R0,??DataTable11_8
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+30
        BL       OLED_Int16
// 1165 
// 1166       
// 1167     if(BB_H_old!=BB_H)
??Oled_Data_ZS_All2_2:
        LDR      R0,??DataTable11_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        MOVS     R1,R0
        LDR      R0,??DataTable11_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All2_3
// 1168          OLED_Int16(100, 1, BB_H);
        LDR      R0,??DataTable11_10
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+1
        MOVS     R0,#+100
        BL       OLED_Int16
// 1169 
// 1170     if(Circle_Chazhi_old!=Circle_Chazhi)
??Oled_Data_ZS_All2_3:
        LDR      R0,??DataTable11_12
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_13
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_4
// 1171          OLED_Int16(100, 2, Circle_Chazhi);
        LDR      R0,??DataTable11_13
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+2
        MOVS     R0,#+100
        BL       OLED_Int16
// 1172 
// 1173     if(Circle_Finish_Count_Max_old!=Circle_Finish_Count_Max)
??Oled_Data_ZS_All2_4:
        LDR      R0,??DataTable11_14
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_15
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_5
// 1174          OLED_Int16(30, 5, Circle_Count6_Max);
        LDR      R0,??DataTable11_16
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+30
        BL       OLED_Int16
// 1175 
// 1176  
// 1177     if(Circle_Count6_Max_old!=Circle_Count6_Max)
??Oled_Data_ZS_All2_5:
        LDR      R0,??DataTable11_17
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_16
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_6
// 1178          OLED_Int16(100, 3, Circle_Finish_Count_Max);
        LDR      R0,??DataTable11_15
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+3
        MOVS     R0,#+100
        BL       OLED_Int16
// 1179 
// 1180           if(Circle_Inductor_LR1_old!=Circle_Inductor_LR1)
??Oled_Data_ZS_All2_6:
        LDR      R0,??DataTable11_1
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_18
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_7
// 1181                OLED_Int16(30, 6, Circle_Inductor_LR1);  
        LDR      R0,??DataTable11_18
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+30
        BL       OLED_Int16
// 1182 
// 1183     if(Circle_Inductor_M1_old!=Circle_Inductor_M1)
??Oled_Data_ZS_All2_7:
        LDR      R0,??DataTable11_19
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_20
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_8
// 1184          OLED_Int16(30,7 , Circle_Inductor_M1);
        LDR      R0,??DataTable11_20
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+30
        BL       OLED_Int16
// 1185 
// 1186       
// 1187     if(Circle_Inductor_M2_old!=Circle_Inductor_M2)
??Oled_Data_ZS_All2_8:
        LDR      R0,??DataTable11_21
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_22
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_9
// 1188          OLED_Int16(100, 5, Circle_Inductor_M2);
        LDR      R0,??DataTable11_22
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+5
        MOVS     R0,#+100
        BL       OLED_Int16
// 1189 
// 1190     if(Circle_Inductor_M3_old!=Circle_Inductor_M3)    
??Oled_Data_ZS_All2_9:
        LDR      R0,??DataTable11_23
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_24
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??Oled_Data_ZS_All2_10
// 1191          OLED_Int16(100, 6, Circle_Inductor_M3);
        LDR      R0,??DataTable11_24
        LDR      R2,[R0, #+0]
        SXTH     R2,R2
        MOVS     R1,#+6
        MOVS     R0,#+100
        BL       OLED_Int16
// 1192 
// 1193     if(Direction_P_old!=Direction_P)
??Oled_Data_ZS_All2_10:
        LDR      R0,??DataTable11_25
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable11_26
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfcmpeq
        BEQ      ??Oled_Data_ZS_All2_11
// 1194          OLED_Int16(100, 7, Direction_P);
        LDR      R0,??DataTable11_26
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        SXTH     R2,R2
        MOVS     R1,#+7
        MOVS     R0,#+100
        BL       OLED_Int16
// 1195 
// 1196 
// 1197 }
??Oled_Data_ZS_All2_11:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     Angle_P_Change_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     Circle_Inductor_LR1_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     Direction_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     Direction_P2_Change

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     speed_set_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     speed_set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     BB_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     BB_Z_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     BB_W

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     BB_W_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     BB_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     BB_H_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     Circle_Chazhi_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     Circle_Chazhi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     Circle_Finish_Count_Max_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     Circle_Finish_Count_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_16:
        DC32     Circle_Count6_Max

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_17:
        DC32     Circle_Count6_Max_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_18:
        DC32     Circle_Inductor_LR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_19:
        DC32     Circle_Inductor_M1_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_20:
        DC32     Circle_Inductor_M1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_21:
        DC32     Circle_Inductor_M2_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_22:
        DC32     Circle_Inductor_M2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_23:
        DC32     Circle_Inductor_M3_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_24:
        DC32     Circle_Inductor_M3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_25:
        DC32     Direction_P_old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_26:
        DC32     Direction_P

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
        DC8 "PC:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "DC:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "50*:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "25*:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "RUN "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "STOP"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "BBPW:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "BB_W:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "BB_H:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "O_Cha:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "O_D_ms:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "O_J_ms:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "O_LR:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "O_M1:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "O_M2:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "O_M3:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_16:
        DATA
        DC8 "BBPZ:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "NO "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "CC "

        END
// 1198   
// 1199    
// 1200    
// 1201    
// 1202    
// 1203 
// 1204 
// 1205 
// 
//    88 bytes in section .bss
//   136 bytes in section .rodata
// 5 898 bytes in section .text
// 
// 5 898 bytes of CODE  memory
//   136 bytes of CONST memory
//    88 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
