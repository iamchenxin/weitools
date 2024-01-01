@echo off
chcp 65001
setlocal enabledelayedexpansion

:: 恢复 DHCP 设置
netsh interface ip set address name="以太网" source=dhcp
netsh interface ipv4 set dnsservers name="以太网" source=dhcp

netsh int ip reset
echo 全网络连接,DHCP 设置已恢复。
echo Waiting for 1 seconds...
timeout /t 1 /nobreak >nul
start https://ip.sb/