@echo off
REM Quick Start Script - Opens both Frontend and Backend in separate terminals
REM Run this from the project root directory

echo.
echo ====================================
echo 🚀 Event Booking System - Quick Start
echo ====================================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed!
    echo Please install Node.js v16+ from https://nodejs.org
    pause
    exit /b 1
)

echo ✅ Starting Backend Server...
echo.
echo (A new terminal will open for the backend)
start cmd /k "cd backend && npm run dev"

echo.
timeout /t 3

echo ✅ Starting Frontend Server...
echo.
echo (A new terminal will open for the frontend)
start cmd /k "cd frontend && npm start"

echo.
echo ====================================
echo 🎉 Both servers are starting!
echo ====================================
echo.
echo Frontend: http://localhost:3000
echo Backend:  http://localhost:5000
echo.
echo Setup complete! Check the opened terminal windows.
echo.
pause
