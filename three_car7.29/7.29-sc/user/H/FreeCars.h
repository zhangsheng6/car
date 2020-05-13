#ifndef _FREECARS_H_
#define _FREECARS_H_

#include "common.h"

extern uint8 ccdData_Buff[128];

//------------------向某通道填充数据
void push(uint8 chanel,uint16 dat);

//------------模拟波形产生函数
void produceScopeData(void);	//在启动发送一帧前添加的

//-------------发送波形到上位机
void sendDataToScope(void);

//--------------模拟产生CCD数据
void produceCCDData(void);

//------------发送CCD数据到上位机
void sendDataToCCDViewer(uint8 CCDSelection,uint8* CCDData);


void myCCDData(void);

#endif