<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <fmt:setLocale value="${sessionScope.locale}" />
    <fmt:setBundle basename="messages" />
        <!DOCTYPE html>
        <html lang="${sessionScope.lang}">

        <head>
            <meta charset="UTF-8">
            <title>Edit Module | UniGPA</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="container" style="max-width: 600px;">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem; flex-wrap: wrap; gap: 0.5rem;">
                    <div class="language-switcher" style="display: flex; gap: 0.25rem;">
                        <a href="?lang=en" class="btn btn-sm ${sessionScope.lang == 'en' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">EN</a>
                        <a href="?lang=si" class="btn btn-sm ${sessionScope.lang == 'si' ? 'btn-primary' : 'btn-secondary'}" style="padding: 0.35rem 0.6rem; font-size: 0.8rem;">SI</a>
                    </div>
                    <button id="theme-toggle" class="theme-toggle" title="Toggle Dark Mode">
                        <!-- Icon injected by JS -->
                    </button>
                </div>
                <div class="card">
                    <h2><fmt:message key="module.editTitle" /></h2>
                    <form action="${pageContext.request.contextPath}/edit-module" method="post">
                        <input type="hidden" name="id" value="${module.id}">

                        <div class="form-group">
                            <label><fmt:message key="module.code" /></label>
                            <input type="text" name="code" required value="${module.moduleCode}">
                        </div>
                        <div class="form-group">
                            <label><fmt:message key="module.name" /></label>
                            <input type="text" name="name" required value="${module.moduleName}">
                        </div>
                        <div class="form-group">
                            <label><fmt:message key="module.credits" /></label>
                            <input type="number" name="credits" required min="1" max="20" value="${module.credits}">
                        </div>
                        <div class="form-group">
                            <label><fmt:message key="module.grade" /></label>
                            <select name="grade">
                                <option value="A+" ${module.grade=='A+' ? 'selected' : '' }><fmt:message key="module.gradeA+" /></option>
                                <option value="A" ${module.grade=='A' ? 'selected' : '' }><fmt:message key="module.gradeA" /></option>
                                <option value="A-" ${module.grade=='A-' ? 'selected' : '' }><fmt:message key="module.gradeA-" /></option>
                                <option value="B+" ${module.grade=='B+' ? 'selected' : '' }><fmt:message key="module.gradeB+" /></option>
                                <option value="B" ${module.grade=='B' ? 'selected' : '' }><fmt:message key="module.gradeB" /></option>
                                <option value="B-" ${module.grade=='B-' ? 'selected' : '' }><fmt:message key="module.gradeB-" /></option>
                                <option value="C+" ${module.grade=='C+' ? 'selected' : '' }><fmt:message key="module.gradeC+" /></option>
                                <option value="C" ${module.grade=='C' ? 'selected' : '' }><fmt:message key="module.gradeC" /></option>
                                <option value="C-" ${module.grade=='C-' ? 'selected' : '' }><fmt:message key="module.gradeC-" /></option>
                                <option value="D" ${module.grade=='D' ? 'selected' : '' }><fmt:message key="module.gradeD" /></option>
                                <option value="E" ${module.grade=='E' ? 'selected' : '' }><fmt:message key="module.gradeE" /></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><fmt:message key="module.semester" /></label>
                            <select name="semester">
                                <option value="1" ${module.semester==1 ? 'selected' : '' }><fmt:message key="module.semester1" /></option>
                                <option value="2" ${module.semester==2 ? 'selected' : '' }><fmt:message key="module.semester2" /></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><fmt:message key="module.academicYear" /></label>
                            <input type="number" name="year" required min="1" max="5" value="${module.academicYear}">
                        </div>
                        <div style="margin-top: 2rem;">
                            <button type="submit" class="btn btn-primary"><fmt:message key="module.update" /></button>
                            <a href="${pageContext.request.contextPath}/degree-details?id=${module.degreeId}"
                                class="btn btn-secondary" style="margin-left: 1rem;"><fmt:message key="module.cancel" /></a>
                        </div>
                    </form>
                </div>
            </div>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
        </body>

        </html>