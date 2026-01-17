package com.unigpa.controller;

import com.unigpa.dao.DegreeDAO;
import com.unigpa.dao.ModuleDAO;
import com.unigpa.model.Degree;
import com.unigpa.model.Module;
import com.unigpa.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add-module")
public class AddModuleServlet extends HttpServlet {

    private ModuleDAO moduleDAO;
    private DegreeDAO degreeDAO;

    @Override
    public void init() {
        moduleDAO = new ModuleDAO();
        degreeDAO = new DegreeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Need degreeId to add a module
        String degreeIdStr = request.getParameter("degreeId");
        if (degreeIdStr == null) {
            response.sendRedirect("dashboard");
            return;
        }
        request.setAttribute("degreeId", degreeIdStr);
        request.getRequestDispatcher("/WEB-INF/views/add-module.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int credits = Integer.parseInt(request.getParameter("credits"));
        String grade = request.getParameter("grade");
        int semester = Integer.parseInt(request.getParameter("semester"));
        int year = Integer.parseInt(request.getParameter("year"));
        long degreeId = Long.parseLong(request.getParameter("degreeId"));

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        // Security check: ensure degree belongs to user
        Degree degree = degreeDAO.getDegreeById(degreeId);
        if (degree == null || degree.getUserId() != user.getId()) {
            // Unauthorized or invalid degree
            response.sendRedirect("dashboard");
            return;
        }

        Module newModule = new Module(code, name, credits, grade, semester, year);
        newModule.setDegreeId(degreeId);
        moduleDAO.addModule(newModule);

        response.sendRedirect(request.getContextPath() + "/degree-details?id=" + degreeId);
    }
}
