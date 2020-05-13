#include "L3G4200.h"



SPI_Type* SPI[2] = SPI_BASES; //��������ָ�����鱣�� SPIx �ĵ�ַ

//��ز���
uint8 gyro_ID = 0;
int16 gyro_x = 0, gyro_y = 0, gyro_z = 0;//�洢�����������
int gyro_y_valu = 0;
uint8 a, b;
char gyro_y_num = 0;
int gyro_y_he = 0;
int16 L3G4200_valu[2];

void SPI_delay(void)
{
	uint16 j=120;
	while(j--);
}

/**
  * ���
  *     д����
  */
void L3G4200_WrCmd(unsigned char cmd)
{
  uint8 i=8;
  CL_L3G4200_CS;
  SPI_delay();
//  CL_L3G4200_MI;
  while(i--)
  {
    CL_L3G4200_CLK;
    if(cmd&0x80)
    {
        L3G4200_MO;
    }
    else
    {
      CL_L3G4200_MO;
    }
    cmd<<=1;
  SPI_delay();
    L3G4200_CLK;
  }

//  L3G4200_MI;
  L3G4200_CS;
}

/**
  * ���
  *     ������
  */
uint8 L3G4200_ReData()
{
  uint8 i=8;
  uint8 byte = 0;

  CL_L3G4200_CS;
  SPI_delay();
  while(i--)
  {
    L3G4200_CLK;
    SPI_delay();
    CL_L3G4200_CLK;

    if (GpioGet(SPI1_MISO) == 1)
    {
        byte += 1;
    }

    byte<<=1;
  }

  L3G4200_CS;

  return byte;
}

/**
  * ���
  *     ��д
  */
uint8 SPI_ReadWrite(uint8 byte)
{
    uint8 temp = 0;

    L3G4200_WrCmd(byte);
    temp = L3G4200_ReData();



//    uint8 temp = 0;
//
//    while( !( SPI[1]->S & SPI_S_SPTEF_MASK ) );  //�ȴ��������
//    SPI[1]->D = byte;          //���������ɱ�־λ
//
//    while( !( SPI[1]->S & SPI_S_SPRF_MASK ) );   //�ȴ���������
//    temp = (uint8)(SPI[1]->D);;           //��ȡ���ݣ�ת����ʽ
//
    return temp;
}
/**
  * ���
  *     д�����ǼĴ���
  * ����
  *     reg���Ĵ�����ַ
  *     value��д�������
  */
void L3G4200_Write_Reg(uint8 reg, uint8 value)
{
    SPI_ReadWrite(reg);
    SPI_ReadWrite(value);


//    SPI_ReadWrite(reg);     //��λ��ǰ�����Զ� -> ���λҪд1
//    SPI_ReadWrite(value);   //��ʱд���������
}

/**
  * ���
  *     ��ȡ�����ǼĴ���
  * ����
  *     reg���Ĵ�����ַ
  *     value�������ַ
  * ע��
  *     һ����������16������
  *     ǰ��λ״̬�����λ����
  */
void L3G4200_Read_Reg(uint8 reg, uint8 *value)
{
    SPI_ReadWrite(0x80|reg);
    *value = SPI_ReadWrite(0xff);

//    SPI_ReadWrite(0x80|reg);        //��λ��ǰ�����Զ� -> ���λҪд1
//    *value = SPI_ReadWrite(0xff);   //��ʱд���������
}


/**
  * ���
  *     �����ǳ�ʼ��
  * ע��
  *     ʹ����2����
  */
void L3G4200_Init(void)
{
    i2c_init(IIC_PORT, 400*1000);

    //�����������800Hz��LPF��ֹƵ��110Hz������������ģʽ��ʹ��X Y ��
//    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFF);
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200, 0xFB);
//    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG1_4200);

    //��ͨ�˲�������
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG2_4200, 0x00);

    //�ر������ж�,����IIC DRDY
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200, 0x08);
//    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG3_4200);

    //ʹ��block data updata���ܣ�ȷ����ȷ�������ݡ�ʹ��С��ģʽ��ѡ��������250dps
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG4_4200, 0x80);

    //ʹ��LPF2���ر�HPF���򿪺�������ʹ�ã�
    i2c_write_reg(IIC_PORT, L3G4200_DEV_ADD, CTRL_REG5_4200, 0x02);

    gyro_ID = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_TEMP_4200);
}

