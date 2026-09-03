@echo off
chcp 65001 >nul
title Arc Orbiter - Stella Montis (Local)
cd /d "%~dp0"

set PORT=8000
set PY=python
%PY% --version >nul 2>nul
if errorlevel 1 set PY=py -3
%PY% --version >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Python not found. Please install Python 3 and add it to PATH.
  pause
  exit /b 1
)

echo ============================================================
echo   Arc Orbiter - Stella Montis  (Local Offline Edition)
echo ============================================================
echo   Serving: %CD%
echo   URL    : http://localhost:%PORT%/stella-montis/
echo ============================================================
echo.

start "Arc Orbiter Server" /min %PY% -m http.server %PORT% --bind 127.0.0.1

echo Waiting for server to be ready...
:waitloop
timeout /t 1 >nul
curl.exe -s -o nul --max-time 2 "http://127.0.0.1:%PORT%/stella-montis/index.html"
if errorlevel 1 goto waitloop

start "" "http://localhost:%PORT%/stella-montis/"
echo.
echo Server is running. Browser should open automatically.
echo If not, open manually:  http://localhost:%PORT%/stella-montis/
echo.
echo To stop: close the minimized "Arc Orbiter Server" window.
echo.
pause
