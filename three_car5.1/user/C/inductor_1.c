#include "inductor_1.h"
#include "Variable.h"
#include "common.h"
#include "allHead.h"



//右  中 左   右竖 左竖 gnd
//橙  红 褐    黑   白  黄
//橙  黄 蓝    灰   紫  绿色
//4   2  3    1    5
//              右电感   中电感   左电感   位置     差值
//右电感最大    490,97    250,50  16,1      1        -95
//左电感最大    4,0.1    240,47  509,100    2         99
//过左弯道时     40,7    312,62   287,57    2          50      
//过左弯道时     4，0.1    194,38   287,57    2          50    
                                     //          范围
//AD值：AD_valu[3]为采集到处理后的的AD值          0-260(小车行驶时)
//归一值sensor_to_one[5]为将AD值归一化            0-1
//最终值：AD_inductor[5]为将归一化的值放大100倍    0-100
//丢线：信号很小了，然后就按照找不到信号线来处理
//Position_transit[i]:记录过渡点归一化放大后的值
//Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
//Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值
//差值：差值大小由中电感与电磁线的相对位置决定
//小车在赛道内差值为100以内，出半个赛道200左右，全出赛道300左右






/*************************************************************************
 *  函数名称   Read_ADC
 *  功能说明： AD采集
 *  参数说明：
 *  函数返回： 无
 *  修改时间：
 *  备    注：
*************************************************************************/
void Read_ADC(void)
{
      int16  i,j,k,temp;
      int16  ad_valu1[5],ad_sum[5];

      for(i=0;i<5;i++)
      {

            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //左  通道
            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //中  通道
            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //右  通道
            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //中1 通道
            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //中2 通道
            
//            if(ad_valu[0][i] > 650) ad_valu[0][i]=500;
//            if(ad_valu[1][i] > 650) ad_valu[0][i]=500;
//            if(ad_valu[2][i] > 650) ad_valu[0][i]=500;

      }
   //////////////////////冒泡排序///////////////////////////////////
      for(i=0;i<5;i++)     //5个电感
      {
         for(j=0;j<4;j++)  //五个数据排序
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu[i][k] > ad_valu[i][k+1])  //前面的比后面的大  则进行交换
               {
                  temp = ad_valu[i][k+1];
                  ad_valu[i][k+1] = ad_valu[i][k];
                  ad_valu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<5;i++)    //求中间三项的和
      {
         ad_sum[i] = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
         ad_valu1[i] = ad_sum[i] / 3;
      }
   ////////////////////////滑动平均滤波/////////////////////////////
      for(i = 0;i < NM-1;i ++)  //取中间3位的值到前三位
      {
          AD_V[0][i] = ad_valu[0][i + 1];
          AD_V[1][i] = ad_valu[1][i + 1];
          AD_V[2][i] = ad_valu[2][i + 1];
          AD_V[3][i] = ad_valu[3][i + 1];
          AD_V[4][i] = ad_valu[4][i + 1];
      }
      for(i=0;i<5;i++)   //第三位存储平均值
      {
          AD_V[i][NM-1] =  ad_valu1[i];
      }
         for(i = 0;i < NM;i ++)   //得到原中间三位的值
      {
          AD_sum[0] += AD_V[0][i];
          AD_sum[1] += AD_V[1][i];
          AD_sum[2] += AD_V[2][i];
          AD_sum[3] += AD_V[3][i];
          AD_sum[4] += AD_V[4][i];
      }
      for(i=0;i<5;i++)  //求平均
      {
          AD_valu[i] = AD_sum[i] / NM;
          AD_sum[i] = 0;
      }
}










