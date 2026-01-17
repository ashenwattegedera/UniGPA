<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Add Degree | UniGPA</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <div class="container" style="max-width: 600px;">
            <div style="display: flex; justify-content: flex-end; margin-bottom: 1rem;">
                <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode">
                    <!-- Icon injected by JS -->
                </button>
            </div>
            <div class="card">
                <h2>Add New Degree</h2>
                <form action="${pageContext.request.contextPath}/add-degree" method="post">
                    <div class="form-group">
                        <label>Degree Name</label>
                        <input type="text" name="degreeName" required placeholder="e.g. BSc Computer Science">
                    </div>
                    <div style="margin-top: 2rem;">
                        <button type="submit" class="btn btn-primary">Create Degree</button>
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary"
                            style="margin-left: 1rem;">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

    </html>