#ifndef __USMART_STR_H
#define __USMART_STR_H

uint8 usmart_get_parmpos(uint8 num);						//�õ�ĳ�������ڲ������������ʼλ��
uint8 usmart_strcmp(uint8*str1,uint8 *str2);					//�Ա������ַ����Ƿ����
uint32 usmart_pow(uint8 m,uint8 n);							//M^N�η�
uint8 usmart_str2num(uint8*str,uint32 *res);					//�ַ���תΪ����
uint8 usmart_get_cmdname(uint8*str,uint8*cmdname,uint8 *nlen,uint8 maxlen);//��str�еõ�ָ����,������ָ���
uint8 usmart_get_fname(uint8*str,uint8*fname,uint8 *pnum,uint8 *rval);		//��str�еõ�������
uint8 usmart_get_aparm(uint8 *str,uint8 *fparm,uint8 *ptype); 	//��str�еõ�һ����������
uint8 usmart_get_fparam(uint8*str,uint8 *parn);  			//�õ�str�����еĺ�������.
#endif











