<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="${sessionScope.lang}">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - UniGPA</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="auth-wrapper">
            <div class="auth-card">
                <div style="text-align: center; margin-bottom: 1.5rem;">
                    <div style="display: flex; gap: 0.25rem; justify-content: center; margin-bottom: 1rem;">
                        <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">EN</a>
                        <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">SI</a>
                    </div>
                    <h1 style="font-size: 1.5rem; margin-bottom: 0.5rem;"><fmt:message key="login.title" /></h1>
                    <p style="color: var(--muted-foreground); font-size: 0.9rem;"><fmt:message key="login.subtitle" /></p>
                </div>

                <% if(request.getParameter("success") !=null) { %>
                    <div
                        style="background-color: rgba(0, 128, 0, 0.1); color: green; padding: 0.75rem; border-radius: var(--radius); margin-bottom: 1.5rem; text-align: center;">
                        <%= request.getParameter("success") %>
                    </div>
                    <% } %>

                        <% if(request.getAttribute("error") !=null) { %>
                            <div
                                style="background-color: rgba(255, 0, 0, 0.1); color: var(--destructive); padding: 0.75rem; border-radius: var(--radius); margin-bottom: 1.5rem; text-align: center;">
                                <%= request.getAttribute("error") %>
                            </div>
                            <% } %>

                                <form action="login" method="post">
                                    <div class="form-group">
                                        <label for="email"><fmt:message key="login.email" /></label>
                                        <input type="email" id="email" name="email" required
                                            placeholder="name@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="password"><fmt:message key="login.password" /></label>
                                        <input type="password" id="password" name="password" required
                                            placeholder="<fmt:message key="login.password" />">
                                    </div>

                                    <button type="submit" class="btn btn-primary"
                                        style="width: 100%; margin-top: 1rem;"><fmt:message key="login.signIn" /></button>
                                </form>

                                <div
                                    style="text-align: center; margin-top: 1.5rem; font-size: 0.875rem; color: var(--muted-foreground);">
                                    <fmt:message key="login.noAccount" /> <a href="register"
                                        style="color: var(--primary); font-weight: 500;"><fmt:message key="login.signUp" /></a>
                                </div>
                                <div style="text-align: center; margin-top: 1rem;">
                                    <a href="index.jsp"
                                        style="color: var(--muted-foreground); text-decoration: none; font-size: 0.875rem;"><fmt:message key="login.backHome" /></a>
                                </div>
            </div>
        </div>
    </body>

    </html>