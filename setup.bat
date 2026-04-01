@echo off
REM Event Booking System - Automated Setup Script (Windows)
REM This script sets up both frontend and backend for development

echo.
echo ======================================
echo 🚀 Event Booking System - Setup Script
echo ======================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed. Please install Node.js v16+ first.
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
echo ✅ Node.js version: %NODE_VERSION%
echo.

REM Backend Setup
echo 📦 Setting up Backend...
cd backend

if not exist node_modules (
    echo   Installing dependencies...
    call npm install
    echo ✅ Backend dependencies installed
) else (
    echo ✅ Backend dependencies already installed
)

echo.
echo ✅ Backend setup complete!
echo.

REM Frontend Setup
echo 📦 Setting up Frontend...
cd ..\frontend

if not exist node_modules (
    echo   Installing dependencies...
    call npm install
    echo ✅ Frontend dependencies installed
) else (
    echo ✅ Frontend dependencies already installed
)

echo.
echo ✅ Frontend setup complete!
echo.

REM Summary
echo ======================================
echo ✅ Setup Complete!
echo ======================================
echo.
echo To start development:
echo.
echo PowerShell Terminal 1 - Backend:
echo   cd backend
echo   npm run dev
echo.
echo PowerShell Terminal 2 - Frontend:
echo   cd frontend
echo   npm start
echo.
echo Frontend will run on: http://localhost:3000
echo Backend will run on: http://localhost:5000
echo.
pause
