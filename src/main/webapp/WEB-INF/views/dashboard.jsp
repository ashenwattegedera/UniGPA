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
                        <a href="${pageContext.request.contextPath}/add-module" class="btn btn-primary">+ Add Module</a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn"
                            style="background-color: #f44336; margin-left: 10px;">Logout</a>
                    </div>
                </div>

                <div class="stats-grid">
                    <div class="card stat-item">
                        <div class="stat-value">${overallGPA}</div>
                        <div>Current GPA</div>
                    </div>
                    <div class="card stat-item">
                        <div class="stat-value">${totalCredits}</div>
                        <div>Total Credits</div>
                    </div>
                </div>

                <div class="card">
                    <h2>Course Modules</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Code</th>
                                <th>Module Name</th>
                                <th>Credits</th>
                                <th>Grade</th>
                                <th>Sem</th>
                                <th>Year</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="module" items="${modules}">
                                <tr>
                                    <td>${module.moduleCode}</td>
                                    <td>${module.moduleName}</td>
                                    <td>${module.credits}</td>
                                    <td>${module.grade}</td>
                                    <td>${module.semester}</td>
                                    <td>${module.academicYear}</td>
                                    <td class="actions">
                                        <a href="${pageContext.request.contextPath}/edit-module?id=${module.id}"
                                            class="btn"
                                            style="background: rgba(255,255,255,0.1); padding: 0.5rem;">Edit</a>
                                        <form action="${pageContext.request.contextPath}/delete-module" method="post"
                                            style="display:inline;">
                                            <input type="hidden" name="id" value="${module.id}">
                                            <button type="submit" class="btn btn-danger" style="padding: 0.5rem;"
                                                onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty modules}">
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 2rem;">No modules added yet.
                                        Start tracking your success! 🚀</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
        </body>

        </html>