<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <fmt:setLocale value="${sessionScope.locale}" />
    <fmt:setBundle basename="messages" />
        <!DOCTYPE html>
        <html lang="${sessionScope.lang}">

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
                <div class="header" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                    <div style="flex: 1; min-width: 200px;">
                        <h1 style="margin: 0;">🎓 ${degree.name}</h1>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap; justify-content: flex-end;">
                        <div class="language-switcher" style="display: flex; gap: 0.25rem;">
                            <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.6rem; font-size: 0.8rem;">EN</a>
                            <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.6rem; font-size: 0.8rem;">SI</a>
                        </div>
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary" style="padding: 0.5rem 0.75rem; font-size: 0.85rem; white-space: nowrap;"><fmt:message key="degree.backDashboard" /></a>
                        <a href="${pageContext.request.contextPath}/add-module?degreeId=${degree.id}"
                            class="btn btn-primary" style="padding: 0.5rem 0.75rem; font-size: 0.85rem; white-space: nowrap;"><fmt:message key="degree.addModule" /></a>
                        <form action="${pageContext.request.contextPath}/delete-degree" method="post"
                            style="display:inline;">
                            <input type="hidden" name="id" value="${degree.id}">
                            <button type="submit" class="btn btn-danger" style="padding: 0.5rem 0.75rem; font-size: 0.85rem; white-space: nowrap;"
                                onclick="return confirm('<fmt:message key="degree.confirmDelete" />')"><fmt:message key="degree.deleteDegree" /></button>
                        </form>
                    </div>
                </div>

                <!-- Stats Cards -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3><fmt:message key="degree.overallGPA" /></h3>
                        <div class="value">${overallGPA}</div>
                    </div>
                    <div class="stat-card">
                        <h3><fmt:message key="degree.totalCredits" /></h3>
                        <div class="value">${totalCredits}</div>
                    </div>
                    <div class="stat-card">
                        <h3><fmt:message key="degree.totalSubjects" /></h3>
                        <div class="value">${totalModules}</div>
                    </div>
                </div>

                <div class="details-grid">
                    <!-- Main Content: Module List -->
                    <div class="card">
                        <h2><fmt:message key="degree.courseModules" /></h2>
                        <table>
                            <thead>
                                <tr>
                                    <th><fmt:message key="degree.moduleCode" /></th>
                                    <th><fmt:message key="degree.moduleName" /></th>
                                    <th><fmt:message key="degree.credits" /></th>
                                    <th><fmt:message key="degree.grade" /></th>
                                    <th><fmt:message key="degree.semester" /></th>
                                    <th><fmt:message key="degree.academicYear" /></th>
                                    <th><fmt:message key="degree.actions" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="module" items="${modules}">
                                    <tr>
                                        <td data-label="<fmt:message key="degree.moduleCode" />">${module.moduleCode}</td>
                                        <td data-label="<fmt:message key="degree.moduleName" />">${module.moduleName}</td>
                                        <td data-label="<fmt:message key="degree.credits" />">${module.credits}</td>
                                        <td data-label="<fmt:message key="degree.grade" />"><span class="badge"
                                                style="background:var(--secondary); padding:0.25rem 0.5rem; border-radius:4px;">${module.grade}</span>
                                        </td>
                                        <td data-label="<fmt:message key="degree.semester" />">${module.semester}</td>
                                        <td data-label="<fmt:message key="degree.academicYear" />">${module.academicYear}</td>
                                        <td class="actions" data-label="<fmt:message key="degree.actions" />">
                                            <div style="display: flex; gap: 0.5rem; justify-content: flex-start;">
                                                <a href="${pageContext.request.contextPath}/edit-module?id=${module.id}"
                                                    class="btn btn-secondary btn-sm"><fmt:message key="degree.edit" /></a>
                                                <form action="${pageContext.request.contextPath}/delete-module"
                                                    method="post" style="display:inline;">
                                                    <input type="hidden" name="id" value="${module.id}">
                                                    <button type="submit" class="btn btn-danger btn-sm"
                                                        onclick="return confirm('<fmt:message key="degree.confirmModuleDelete" />')"><fmt:message key="degree.delete" /></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty modules}">
                                    <tr>
                                        <td colspan="7" style="text-align: center; padding: 2rem;"><fmt:message key="degree.noModules" /></td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>

                    <!-- Sidebar: Grading System -->
                    <div class="grading-system-card">
                        <h2><fmt:message key="degree.grade" /></h2>
                        <div style="max-height: 400px; overflow-y: auto;">
                            <table>
                                <thead>
                                    <tr>
                                        <th><fmt:message key="degree.grade" /></th>
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