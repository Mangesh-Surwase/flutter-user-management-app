# Flutter User Management App

A Flutter Web application built as part of a technical assignment to demonstrate
authentication flows, user management, and overall app experience using Firebase.

---

## 🚀 Features

### 🔐 Authentication
- Signup with email & password
- Login with email & password
- Forgot password (reset email)
- Persist login state after app restart
- Logout functionality

### 👥 User Management
- Add user details (Name, Email, Role)
- View users list (real-time from Firestore)
- View user details
- Delete user with confirmation dialog

### 🎨 UI & Experience
- Light / Dark theme switching
- Theme preference persisted using local storage
- Clean and responsive Material UI

---

## 🛠 Tech Stack

- Flutter (Web)
- Firebase Authentication
- Cloud Firestore
- Provider (state management)
- Shared Preferences

---

## 📂 Project Structure

lib/
├── auth/
│ ├── login_page.dart
│ ├── signup_page.dart
│ ├── forgot_password_page.dart
│ └── auth_wrapper.dart
├── home/
│ ├── dashboard_page.dart
│ ├── user_list_page.dart
│ ├── add_user_page.dart
│ └── user_detail_page.dart
├── theme/
│ └── theme_provider.dart
└── main.dart



## 📸 Demo Video

👉 Screen recording of the application demonstrating all required features:

🔗 Demo Video Link:  
https://drive.google.com/file/d/1X6LEbXUdSKsQJtpOjgISwgtU3WO3KXso/view?usp=sharing

The demo video covers:
- Signup & Login
- Login state persistence
- Forgot password
- Dashboard
- Theme switching (Light / Dark)
- Add, view, and delete users
- Logout