///*************************************************************************
// *  函数名称   Date_analyse
// *  功能说明： 数据分析
// *  参数说明：
// *  函数返回： 无
// *  修改时间：
// *  备    注：
//*************************************************************************/
//void Date_analyse()
//{
////     char Chazhi_flag = 0;
////     char Chazhi_value[11];
////     int16  a,b;
//     int16  i,max_front=0,max_back;
//     static int16 max_old = 1,max_crosstalk = 1;
//     static int16 position_last = 2;
//     float  sensor_1;
//
//     Read_ADC();
//
//    Inductor_Check();//电感最大最小值校验 
//     /*********************归一化处理********************/
//     for(i=0;i<5;i++)
//     {
//        sensor_to_one[i] = (float)(AD_valu[i] - min_v[i])/(float)(max_v[i]- min_v[i]);
//      if(sensor_to_one[i]<=0.0)  sensor_to_one[i]=0.001;
////        if(sensor_to_one[0]<=0.0)  sensor_to_one[0]=0.001;
////        if(sensor_to_one[0]>1.0)  sensor_to_one[0]=1.0;
////        
////        if(sensor_to_one[2]<=0.0)  sensor_to_one[2]=0.001;
////        if(sensor_to_one[2]>1.0)  sensor_to_one[2]=1.0;
//
//        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]为归一化后的值  范围为0-100
//     }
//       /*******1号电感特殊归一化，用于坡道检测********/
//      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//      Slope_AD_1 = 100 * sensor_1;
//   ////////////////////////////////////////////////////////////////////
//
//       for(i=0;i<3;i++)                 //找出最强的传感器
//       {
//         if(AD_inductor[max_front]<AD_inductor[i])
//           max_front=i;
//       }
//       max_value=AD_inductor[max_front];  //最大电感值
//
//    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //找后排最强电感
// //zs屏蔽      
//       //丢线时最大值取旧值
//       if(max_value < 5)           
//       {
//         max_front=max_old;
//         max_value=AD_inductor[max_front];
//       }
//       else
//         max_old=max_front;
////       //防串道
//       if(abs_inductor(max_front - max_crosstalk) < 2)  
//       {
//            max_crosstalk = max_front;
//       }
//       else
//            max_front = max_crosstalk;
// //张盛屏蔽      
//      // AD_MAX_NUM = max_front;        //传送速度控制
//       
//        /****************位置解算，解算过程的值用归一化放大后的值************************/
////zs1    
//       
////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] > AD_inductor[2])  ))
////       {
////           position=1;         
////       }
////       if((max_front==0&&AD_inductor[1] > 5)||(max_front==1 && (AD_inductor[0] < AD_inductor[2])  ))
////       {
////           position=2;         
////       }
////         
////         
////ZS2       
//        if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
//       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
//             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
// //          AD_0_max = AD_inductor[0];//zs加
//       }
//       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //左侧位置  0-1号传感器之间
//       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
//           //      中电感在电磁线左边                            中电感在电磁线左边
//             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
//             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
//       }
//       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //右侧位置  1-2号传感器之间
//       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
//        //    中电感在电磁线右边                         中电感在电磁线右边          
//             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
//             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
//       }
//       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] ))  //已经偏离3号传感器
//       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
//             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
//        // AD_2_max = AD_inductor[2];//zs加
//
//       }   
//         
//         
////Position_transit[0]:右电感位于电磁线正上方时中电感归一化放大后的值
////Position_transit[1]:左电感位于电磁线正上方时中电感归一化放大后的值中电感的值
////       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //已经偏离0号传感器
////       {//右电感最大且此时的中电感值<=过渡点0时中电感的值
////             position=0;//右电感在电磁线左方，整个小车都在电磁线左方
//// //          AD_0_max = AD_inductor[0];//zs加
////       }
////       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //左侧位置  0-1号传感器之间
////       {//右电感最大且此时中电感的值>过渡点0时中电感的值||中电感最大且右电感的值>左电感的值
////           //      中电感在电磁线左边                            中电感在电磁线左边
////             position=1;//中电感在电磁线左边,小车偏左(半个小车以上部分在电磁线左边但不是全部)
////             AD_0_max = AD_inductor[0]; //记录下此时的0号传感器的归一放大后的值
////       }
////       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //右侧位置  1-2号传感器之间
////       {//中电感最大且左电感的值大于右电感的值||左电感最大且此时中电感的值>过渡点1时中电感的值
////        //    中电感在电磁线右边                         中电感在电磁线右边          
////             position=2;//中电感在电磁线右边,小车偏右(半个小车以上部分在电磁线右边但不是全部)
////             AD_2_max = AD_inductor[2]; //记录下此时的3号传感器归一放大后的值
////       }
////       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //已经偏离3号传感器
////       {//左电感最大且此时的中电感值<=过渡点1时中电感的值
////             position = 3;//左电感在电磁线右方，整个小车都在电磁线右方
////        // AD_2_max = AD_inductor[2];//zs加
////
////       }
//       /*
//       //~~~~~~~~~~~~~~~~~~~~~~~ 后排位置解算~~~~~~~~~~~~~~~~~~~//
//       if(max_back == 3 && AD_inductor[4] <= Position_transit[2] - 1)
//       {
//            if(AD_inductor[4] <= Position_transit[2] - 22)
//               position_back = 0;
//            if(AD_inductor[4] >= Position_transit[2] - 20)
//               position_back = 1;
//       }
//       else  if(max_back == 3 && AD_inductor[4] > Position_transit[2] + 1 || max_back == 4 && AD_inductor[3] > Position_transit[3] + 1)
//       {
//            position_back = 2;
//       }
//       else if(max_back == 4 && AD_inductor[3] <= Position_transit[3] - 1)
//       {
//            if(AD_inductor[3] >= Position_transit[3] - 20)
//               position_back = 3;
//            if(AD_inductor[3] <= Position_transit[3] - 22)
//               position_back = 4;
//       }
//       */
//      /*位置防跳变过大，比如前1ms小车都在电磁线左边，后1ms小车偏右*/  
// //zs屏蔽      
//       if(abs_inductor(position - position_last) > 1)  //位置跳变过大时进入 
//       {
//            position = position_last;//此刻小车位置转变为上一次小车位置
//       }
//       else
//       {
//       position_last = position;//正常记录，接下来的上次小车位置=此刻小车位置
//       }   
////zs屏蔽
////////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
///*用于小车直道太偏或过弯道时小车转弯幅度小不给力，小车不能好好的给过弯道，此时强制*/
////当在直道整个小车太过偏左都在电磁线左边时且此时最强的右电感值<75,说明小车太偏了，进入if
////当遇到弯道小车转弯幅度不够，可能会冲出赛道，进入if 
//       
//      //////弯道内和导线夹角过大导致后面转向不足，此时过渡点强制增大//////////////
////张盛屏蔽
////       if(position == 0 && AD_0_max < 75)
////       {
////           AD_0_max = 75 + abs_f(75 - AD_0_max);
////       }
////       else if(position == 3 && AD_2_max < 75)
////       {
////           AD_2_max = 75 + abs_f(75 - AD_2_max);
////       }
////张盛屏蔽
//  Chazhi_Last=Chazhi;
//       /*************计算偏移量*************/
////zs
////    Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]);
////   if(position ==1)  
////   {
////      if(AD_inductor[0]>50&&AD_inductor[0]>AD_inductor[1]&&AD_inductor[1]>AD_inductor[2]&&AD_inductor[2]<5)
////        Chazhi=-70;
////   }
////   
////    if(position ==2)  
////   {
////      if(AD_inductor[2]>50&&AD_inductor[2]>AD_inductor[1 ]&&AD_inductor[1]>AD_inductor[0]&&AD_inductor[0]<5)
////        Chazhi=70;
////   }
//  
//       if(position == 0)   //左侧丢线
//       {
//       
//            Chazhi =-60;
//       }
//       else if(position == 1 || position == 2) //处于中间位置        
//       {
//                  
//             Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//             
//             
//       }
//       else if(position == 3)  //右侧丢线
//       {
//            Chazhi = 60;
//       }
//     
//
//      
//       /*
//       if(Strig  ht_Flag)
//       {
//           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //长直道用斜率控制舵机
//       }
//       if(UPhill_flag)  //上坡时 强制用两侧电感偏移量
//       {
//           Chazhi = (int16)((AD_inductor[2] - AD_inductor[0]));
//       }
//       */
//       
//         
//       
//
//}
//
//






