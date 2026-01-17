<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>UniGPA | ${degree.name}</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <style>
                .stat-card {
                    background-color: var(--card);
                    color: var(--card-foreground);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    padding: 1.5rem;
                    box-shadow: var(--shadow-sm);
                    text-align: center;
                    transition: transform 0.2s, box-shadow 0.2s;
                }

                /*.stat-card:hover {*/
                /*    transform: translateY(-5px);*/
                /*    box-shadow: var(--shadow-md);*/
                /*}*/

                .stat-card h3 {
                    font-size: 0.875rem;
                    color: var(--muted-foreground);
                    margin-bottom: 0.5rem;
                    text-transform: uppercase;
                    letter-spacing: 0.05em;
                }

                .stat-card .value {
                    font-size: 2.5rem;
                    font-weight: 700;
                    color: var(--primary);
                }

                .grading-system-card {
                    background-color: var(--card);
                    border: 1px solid var(--border);
                    border-radius: var(--radius);
                    padding: 1.5rem;
                    box-shadow: var(--shadow-sm);
                }

                .details-grid {
                    display: grid;
                    grid-template-columns: 2fr 1fr;
                    gap: 2rem;
                }

                @media (max-width: 768px) {
                    .details-grid {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="header" style="display: flex; justify-content: space-between; align-items: center;">
                    <div>
                        <h1>🎓 ${degree.name}</h1>
                    </div>
                    <div style="display: flex; gap: 0.75rem;">
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary">Back to
                            Dashboard</a>
                        <a href="${pageContext.request.contextPath}/add-module?degreeId=${degree.id}"
                            class="btn btn-primary">+ Add Module</a>
                        <form action="${pageContext.request.contextPath}/delete-degree" method="post"
                            style="display:inline;">
                            <input type="hidden" name="id" value="${degree.id}">
                            <button type="submit" class="btn btn-danger"
                                onclick="return confirm('Are you sure you want to delete this degree? All modules will be lost.')">Delete
                                Degree</button>
                        </form>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3>Overall GPA</h3>
                        <div class="value">${overallGPA}</div>
                    </div>
                    <div class="stat-card">
                        <h3>Total Credits</h3>
                        <div class="value">${totalCredits}</div>
                    </div>
                    <div class="stat-card">
                        <h3>Total Subjects</h3>
                        <div class="value">${totalModules}</div>
                    </div>
                </div>

                <div class="details-grid">
                    <!-- Main Content: Module List -->
                    <div class="card">
                        <h2>Course Modules</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Module Code</th>
                                    <th>Module Name</th>
                                    <th>Credits</th>
                                    <th>Grade</th>
                                    <th>Semester</th>
                                    <th>Academic Year</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="module" items="${modules}">
                                    <tr>
                                        <td>${module.moduleCode}</td>
                                        <td>${module.moduleName}</td>
                                        <td>${module.credits}</td>
                                        <td><span class="badge"
                                                style="background:var(--secondary); padding:0.25rem 0.5rem; border-radius:4px;">${module.grade}</span>
                                        </td>
                                        <td>${module.semester}</td>
                                        <td>${module.academicYear}</td>
                                        <td class="actions">
                                            <div style="display: flex; gap: 0.5rem; justify-content: flex-start;">
                                                <a href="${pageContext.request.contextPath}/edit-module?id=${module.id}"
                                                    class="btn btn-secondary btn-sm">Edit</a>
                                                <form action="${pageContext.request.contextPath}/delete-module"
                                                    method="post" style="display:inline;">
                                                    <input type="hidden" name="id" value="${module.id}">
                                                    <button type="submit" class="btn btn-danger btn-sm"
                                                        onclick="return confirm('Are you sure?')">Delete</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty modules}">
                                    <tr>
                                        <td colspan="7" style="text-align: center; padding: 2rem;">No modules added yet.
                                            Start by adding one!</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>

                    <!-- Sidebar: Grading System -->
                    <div class="grading-system-card">
                        <h2>Grading System</h2>
                        <div style="max-height: 400px; overflow-y: auto;">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Grade</th>
                                        <th>Points</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="entry" items="${gradingSchema}">
                                        <tr>
                                            <td><strong>${entry.key}</strong></td>
                                            <td>${entry.value}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
        </body>

        </html>