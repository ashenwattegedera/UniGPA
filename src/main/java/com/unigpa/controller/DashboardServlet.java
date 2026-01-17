package com.unigpa.controller;

import com.unigpa.dao.DegreeDAO;
import com.unigpa.dao.ModuleDAO;
import com.unigpa.model.Degree;
import com.unigpa.model.Module;
import com.unigpa.model.User;
import com.unigpa.service.GPACalculator;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private DegreeDAO degreeDAO;
    private ModuleDAO moduleDAO;

    @Override
    public void init() {
        degreeDAO = new DegreeDAO();
        moduleDAO = new ModuleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        List<Degree> degrees = degreeDAO.getDegreesByUserId(user.getId());

        // Map to store GPA and Year for each degree
        Map<Long, String> degreeGPAs = new HashMap<>();
        Map<Long, Integer> degreeYears = new HashMap<>();

        for (Degree degree : degrees) {
            List<Module> modules = moduleDAO.getModulesByDegreeId(degree.getId());
            double gpa = GPACalculator.calculateGPA(modules);
            degreeGPAs.put(degree.getId(), String.format("%.2f", gpa));

            int maxYear = modules.stream()
                    .mapToInt(Module::getAcademicYear)
                    .max()
                    .orElse(0);
            degreeYears.put(degree.getId(), maxYear);
        }

        request.setAttribute("degrees", degrees);
        request.setAttribute("degreeGPAs", degreeGPAs);
        request.setAttribute("degreeYears", degreeYears);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
