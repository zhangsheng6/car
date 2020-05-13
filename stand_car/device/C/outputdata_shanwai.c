/***************************************
山外调试工具  虚拟示波器的通信协议

注意事项
1、连接的管脚需要与配置的UART一致
2、上位机端口的波特率和代码中配置的波特率需要一致
3、虚拟示波器的波形数目需要与定义显示的波形数目一致（PS：var[5]）
4、上位机的数据类型需要与代码定义的数据类型一致

扩展 1，不同字符类型发送 只需改var[]的字符类型 
     2，可以扩展的8通道同时发送只需添加var里的个数
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
   uint8 cmdf[2] = {CMD_WARE, ~CMD_WARE};    //串口调试 使用的前命令
   uint8 cmdr[2] = {~CMD_WARE, CMD_WARE};    //串口调试 使用的后命令
//发送开始 0011 1100
//发送数据   
//发送结束
   UART_SendArray( cmdf,sizeof(cmdf));    //先发送前命令
   UART_SendArray( (uint8_t *)var,sizeof(var));    //发送数据
   UART_SendArray( cmdr,sizeof(cmdr));    //发送后命令

}


