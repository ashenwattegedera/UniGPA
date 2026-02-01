<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="${sessionScope.lang}">

    <head>
        <meta charset="UTF-8">
        <title>Add Degree | UniGPA</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <div class="container" style="max-width: 600px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; flex-wrap: wrap; gap: 0.5rem;">
                <div class="language-switcher" style="display: flex; gap: 0.25rem;">
                    <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">EN</a>
                    <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">SI</a>
                </div>
                <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode" style="padding: 0.35rem;">
                    <!-- Icon injected by JS -->
                </button>
            </div>
            <div class="card">
                <h2><fmt:message key="addDegree.title" /></h2>
                <form action="${pageContext.request.contextPath}/add-degree" method="post">
                    <div class="form-group">
                        <label><fmt:message key="addDegree.degreeName" /></label>
                        <input type="text" name="degreeName" required placeholder="<fmt:message key="addDegree.placeholder" />">
                    </div>
                    <div style="margin-top: 2rem;">
                        <button type="submit" class="btn btn-primary"><fmt:message key="addDegree.create" /></button>
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary"
                            style="margin-left: 1rem;"><fmt:message key="addDegree.cancel" /></a>
                    </div>
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

    </html>