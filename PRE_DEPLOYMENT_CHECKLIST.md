# Event Booking System - Pre-Deployment Checklist

## ✅ Environment Setup
- [ ] Backend `.env` file exists with all required variables:
  - [ ] MONGO_URI (MongoDB Atlas connection string)
  - [ ] JWT_SECRET (random secure string)
  - [ ] STRIPE_SECRET_KEY (from Stripe dashboard)
  - [ ] STRIPE_PUBLIC_KEY (from Stripe dashboard)
  - [ ] EMAIL_USER and EMAIL_PASSWORD (Gmail or SendGrid)
  - [ ] RAZORPAY_KEY_ID and RAZORPAY_KEY_SECRET (if using Razorpay)
  - [ ] CORS_ORIGIN (frontend URL)

- [ ] Frontend `.env` file exists with:
  - [ ] REACT_APP_API_URL (backend API URL)
  - [ ] REACT_APP_STRIPE_PUBLIC_KEY (matching backend)

## ✅ Code Quality
- [ ] Backend dependencies installed: `cd backend && npm install`
- [ ] Frontend dependencies installed: `cd frontend && npm install`
- [ ] Backend starts without errors: `npm run dev`
- [ ] Frontend builds successfully: `npm run build`
- [ ] No console errors in browser DevTools
- [ ] API health check passes: GET http://localhost:5000/api/health

## ✅ Feature Testing
- [ ] User registration works
- [ ] User login works
- [ ] Events can be viewed
- [ ] Events can be booked
- [ ] Stripe payment integration works
- [ ] Email notifications send (optional)
- [ ] Admin panel is accessible
- [ ] Dashboard loads all data correctly

## ✅ Database
- [ ] MongoDB Atlas cluster is set up
- [ ] Database collections are created
- [ ] Test data (events) can be created via API or script
- [ ] Database credentials are secure (in .env)

## ✅ Security
- [ ] `.env` file is in `.gitignore` (not committed to git)
- [ ] All sensitive keys are environment variables
- [ ] JWT_SECRET is strong (random 32+ character string)
- [ ] CORS_ORIGIN is set to specific domain (not *)
- [ ] HTTPS will be used in production

## ✅ Deployment Preparation

### For Render.com Deployment
- [ ] Code is pushed to GitHub
- [ ] Render account created and authorized
- [ ] MongoDB Atlas database configured
- [ ] Environment variables added to Render dashboard
- [ ] See RENDER_DEPLOYMENT.md for detailed steps

### For Vercel Deployment (Frontend)
- [ ] Frontend build succeeds locally
- [ ] API_URL environment variable set in Vercel
- [ ] See vercel.json configuration

### For Docker Deployment
- [ ] Docker Desktop installed
- [ ] docker-compose.yml configured correctly
- [ ] Can run: `docker-compose up`

## ✅ Documentation
- [ ] README.md is complete
- [ ] API_DOCUMENTATION.md exists
- [ ] Environment variable documentation is clear
- [ ] Deployment steps are documented

## 🚀 Ready to Deploy?
Once all boxes are checked, you're ready to:
1. Push code to GitHub: `git add . && git commit -m "Ready for production" && git push`
2. Follow the deployment guide for your chosen platform
3. Test deployment thoroughly in staging/production

**Deployment Guides:**
- [Render Deployment](./RENDER_DEPLOYMENT.md)
- [Docker Deployment](./docker-compose.yml)
- [Vercel Config](./vercel.json)

