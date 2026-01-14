<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Add Module | UniGPA</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>
        <div class="container" style="max-width: 600px;">
            <div class="card">
                <h2>Add New Module</h2>
                <form action="${pageContext.request.contextPath}/add-module" method="post">
                    <div class="form-group">
                        <label>Module Code</label>
                        <input type="text" name="code" required placeholder="e.g. CS101">
                    </div>
                    <div class="form-group">
                        <label>Module Name</label>
                        <input type="text" name="name" required placeholder="e.g. Intro to CS">
                    </div>
                    <div class="form-group">
                        <label>Credits</label>
                        <input type="number" name="credits" required min="1" max="20" placeholder="e.g. 3">
                    </div>
                    <div class="form-group">
                        <label>Grade</label>
                        <select name="grade">
                            <option value="A+">A+</option>
                            <option value="A">A</option>
                            <option value="A-">A-</option>
                            <option value="B+">B+</option>
                            <option value="B">B</option>
                            <option value="B-">B-</option>
                            <option value="C+">C+</option>
                            <option value="C">C</option>
                            <option value="C-">C-</option>
                            <option value="D">D</option>
                            <option value="E">E</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Semester</label>
                        <select name="semester">
                            <option value="1">Semester 1</option>
                            <option value="2">Semester 2</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Academic Year</label>
                        <input type="number" name="year" required min="1" max="5" value="1">
                    </div>
                    <div style="margin-top: 2rem;">
                        <button type="submit" class="btn btn-primary">Save Module</button>
                        <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-secondary"
                            style="margin-left: 1rem;">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>

    </html>