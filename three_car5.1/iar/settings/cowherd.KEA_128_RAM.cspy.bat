@REM 这批处理文件已经由IAR Embedded Workbench生成
@REM C-SPY调试器，作为援助准备运行一个命令行
@REM 这个 cspybat 命令行实用程序使用适当的设置。
@REM
@REM 注意，每次新的调试会话都会生成该文件
@REM 初始化，所以您可能要移动或重命名文件之前
@REM 做出改变。
@REM
@REM 你可以启动cspybat键入这个批处理文件的名称
@REM 通过调试文件的名称 (通常是一个 ELF/DWARF 或 UBROF 文件).
@REM
@REM 阅读关于可用的命令行参数在C-SPY调试
@REM 指南。也许可以提示额外的命令行参数
@REM 在特定情况下有用：
@REM   --仅下载   下载代码映像而不启动调试
@REM                     会话之后。
@REM   --默认          省略登录消息。
@REM   --超时         限制允许的最大执行时间。
@REM 


@echo off 

if not "%1" == "" goto debugFile 

@echo on 

"F:\IAR安装包\common\bin\cspybat" -f "H:\智能车程序2018\电磁三轮——ZS\5.1\iar\settings\cowherd.KEA_128_RAM.general.xcl" --backend -f "H:\智能车程序2018\电磁三轮——ZS\5.1\iar\settings\cowherd.KEA_128_RAM.driver.xcl" 

@echo off 
goto end 

:debugFile 

@echo on 

"F:\IAR安装包\common\bin\cspybat" -f "H:\智能车程序2018\电磁三轮——ZS\5.1\iar\settings\cowherd.KEA_128_RAM.general.xcl" "--debug_file=%1" --backend -f "H:\智能车程序2018\电磁三轮——ZS\5.1\iar\settings\cowherd.KEA_128_RAM.driver.xcl" 

@echo off 
:end