#!/bin/bash

# Quick Start Script - Opens both Frontend and Backend in separate terminals
# Run this from the project root directory

echo ""
echo "===================================="
echo "🚀 Event Booking System - Quick Start"
echo "===================================="
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed!"
    echo "Please install Node.js v16+ from https://nodejs.org"
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo ""

# Check MongoDB
if ! command -v mongod &> /dev/null; then
    echo "⚠️  MongoDB is not installed locally."
    echo "Make sure your MongoDB Atlas connection string is correct in backend/.env"
    echo ""
fi

echo "✅ Starting Backend Server..."
echo ""
echo "(Run this in Terminal 1)"
(cd backend && npm run dev) &
BACKEND_PID=$!

sleep 2

echo ""
echo "✅ Starting Frontend Server..."
echo ""
echo "(Run this in Terminal 2)"
(cd frontend && npm start) &
FRONTEND_PID=$!

echo ""
echo "===================================="
echo "🎉 Both servers are starting!"
echo "===================================="
echo ""
echo "Frontend: http://localhost:3000"
echo "Backend:  http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop both servers"
echo ""

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
