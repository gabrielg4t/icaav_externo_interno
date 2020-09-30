@echo off
TITLE INSTALADOR ICAAVWIN
COLOR 0A
MODE con:cols=48 lines=8

:CheckOS
IF EXIST "%windir%\SysWOW64\odbcad32.exe" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
cd %windir%\SysWOW64\
dbdsn.exe -y -x tcpip() -w icaavcapa -c "uid=admin;pwd=admin" -n "icaavwin"
goto exit

:32BIT
cd %windir%\System32
dbdsn.exe -y -x tcpip() -w icaavcapa -c "uid=admin;pwd=admin" -n "icaavwin"
exit
