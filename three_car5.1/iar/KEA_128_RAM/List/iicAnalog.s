///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.2.8542/W32 for ARM       29/Apr/2018  11:05:35
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\iicAnalog.c
//    Command line =  
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\iicAnalog.c -D IAR
//        -D TWR_K60N512 -D _DLIB_FILE_DESCRIPTOR -lCN
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
//        H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\iar\KEA_128_RAM\List\iicAnalog.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GpioGet
        EXTERN GpioInit
        EXTERN GpioSet
        EXTERN gpio_ddr

        PUBLIC I2C_SendACK
        PUBLIC IIC_Init
        PUBLIC IIC_IoMux
        PUBLIC IIC_ad_main
        PUBLIC IIC_ad_sub
        PUBLIC IIC_buf
        PUBLIC IIC_delay
        PUBLIC IIC_num
        PUBLIC IIC_readReg
        PUBLIC IIC_start
        PUBLIC IIC_stop
        PUBLIC IIC_writeReg
        PUBLIC read_ch
        PUBLIC send_ch

// H:\智能车程序2018\电磁三轮——ZS\4.27_ZS\device\C\iicAnalog.c
//    1 /**
//    2   ******************************************************************************
//    3   * COPYRIGHT NOTICE
//    4   * Copyright (c) 2018,鍗庡寳绉戞妧瀛﹂櫌
//    5   * All rights reserved.
//    6   *
//    7   * 鏂囦欢鍚嶇О锛�     iicAnalog.c
//    8   * 鏂囦欢鏍囪瘑锛�
//    9   * 鎽�    瑕侊細
//   10   *
//   11   * 褰撳墠鐗堟湰锛�     1.0
//   12   * 璐�    璐ｏ細     闊╁織浼�
//   13   * 鏃�    闂达細     2018骞�1鏈�28鏃� 16:33:14
//   14   ******************************************************************************
//   15   */
//   16 
//   17 #include "iicAnalog.h"
//   18 
//   19 #define SDA             GpioGet (IIC_SDA)
//   20 #define SDA0()          GpioSet (IIC_SDA, 0)		//IO鍙ｈ緭鍑轰綆鐢靛钩
//   21 #define SDA1()          GpioSet (IIC_SDA, 1)		//IO鍙ｈ緭鍑洪珮鐢靛钩
//   22 #define SCL0()          GpioSet (IIC_SCL, 0)		//IO鍙ｈ緭鍑轰綆鐢靛钩
//   23 #define SCL1()          GpioSet (IIC_SCL, 1)		//IO鍙ｈ緭鍑洪珮鐢靛钩
//   24 #define DIR_OUT()       gpio_ddr (IIC_SDA, GPO)    //杈撳嚭鏂瑰悜
//   25 #define DIR_IN()        gpio_ddr (IIC_SDA, GPI)    //杈撳叆鏂瑰悜
//   26 
//   27 
//   28 //鍐呴儴鏁版嵁瀹氫箟

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 uint8 IIC_ad_main; //鍣ㄤ欢浠庡湴鍧�
IIC_ad_main:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   30 uint8 IIC_ad_sub;  //鍣ㄤ欢瀛愬湴鍧�
IIC_ad_sub:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 uint8 *IIC_buf;    //鍙戦�亅鎺ユ敹鏁版嵁缂撳啿鍖�
IIC_buf:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   32 uint8 IIC_num;     //鍙戦�亅鎺ユ敹鏁版嵁涓暟
IIC_num:
        DS8 1
//   33 
//   34 #define ack     1      //涓诲簲绛�
//   35 #define no_ack  0   //浠庡簲绛�
//   36 
//   37 
//   38 /**
//   39   * 绠�浠�
//   40   *     妯℃嫙 IIC 寤舵椂
//   41   * 澶囨敞
//   42   *     濡傛灉IIC閫氫俊澶辫触锛屽皾璇曞鍔� j
//   43   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void IIC_delay(void)
//   45 {
IIC_delay:
        PUSH     {LR}
//   46 	//64涓�100K鐨勯�熺巼(bus棰戠巼涓�100M)
//   47 	//鐗瑰埆鎻愮ずOV7725鐨勯�氫俊閫熺巼涓嶈兘澶珮锛屾渶濂�50K宸﹀彸锛宩璁剧疆涓�120閫氫俊閫熺巼涓�60K锛�60K鐨勬椂鍊欏彲浠ユ甯搁�氫俊
//   48 	//鍏朵粬IIC鍣ㄤ欢涓�鑸彲浠�400K鐨勯�氫俊閫熺巼
//   49 	uint16 j=120;
        MOVS     R0,#+120
