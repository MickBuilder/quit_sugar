# Email Setup for Support Form

## Overview
The support form now sends emails server-side instead of opening the user's email client. This provides a better user experience and allows for proper email tracking.

## Setup Instructions

### 1. Create Environment File
Create a `.env.local` file in the root of the landing directory:

```bash
# Email Configuration
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
```

### 2. Gmail App Password Setup
For Gmail, you need to use an App Password, not your regular password:

1. Go to [Google Account Settings](https://myaccount.google.com/)
2. Navigate to Security → 2-Step Verification
3. Generate an App Password for "Mail"
4. Use this App Password in your `.env.local` file

### 3. Alternative Email Services
You can modify the `nodemailer` configuration in `app/api/send-support-email/route.ts` to use other email services:

#### For Outlook/Hotmail:
```typescript
const transporter = nodemailer.createTransport({
  service: 'outlook',
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});
```

#### For Custom SMTP:
```typescript
const transporter = nodemailer.createTransport({
  host: 'your-smtp-host.com',
  port: 587,
  secure: false,
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});
```

## How It Works

1. User fills out the support form
2. Form data is sent to `/api/send-support-email`
3. Server validates the data and sends email to `sugaddict-support@mikebapps.com`
4. User receives confirmation message
5. Form is cleared on successful submission

## Security Notes

- Never commit `.env.local` to version control
- Use App Passwords for Gmail (not regular passwords)
- Consider rate limiting for production use
- Validate email inputs server-side

## Testing

1. Set up your environment variables
2. Run `npm run dev`
3. Navigate to `/support`
4. Fill out and submit the form
5. Check your email for the support request