/**
  * ���
  *     L3G4200 ��ȡ
  * ע��
  *     �˴�ֻʹ��XY������
  *     ʹ��Ӳ��iic ��һ������Ҫ470us(����ʹ�õ����ڲ�����)
  *     ʹ��ģ��IIC ��һ������Ҫ4.9ms
  */
void L3G4200_Read(void)
{
    //�洢�������ݣ�ÿһ�������ֽڣ��ȵͺ�ߣ�������ʽ�洢
    uint8 gx, gy;//, gz;
    uint16 wgx, wgy;//, wgz;
    

    //�����Զ���������Ҫ 3.72 ms ���������������ֻ����Ҫ��
    if ( i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, STATUS_REG_4200)&0x80 )//�鿴�����Ƿ�׼�����ˡ����û��׼���ã���ȡ����ܶ�ȡ���������ݡ���ȡƵ������Ǹ����������Ƶ��
    {
        //��һ������Ҫ470us
        wgx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_H_4200);
		gx = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_X_L_4200);
        gyro_x = (wgx<<8) + gx;
        gyro_x >>= 3;

//        wgz = IIC_readReg(L3G4200_DEV_ADD, OUT_Y_H_4200, IIC);
//		gz = IIC_readReg(L3G4200_DEV_ADD, OUT_Y_L_4200, IIC);
//        gyro_z = (wgz<<8) + gz;
//        gyro_z >>= 3;

        wgy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_H_4200);
		gy = i2c_read_reg(IIC_PORT, L3G4200_DEV_ADD, OUT_Y_L_4200);
        gyro_y = (wgy<<8) + gy;
        gyro_y >>= 3;
        
        
        //ƽ���˲���
        gyro_y_num++;
        gyro_y_he += gyro_y;
        gyro_y_valu =  gyro_y_he/gyro_y_num;
        if(gyro_y_num == 10) {gyro_y_num = 0;gyro_y_he=0;}
        
    }
}


////��ֵƽ���˲������вɼ�����
//void L3G4200_Read_deal(void)
//{
//      int16  i,j,k,temp;
//      int16  L3G4200_valu2[5][5],L3G4200_sum[5],L3G4200_valu1[5],L3G4200_V[3][5];
//
//      for(i=0;i<5;i++)
//      {
//            L3G4200_Read();
//            L3G4200_valu2[0][i] = gyro_x;  //x������
//            L3G4200_valu2[1][i] = gyro_y;  //y������
//      }
//   //////////////////////ð������///////////////////////////////////
//      for(i=0;i<2;i++)     
//      {
//         for(j=0;j<4;j++)  //�����������
//         {
//            for(k=0;k<4-j;k++)
//            {
//               if(L3G4200_valu2[i][k] > L3G4200_valu2[i][k+1])  //ǰ��ıȺ���Ĵ�  ����н���
//               {
//                  temp = L3G4200_valu2[i][k+1];
//                  L3G4200_valu2[i][k+1] = L3G4200_valu2[i][k];
//                  L3G4200_valu2[i][k] = temp;
//               }
//            }
//         }
//      }
//      for(i=0;i<2;i++)    //���м�����ĺ�
//      {
//         L3G4200_sum[i] = L3G4200_valu2[i][1] + L3G4200_valu2[i][2] + L3G4200_valu2[i][3];
//         L3G4200_valu1[i] = L3G4200_sum[i] / 3;
//      }
//   ////////////////////////����ƽ���˲�/////////////////////////////
//      for(i = 0;i < 2;i ++)  //ȡ�м�3λ��ֵ��ǰ��λ
//      {
//          L3G4200_V[0][i] = L3G4200_valu2[0][i + 1];
//          L3G4200_V[1][i] = L3G4200_valu2[1][i + 1];
//      }
//      for(i=0;i<2;i++)   //����λ�洢ƽ��ֵ
//      {
//          L3G4200_V[i][2] =  L3G4200_valu1[i];
//      }
//         for(i = 0;i < 3;i ++)   //�õ�ԭ�м���λ��ֵ
//      {
//          L3G4200_sum[0] += L3G4200_V[0][i];
//          L3G4200_sum[1] += L3G4200_V[1][i];
//      }
//      for(i=0;i<3;i++)  //��ƽ��
//      {
//          L3G4200_valu[i] = L3G4200_sum[i] / 3;
//          L3G4200_sum[i] = 0;
//      }
//}



