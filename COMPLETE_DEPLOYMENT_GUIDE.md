# Event Booking System - Complete Deployment Guide

## 🎯 Quick Overview

Your project is ready to deploy! Here are your deployment options:

1. **Render.com** (Recommended for full-stack) - See detailed steps below
2. **Vercel** (Best for frontend only)
3. **Docker** (Self-hosted or any cloud provider)

---

## 🚀 Option 1: Deploy to Render.com (RECOMMENDED)

### Prerequisites
- GitHub account with your code pushed
- Render account (free tier available at render.com)
- MongoDB Atlas account (free tier available)

### Step 1: Prepare Your Code

```bash
# Initialize git if not already done
git init
git add .
git commit -m "Ready for Render deployment"

# Push to GitHub (create a new repo on github.com first)
git remote add origin https://github.com/YOUR_USERNAME/event-booking-system.git
git branch -M main
git push -u origin main
```

### Step 2: Set Up MongoDB Atlas

1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free account
3. Create a new cluster (free tier)
4. Add a database user with a password
5. Get your connection string (looks like: `mongodb+srv://user:pass@cluster.mongodb.net/dbname`)
6. **Keep this string safe** - you'll need it in Render

### Step 3: Deploy Backend to Render

1. Sign up at https://render.com (use GitHub login)
2. Click **New +** → **Web Service**
3. Connect your GitHub repository
4. Configure:
   - **Name**: `event-booking-backend`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Instance Type**: Free (for starting)

5. Click **Create Web Service**

### Step 4: Add Environment Variables to Render

In Render dashboard for your backend service:

1. Go to **Environment** tab
2. Add these variables:

```
MONGO_URI=<your MongoDB Atlas connection string>
JWT_SECRET=<generate: openssl rand -hex 32>
STRIPE_SECRET_KEY=sk_test_your_key
STRIPE_PUBLIC_KEY=pk_test_your_key
RAZORPAY_KEY_ID=rzp_test_...
RAZORPAY_KEY_SECRET=...
NODE_ENV=production
PORT=5000
CORS_ORIGIN=<your frontend domain>
EMAIL_USER=your-email@gmail.com
EMAIL_PASSWORD=app-password
```

3. Click **Deploy** to restart with new variables

### Step 5: Deploy Frontend to Render

1. In Render dashboard, click **New +** → **Static Site**
2. Connect your GitHub repository (same repo)
3. Configure:
   - **Name**: `event-booking-frontend`
   - **Build Command**: `cd frontend && npm install && npm run build`
   - **Publish Directory**: `frontend/build`

4. Click **Create Static Site**

### Step 6: Update Frontend Environment

In Render dashboard for your frontend:

1. Go to **Environment** tab
2. Add:
```
REACT_APP_API_URL=https://your-backend-render.onrender.com
REACT_APP_STRIPE_PUBLIC_KEY=pk_test_your_key
```

3. Click **Deploy** to rebuild

### ✅ You're Live!
- Frontend URL: `https://your-frontend-render.onrender.com`
- Backend URL: `https://your-backend-render.onrender.com`

---

## 🚀 Option 2: Deploy Frontend to Vercel

### Step 1: Create Vercel Account
1. Go to https://vercel.com
2. Sign up with GitHub
3. Import your GitHub repository

### Step 2: Configure Build Settings
- **Framework**: React
- **Build Command**: `npm run build` (in frontend folder)
- **Output Directory**: `frontend/build`
- **Root Directory**: `frontend/`

### Step 3: Add Environment Variables
In Vercel project settings → Environment Variables:
```
REACT_APP_API_URL=https://your-backend-url
REACT_APP_STRIPE_PUBLIC_KEY=pk_live_your_key
```

### ✅ Frontend Deployed!
Your frontend is live at the Vercel URL. Connect it to your backend from Option 1.

---

## 🐳 Option 3: Docker Deployment

### Prerequisites
- Docker Desktop installed
- Docker Hub account (optional, for sharing images)

### Step 1: Build and Run Locally

```bash
# In project root directory
docker-compose up --build

# Open http://localhost:3000 (frontend)
# Open http://localhost:5000 (backend)
```

### Step 2: Deploy to Docker Host

#### On DigitalOcean App Platform:
1. Connect GitHub repository
2. Use `docker-compose.yml` configuration
3. Set environment variables in dashboard
4. Deploy!

#### On AWS Elastic Beanstalk:
1. Install EB CLI
2. Run: `eb create event-booking-prod`
3. Upload `docker-compose.yml`
4. Set environment variables
5. Deploy!

---

## 🔍 Testing Your Deployment

### After deployment, test these endpoints:

**Backend Health Check**
```bash
curl https://your-backend-url/api/health
# Should return: {"status":"Server is running"}
```

**Frontend LoadTesting**
1. Visit your frontend URL
2. Create a test account
3. Create/book an event
4. Verify database saves data
5. Test Stripe payment (with test card 4242 4242 4242 4242)

---

## 📊 Production Checklist

Before going live:

- [ ] Switch to live Stripe keys (`pk_live_`, `sk_live_`)
- [ ] Update Razorpay to production mode
- [ ] Use strong JWT_SECRET (32+ random characters)
- [ ] Set `NODE_ENV=production`
- [ ] Update email credentials to production email
- [ ] Set up error monitoring (Sentry, LogRocket)
- [ ] Enable HTTPS (automatic with Render/Vercel)
- [ ] Set up database backups (MongoDB Atlas automatic backups)
- [ ] Monitor database usage
- [ ] Test all user workflows in production

---

## 🐛 Troubleshooting Deployment

### Backend won't start
- Check `MONGO_URI` connection string
- Verify MongoDB Atlas IP whitelist includes Render's IP
- Check logs in Render dashboard

### Frontend shows API errors
- Verify `REACT_APP_API_URL` environment variable
- Check CORS_ORIGIN in backend
- Ensure backend service is running

### CORS errors
- Update `CORS_ORIGIN` to include frontend domain
- Frontend must match exactly (http vs https, domain, port)

### Database connection timeout
- Whitelist Render's IP in MongoDB Atlas
- Go to MongoDB Atlas → Security → IP Whitelist
- Add `0.0.0.0/0` for development (more restrictive in production)

### Can't see logs
- Render: Service → Logs tab
- Vercel: Deployments → Function logs
- Docker: `docker logs container-name`

---

## 📈 Next Steps After Deployment

1. Set up monitoring and alerts
2. Configure automated backups
3. Set up CI/CD pipeline for auto-deployment on git push
4. Monitor error rates and performance
5. Plan for scaling (upgrade from free tier when needed)
6. Set up SSL certificates (automatic on Render/Vercel)
7. Configure domain name and DNS

---

## 💡 Tips for Success

- **Start with free tier**: Test before upgrading
- **Monitor costs**: Set up billing alerts on cloud providers
- **Daily backups**: Enable MongoDB Atlas backup for peace of mind
- **Keep nodes updated**: Regular security patches
- **Test before production**: Thoroughly test in staging environment firstSave recent changes to git before deploying

---

## 🆘 Need Help?

- **Render Support**: https://render.com/docs
- **MongoDB Docs**: https://docs.mongodb.com
- **Stripe Integration**: https://stripe.com/docs
- **React Deployment**: https://create-react-app.dev/deployment
- **Project Debugging**: See DEBUGGING_GUIDE.md