//延时
void delayms(unsigned int time)
{
   unsigned int i=0;
   while(time--)
   {
      i=12000;  //自己定义
      while(i--);
   }
}

///取绝对值
uint16 abs_inductor(int value)
{
    if(value<0)
      value=-value;
    return value;
}

float abs_f(float value)
{
    if(value<0)
      value=-value;
    return value;
}




/*************************************************************************
 *  函数名称   SC_black_Init
 *  功能说明： AD初始化  将电感的最大值 以及 过渡点写入FLASH
 *  参数说明：
 *  函数返回： 无
 *  修改时间：
 *  备    注：
*************************************************************************/
void SC_black_Init(void)
{
//    uint16  i,j;
//    float  *Ptr_flash=NULL;
//    int16   Position_transit_short[4];
//    float  sensor_1,sensor_2,sensor_3,sensor_4;
//    flag_1 = 1;
//
//    if(inductor_flag)
//    {
//     inductor_flag = 0;
////     UART_Send_String("Collecting");
////     UART_Send_String("samples...");
//
//        max_v[0] = max_v[1] = max_v[2] = max_v[3] = max_v[4] = 0;
//        for(i=0;i<100;i++)
//        {
//
//            AD_valu[0] = ADC_Once(ADC_1,adc10bit);  //左  通道
//            AD_valu[1] = ADC_Once(ADC_2,adc10bit);  //中  通道
//            AD_valu[2] = ADC_Once(ADC_3,adc10bit);  //右  通道
////            AD_valu[3] = ADC_Once(ADC_4,adc10bit);  //中1 通道
////            AD_valu[4] = ADC_Once(ADC_5,adc10bit);  //中2 通道
//            if(AD_valu[2]>300) AD_valu[2] = 250;
//            
//            for(j=0;j<3;j++)
//            {
//                if(AD_valu[j] > max_v[j])
//                {
//                    max_v[j] = AD_valu[j];
//                    if(j==0)    Position_transit_short[0] =  AD_valu[1];  //记录过渡点 电感值
//                    if(j==2)    Position_transit_short[1] =  AD_valu[1];
////                    if(j==3)    Position_transit_short[2] =  AD_valu[4];
////                    if(j==4)    Position_transit_short[3] =  AD_valu[3];
//                }
//            }
//          
//        }
//        /***************              记录的过渡点归一化                     ******************/
//        sensor_1 = (float)(Position_transit_short[0] - min_v[1])/(float)(max_v[1] - min_v[1]);
//        if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//        if(sensor_1 >= 1.0)  sensor_1 = 1.0;
//
//        sensor_2 = (float)(Position_transit_short[1] - min_v[1])/(float)(max_v[1] - min_v[1]);
//        if(sensor_2 <= 0.0)  sensor_2 = 0.001;
//        if(sensor_2 >= 1.0)  sensor_2 = 1.0;
//
////        sensor_3 = (float)(Position_transit_short[2] - min_v[4])/(float)(max_v[4] - min_v[4]);
////        if(sensor_3 <= 0.0)  sensor_3 = 0.001;/
////        if(sensor_3 >= 1.0)  sensor_3 = 1.0;
////
////        sensor_4 = (float)(Position_transit_short[3] - min_v[3])/(float)(max_v[3] - min_v[3]);
////        if(sensor_4 <= 0.0)  sensor_4 = 0.001;
////        if(sensor_4 >= 1.0)  sensor_4 = 1.0;
//
//        //扩大过渡点的值
//        Position_transit[0] = (int16)(100 * sensor_1);
//        Position_transit[1] = (int16)(100 * sensor_2);
////        Position_transit[2] = (int16)(100 * sensor_3);
////        Position_transit[3] = (int16)(100 * sensor_4);
//
//
//        //将过渡值和最大值写到FASH里面
//    /*
//        result=LPLD_Flash_SectorErase((uint32)SECTOR_ADM);//擦除254扇区
//        if(result == FLASH_OK)printf(0,0,"Eraser successful!");
//
//
//        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM, (uint32*)max_v, DATA_SIZE*4); //电感标定的最大值写入扇区
//        if(result == FLASH_OK)printf(0,0,"Write max successful!");
//
//
//        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM+20, (uint32*)Position_transit, 4*4);
//        if(result == FLASH_OK)printf(0,0,"Write Position_transit successful!");
//        */
//
//
//        /*
//        for(i=0;i<4;i++)                     //过渡点归一化值写入扇区
//        {
//           LPLD_Flash_ByteProgram(SECTOR_ADM,20+i*4,Position_transit[i]);
//        }
//        */
////    }
//    
////    else
////    {
////        for(i=0;i<3;i++)
////        {
////          /*
////          Ptr_flash = (float*)SECTOR_ADM;  没写ROM 报错  改
////          */
////           for(j=0;j<5;j++)   //读取五个电感的采样标定的最大值
////           {
////               max_v[j] = *(Ptr_flash+j);
////           }
////           for(j=0;j<4;j++)  //读取过渡点
////           {
////              Position_transit[j] = *(Ptr_flash+20+j);
////           }
////
////           UART_Send_String("Reading");
////           UART_Send_String("samples...");
////          // delayms(10);
////        }
//    }


 }








