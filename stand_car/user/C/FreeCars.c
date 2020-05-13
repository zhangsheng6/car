#include "includes.h"

#define CCDWidth 	128
#define UartDataNum 	17

uint8 uSendBuf[UartDataNum*2]={0};
uint8 FreeCarsDataNum = UartDataNum*2;

uint8 ccdData_Buff[CCDWidth];

//------------------向某通道填充数据
void push(uint8 chanel,uint16 dat)
{
    uSendBuf[chanel*2]	= dat/256;
    uSendBuf[chanel*2+1]= dat%256;
}

//-----------------------------模拟波形产生函数
void produceScopeData(void)	//在启动发送一帧前添加的
{
  int16 j;
  static int16 i=0;
  for(j=4; j<UartDataNum; j++)  //生成正弦函数，测试
  {
    push(j%4,(int16)( (j+1)*100*sin(i/2.0/3.14)) );
  }
  i+=1;
}
//-------------发送波形到上位机
void sendDataToScope(void)
{
  uint8 i,sum=0;
  //使用轮询法，发送未完，一直等待
  UART_Send_Byte(251);
  UART_Send_Byte(109);
  UART_Send_Byte(37);
  sum+=(251);
  sum+=(109);
  sum+=(37);
  for(i=0;i<FreeCarsDataNum;i++)
  {
    UART_Send_Byte( uSendBuf[i] );
    sum += uSendBuf[i];
  }
  UART_Send_Byte(sum);
}
//---------------我的模拟ＣＣＤ数据产生
void myCCDData()
{
	int cnt;
	for(cnt=0; cnt<40; cnt++)
		ccdData_Buff[cnt] = 100;
	for(cnt=40; cnt<88; cnt++)
		ccdData_Buff[cnt] = 200;
	for(cnt=88; cnt<128; cnt++)
		ccdData_Buff[cnt] = 150;
	
}
//--------------模拟产生CCD数据
void produceCCDData(void)
{
  uint8 ccdCount=0;
  static  uint8 ccdC=20;
  static  int16 dir=1;
  for(ccdCount=0; ccdCount<ccdC; ccdCount++)
  {
    ccdData_Buff[ccdCount]=20+ccdCount*180/ccdC + ccdCount%20;
  }
  for(ccdCount=ccdC; ccdCount<60+ccdC; ccdCount++)
  {
    ccdData_Buff[ccdCount]=200 + ccdCount%40;			   //产生-40到40之间的随机数，模拟CCD数据的跳动
  }
  for(ccdCount=50+ccdC; ccdCount<CCDWidth; ccdCount++)
  {
    ccdData_Buff[ccdCount]=200 - (180 - (CCDWidth - ccdCount)*180/(CCDWidth - 50 - ccdC)) + ccdCount%20;
  }
  ccdC+=dir;
  if(ccdC==58)
  {
    dir =-1;
  }
  else if(ccdC==20)
  {
    dir=1;
  }
}

//------------发送CCD数据到上位机
void sendDataToCCDViewer(uint8 CCDSelection,uint8 *ccdData)
{
  uint8 i,sum=0;
  //使用轮询法，发送未完，一直等待
  UART_Send_Byte(0xFC);
  UART_Send_Byte(0x07);
  UART_Send_Byte(0xCF);
  UART_Send_Byte(CCDSelection);//多CCD时进行对CCD的选择
  sum+=(0xFC);      //全部数据加入校验
  sum+=(0x07);
  sum+=(0xCF);
  sum+=CCDSelection;
  for(i=0;i<CCDWidth;i++)
  {
    UART_Send_Byte(ccdData[i]);
    sum+=ccdData[i];        //全部数据加入校验
  }
  UART_Send_Byte(sum);
}
