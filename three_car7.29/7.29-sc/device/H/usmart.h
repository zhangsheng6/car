#ifndef __USMART_H
#define __USMART_H
#include "usmart_str.h"

////////////////////////////////////////////�û����ò���////////////////////////////////////////////////////
#define MAX_FNAME_LEN 		30	//��������󳤶ȣ�Ӧ������Ϊ��С����������ĳ��ȡ�
#define MAX_PARM 			10	//���Ϊ10������ ,�޸Ĵ˲���,�����޸�usmart_exe��֮��Ӧ.
#define PARM_LEN 			200	//���в���֮�͵ĳ��Ȳ�����PARM_LEN���ֽ�,ע�⴮�ڽ��ղ���Ҫ��֮��Ӧ(��С��PARM_LEN)


#define USMART_ENTIMX_SCAN 	1	//ʹ��TIM�Ķ�ʱ�ж���ɨ��SCAN����,�������Ϊ0,��Ҫ�Լ�ʵ�ָ�һ��ʱ��ɨ��һ��scan����.
								//ע��:���Ҫ��runtimeͳ�ƹ���,��������USMART_ENTIMX_SCANΪ1!!!!

#define USMART_USE_HELP		1	//ʹ�ð�������ֵ��Ϊ0�����Խ�ʡ��700���ֽڣ����ǽ������޷���ʾ������Ϣ��
#define USMART_USE_WRFUNS	1	//ʹ�ö�д����,ʹ������,���Զ�ȡ�κε�ַ��ֵ,������д�Ĵ�����ֵ.
///////////////////////////////////////////////END///////////////////////////////////////////////////////////

#define USMART_OK 			0  //�޴���
#define USMART_FUNCERR 		1  //��������
#define USMART_PARMERR 		2  //��������
#define USMART_PARMOVER 	3  //�������
#define USMART_NOFUNCFIND 	4  //δ�ҵ�ƥ�亯��

#define SP_TYPE_DEC      	0  //10���Ʋ�����ʾ
#define SP_TYPE_HEX       	1  //16���Ʋ�����ʾ


 //�������б�
struct _m_usmart_nametab
{
	void* func;			//����ָ��
	uint8* const name;		//������(���Ҵ�)
};
//usmart���ƹ�����
struct _m_usmart_dev
{
	struct _m_usmart_nametab *funs;	//������ָ��

	void (*init)(uint8);				//��ʼ��
	uint8 (*cmd_rec)(uint8*str);			//ʶ������������
	void (*exe)(void); 				//ִ��
	void (*scan)(void);             //ɨ��
	uint8 fnum; 				  		//��������
	uint8 pnum;                        //��������
	uint8 id;							//����id
	uint8 sptype;						//������ʾ����(���ַ�������):0,10����;1,16����;
	uint16 parmtype;					//����������
	uint8  plentbl[MAX_PARM];  		//ÿ�������ĳ����ݴ��
	uint8  parm[PARM_LEN];  			//�����Ĳ���
	uint8 runtimeflag;					//0,��ͳ�ƺ���ִ��ʱ��;1,ͳ�ƺ���ִ��ʱ��,ע��:�˹��ܱ�����USMART_ENTIMX_SCANʹ�ܵ�ʱ��,������
	uint32 runtime;					//����ʱ��,��λ:0.1ms,�����ʱʱ��Ϊ��ʱ��CNTֵ��2��*0.1ms
};
extern struct _m_usmart_nametab usmart_nametab[];	//��usmart_config.c���涨��
extern struct _m_usmart_dev usmart_dev;				//��usmart_config.c���涨��


void usmart_init(uint8 sysclk);//��ʼ��
uint8 usmart_cmd_rec(uint8*str);	//ʶ��
void usmart_exe(void);		//ִ��
void usmart_scan(void);     //ɨ��
uint32 read_addr(uint32 addr);	//��ȡָ����ַ��ֵ
void write_addr(uint32 addr,uint32 val);//��ָ����ַд��ָ����ֵ
uint32 usmart_get_runtime(void);	//��ȡ����ʱ��
void usmart_reset_runtime(void);//��λ����ʱ��

#endif






