//   50 	while(j--);
??IIC_delay_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        UXTH     R1,R1
        CMP      R1,#+0
        BNE      ??IIC_delay_0
//   51 }
        POP      {PC}             ;; return
//   52 
//   53 /**
//   54   * 绠�浠�
//   55   *     IIC 寮�濮嬪嚱鏁�
//   56   * 澶囨敞
//   57   *     鍐呴儴浣跨敤锛屾棤闇�璋冪敤
//   58   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 void IIC_start(void)
//   60 {
IIC_start:
        PUSH     {R7,LR}
//   61 	SDA1();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   62 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   63 	IIC_delay();
        BL       IIC_delay
//   64 	SDA0();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//   65 	IIC_delay();
        BL       IIC_delay
//   66 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   67 }
        POP      {R0,PC}          ;; return
//   68 
//   69 /**
//   70   * 绠�浠�
//   71   *     IIC 鍋滄鍑芥暟
//   72   * 澶囨敞
//   73   *     鍐呴儴浣跨敤锛屾棤闇�璋冪敤
//   74   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   75 void IIC_stop(void)
//   76 {
IIC_stop:
        PUSH     {R7,LR}
//   77 	SDA0();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//   78 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   79 	IIC_delay();
        BL       IIC_delay
//   80 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   81 	IIC_delay();
        BL       IIC_delay
//   82 	SDA1();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   83 	IIC_delay();
        BL       IIC_delay
//   84 }
        POP      {R0,PC}          ;; return
//   85 
//   86 //涓诲簲绛�(鍖呭惈ack:SDA=0鍜宯o_ack:SDA=0)
//   87 //鍐呴儴浣跨敤锛岀敤鎴锋棤闇�璋冪敤

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void I2C_SendACK(unsigned char ack_dat)
//   89 {
I2C_SendACK:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   90     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   91 	IIC_delay();
        BL       IIC_delay
//   92 	if(ack_dat) SDA0();
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??I2C_SendACK_0
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
        B        ??I2C_SendACK_1
//   93     else    	SDA1();
??I2C_SendACK_0:
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//   94 
//   95     SCL1();
??I2C_SendACK_1:
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//   96     IIC_delay();
        BL       IIC_delay
//   97     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//   98     IIC_delay();
        BL       IIC_delay
//   99 }
        POP      {R4,PC}          ;; return
//  100 
//  101 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 static int SCCB_WaitAck(void)
//  103 {
SCCB_WaitAck:
        PUSH     {R7,LR}
//  104     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  105 	DIR_IN();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       gpio_ddr
//  106 	IIC_delay();
        BL       IIC_delay
//  107 
//  108 	SCL1();
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  109     IIC_delay();
        BL       IIC_delay
//  110 
//  111     if(SDA)           //搴旂瓟涓洪珮鐢靛钩锛屽紓甯革紝閫氫俊澶辫触
        MOVS     R0,#+23
        BL       GpioGet
        CMP      R0,#+0
        BEQ      ??SCCB_WaitAck_0
//  112     {
//  113         DIR_OUT();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  114         SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  115         return 0;
        MOVS     R0,#+0
        B        ??SCCB_WaitAck_1
//  116     }
//  117     DIR_OUT();
??SCCB_WaitAck_0:
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  118     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  119 	IIC_delay();
        BL       IIC_delay
//  120     return 1;
        MOVS     R0,#+1
??SCCB_WaitAck_1:
        POP      {R1,PC}          ;; return
//  121 }
//  122 
//  123 /**
//  124   * 绠�浠�
//  125   *     IIC 瀛楄妭鍙戦�佺▼搴�
//  126   * 澶囨敞
//  127   *     鍙戦�乧(鍙互鏄暟鎹篃鍙槸鍦板潃)锛岄�佸畬鍚庢帴鏀朵粠搴旂瓟
//  128   *     涓嶈�冭檻浠庡簲绛斾綅
//  129   *     鍐呴儴浣跨敤锛岀敤鎴锋棤闇�璋冪敤
//  130   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  131 void send_ch(uint8 c)
//  132 {
send_ch:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  133 	uint8 i = 8;
        MOVS     R5,#+8
        B        ??send_ch_0
