# Leonardo Levi Joaquin Colorado — Professional Portfolio

A high-performance personal portfolio highlighting competencies in **Data Engineering**, **Data Analytics & Business Intelligence**, **Relational Database Design (3NF SQL)**, and **Software Solutions**, backed by **4+ years of American Eagle Outfitters (AEO) operational leadership & KPI analytics**.

---

## 📁 Project Architecture

```
portfolio/
├── index.html       # Main portfolio interface (Tailwind CSS, Lucide icons, Dark/Light mode, Alien Sci-Fi FX)
├── resume.html      # ATS-optimized 1-page printable resume & CV
├── resume.md        # Plain-text markdown resume
├── triage-engine/   # AI Support Escalation Triage Engine (ETL & SQL Case Routing)
├── asset-manager/  # Enterprise IT Asset Manager (3NF Normalized SQL Schema & Inventory Analytics)
├── assets/          # Project visual assets & diagrams
├── _headers         # Cloudflare Pages security headers configuration (CSP, HSTS, X-Frame-Options)
├── .gitignore       # Excluded local developer tools & temporary files
├── .env.example     # Environment variable documentation template
├── SECURITY.md      # Security vulnerability disclosure policy
└── README.md        # Documentation and deployment guide
```

---

## 🚀 Core Competencies & Domains

- **Databases & Data Engineering:** SQL (Advanced Joins, Window Functions, Query Optimization), Relational Database Normalization (3NF), Entity-Relationship (ER) Modeling, ETL Pipelines, Python Data Scripts, Database Administration.
- **Data Analysis & Business Intelligence:** Operational KPI Auditing, SLA/CSAT Metrics Monitoring, Root-Cause Analysis (RCA), Performance Trend Analysis, Metric Variance Tracking.
- **Software Engineering & AI Automation:** Python, Java (OOP), C++, JavaScript/TypeScript, Next.js/React, Tailwind CSS, AI API Data Extraction & Triage Pipelines.
- **IT Systems & Operations:** Escalation Governance (SME), IT Asset Lifecycle Management, Process Documentation (SOPs), Team Supervision.
- **Languages:** English (Professional C1/C2), Spanish (Native).

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

This project is configured for automated continuous deployment on **Cloudflare Pages** via GitHub integration.

### Deployment Configuration Settings

| Setting | Value |
|---|---|
| **Framework Preset** | `None` (Static HTML) |
| **Build Command** | *(Leave empty)* |
| **Build Output Directory** | `/` (Root directory) |
| **Node.js Version** | N/A (Static files) |
| **Environment Variables** | *None required* |

---

## 🛡️ Security & Privacy Standards

- **Strict HTTP Headers (`_headers`)**: Enforces strict Content-Security-Policy (CSP), `X-Frame-Options: DENY`, `X-Content-Type-Options: nosniff`, and `Referrer-Policy: strict-origin-when-cross-origin`.
- **Zero Secrets**: No private credentials, API keys, or access tokens exist in the source code.
- **Safe DOM Manipulation**: Dynamic text and table rendering utilize safe DOM APIs (`textContent`, `createElement`, `createTextNode`) to eliminate Cross-Site Scripting (XSS) risks.
- **Outbound Link Protection**: All external links use `rel="noopener noreferrer"` and `referrerpolicy="no-referrer"`.
