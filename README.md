# Campus Management System

<div align="center">

![Campus Management System](https://img.shields.io/badge/Campus-Management%20System-4F46E5?style=for-the-badge&logo=graduation-cap&logoColor=white)
![Python](https://img.shields.io/badge/Python-3.13-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-3.x-000000?style=for-the-badge&logo=flask&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)

**An AI-Powered Academic Management Platform with Role-Based Approval Workflows**

[Features](#-features) • [Tech Stack](#-tech-stack) • [Installation](#-installation) • [Usage](#-usage) • [API Docs](#-api-reference) • [Screenshots](#-screenshots)

</div>

---

## 📋 Overview

**Campus Management System** is a full-stack web application built with Flask that streamlines academic operations for universities and colleges. It provides a unified platform for **Students**, **Faculty**, **Department Heads (HOD)**, and **Administrators** — each with dedicated dashboards, role-based access control, and an intelligent approval workflow for new registrations.

Key highlights:
- 🤖 **AI-powered** grade prediction, dropout risk analysis, and attendance intelligence
- 🔐 **Multi-tier approval workflow** — Student/Faculty registrations require HOD and Admin sign-off
- 📊 **Real-time dashboards** with analytics, notifications, and reporting
- 📧 **Email notification system** via Gmail SMTP
- 🏫 **Complete academic lifecycle** — from enrollment to graduation

---

## ✨ Features

### 🎓 Student Portal
- Personalized dashboard with enrolled courses and progress
- Real-time attendance tracking and AI-driven risk alerts
- Assignment submission and grade viewing
- Course application and enrollment management
- AI study recommendations and performance insights
- Profile management with password change

### 👨‍🏫 Faculty Portal
- Course and classroom management
- Attendance marking with AI analysis
- Assignment creation and grading
- Live classroom sessions with real-time student interaction
- AI quiz generation via Google Gemini
- Student performance analytics

### 🏛️ HOD (Head of Department) Portal
- Review and approve/reject student and faculty registration requests
- Department-level registration oversight dashboard
- Forward approved faculty applications to Admin for final activation
- In-app notifications for all pending actions

### 🔑 Admin Portal
- System-wide dashboard with analytics
- Student and faculty list management (add, edit, delete)
- Final approval for faculty registrations
- Department and HOD management
- Email settings and bulk email broadcasting
- Auto-alert system and audit logs
- System settings management

### 🔄 Registration Approval Workflow
```
Public Registration ──▶ HOD Review
                            │
                 ┌──────────┴──────────┐
               STUDENT              FACULTY
                 │                     │
           HOD Approves          HOD Approves
                 │                     │
           Account Active       Admin Notified
                                      │
                                Admin Approves
                                      │
                                Account Active
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Backend** | Python 3.13, Flask, Flask-SocketIO |
| **Database** | SQLite3 (via Python's built-in driver) |
| **Frontend** | HTML5, Bootstrap 5, Vanilla CSS, JavaScript |
| **AI/ML** | Google Gemini API, scikit-learn (grade & dropout prediction) |
| **Real-time** | Socket.IO (live classroom sessions) |
| **Email** | SMTP via smtplib (Gmail App Password) |
| **Auth** | Flask Sessions + Werkzeug password hashing |
| **Exports** | openpyxl (Excel reports) |

---

## 📁 Project Structure

```
Campus-Management-System/
│
├── APP.PY                          # Main Flask application (routes, logic, DB init)
├── ai_attendance.py                # AI-powered attendance analysis module
├── ai_features.py                  # Grade prediction, dropout risk, study recommendations
├── ai_questions.py                 # AI quiz generation helper
├── database.db                     # SQLite database (auto-created on first run)
├── requirements.txt                # Python dependencies
├── .env                            # Environment variables (not committed)
│
├── templates/                      # Jinja2 HTML templates
│   ├── base.html                   # Master layout (sidebar, topbar, flash messages)
│   ├── login.html                  # Unified login page
│   ├── register.html               # Public registration form
│   ├── admin_dashboard.html        # Admin overview dashboard
│   ├── admin_registrations.html    # Admin: faculty approval queue
│   ├── hod_dashboard.html          # HOD: registration review dashboard
│   ├── hod_registration_detail.html# HOD: single request approve/reject
│   ├── profile.html                # User profile (edit + change password/username)
│   └── ...                         # Other role-specific templates
│
├── static/                         # Static assets
│   ├── css/
│   ├── js/
│   └── img/
│
├── uploads/                        # Uploaded files (assignments, submissions)
│   ├── assignments/
│   └── submissions/
│
└── logs/                           # Application logs (rotating)
    └── app.log
```

---

## ⚙️ Installation

### Prerequisites
- Python 3.10+ installed
- Git installed
- A Gmail account (for email notifications — optional)
- Google Gemini API key (for AI features — optional)

### 1. Clone the Repository
```bash
git clone https://github.com/Prasannaganesann/Campus-Management-System.git
cd Campus-Management-System
```

### 2. Create a Virtual Environment
```bash
python -m venv venv

# Windows
venv\Scripts\activate

# macOS / Linux
source venv/bin/activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Configure Environment Variables

Create a `.env` file in the root directory:
```env
SECRET_KEY=your-secret-key-here
DATABASE_URI=database.db
GEMINI_API_KEY=your-gemini-api-key-here   # Optional — for AI features
```

### 5. Run the Application
```bash
python APP.PY
```

The application will:
- Auto-initialize the database and all tables
- Create default user accounts
- Create HOD accounts for all departments

Open your browser at: **http://127.0.0.1:5001**

---

## 🔑 Default Login Credentials

> ⚠️ **Change all default passwords immediately after first login in a production environment.**

| Role | Username | Password | Portal |
|---|---|---|---|
| Administrator | `admin` | `admin123` | `/admin/login` |
| Student | `student` | `student123` | `/student/login` |
| Faculty | `faculty` | `faculty123` | `/faculty/login` |
| HOD – Computer Science | `hod.cs` | `hod123` | `/login` |
| HOD – Mathematics | `hod.math` | `hod123` | `/login` |
| HOD – Physics | `hod.phy` | `hod123` | `/login` |
| HOD – Chemistry | `hod.chem` | `hod123` | `/login` |
| HOD – Engineering | `hod.eng` | `hod123` | `/login` |

---

## 🚀 Usage

### Register a New Student or Faculty
1. Go to `/register`
2. Fill in your details and select your **Department**
3. Choose role: **Student** or **Faculty**
4. Submit — your application enters **Pending** status
5. The **HOD** for your department will receive a notification
6. **Student:** Account activated upon HOD approval
7. **Faculty:** Account activated only after HOD + Admin approval

### Email Notifications Setup
1. Login as Admin → **Email Settings**
2. Enter your Gmail address
3. Generate a Gmail **App Password**: `Google Account > Security > 2-Step Verification > App Passwords`
4. Paste the App Password (not your regular Gmail password)
5. Enable notifications and click **Save & Test**

### AI Features Setup
1. Get a [Google Gemini API Key](https://aistudio.google.com/)
2. Add it to your `.env` file: `GEMINI_API_KEY=your_key_here`
3. Or set it through Admin → **System Settings → Gemini API Key**

---

## 🗄️ Database Schema (Key Tables)

| Table | Purpose |
|---|---|
| `users` | All system users (student, teacher, hod, admin) |
| `students` | Student profiles linked to users |
| `instructors` | Faculty profiles linked to users |
| `departments` | Departments with HOD linkage |
| `registration_requests` | Pending approval workflow table |
| `courses` | Course catalog |
| `enrollments` | Student-course enrollment |
| `attendance` | Per-session attendance records |
| `grades` | Assessment scores |
| `notifications` | In-app notification system |
| `email_settings` | SMTP configuration |
| `assignments` / `submissions` | Assignment lifecycle |
| `classroom_sessions` | Live classroom session data |

---

## 🔌 API Reference

| Method | Endpoint | Description | Auth |
|---|---|---|---|
| `GET/POST` | `/register` | Public registration form | Public |
| `POST` | `/hod/registrations/<id>/action` | HOD approve/reject | HOD |
| `POST` | `/admin/registrations/<id>/action` | Admin final approval | Admin |
| `GET` | `/admin/registrations` | All registration requests | Admin |
| `POST` | `/profile/change-password` | Change own password | Any |
| `POST` | `/profile/update` | Update profile info | Any |
| `GET` | `/api/stats/dashboard` | Dashboard statistics | Any |

---

## 🔒 Security Notes

- Passwords are hashed using **Werkzeug's `generate_password_hash`** (PBKDF2-SHA256)
- Role-based access is enforced via decorators (`@admin_required`, `@hod_required`, etc.)
- Sessions are server-side signed with `SECRET_KEY`
- Username and email uniqueness is enforced at both DB and application levels
- **Never commit your `.env` file** — it is listed in `.gitignore`

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'feat: add your feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Prasanna Ganesan**

[![GitHub](https://img.shields.io/badge/GitHub-Prasannaganesann-181717?style=flat&logo=github)](https://github.com/Prasannaganesann)

---

<div align="center">
  <sub>Built with ❤️ using Flask & Python</sub>
</div>
