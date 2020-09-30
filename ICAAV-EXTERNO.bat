@echo off
TITLE INSTALADOR ICAAVWIN
COLOR 0A
MODE con:cols=48 lines=8

:CheckOS
IF EXIST "%windir%\SysWOW64\odbcad32.exe" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
cd %windir%\SysWOW64\
dbdsn.exe -y -x tcpip(host=fama.dnsalias.com:2638) -w icaavcapa -c "uid=admin;pwd=admin" -n "fama"
dbdsn.exe -y -x tcpip(host=fama.dnsalias.com:49152) -w iris -c "uid=admin;pwd=admin" -n "fama_iris"
goto exit

:32BIT
cd C:\Windows\System32
dbdsn.exe -y -x tcpip(host=fama.dnsalias.com:2638) -w icaavcapa -c "uid=admin;pwd=admin" -n "fama"
dbdsn.exe -y -x tcpip(host=fama.dnsalias.com:49152) -w iris -c "uid=admin;pwd=admin" -n "fama_iris"
exit
