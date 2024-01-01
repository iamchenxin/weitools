@echo off
chcp 65001
setlocal enabledelayedexpansion

set IPADDR=192.168.6.79
set GATEWAY=192.168.6.1
set PRIMARYDNS=114.114.114.114
set SECONDARYDNS=114.114.114.114
set NETMASK=255.255.255.0

if not "%1"=="" set IPADDR=%1
if not "%2"=="" set GATEWAY=%2
if not "%3"=="" set PRIMARYDNS=%3
if not "%4"=="" set SECONDARYDNS=%4

@echo on
netsh interface ip set address name="以太网" source=static addr=%IPADDR% mask=%NETMASK% gateway=%GATEWAY% 
netsh interface ipv4 set dnsservers name="以太网" static address=%PRIMARYDNS%
netsh int ip reset
echo 设置成功！
echo Waiting for 3 seconds...
timeout /t 3 /nobreak >nul
start https://ip.sb/


