#include "uart.h"
#include "outputdata_zs.h"

void uart_sendware_float(float x,float y,float z,float w)
{
#define CMD_WARE 3
  
  float var[4];
  
  var[0] = x;
  var[1] = y;
  var[2] = z;
  var[3] = w;
  
   uint8 cmdf[2] = {CMD_WARE, ~CMD_WARE};    //���ڵ��� ʹ�õ�ǰ����
   uint8 cmdr[2] = {~CMD_WARE, CMD_WARE};    //���ڵ��� ʹ�õĺ�����

   UART_SendArray( cmdf,sizeof(cmdf));    //�ȷ���ǰ����
   UART_SendArray( (uint8_t *)var,sizeof(var));    //��������
   UART_SendArray( cmdr,sizeof(cmdr));    //���ͺ�����

}





