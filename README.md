# 🎓 UniGPA - University GPA Management System

A production-quality Jakarta EE web application for tracking university course modules and GPA. Built with Servlets, JSP, MySQL, and a modern Glassmorphism UI.

## 🚀 Features
- **Dashboard**: View current overall GPA, total credits, and module list.
- **Module Management**: Add, Edit, and Delete course modules.
- **Automatic Calculation**: GPA updates instantly upon data changes.
- **Glass UI**: Beautiful, responsive, dark-themed design.

## 🛠 Tech Stack
- **Backend**: Jakarta EE 10 (Servlets, JSP), Java 17+
- **Database**: MySQL 8.0
- **Build Tool**: Maven
- **Server**: Apache Tomcat 10/11

## ⚙️ Setup Instructions

### 1. Database Setup
1.  Ensure MySQL is running on `localhost:3306`.
2.  Run the provided `database.sql` script to create the database and table:
    ```bash
    mysql -u root -p < database.sql
    ```
    *(Or import it using Workbench / phpMyAdmin)*.
3.  **Important**: Check `src/main/java/com/unigpa/util/DBConnection.java` and update the `USER` and `PASSWORD` fields to match your local MySQL credentials.

### 2. Build and Deploy
1.  Open the project in IntelliJ IDEA or Eclipse.
2.  Run Maven build:
    ```bash
    mvn clean package
    ```
3.  Deploy the generated `.war` file (in `target/`) to your Tomcat `webapps` folder, or run directly via IDE Tomcat integration.
4.  Access the app at:
    ```
    http://localhost:8080/unigpa/dashboard
    ```
    *(Note: Context path might differ based on your IDE configuration).*

## 📂 Project Structure
```
src
├── main
│   ├── java
│   │   └── com.unigpa
│   │       ├── controller  # Servlets (Dashboard, Add, Edit, Delete)
│   │       ├── dao         # Database Access Object
│   │       ├── model       # Module POJO
│   │       ├── service     # GPA Calculation Logic
│   │       └── util        # DB Connection Helper
│   └── webapp
│       ├── css             # Glassmorphism Styles
│       ├── js              # Client-side scripts
│       └── WEB-INF
│           └── views       # JSP Pages (Dashboard, Forms)
└── test                    # (No tests configured for this MVP)
```
