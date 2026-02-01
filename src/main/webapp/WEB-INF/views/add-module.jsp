<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="${sessionScope.lang}">

    <head>
        <meta charset="UTF-8">
        <title>Add Module | UniGPA</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <div class="container" style="max-width: 600px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                <div class="language-switcher" style="display: flex; gap: 0.25rem;">
                    <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">EN</a>
                    <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">SI</a>
                </div>
                <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode" style="padding: 0.35rem;">
                    <!-- Icon injected by JS -->
                </button>
            </div>
            <div class="card">
                <h2><fmt:message key="module.addTitle" /></h2>
                <form action="${pageContext.request.contextPath}/add-module" method="post">
                    <input type="hidden" name="degreeId" value="${degreeId}">
                    <div class="form-group">
                        <label><fmt:message key="module.code" /></label>
                        <input type="text" name="code" required placeholder="<fmt:message key="module.codePlaceholder" />">
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="module.name" /></label>
                        <input type="text" name="name" required placeholder="<fmt:message key="module.namePlaceholder" />">
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="module.credits" /></label>
                        <input type="number" name="credits" required min="1" max="20" placeholder="<fmt:message key="module.creditsPlaceholder" />">
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="module.grade" /></label>
                        <select name="grade">
                            <option value="A+"><fmt:message key="module.gradeA+" /></option>
                            <option value="A"><fmt:message key="module.gradeA" /></option>
                            <option value="A-"><fmt:message key="module.gradeA-" /></option>
                            <option value="B+"><fmt:message key="module.gradeB+" /></option>
                            <option value="B"><fmt:message key="module.gradeB" /></option>
                            <option value="B-"><fmt:message key="module.gradeB-" /></option>
                            <option value="C+"><fmt:message key="module.gradeC+" /></option>
                            <option value="C"><fmt:message key="module.gradeC" /></option>
                            <option value="C-"><fmt:message key="module.gradeC-" /></option>
                            <option value="D"><fmt:message key="module.gradeD" /></option>
                            <option value="E"><fmt:message key="module.gradeE" /></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="module.semester" /></label>
                        <select name="semester">
                            <option value="1"><fmt:message key="module.semester1" /></option>
                            <option value="2"><fmt:message key="module.semester2" /></option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><fmt:message key="module.academicYear" /></label>
                        <input type="number" name="year" required min="1" max="5" value="1">
                    </div>
                    <div style="margin-top: 2rem;">
                        <button type="submit" class="btn btn-primary"><fmt:message key="module.save" /></button>
                        <a href="${pageContext.request.contextPath}/degree-details?id=${degreeId}"
                            class="btn btn-secondary" style="margin-left: 1rem;"><fmt:message key="module.cancel" /></a>
                    </div>
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

    </html>