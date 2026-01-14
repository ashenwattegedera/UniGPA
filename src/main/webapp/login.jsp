<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - UniGPA</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="auth-wrapper">
            <div class="auth-card">
                <div style="text-align: center; margin-bottom: 2rem;">
                    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Welcome back</h1>
                    <p style="color: var(--muted-foreground);">Enter your details to access your account</p>
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
                                        <label for="email">Email Address</label>
                                        <input type="email" id="email" name="email" required
                                            placeholder="name@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" name="password" required
                                            placeholder="Enter your password">
                                    </div>

                                    <button type="submit" class="btn btn-primary"
                                        style="width: 100%; margin-top: 1rem;">Sign In</button>
                                </form>

                                <div
                                    style="text-align: center; margin-top: 1.5rem; font-size: 0.875rem; color: var(--muted-foreground);">
                                    Don't have an account? <a href="register"
                                        style="color: var(--primary); font-weight: 500;">Sign up</a>
                                </div>
                                <div style="text-align: center; margin-top: 1rem;">
                                    <a href="index.jsp"
                                        style="color: var(--muted-foreground); text-decoration: none; font-size: 0.875rem;">&larr;
                                        Back to Home</a>
                                </div>
            </div>
        </div>
    </body>

    </html>