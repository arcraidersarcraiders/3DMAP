@echo off
chcp 65001 >nul
title Arc Orbiter - Stella Montis (离线版)
cd /d "%~dp0"

set "PAGE=%CD%\stella-montis\index.html"
if not exist "%PAGE%" (
  echo.
  echo   [错误] 找不到 stella-montis\index.html
  echo   请确保本文件与 stella-montis、viewer、data 三个文件夹在同一目录。
  echo.
  pause
  exit /b 1
)

rem ---- 自动探测 Edge / Chrome ----
set "BROWSER="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "BROWSER=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"
if not defined BROWSER if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "BROWSER=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if not defined BROWSER if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "BROWSER=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if not defined BROWSER (
  echo.
  echo   [错误] 未检测到 Edge 或 Chrome 浏览器。
  echo   本离线查看器需要基于 Chromium 内核的浏览器才能读取本地数据。
  echo.
  pause
  exit /b 1
)

rem ---- 使用独立的浏览器配置目录，避免影响你日常使用的浏览器 ----
set "PROFILE=%CD%\.viewer-profile"
if not exist "%PROFILE%" mkdir "%PROFILE%" >nul 2>&1

set "URL=file:///%PAGE:\=/%"

echo.
echo   ============================================================
echo     Arc Orbiter - Stella Montis  离线版
echo   ============================================================
echo     数据目录: %CD%\data
echo     浏览器  : %BROWSER%
echo   ============================================================
echo.
echo   正在启动，首次加载约需十几秒（需读取约 508MB 本地数据）...
echo.

start "" "%BROWSER%" --allow-file-access-from-files --user-data-dir="%PROFILE%" --window-size=1440,900 "%URL%"

exit /b 0