//  134     while(i--)
//  135     {
//  136         if(c & 0x80)	SDA1();//SDA 杈撳嚭鏁版嵁
//  137         else			SDA0();
??send_ch_1:
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       GpioSet
//  138         c <<= 1;
??send_ch_2:
        LSLS     R4,R4,#+1
//  139         IIC_delay();
        BL       IIC_delay
//  140         SCL1();                //SCL 鎷夐珮锛岄噰闆嗕俊鍙�
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  141         IIC_delay();
        BL       IIC_delay
//  142         SCL0();                //SCL 鏃堕挓绾挎媺浣�
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
??send_ch_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??send_ch_3
        LSLS     R0,R4,#+24
        BPL      ??send_ch_1
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
        B        ??send_ch_2
//  143     }
//  144 	SCCB_WaitAck();
??send_ch_3:
        BL       SCCB_WaitAck
//  145 }
        POP      {R0,R4,R5,PC}    ;; return
//  146 
//  147 /**
//  148   * 绠�浠�
//  149   *     IIC 瀛楄妭鎺ユ敹绋嬪簭
//  150   * 澶囨敞
//  151   *     鎺ユ敹鍣ㄤ欢浼犳潵鐨勬暟鎹紝
//  152   *     姝ょ▼搴忓簲閰嶅悎|涓诲簲绛斿嚱鏁皘IIC_ack_main()浣跨敤
//  153   *     鍐呴儴浣跨敤锛岀敤鎴锋棤闇�璋冪敤
//  154   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  155 uint8 read_ch(void)
//  156 {
read_ch:
        PUSH     {R3-R5,LR}
//  157     uint8 i;
//  158     uint8 c;
//  159     c=0;
        MOVS     R5,#+0
//  160     SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  161     IIC_delay();
        BL       IIC_delay
//  162     SDA1();             //缃暟鎹嚎涓鸿緭鍏ユ柟寮�
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioSet
//  163     DIR_IN();
        MOVS     R1,#+0
        MOVS     R0,#+23
        BL       gpio_ddr
//  164     for(i=0;i<8;i++)
        MOVS     R4,#+0
        B        ??read_ch_0
//  165     {
//  166         IIC_delay();
??read_ch_1:
        BL       IIC_delay
//  167         SCL0();         //缃椂閽熺嚎涓轰綆锛屽噯澶囨帴鏀舵暟鎹綅
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  168         IIC_delay();
        BL       IIC_delay
//  169         SCL1();         //缃椂閽熺嚎涓洪珮锛屼娇鏁版嵁绾夸笂鏁版嵁鏈夋晥
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioSet
//  170         IIC_delay();
        BL       IIC_delay
//  171         c<<=1;
        LSLS     R5,R5,#+1
//  172         if(SDA) c+=1;   //璇绘暟鎹綅锛屽皢鎺ユ敹鐨勬暟鎹瓨c
        MOVS     R0,#+23
        BL       GpioGet
        CMP      R0,#+0
        BEQ      ??read_ch_2
        ADDS     R5,R5,#+1
//  173     }
??read_ch_2:
        ADDS     R4,R4,#+1
??read_ch_0:
        UXTB     R4,R4
        CMP      R4,#+8
        BLT      ??read_ch_1
//  174     DIR_OUT();
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       gpio_ddr
//  175 	SCL0();
        MOVS     R1,#+0
        MOVS     R0,#+27
        BL       GpioSet
//  176 	IIC_delay();
        BL       IIC_delay
//  177 	I2C_SendACK(no_ack);
        MOVS     R0,#+0
        BL       I2C_SendACK
//  178 
//  179     return c;
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return
//  180 }
//  181 
//  182 /**
//  183   * 绠�浠�
//  184   *     妯℃嫙IIC鍐欐暟鎹埌璁惧瀵勫瓨鍣ㄥ嚱鏁�
//  185   * 鍙傛暟
//  186   *     dev_add			璁惧鍦板潃(浣庝竷浣嶅湴鍧�)
//  187   *     reg				瀵勫瓨鍣ㄥ湴鍧�
//  188   *     dat				鍐欏叆鐨勬暟鎹�
//  189   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  190 void IIC_writeReg(uint8 dev_add, uint8 reg, uint8 dat)
//  191 {
IIC_writeReg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  192 	IIC_start();
        BL       IIC_start
//  193     send_ch( (dev_add<<1) | 0x00);   //鍙戦�佸櫒浠跺湴鍧�鍔犲啓浣�
        LSLS     R0,R4,#+1
        UXTB     R0,R0
        BL       send_ch
