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
  
   uint8 cmdf[2] = {CMD_WARE, ~CMD_WARE};    //串口调试 使用的前命令
   uint8 cmdr[2] = {~CMD_WARE, CMD_WARE};    //串口调试 使用的后命令

   UART_SendArray( cmdf,sizeof(cmdf));    //先发送前命令
   UART_SendArray( (uint8_t *)var,sizeof(var));    //发送数据
   UART_SendArray( cmdr,sizeof(cmdr));    //发送后命令

}





