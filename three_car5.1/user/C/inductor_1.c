#include "inductor_1.h"
#include "Variable.h"
#include "common.h"
#include "allHead.h"



//��  �� ��   ���� ���� gnd
//��  �� ��    ��   ��  ��
//��  �� ��    ��   ��  ��ɫ
//4   2  3    1    5
//              �ҵ��   �е��   ����   λ��     ��ֵ
//�ҵ�����    490,97    250,50  16,1      1        -95
//�������    4,0.1    240,47  509,100    2         99
//�������ʱ     40,7    312,62   287,57    2          50      
//�������ʱ     4��0.1    194,38   287,57    2          50    
                                     //          ��Χ
//ADֵ��AD_valu[3]Ϊ�ɼ��������ĵ�ADֵ          0-260(С����ʻʱ)
//��һֵsensor_to_one[5]Ϊ��ADֵ��һ��            0-1
//����ֵ��AD_inductor[5]Ϊ����һ����ֵ�Ŵ�100��    0-100
//���ߣ��źź�С�ˣ�Ȼ��Ͱ����Ҳ����ź���������
//Position_transit[i]:��¼���ɵ��һ���Ŵ���ֵ
//Position_transit[0]:�ҵ��λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
//Position_transit[1]:����λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
//��ֵ����ֵ��С���е�������ߵ����λ�þ���
//С���������ڲ�ֵΪ100���ڣ����������200���ң�ȫ������300����






/*************************************************************************
 *  ��������   Read_ADC
 *  ����˵���� AD�ɼ�
 *  ����˵����
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
*************************************************************************/
void Read_ADC(void)
{
      int16  i,j,k,temp;
      int16  ad_valu1[5],ad_sum[5];

      for(i=0;i<5;i++)
      {

            ad_valu[0][i] = ADC_Once(ADC_1,adc12bit);  //��  ͨ��
            ad_valu[1][i] = ADC_Once(ADC_2,adc12bit);  //��  ͨ��
            ad_valu[2][i] = ADC_Once(ADC_3,adc12bit);  //��  ͨ��
            ad_valu[3][i] = ADC_Once(ADC_4,adc12bit);  //��1 ͨ��
            ad_valu[4][i] = ADC_Once(ADC_5,adc12bit);  //��2 ͨ��
            
//            if(ad_valu[0][i] > 650) ad_valu[0][i]=500;
//            if(ad_valu[1][i] > 650) ad_valu[0][i]=500;
//            if(ad_valu[2][i] > 650) ad_valu[0][i]=500;

      }
   //////////////////////ð������///////////////////////////////////
      for(i=0;i<5;i++)     //5�����
      {
         for(j=0;j<4;j++)  //�����������
         {
            for(k=0;k<4-j;k++)
            {
               if(ad_valu[i][k] > ad_valu[i][k+1])  //ǰ��ıȺ���Ĵ�  ����н���
               {
                  temp = ad_valu[i][k+1];
                  ad_valu[i][k+1] = ad_valu[i][k];
                  ad_valu[i][k] = temp;
               }
            }
         }
      }
      for(i=0;i<5;i++)    //���м�����ĺ�
      {
         ad_sum[i] = ad_valu[i][1] + ad_valu[i][2] + ad_valu[i][3];
         ad_valu1[i] = ad_sum[i] / 3;
      }
   ////////////////////////����ƽ���˲�/////////////////////////////
      for(i = 0;i < NM-1;i ++)  //ȡ�м�3λ��ֵ��ǰ��λ
      {
          AD_V[0][i] = ad_valu[0][i + 1];
          AD_V[1][i] = ad_valu[1][i + 1];
          AD_V[2][i] = ad_valu[2][i + 1];
          AD_V[3][i] = ad_valu[3][i + 1];
          AD_V[4][i] = ad_valu[4][i + 1];
      }
      for(i=0;i<5;i++)   //����λ�洢ƽ��ֵ
      {
          AD_V[i][NM-1] =  ad_valu1[i];
      }
         for(i = 0;i < NM;i ++)   //�õ�ԭ�м���λ��ֵ
      {
          AD_sum[0] += AD_V[0][i];
          AD_sum[1] += AD_V[1][i];
          AD_sum[2] += AD_V[2][i];
          AD_sum[3] += AD_V[3][i];
          AD_sum[4] += AD_V[4][i];
      }
      for(i=0;i<5;i++)  //��ƽ��
      {
          AD_valu[i] = AD_sum[i] / NM;
          AD_sum[i] = 0;
      }
}










