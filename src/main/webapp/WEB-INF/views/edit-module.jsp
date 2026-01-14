<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Edit Module | UniGPA</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>
            <div class="container" style="max-width: 600px;">
                <div class="card">
                    <h2>Edit Module</h2>
                    <form action="${pageContext.request.contextPath}/edit-module" method="post">
                        <input type="hidden" name="id" value="${module.id}">

                        <div class="form-group">
                            <label>Module Code</label>
                            <input type="text" name="code" required value="${module.moduleCode}">
                        </div>
                        <div class="form-group">
                            <label>Module Name</label>
                            <input type="text" name="name" required value="${module.moduleName}">
                        </div>
                        <div class="form-group">
                            <label>Credits</label>
                            <input type="number" name="credits" required min="1" max="20" value="${module.credits}">
                        </div>
                        <div class="form-group">
                            <label>Grade</label>
                            <select name="grade">
                                <option value="A+" ${module.grade=='A+' ? 'selected' : '' }>A+</option>
                                <option value="A" ${module.grade=='A' ? 'selected' : '' }>A</option>
                                <option value="A-" ${module.grade=='A-' ? 'selected' : '' }>A-</option>
                                <option value="B+" ${module.grade=='B+' ? 'selected' : '' }>B+</option>
                                <option value="B" ${module.grade=='B' ? 'selected' : '' }>B</option>
                                <option value="B-" ${module.grade=='B-' ? 'selected' : '' }>B-</option>
                                <option value="C+" ${module.grade=='C+' ? 'selected' : '' }>C+</option>
                                <option value="C" ${module.grade=='C' ? 'selected' : '' }>C</option>
                                <option value="C-" ${module.grade=='C-' ? 'selected' : '' }>C-</option>
                                <option value="D" ${module.grade=='D' ? 'selected' : '' }>D</option>
                                <option value="E" ${module.grade=='E' ? 'selected' : '' }>E</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Semester</label>
                            <select name="semester">
                                <option value="1" ${module.semester==1 ? 'selected' : '' }>Semester 1</option>
                                <option value="2" ${module.semester==2 ? 'selected' : '' }>Semester 2</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Academic Year</label>
                            <input type="number" name="year" required min="1" max="5" value="${module.academicYear}">
                        </div>
                        <div style="margin-top: 2rem;">
                            <button type="submit" class="btn btn-primary">Update Module</button>
                            <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary"
                                style="margin-left: 1rem;">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </body>

        </html>