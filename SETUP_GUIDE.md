# Event Booking System - Complete Setup Guide

## Quick Setup (5 minutes)

### 1. Install MongoDB Locally
- **Windows**: Download from https://www.mongodb.com/try/download/community
- **Mac**: `brew tap mongodb/brew && brew install mongodb-community`
- **Linux**: Follow https://docs.mongodb.com/manual/installation/

Start MongoDB:
```bash
# Windows
mongod

# Mac/Linux
brew services start mongodb-community

# Or manually
mongod --dbpath /path/to/data
```

### 2. Backend Setup
```bash
cd backend
npm install
npm run dev
```
✅ Backend runs on http://localhost:5000

### 3. Frontend Setup (New Terminal)
```bash
cd frontend
npm install
npm start
```
✅ Frontend runs on http://localhost:3000

---

## Configuration

### Backend Environment (.env)
The `.env` file in `backend/` is already created with development defaults:
- MongoDB local connection
- Stripe test keys placeholder
- JWT secret
- CORS origin pointing to frontend

**Update with your actual API keys:**
1. Get Stripe keys from https://dashboard.stripe.com/apikeys
2. Replace placeholder values in `backend/.env`

### Frontend Environment (.env)
The `.env` file in `frontend/` has:
- Backend API URL
- Stripe public key placeholder

---

## Deployment

### Option 1: Deploy to Render (Recommended)
See [RENDER_DEPLOYMENT.md](./RENDER_DEPLOYMENT.md)

### Option 2: Deploy to Vercel
See [vercel.json](./vercel.json) configuration

### Option 3: Deploy with Docker Compose
See [docker-compose.yml](./docker-compose.yml)

---

## Troubleshooting

- **MongoDB connection failed**: Make sure MongoDB is running
- **PORT already in use**: Change PORT in `.env`
- **CORS errors**: Update CORS_ORIGIN in `.env`
- **Stripe errors**: Verify API keys in `.env`

For more help, see [DEBUGGING_GUIDE.md](./DEBUGGING_GUIDE.md)
