#include "SKEAZ1284.h"
#include "usmart_str.h"
#include "usmart.h"
#include "allHead.h"

/*****************************************************************/
UART_Type * USMART_uart[3] = UART_BASES;
uint16 USART_RX_STA = 0;
uint8 USART_RX_BUF[100] = {0};

/**
  * ���
  *     ��ȡ��������
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


//��str�л�ȡ������,id,��������Ϣ
//*str:�ַ���ָ��.
//����ֵ:0,ʶ��ɹ�;����,�������.
uint8 usmart_cmd_rec(uint8*str)
{
	uint8 sta,i,rval;//״̬
	uint8 rpnum,spnum;
	uint8 rfname[MAX_FNAME_LEN];//�ݴ�ռ�,���ڴ�Ž��յ��ĺ�����
	uint8 sfname[MAX_FNAME_LEN];//��ű��غ�����

	sta = usmart_get_fname(str,rfname,&rpnum,&rval);//�õ����յ������ݵĺ���������������
	if(sta)return sta;//����
	for(i=0;i<usmart_dev.fnum;i++)
	{
		sta=usmart_get_fname((uint8*)usmart_dev.funs[i].name,sfname,&spnum,&rval);//�õ����غ���������������
		if(sta)return sta;//���ؽ�������
		if(usmart_strcmp(sfname,rfname)==0)//���
		{
			if(spnum>rpnum)return USMART_PARMERR;//��������(���������Դ����������)
			usmart_dev.id=i;//��¼����ID.
			break;//����.
		}
	}
	if(i==usmart_dev.fnum)return USMART_NOFUNCFIND;	//δ�ҵ�ƥ��ĺ���
 	sta=usmart_get_fparam(str,&i);					//�õ�������������
	if(sta)return sta;								//���ش���
	usmart_dev.pnum=i;								//����������¼
    return USMART_OK;
}
//usamrtִ�к���
//�ú�����������ִ�дӴ����յ�����Ч����.
//���֧��10�������ĺ���,����Ĳ���֧��Ҳ������ʵ��.�����õĺ���.һ��5�����ҵĲ����ĺ����Ѿ����ټ���.
//�ú������ڴ��ڴ�ӡִ�����.��:"������(����1������2...����N)=����ֵ".����ʽ��ӡ.
//����ִ�еĺ���û�з���ֵ��ʱ��,����ӡ�ķ���ֵ��һ�������������.
void usmart_exe(void)
{
	uint8 id,i;
	uint32 res;
	uint32 temp[MAX_PARM];//����ת��,ʹ֧֮�����ַ���
	uint8 sfname[MAX_FNAME_LEN];//��ű��غ�����
	uint8 pnum,rval;

	id=usmart_dev.id;
	if(id>=usmart_dev.fnum)return;//��ִ��.
	usmart_get_fname((uint8*)usmart_dev.funs[id].name,sfname,&pnum,&rval);//�õ����غ�����,����������

	switch(usmart_dev.pnum)
	{
		case 0://�޲���(void����)
			res=(*(uint32(*)())usmart_dev.funs[id].func)();
			break;
	    case 1://��1������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0]);
			break;
	    case 2://��2������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1]);
			break;
	    case 3://��3������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2]);
			break;
	    case 4://��4������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3]);
			break;
	    case 5://��5������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4]);
			break;
	    case 6://��6������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5]);
			break;
	    case 7://��7������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6]);
			break;
	    case 8://��8������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7]);
			break;
	    case 9://��9������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7],temp[8]);
			break;
	    case 10://��10������
			res=(*(uint32(*)())usmart_dev.funs[id].func)(temp[0],temp[1],temp[2],temp[3],temp[4],\
			temp[5],temp[6],temp[7],temp[8],temp[9]);
			break;
	}
}
//usmartɨ�躯��
//ͨ�����øú���,ʵ��usmart�ĸ�������.�ú�����Ҫÿ��һ��ʱ�䱻����һ��
//�Լ�ʱִ�дӴ��ڷ������ĸ�������.
//�������������ж��������,�Ӷ�ʵ���Զ�����.
//�����ALIENTEK�û�,��USART_RX_STA��USART_RX_BUF[]��Ҫ�û��Լ�ʵ��
void usmart_scan(void)
{
	uint8 sta,len;

    GetUartData();
	if(USART_RX_STA&0x8000)//���ڽ�����ɣ�
	{
		len=USART_RX_STA&0x3fff;	//�õ��˴ν��յ������ݳ���
		USART_RX_BUF[len]='\0';	//��ĩβ���������.
		sta=usmart_dev.cmd_rec(USART_RX_BUF);//�õ�����������Ϣ
		if(sta==0)usmart_dev.exe();	//ִ�к���
		else
		{
			BUZZER_ON;
		}
		USART_RX_STA=0;//״̬�Ĵ������
	}
}

#if USMART_USE_WRFUNS==1 	//���ʹ���˶�д����
//��ȡָ����ַ��ֵ
uint32 read_addr(uint32 addr)
{
	return *(uint32*)addr;//
}
//��ָ����ַд��ָ����ֵ
void write_addr(uint32 addr,uint32 val)
{
	*(uint32*)addr=val;
}
#endif