///*************************************************************************
// *  ��������   Date_analyse
// *  ����˵���� ���ݷ���
// *  ����˵����
// *  �������أ� ��
// *  �޸�ʱ�䣺
// *  ��    ע��
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
//    Inductor_Check();//��������СֵУ�� 
//     /*********************��һ������********************/
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
//        AD_inductor[i] = 100 * sensor_to_one[i];     //AD[i]Ϊ��һ�����ֵ  ��ΧΪ0-100
//     }
//       /*******1�ŵ�������һ���������µ����********/
//      sensor_1 = (float)(AD_valu[1] - min_v[1])/(float)(ad_valu[1][0] - min_v[1]);
//      if(sensor_1 <= 0.0)  sensor_1 = 0.001;
//      Slope_AD_1 = 100 * sensor_1;
//   ////////////////////////////////////////////////////////////////////
//
//       for(i=0;i<3;i++)                 //�ҳ���ǿ�Ĵ�����
//       {
//         if(AD_inductor[max_front]<AD_inductor[i])
//           max_front=i;
//       }
//       max_value=AD_inductor[max_front];  //�����ֵ
//
//    //   max_back = (AD_inductor[3]>AD_inductor[4])? 3:4;  //�Һ�����ǿ���
// //zs����      
//       //����ʱ���ֵȡ��ֵ
//       if(max_value < 5)           
//       {
//         max_front=max_old;
//         max_value=AD_inductor[max_front];
//       }
//       else
//         max_old=max_front;
////       //������
//       if(abs_inductor(max_front - max_crosstalk) < 2)  
//       {
//            max_crosstalk = max_front;
//       }
//       else
//            max_front = max_crosstalk;
// //��ʢ����      
//      // AD_MAX_NUM = max_front;        //�����ٶȿ���
//       
//        /****************λ�ý��㣬������̵�ֵ�ù�һ���Ŵ���ֵ************************/
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
//        if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //�Ѿ�ƫ��0�Ŵ�����
//       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
//             position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
// //          AD_0_max = AD_inductor[0];//zs��
//       }
//       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] )) || (max_front==1 && (AD_inductor[0] >AD_inductor[2]) ))  //���λ��  0-1�Ŵ�����֮��
//       {//�ҵ������Ҵ�ʱ�е�е�ֵ>���ɵ�0ʱ�е�е�ֵ||�е��������ҵ�е�ֵ>���е�ֵ
//           //      �е���ڵ�������                            �е���ڵ�������
//             position=1;//�е���ڵ�������,С��ƫ��(���С�����ϲ����ڵ������ߵ�����ȫ��)
//             AD_0_max = AD_inductor[0]; //��¼�´�ʱ��0�Ŵ������Ĺ�һ�Ŵ���ֵ
//       }
//       else if((max_front==1 && (AD_inductor[2] >AD_inductor[0]) ) || (max_front==2 && (AD_inductor[1] > Position_transit[1] )))  //�Ҳ�λ��  1-2�Ŵ�����֮��
//       {//�е����������е�ֵ�����ҵ�е�ֵ||��������Ҵ�ʱ�е�е�ֵ>���ɵ�1ʱ�е�е�ֵ
//        //    �е���ڵ�����ұ�                         �е���ڵ�����ұ�          
//             position=2;//�е���ڵ�����ұ�,С��ƫ��(���С�����ϲ����ڵ�����ұߵ�����ȫ��)
//             AD_2_max = AD_inductor[2]; //��¼�´�ʱ��3�Ŵ�������һ�Ŵ���ֵ
//       }
//       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] ))  //�Ѿ�ƫ��3�Ŵ�����
//       {//��������Ҵ�ʱ���е��ֵ<=���ɵ�1ʱ�е�е�ֵ
//             position = 3;//�����ڵ�����ҷ�������С�����ڵ�����ҷ�
//        // AD_2_max = AD_inductor[2];//zs��
//
//       }   
//         
//         
////Position_transit[0]:�ҵ��λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ
////Position_transit[1]:����λ�ڵ�������Ϸ�ʱ�е�й�һ���Ŵ���ֵ�е�е�ֵ
////       if(max_front==0 && (AD_inductor[1] <= Position_transit[0] ))  //�Ѿ�ƫ��0�Ŵ�����
////       {//�ҵ������Ҵ�ʱ���е��ֵ<=���ɵ�0ʱ�е�е�ֵ
////             position=0;//�ҵ���ڵ�����󷽣�����С�����ڵ������
//// //          AD_0_max = AD_inductor[0];//zs��
////       }
////       else if((max_front==0 && (AD_inductor[1] > Position_transit[0] + 1)) || (max_front==1 && (AD_inductor[0] - AD_inductor[2]) > 1))  //���λ��  0-1�Ŵ�����֮��
////       {//�ҵ������Ҵ�ʱ�е�е�ֵ>���ɵ�0ʱ�е�е�ֵ||�е��������ҵ�е�ֵ>���е�ֵ
////           //      �е���ڵ�������                            �е���ڵ�������
////             position=1;//�е���ڵ�������,С��ƫ��(���С�����ϲ����ڵ������ߵ�����ȫ��)
////             AD_0_max = AD_inductor[0]; //��¼�´�ʱ��0�Ŵ������Ĺ�һ�Ŵ���ֵ
////       }
////       else if((max_front==1 && (AD_inductor[2] - AD_inductor[0]) > 1) || (max_front==2 && (AD_inductor[1] > Position_transit[1] + 1)))  //�Ҳ�λ��  1-2�Ŵ�����֮��
////       {//�е����������е�ֵ�����ҵ�е�ֵ||��������Ҵ�ʱ�е�е�ֵ>���ɵ�1ʱ�е�е�ֵ
////        //    �е���ڵ�����ұ�                         �е���ڵ�����ұ�          
////             position=2;//�е���ڵ�����ұ�,С��ƫ��(���С�����ϲ����ڵ�����ұߵ�����ȫ��)
////             AD_2_max = AD_inductor[2]; //��¼�´�ʱ��3�Ŵ�������һ�Ŵ���ֵ
////       }
////       else if(max_front==2 && (AD_inductor[1] <= Position_transit[1] - 1))  //�Ѿ�ƫ��3�Ŵ�����
////       {//��������Ҵ�ʱ���е��ֵ<=���ɵ�1ʱ�е�е�ֵ
////             position = 3;//�����ڵ�����ҷ�������С�����ڵ�����ҷ�
////        // AD_2_max = AD_inductor[2];//zs��
////
////       }
//       /*
//       //~~~~~~~~~~~~~~~~~~~~~~~ ����λ�ý���~~~~~~~~~~~~~~~~~~~//
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
//      /*λ�÷�������󣬱���ǰ1msС�����ڵ������ߣ���1msС��ƫ��*/  
// //zs����      
//       if(abs_inductor(position - position_last) > 1)  //λ���������ʱ���� 
//       {
//            position = position_last;//�˿�С��λ��ת��Ϊ��һ��С��λ��
//       }
//       else
//       {
//       position_last = position;//������¼�����������ϴ�С��λ��=�˿�С��λ��
//       }   
////zs����
////////����ں͵��߼нǹ����º���ת���㣬��ʱ���ɵ�ǿ������//////////////
///*����С��ֱ��̫ƫ������ʱС��ת�����С��������С�����ܺúõĸ����������ʱǿ��*/
////����ֱ������С��̫��ƫ���ڵ�������ʱ�Ҵ�ʱ��ǿ���ҵ��ֵ<75,˵��С��̫ƫ�ˣ�����if
////���������С��ת����Ȳ��������ܻ�������������if 
//       
//      //////����ں͵��߼нǹ����º���ת���㣬��ʱ���ɵ�ǿ������//////////////
////��ʢ����
////       if(position == 0 && AD_0_max < 75)
////       {
////           AD_0_max = 75 + abs_f(75 - AD_0_max);
////       }
////       else if(position == 3 && AD_2_max < 75)
////       {
////           AD_2_max = 75 + abs_f(75 - AD_2_max);
////       }
////��ʢ����
//  Chazhi_Last=Chazhi;
//       /*************����ƫ����*************/
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
//       if(position == 0)   //��ඪ��
//       {
//       
//            Chazhi =-60;
//       }
//       else if(position == 1 || position == 2) //�����м�λ��        
//       {
//                  
//             Chazhi = (int16)(AD_inductor[2] - AD_inductor[0]); 
//             
//             
//       }
//       else if(position == 3)  //�Ҳඪ��
//       {
//            Chazhi = 60;
//       }
//     
//
//      
//       /*
//       if(Strig  ht_Flag)
//       {
//           Chazhi = (int16)(((AD_inductor[2]-AD_inductor[0])-(AD_inductor[4]-AD_inductor[3])/10)*1.3);  //��ֱ����б�ʿ��ƶ��
//       }
//       if(UPhill_flag)  //����ʱ ǿ����������ƫ����
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






