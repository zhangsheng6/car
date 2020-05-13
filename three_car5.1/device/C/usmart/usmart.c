#include "SKEAZ1284.h"
#include "usmart_str.h"
#include "usmart.h"
#include "allHead.h"

/*****************************************************************/
UART_Type * USMART_uart[3] = UART_BASES;
uint16 USART_RX_STA = 0;
uint8 USART_RX_BUF[100] = {0};

/**
  * 简介
  *     获取串口数据
  */
void GetUartData()
{
    uint8 temp = 0;

    if ( !(USMART_uart[UART_PART]->S1 & UART_S1_RDRF_MASK))
    {
        USART_RX_STA = 0;
    }
    else
    {
        for (USART_RX_STA=0; !(USART_RX_STA&0x8000); USART_RX_STA++)
        {
            while ( !(USMART_uart[UART_PART]->S1 & UART_S1_RDRF_MASK) );
            USART_RX_BUF[USART_RX_STA] =  USMART_uart[UART_PART]->D;

            if (USART_RX_STA>0)
            {
                if ((USART_RX_BUF[USART_RX_STA-1]=='\r') && (USART_RX_BUF[USART_RX_STA]=='\n') )
                {
                    USART_RX_STA |= 0x8000;
                }
            }
        }
    }
}

/*****************************************************************/


//从str中获取函数名,id,及参数信息
//*str:字符串指针.
//返回值:0,识别成功;其他,错误代码.
uint8 usmart_cmd_rec(uint8*str)
{
	uint8 sta,i,rval;//状态
	uint8 rpnum,spnum;
	uint8 rfname[MAX_FNAME_LEN];//暂存空间,用于存放接收到的函数名
	uint8 sfname[MAX_FNAME_LEN];//存放本地函数名

	sta = usmart_get_fname(str,rfname,&rpnum,&rval);//得到接收到的数据的函数名及参数个数
	if(sta)return sta;//错误
	for(i=0;i<usmart_dev.fnum;i++)
	{
		sta=usmart_get_fname((uint8*)usmart_dev.funs[i].name,sfname,&spnum,&rval);//得到本地函数名及参数个数
		if(sta)return sta;//本地解析有误
		if(usmart_strcmp(sfname,rfname)==0)//相等
		{
			if(spnum>rpnum)return USMART_PARMERR;//参数错误(输入参数比源函数参数少)
			usmart_dev.id=i;//记录函数ID.
			break;//跳出.
		}
	}
	if(i==usmart_dev.fnum)return USMART_NOFUNCFIND;	//未找到匹配的函数
 	sta=usmart_get_fparam(str,&i);					//得到函数参数个数
	if(sta)return sta;								//返回错误
	usmart_dev.pnum=i;								//参数个数记录
    return USMART_OK;
}
//usamrt执行函数
//该函数用于最终执行从串口收到的有效函数.
//最多支持10个参数的函数,更多的参数支持也很容易实现.不过用的很少.一般5个左右的参数的函数已经很少见了.
//该函数会在串口打印执行情况.以:"函数名(参数1，参数2...参数N)=返回值".的形式打印.
//当所执行的函数没有返回值的时候,所打印的返回值是一个无意义的数据.
void usmart_exe(void)
{
	uint8 id,i;
	uint32 res;
	uint32 temp[MAX_PARM];//参数转换,使之支持了字符串
	uint8 sfname[MAX_FNAME_LEN];//存放本地函数名
	uint8 pnum,rval;

	id=usmart_dev.id;
	if(id>=usmart_dev.fnum)return;//不执行.
	usmart_get_fname((uint8*)usmart_dev.funs[id].name,sfname,&pnum,&rval);//得到本地函数名,及参数个数

	switch(usmart_dev.pnum)
	{
		case 0://无参数(void类型)
			res=(*(uint32(*)())usmart_dev.funs[id].func)();
			break;
	    case 1://有1个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0]);
			break;
	    case 2://有2个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1]);
			break;
	    case 3://有3个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2]);
			break;
	    case 4://有4个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3]);
			break;
	    case 5://有5个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4]);
			break;
	    case 6://有6个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5]);
			break;
	    case 7://有7个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6]);
			break;
	    case 8://有8个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7]);
			break;
	    case 9://有9个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7],temp[8]);
			break;
	    case 10://有10个参数
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7],temp[8],temp[9]);
			break;
	}
}
//usmart扫描函数
//通过调用该函数,实现usmart的各个控制.该函数需要每隔一定时间被调用一次
//以及时执行从串口发过来的各个函数.
//本函数可以在中断里面调用,从而实现自动管理.
//如果非ALIENTEK用户,则USART_RX_STA和USART_RX_BUF[]需要用户自己实现
void usmart_scan(void)
{
	uint8 sta,len;

    GetUartData();
	if(USART_RX_STA&0x8000)//串口接收完成？
	{
		len=USART_RX_STA&0x3fff;	//得到此次接收到的数据长度
		USART_RX_BUF[len]='\0';	//在末尾加入结束符.
		sta=usmart_dev.cmd_rec(USART_RX_BUF);//得到函数各个信息
		if(sta==0)usmart_dev.exe();	//执行函数
		else
		{
			BUZZER_ON;
		}
		USART_RX_STA=0;//状态寄存器清空
	}
}

#if USMART_USE_WRFUNS==1 	//如果使能了读写操作
//读取指定地址的值
uint32 read_addr(uint32 addr)
{
	return *(uint32*)addr;//
}
//在指定地址写入指定的值
void write_addr(uint32 addr,uint32 val)
{
	*(uint32*)addr=val;
}
#endif













