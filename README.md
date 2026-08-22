# Leonardo Levi Joaquin Colorado — Professional Portfolio

A modern, high-performance portfolio highlighting software development skills, AI workflows, SQL databases, and 4+ years of American Eagle Outfitters (AEO) operational leadership.

---

## 📁 Project Structure

```
portfolio/
├── index.html       # Standalone main portfolio page (Tailwind CSS, Lucide icons, Dark/Light mode)
├── triage-engine/   # AI Escalation Triage Engine sub-application
├── asset-manager/  # Enterprise IT Asset Manager sub-application
├── assets/          # Static images & graphics
├── _headers         # Cloudflare Pages security headers configuration
├── .gitignore       # Excluded local development files
├── .env.example     # Environment variable documentation
├── SECURITY.md      # Security vulnerability reporting policy
└── README.md        # Documentation and deployment guide
```

---

## 💻 Local Development & Testing

### Requirements
- **Node.js Version**: Node.js v18+ (optional, only if using `npx serve`)
- **Installation Command**: `None` (Pure static HTML/CSS/JS — zero dependencies to install)

### Running Locally
Run a local static HTTP server from the root directory:

**Using Python:**
```powershell
python -m http.server 3000
```

**Using Node.js:**
```bash
npx serve .
```

Then open `http://localhost:3000` in your browser.

---

## ☁️ Cloudflare Pages Deployment Guide

This project is optimized for 1-click deployment on **Cloudflare Pages** via GitHub integration.

### Deployment Configuration Settings

| Setting | Value |
|---|---|
| **Framework Preset** | `None` (Static HTML) |
| **Build Command** | *(Leave empty)* |
| **Build Output Directory** | `/` (Root directory) |
| **Node.js Version** | N/A (Static files) |
| **Environment Variables** | *None required* |

### Step-by-Step Cloudflare Pages Setup

1. Log in to the [Cloudflare Dashboard](https://dash.cloudflare.com/).
2. Navigate to **Workers & Pages** $\rightarrow$ **Create Application** $\rightarrow$ **Pages** tab.
3. Click **Connect to Git** and select your repository (`snmn20mgf-jpg/portfolio`).
4. Select the `main` branch.
5. In **Build Settings**:
   - Set **Framework Preset** to `None`.
   - Leave **Build command** blank.
   - Set **Build output directory** to `/`.
6. Click **Save and Deploy**. Cloudflare Pages will automatically deploy your portfolio and apply all HTTP security headers from `_headers`.

---

## 🛡️ Security & Privacy Features

- **Security Headers (`_headers`)**: Enforces strict Content-Security-Policy (CSP), `X-Frame-Options: DENY`, `nosniff`, and `Referrer-Policy`.
- **Zero Secrets**: No private credentials, API keys, or access tokens exist in the source code.
- **DOM Sanitization**: Input fields in sub-apps use strict `escHtml()` escaping and text node binding to prevent Cross-Site Scripting (XSS).
- **Outbound Link Protection**: All external links use `rel="noopener noreferrer"` and `referrerpolicy="no-referrer"`.