//��ʱ
void delayms(unsigned int time)
{
   unsigned int i=0;
   while(time--)
   {
      i=12000;  //�Լ�����
      while(i--);
   }
}

///ȡ����ֵ
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
 *  ��������   SC_black_Init
 *  ����˵���� AD��ʼ��  ����е����ֵ �Լ� ���ɵ�д��FLASH
 *  ����˵����
 *  �������أ� ��
 *  �޸�ʱ�䣺
 *  ��    ע��
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
//            AD_valu[0] = ADC_Once(ADC_1,adc10bit);  //��  ͨ��
//            AD_valu[1] = ADC_Once(ADC_2,adc10bit);  //��  ͨ��
//            AD_valu[2] = ADC_Once(ADC_3,adc10bit);  //��  ͨ��
////            AD_valu[3] = ADC_Once(ADC_4,adc10bit);  //��1 ͨ��
////            AD_valu[4] = ADC_Once(ADC_5,adc10bit);  //��2 ͨ��
//            if(AD_valu[2]>300) AD_valu[2] = 250;
//            
//            for(j=0;j<3;j++)
//            {
//                if(AD_valu[j] > max_v[j])
//                {
//                    max_v[j] = AD_valu[j];
//                    if(j==0)    Position_transit_short[0] =  AD_valu[1];  //��¼���ɵ� ���ֵ
//                    if(j==2)    Position_transit_short[1] =  AD_valu[1];
////                    if(j==3)    Position_transit_short[2] =  AD_valu[4];
////                    if(j==4)    Position_transit_short[3] =  AD_valu[3];
//                }
//            }
//          
//        }
//        /***************              ��¼�Ĺ��ɵ��һ��                     ******************/
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
//        //������ɵ��ֵ
//        Position_transit[0] = (int16)(100 * sensor_1);
//        Position_transit[1] = (int16)(100 * sensor_2);
////        Position_transit[2] = (int16)(100 * sensor_3);
////        Position_transit[3] = (int16)(100 * sensor_4);
//
//
//        //������ֵ�����ֵд��FASH����
//    /*
//        result=LPLD_Flash_SectorErase((uint32)SECTOR_ADM);//����254����
//        if(result == FLASH_OK)printf(0,0,"Eraser successful!");
//
//
//        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM, (uint32*)max_v, DATA_SIZE*4); //��б궨�����ֵд������
//        if(result == FLASH_OK)printf(0,0,"Write max successful!");
//
//
//        result=LPLD_Flash_ByteProgram((uint32)SECTOR_ADM+20, (uint32*)Position_transit, 4*4);
//        if(result == FLASH_OK)printf(0,0,"Write Position_transit successful!");
//        */
//
//
//        /*
//        for(i=0;i<4;i++)                     //���ɵ��һ��ֵд������
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
////          Ptr_flash = (float*)SECTOR_ADM;  ûдROM ����  ��
////          */
////           for(j=0;j<5;j++)   //��ȡ�����еĲ����궨�����ֵ
////           {
////               max_v[j] = *(Ptr_flash+j);
////           }
////           for(j=0;j<4;j++)  //��ȡ���ɵ�
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








