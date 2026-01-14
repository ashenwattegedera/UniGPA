<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Account - UniGPA</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="auth-wrapper">
            <div class="auth-card">
                <div style="text-align: center; margin-bottom: 2rem;">
                    <h1 style="font-size: 2rem; margin-bottom: 0.5rem;">Create an account</h1>
                    <p style="color: var(--muted-foreground);">Start tracking your academic success today</p>
                </div>

                <% if(request.getAttribute("error") !=null) { %>
                    <div
                        style="background-color: rgba(255, 0, 0, 0.1); color: var(--destructive); padding: 0.75rem; border-radius: var(--radius); margin-bottom: 1.5rem; text-align: center;">
                        <%= request.getAttribute("error") %>
                    </div>
                    <% } %>

                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" id="name" name="name" required placeholder="John Doe">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" required placeholder="name@example.com">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password" required
                                    placeholder="Create a password">
                            </div>
                            <div class="form-group">
                                <label for="confirmPassword">Confirm Password</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" required
                                    placeholder="Confirm your password">
                            </div>

                            <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 1rem;">Create
                                Account</button>
                        </form>

                        <div
                            style="text-align: center; margin-top: 1.5rem; font-size: 0.875rem; color: var(--muted-foreground);">
                            Already have an account? <a href="login"
                                style="color: var(--primary); font-weight: 500;">Sign in</a>
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