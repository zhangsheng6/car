#ifndef _FREECARS_H_
#define _FREECARS_H_

#include "common.h"

extern uint8 ccdData_Buff[128];

//------------------��ĳͨ���������
void push(uint8 chanel,uint16 dat);

//------------ģ�Ⲩ�β�������
void produceScopeData(void);	//����������һ֡ǰ��ӵ�

//-------------���Ͳ��ε���λ��
void sendDataToScope(void);

//--------------ģ�����CCD����
void produceCCDData(void);

//------------����CCD���ݵ���λ��
void sendDataToCCDViewer(uint8 CCDSelection,uint8* CCDData);


void myCCDData(void);

#endif