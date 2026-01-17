<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>UniGPA | Dashboard</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="container">
                <div class="header" style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <h1>🎓 UniGPA</h1>
                        <p>Welcome, ${user.name}!</p>
                    </div>
                    <div>
                        <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode"
                            style="margin-right: 1rem; display: inline-flex;">
                            <!-- Icon injected by JS -->
                        </button>
                        <a href="${pageContext.request.contextPath}/add-degree" class="btn btn-primary">+ Add Degree</a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn"
                            style="background-color: #f44336; margin-left: 10px;">Logout</a>
                    </div>
                </div>

                <h2 style="margin-bottom: 1.5rem;">My Degrees</h2>

                <div class="features-grid" style="grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));">
                    <c:forEach var="degree" items="${degrees}">
                        <a href="${pageContext.request.contextPath}/degree-details?id=${degree.id}"
                            style="text-decoration: none; color: inherit;">
                            <div class="card feature-card"
                                style="cursor: pointer; transition: transform 0.2s; height: 100%;">
                                <h3 class="feature-title">${degree.name}</h3>
                                <div
                                    style="margin-top: 1rem; display: flex; justify-content: space-between; align-items: flex-end;">
                                    <div>
                                        <div style="font-size: 0.9rem; color: var(--muted-foreground);">Current GPA
                                        </div>
                                        <div style="font-size: 1.5rem; font-weight: 700; color: var(--primary);">
                                            ${degreeGPAs[degree.id]}</div>
                                    </div>
                                    <div style="text-align: right;">
                                        <div style="font-size: 0.9rem; color: var(--muted-foreground);">Year</div>
                                        <div style="font-size: 1.2rem; font-weight: 600;">${degreeYears[degree.id] == 0
                                            ? '-' : degreeYears[degree.id]}</div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                    <c:if test="${empty degrees}">
                        <div class="card" style="grid-column: 1 / -1; text-align: center; padding: 3rem;">
                            <h3>No degrees added yet.</h3>
                            <p style="margin-bottom: 1.5rem;">Add a degree to start tracking your grades.</p>
                            <a href="${pageContext.request.contextPath}/add-degree" class="btn btn-primary">Add
                                Degree</a>
                        </div>
                    </c:if>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
        </body>

        </html>