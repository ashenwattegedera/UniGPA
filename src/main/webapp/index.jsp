<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.unigpa.model.User" %>
        <% User user=(User) session.getAttribute("user"); if (user !=null) { response.sendRedirect("dashboard"); } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>UniGPA - Smart Academic Tracking</title>
                <link rel="stylesheet" href="css/style.css">
                <!-- Font Awesome for Icons (Optional, but good for features) -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
            </head>

            <body>

                <nav
                    style="padding: 1.5rem 2rem; display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto;">
                    <div style="font-weight: 700; font-size: 1.5rem;">🎓 UniGPA</div>
                    <div>
                        <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode"
                            style="margin-right: 1rem; display: inline-flex;">
                            <!-- Icon injected by JS -->
                        </button>
                        <a href="login" class="btn" style="color: var(--muted-foreground); margin-right: 1rem;">Log
                            in</a>
                        <a href="register" class="btn btn-primary">Get Started</a>
                    </div>
                </nav>

                <section class="landing-hero">
                    <h1 class="hero-title">Master Your GPA,<br>Focus on Learning.</h1>
                    <p class="hero-subtitle">
                        The simplest way for university students to track modules, calculate GPA, and stay on top of
                        their academic goals. No spreadsheets required.
                    </p>
                    <div style="display: flex; gap: 1rem; justify-content: center;">
                        <a href="register" class="btn btn-primary"
                            style="padding: 0.75rem 2rem; font-size: 1.1rem;">Start Tracking Now</a>
                        <a href="login" class="btn btn-secondary" style="padding: 0.75rem 2rem; font-size: 1.1rem;">Sign
                            In</a>
                    </div>
                </section>

                <section class="landing-features">
                    <div class="features-grid">
                        <div class="feature-card">
                            <div class="feature-icon">📊</div>
                            <h3 class="feature-title">Real-time Calculation</h3>
                            <p class="feature-desc">Instantly see how new grades affect your overall GPA. We handle the
                                complex weighting formulas for you.</p>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon">🔒</div>
                            <h3 class="feature-title">Private & Secure</h3>
                            <p class="feature-desc">Your academic data is yours alone. Secure login ensures only you can
                                access your modules and grades.</p>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon">📱</div>
                            <h3 class="feature-title">Access Anywhere</h3>
                            <p class="feature-desc">Responsive design works perfectly on your laptop, tablet, or phone.
                                Check your status on the go.</p>
                        </div>
                    </div>
                </section>

                <footer class="landing-footer">
                    <p>&copy; <%= new java.util.Date().getYear() + 1900 %> UniGPA. Built for success.</p>
                </footer>

                <script src="js/main.js"></script>
            </body>

            </html>