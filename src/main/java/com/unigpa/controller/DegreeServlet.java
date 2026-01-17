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
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = { "/add-degree", "/delete-degree", "/degree-details" })
public class DegreeServlet extends HttpServlet {

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

        String action = request.getServletPath();

        if ("/degree-details".equals(action)) {
            showDegreeDetails(request, response, user);
        } else if ("/add-degree".equals(action)) {
            // Forward to the add-degree JSP
            request.getRequestDispatcher("/WEB-INF/views/add-degree.jsp").forward(request, response);
        } else {
            response.sendRedirect("dashboard");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getServletPath();
        if ("/add-degree".equals(action)) {
            addDegree(request, response, user);
        } else if ("/delete-degree".equals(action)) {
            deleteDegree(request, response);
        }
    }

    private void addDegree(HttpServletRequest request, HttpServletResponse response, User user) throws IOException {
        String degreeName = request.getParameter("degreeName");

        if (degreeName != null && !degreeName.trim().isEmpty()) {
            Degree degree = new Degree();
            degree.setName(degreeName.trim());
            degree.setUserId(user.getId());

            try {
                degreeDAO.addDegree(degree);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("dashboard");
    }

    private void deleteDegree(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                long id = Long.parseLong(idStr);
                degreeDAO.deleteDegree(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("dashboard");
    }

    private void showDegreeDetails(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect("dashboard");
            return;
        }

        long degreeId = -1;
        try {
            degreeId = Long.parseLong(idStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("dashboard");
            return;
        }

        Degree degree = degreeDAO.getDegreeById(degreeId);
        if (degree == null || degree.getUserId() != user.getId()) {
            response.sendRedirect("dashboard");
            return;
        }

        List<Module> modules = moduleDAO.getModulesByDegreeId(degreeId);
        double overallGPA = GPACalculator.calculateGPA(modules);
        int totalCredits = modules.stream().mapToInt(Module::getCredits).sum();

        // Get and Sort Grading Schema
        Map<String, Double> gradePoints = GPACalculator.getGradePoints();
        List<java.util.Map.Entry<String, Double>> sortedSchema = new java.util.ArrayList<>(gradePoints.entrySet());
        sortedSchema.sort((e1, e2) -> Double.compare(e2.getValue(), e1.getValue())); // Descending order

        request.setAttribute("degree", degree);
        request.setAttribute("modules", modules);
        request.setAttribute("overallGPA", String.format("%.2f", overallGPA));
        request.setAttribute("totalCredits", totalCredits);
        request.setAttribute("gradingSchema", sortedSchema);
        request.setAttribute("totalModules", modules.size());

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/degree-details.jsp");
        dispatcher.forward(request, response);
    }
}
