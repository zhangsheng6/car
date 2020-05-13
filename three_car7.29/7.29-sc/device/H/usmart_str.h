#ifndef __USMART_STR_H
#define __USMART_STR_H

uint8 usmart_get_parmpos(uint8 num);						//得到某个参数在参数列里面的起始位置
uint8 usmart_strcmp(uint8*str1,uint8 *str2);					//对比两个字符串是否相等
uint32 usmart_pow(uint8 m,uint8 n);							//M^N次方
uint8 usmart_str2num(uint8*str,uint32 *res);					//字符串转为数字
uint8 usmart_get_cmdname(uint8*str,uint8*cmdname,uint8 *nlen,uint8 maxlen);//从str中得到指令名,并返回指令长度
uint8 usmart_get_fname(uint8*str,uint8*fname,uint8 *pnum,uint8 *rval);		//从str中得到函数名
uint8 usmart_get_aparm(uint8 *str,uint8 *fparm,uint8 *ptype); 	//从str中得到一个函数参数
uint8 usmart_get_fparam(uint8*str,uint8 *parn);  			//得到str中所有的函数参数.
#endif











