@echo off
setlocal enabledelayedexpansion
title BLOOD.DROP Launcher

echo ================================
echo   BLOOD.DROP - Starting up...
echo ================================
echo.

:: Start signaling server
start "BLOOD.DROP Signaling Server" cmd /k "cd /d %~dp0server && node index.js"
timeout /t 2 /nobreak > nul

:: Start frontend
start "BLOOD.DROP Frontend" cmd /k "cd /d %~dp0client && python -m http.server 8080"
timeout /t 2 /nobreak > nul

:: Get local IP
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr "IPv4"') do set LOCALIP=%%a
set LOCALIP=%LOCALIP: =%

:: Open browser
start http://localhost:8080

echo ================================
echo   BLOOD.DROP is running!
echo ================================
echo.
echo   This device:   http://localhost:8080
echo   Other devices: http://%LOCALIP%:8080
echo.
echo   Open that URL on your iPhone or
echo   other laptop (same WiFi only).
echo.
echo   Close this window to stop BLOOD.DROP.
echo ================================
pause
taskkill /fi "WINDOWTITLE eq BLOOD.DROP Signaling Server" /f > nul 2>&1
taskkill /fi "WINDOWTITLE eq BLOOD.DROP Frontend" /f > nul 2>&1
