<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="com.unigpa.model.User" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <% User user=(User) session.getAttribute("user"); if (user !=null) { response.sendRedirect("dashboard"); } %>
            <fmt:setLocale value="${sessionScope.locale}" />
            <fmt:setBundle basename="messages" />
            <!DOCTYPE html>
            <html lang="${sessionScope.lang}">

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
                    <div style="display: flex; align-items: center; gap: 1rem; flex-wrap: wrap; justify-content: flex-end;">
                        <div class="language-switcher" style="display: flex; gap: 0.5rem;">
                            <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.8rem; font-size: 0.85rem;">English</a>
                            <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.8rem; font-size: 0.85rem;">සිංහල</a>
                        </div>
                        <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode"
                            style="margin-right: 0.5rem; display: inline-flex;">
                            <!-- Icon injected by JS -->
                        </button>
                        <a href="login" class="btn" style="color: var(--muted-foreground); margin-right: 0.5rem; white-space: nowrap;"><fmt:message key="nav.login" /></a>
                        <a href="register" class="btn btn-primary" style="white-space: nowrap;"><fmt:message key="nav.register" /></a>
                    </div>
                </nav>

                <section class="landing-hero">
                    <h1 class="hero-title"><fmt:message key="index.title" /></h1>
                    <p class="hero-subtitle">
                        <fmt:message key="index.subtitle" />
                    </p>
                    <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
                        <a href="register" class="btn btn-primary"
                            style="padding: 0.75rem 1.5rem; font-size: 1rem; white-space: nowrap;"><fmt:message key="index.startBtn" /></a>
                        <a href="login" class="btn btn-secondary" style="padding: 0.75rem 1.5rem; font-size: 1rem; white-space: nowrap;"><fmt:message key="index.signInBtn" /></a>
                    </div>
                </section>

                <section class="landing-features">
                    <div class="features-grid">
                        <div class="feature-card">
                            <div class="feature-icon">📊</div>
                            <h3 class="feature-title"><fmt:message key="index.feature.title1" /></h3>
                            <p class="feature-desc"><fmt:message key="index.feature.desc1" /></p>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon">🔒</div>
                            <h3 class="feature-title"><fmt:message key="index.feature.title2" /></h3>
                            <p class="feature-desc"><fmt:message key="index.feature.desc2" /></p>
                        </div>
                        <div class="feature-card">
                            <div class="feature-icon">📱</div>
                            <h3 class="feature-title"><fmt:message key="index.feature.title3" /></h3>
                            <p class="feature-desc"><fmt:message key="index.feature.desc3" /></p>
                        </div>
                    </div>
                </section>

                <footer class="landing-footer">
                    <p>&copy; <%= new java.util.Date().getYear() + 1900 %> UniGPA. Built for success.</p>
                </footer>

                <script src="js/main.js"></script>
            </body>

            </html>