//  194 	send_ch( reg );   				 //鍙戦�佷粠鏈哄瘎瀛樺櫒鍦板潃
        MOVS     R0,R5
        UXTB     R0,R0
        BL       send_ch
//  195 	send_ch( dat );   				 //鍙戦�侀渶瑕佸啓鍏ョ殑鏁版嵁
        MOVS     R0,R6
        UXTB     R0,R0
        BL       send_ch
//  196 	IIC_stop();
        BL       IIC_stop
//  197 }
        POP      {R4-R6,PC}       ;; return
//  198 
//  199 /**
//  200   * 绠�浠�
//  201   *     妯℃嫙 IIC 浠庤澶囧瘎瀛樺櫒璇诲彇鏁版嵁
//  202   * 鍙傛暟
//  203   *     dev_add			璁惧鍦板潃(浣庝竷浣嶅湴鍧�)
//  204   *     reg				瀵勫瓨鍣ㄥ湴鍧�
//  205   *     type			閫夋嫨閫氫俊鏂瑰紡鏄疘IC  杩樻槸 SCCB
//  206   * 杩斿洖鍊�
//  207   *     dat             杩斿洖瀵勫瓨鍣ㄧ殑鏁版嵁
//  208   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 uint8 IIC_readReg(uint8 dev_add, uint8 reg, IIC_type type)
//  210 {
IIC_readReg:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  211 	uint8 dat;
//  212 	IIC_start();
        BL       IIC_start
//  213     send_ch( (dev_add<<1) | 0x00);  //鍙戦�佸櫒浠跺湴鍧�鍔犲啓浣�
        LSLS     R0,R4,#+1
        UXTB     R0,R0
        BL       send_ch
//  214 	send_ch( reg );   				//鍙戦�佷粠鏈哄瘎瀛樺櫒鍦板潃
        MOVS     R0,R5
        UXTB     R0,R0
        BL       send_ch
//  215 	if(type == SCCB)IIC_stop();
        UXTB     R6,R6
        CMP      R6,#+1
        BNE      ??IIC_readReg_0
        BL       IIC_stop
//  216 
//  217 	IIC_start();
??IIC_readReg_0:
        BL       IIC_start
//  218 	send_ch( (dev_add<<1) | 0x01);  //鍙戦�佸櫒浠跺湴鍧�鍔犺浣�
        LSLS     R1,R4,#+1
        MOVS     R0,#+1
        ORRS     R0,R0,R1
        UXTB     R0,R0
        BL       send_ch
//  219 	dat = read_ch();   				//鍙戦�侀渶瑕佸啓鍏ョ殑鏁版嵁
        BL       read_ch
        MOVS     R4,R0
//  220 	IIC_stop();
        BL       IIC_stop
//  221 
//  222 	return dat;
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return
//  223 }
//  224 
//  225 /**
//  226   * 绠�浠�
//  227   *     IIC 绔彛澶嶇敤
//  228   * 澶囨敞
//  229   *
//  230   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  231 void IIC_IoMux()
//  232 {
//  233     //灏� D3 鍙樹负寮曡剼鍔熻兘
//  234     SIM->PINSEL1 |= SIM_PINSEL1_SPI1PS_MASK;
IIC_IoMux:
        LDR      R0,??DataTable0  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+4        ;; #+2048
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x40048010
        STR      R1,[R0, #+0]
//  235 
//  236     //灏� C7 鍙樹负寮曡剼鍔熻兘
//  237     SIM->PINSEL1 |= SIM_PINSEL1_UART1PS_MASK;;
        LDR      R0,??DataTable0  ;; 0x40048010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        ORRS     R1,R1,R0
        LDR      R0,??DataTable0  ;; 0x40048010
        STR      R1,[R0, #+0]
//  238 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x40048010
//  239 
//  240 /**
//  241   * 绠�浠�
//  242   *     IIC 鍒濆鍖�
//  243   * 澶囨敞
//  244   *
//  245   */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  246 void IIC_Init(void)
//  247 {
IIC_Init:
        PUSH     {R7,LR}
//  248     IIC_IoMux();
        BL       IIC_IoMux
//  249 
//  250 	GpioInit (IIC_SCL, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+27
        BL       GpioInit
//  251 	GpioInit (IIC_SDA, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+23
        BL       GpioInit
//  252 }
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  253 
// 
//   7 bytes in section .bss
// 626 bytes in section .text
// 
// 626 bytes of CODE memory
//   7 bytes of DATA memory
//
//Errors: none
//Warnings: none
