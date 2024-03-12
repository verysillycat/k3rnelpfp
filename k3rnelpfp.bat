@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

echo.
echo.
    type ascii.txt
    echo.
echo.
    color 07
    echo This is a KernelOS script to manually force to change the profile picture
    timeout /t 2 /nobreak >nul
    timeout /t 1 /nobreak >nul
    echo Executing in 3 Seconds
    timeout /t 3 /nobreak >nul
   color 04
cls
    set /p srcDir="Enter the exact directory where the Profile Picture files are located: "
    cd /d "%srcDir%"

    copy /Y user.bmp "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user.png "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user-32.png "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user-40.png "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user-48.png "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user-192.png "%ProgramData%\Microsoft\User Account Pictures"
    copy /Y user-200.png "%ProgramData%\Microsoft\User Account Pictures"

    if errorlevel 1 (
        echo Files not found. Exiting...
        timeout /t 2 /nobreak >nul
        exit /B
    )
