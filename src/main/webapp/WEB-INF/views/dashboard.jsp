<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <fmt:setLocale value="${sessionScope.locale}" />
    <fmt:setBundle basename="messages" />
        <!DOCTYPE html>
        <html lang="${sessionScope.lang}">

        <head>
            <meta charset="UTF-8">
            <title>UniGPA | Dashboard</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="container">
                <div class="header" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                    <div style="flex: 1; min-width: 200px;">
                        <h1 style="margin: 0 0 0.25rem 0;">🎓 UniGPA</h1>
                        <p style="margin: 0; font-size: 0.9rem;"><fmt:message key="nav.welcome"><fmt:param value="${user.name}" /></fmt:message></p>
                    </div>
                    <div style="display: flex; align-items: center; gap: 0.5rem; flex-wrap: wrap; justify-content: flex-end;">
                        <div class="language-switcher" style="display: flex; gap: 0.25rem;">
                            <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.6rem; font-size: 0.8rem;">EN</a>
                            <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.4rem 0.6rem; font-size: 0.8rem;">SI</a>
                        </div>
                        <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode"
                            style="margin-right: 0.25rem; display: inline-flex;">
                            <!-- Icon injected by JS -->
                        </button>
                        <a href="${pageContext.request.contextPath}/add-degree" class="btn btn-primary" style="padding: 0.5rem 0.75rem; font-size: 0.85rem; white-space: nowrap;"><fmt:message key="nav.addDegree" /></a>
                        <a href="${pageContext.request.contextPath}/logout" class="btn"
                            style="background-color: #f44336; padding: 0.5rem 0.75rem; font-size: 0.85rem; white-space: nowrap;"><fmt:message key="nav.logout" /></a>
                    </div>
                </div>

                <h2 style="margin-bottom: 1.5rem;"><fmt:message key="dashboard.title" /></h2>

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
                                        <div style="font-size: 0.9rem; color: var(--muted-foreground);"><fmt:message key="dashboard.currentGPA" /></div>
                                        <div style="font-size: 1.5rem; font-weight: 700; color: var(--primary);">
                                            ${degreeGPAs[degree.id]}</div>
                                    </div>
                                    <div style="text-align: right;">
                                        <div style="font-size: 0.9rem; color: var(--muted-foreground);"><fmt:message key="dashboard.year" /></div>
                                        <div style="font-size: 1.2rem; font-weight: 600;">${degreeYears[degree.id] == 0
                                            ? msg.notFound : degreeYears[degree.id]}</div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                    <c:if test="${empty degrees}">
                        <div class="card" style="grid-column: 1 / -1; text-align: center; padding: 3rem;">
                            <h3><fmt:message key="dashboard.noModules" /></h3>
                            <p style="margin-bottom: 1.5rem;"><fmt:message key="dashboard.addDegree" /></p>
                            <a href="${pageContext.request.contextPath}/add-degree" class="btn btn-primary"><fmt:message key="nav.addDegree" /></a>
                        </div>
                    </c:if>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
        </body>

        </html>