chcp 65001
echo OFF
setlocal enabledelayedexpansion


@echo off

:: Check for admin rights
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative privileges confirmed.
    goto :main
) else (
    echo Requesting administrative privileges...
    goto :getAdmin
)

:getAdmin
    echo Set objShell = CreateObject("Shell.Application") > "%temp%\Admin.vbs"
    echo objShell.ShellExecute "cmd.exe", "/k %~s0", "", "runas", 1 >> "%temp%\Admin.vbs"
    "%temp%\Admin.vbs"
    del "%temp%\Admin.vbs"
    goto :eof

:main

set WORKDIR=%~dp0
set netcmd=%WORKDIR%dhcp.bat

START /wait   CMD /c "!netcmd!"