@REM ���������ļ��Ѿ���IAR Embedded Workbench����
@REM C-SPY����������ΪԮ��׼������һ��������
@REM ��� cspybat ������ʵ�ó���ʹ���ʵ������á�
@REM
@REM ע�⣬ÿ���µĵ��ԻỰ�������ɸ��ļ�
@REM ��ʼ��������������Ҫ�ƶ����������ļ�֮ǰ
@REM �����ı䡣
@REM
@REM ���������cspybat��������������ļ�������
@REM ͨ�������ļ������� (ͨ����һ�� ELF/DWARF �� UBROF �ļ�).
@REM
@REM �Ķ����ڿ��õ������в�����C-SPY����
@REM ָ�ϡ�Ҳ�������ʾ����������в���
@REM ���ض���������ã�
@REM   --������   ���ش���ӳ�������������
@REM                     �Ự֮��
@REM   --Ĭ��          ʡ�Ե�¼��Ϣ��
@REM   --��ʱ         ������������ִ��ʱ�䡣
@REM 


@echo off 

if not "%1" == "" goto debugFile 

@echo on 

"F:\IAR��װ��\common\bin\cspybat" -f "H:\���ܳ�����2018\������֡���ZS\5.1\iar\settings\cowherd.KEA_128_RAM.general.xcl" --backend -f "H:\���ܳ�����2018\������֡���ZS\5.1\iar\settings\cowherd.KEA_128_RAM.driver.xcl" 

@echo off 
goto end 

:debugFile 

@echo on 

"F:\IAR��װ��\common\bin\cspybat" -f "H:\���ܳ�����2018\������֡���ZS\5.1\iar\settings\cowherd.KEA_128_RAM.general.xcl" "--debug_file=%1" --backend -f "H:\���ܳ�����2018\������֡���ZS\5.1\iar\settings\cowherd.KEA_128_RAM.driver.xcl" 

@echo off 
:end