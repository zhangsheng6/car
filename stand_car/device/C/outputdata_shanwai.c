/***************************************
ɽ����Թ���  ����ʾ������ͨ��Э��

ע������
1�����ӵĹܽ���Ҫ�����õ�UARTһ��
2����λ���˿ڵĲ����ʺʹ��������õĲ�������Ҫһ��
3������ʾ�����Ĳ�����Ŀ��Ҫ�붨����ʾ�Ĳ�����Ŀһ�£�PS��var[5]��
4����λ��������������Ҫ����붨�����������һ��

��չ 1����ͬ�ַ����ͷ��� ֻ���var[]���ַ����� 
     2��������չ��8ͨ��ͬʱ����ֻ�����var��ĸ���
***************************************/
#include "uart.h"
#include "outputdata_shanwai.h"




void uart_sendware_float(float x,float y,float z,float w)
{
#define CMD_WARE 3
  
  float var[4];
  
  var[0] = x;
  var[1] = y;
  var[2] = z;
  var[3] = w;
  //               0011        1100
   uint8 cmdf[2] = {CMD_WARE, ~CMD_WARE};    //���ڵ��� ʹ�õ�ǰ����
   uint8 cmdr[2] = {~CMD_WARE, CMD_WARE};    //���ڵ��� ʹ�õĺ�����
//���Ϳ�ʼ 0011 1100
//��������   
//���ͽ���
   UART_SendArray( cmdf,sizeof(cmdf));    //�ȷ���ǰ����
   UART_SendArray( (uint8_t *)var,sizeof(var));    //��������
   UART_SendArray( cmdr,sizeof(cmdr));    //���ͺ�����

}


