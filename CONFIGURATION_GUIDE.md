# Event Booking System - Configuration Guide

## 🔧 Environment Variables Overview

Your project uses environment variables for secure configuration. All sensitive data (API keys, secrets, database credentials) are stored in `.env` files that are never committed to git.

### Backend Configuration (.env)

**Database**
```
MONGO_URI=mongodb+srv://user:password@cluster.mongodb.net/dbname
```
Your MongoDB Atlas connection string (already configured)

**Authentication**
```
JWT_SECRET=5f9c4ab08cac7457e9111a30e4664882d67c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f
```
Secure token for JWT authentication

**Payment Processing**
```
STRIPE_SECRET_KEY=sk_test_...
RAZORPAY_KEY_ID=rzp_test_...
RAZORPAY_KEY_SECRET=...
```
Payment gateway credentials (already configured)

**Email Notifications**
```
EMAIL_USER=your-email@gmail.com
EMAIL_PASSWORD=app-specific-password
```
For sending booking confirmations and notifications

**Server**
```
PORT=5000
NODE_ENV=development
CORS_ORIGIN=http://localhost:3001
```
Server port and CORS settings for frontend access

### Frontend Configuration (.env)

**API Connection**
```
REACT_APP_API_URL=http://localhost:5000
```
Backend API base URL

**Stripe Integration**
```
REACT_APP_STRIPE_PUBLIC_KEY=pk_test_...
```
Public Stripe key for payment forms

---

## 📝 How to Update Keys

### 1. Get Stripe Keys
- Visit https://dashboard.stripe.com/apikeys
- Copy `Secret Key` → `STRIPE_SECRET_KEY`
- Copy `Publishable Key` → `STRIPE_PUBLIC_KEY`

### 2. Get Razorpay Keys
- Visit https://dashboard.razorpay.com/app/keys
- Copy Key ID and Key Secret

### 3. Get Gmail App Password
- Enable 2FA on Gmail account
- Visit https://myaccount.google.com/apppasswords
- Select Mail and Windows Computer
- Copy the generated password → `EMAIL_PASSWORD`

### 4. MongoDB Atlas Connection
- Already configured in your `.env`
- Connection string format: `mongodb+srv://user:pass@cluster.mongodb.net/database`

---

## 🚀 Development Workflow

### Quick Setup
```bash
# Run from project root
./setup.sh          # Mac/Linux
setup.bat          # Windows
```

### Start Development
```bash
# Terminal 1: Backend
cd backend
npm run dev

# Terminal 2: Frontend
cd frontend
npm start
```

Or use the quick start script:
```bash
./start-dev.sh      # Mac/Linux
start-dev.bat       # Windows
```

---

## 🌐 Production Deployment

### Update Environment Variables for Production

**For Render.com:**
1. Add new Environment Variables in Render dashboard:
   - `MONGO_URI` → Production MongoDB Atlas URI
   - `JWT_SECRET` → Generate a strong random string
   - All other keys from above

**For Vercel (Frontend):**
1. Add Environment Variables in Vercel project settings:
   - `REACT_APP_API_URL` → Your backend production URL
   - `REACT_APP_STRIPE_PUBLIC_KEY` → Live Stripe key

---

## ✅ Verify Configuration

### Test Backend
```bash
curl http://localhost:5000/api/health
# Should return: {"status":"Server is running"}
```

### Check Environment
```bash
# In Node (backend directory)
node -e "console.log(process.env.MONGO_URI)"
```

### Common Issues
- **CORS errors**: Check `CORS_ORIGIN` matches frontend URL
- **DB connection fails**: Verify `MONGO_URI` string
- **API calls 404**: Confirm `REACT_APP_API_URL` is correct

---

## 🔐 Security Best Practices

1. ✅ Never commit `.env` files (already in .gitignore)
2. ✅ Use strong random strings for `JWT_SECRET` (32+ chars)
3. ✅ Use app-specific passwords for email (not main password)
4. ✅ Rotate keys periodically in production
5. ✅ Use environment-specific secrets (test keys in dev, live keys in prod)

---

## 📚 Related Files
- [PRE_DEPLOYMENT_CHECKLIST.md](./PRE_DEPLOYMENT_CHECKLIST.md) - Deployment readiness
- [RENDER_DEPLOYMENT.md](./RENDER_DEPLOYMENT.md) - Deploy to Render
- [DEBUGGING_GUIDE.md](./DEBUGGING_GUIDE.md) - Troubleshooting
