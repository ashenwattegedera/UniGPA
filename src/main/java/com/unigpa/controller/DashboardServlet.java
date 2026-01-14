package com.unigpa.controller;

import com.unigpa.dao.ModuleDAO;
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

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private ModuleDAO moduleDAO;

    @Override
    public void init() {
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

        List<Module> modules = moduleDAO.getModulesByUserId(user.getId());

        // Calculate Overall GPA
        double overallGPA = GPACalculator.calculateGPA(modules);

        // Calculate KPIs (e.g., Total Credits)
        int totalCredits = modules.stream().mapToInt(Module::getCredits).sum();

        request.setAttribute("modules", modules);
        request.setAttribute("overallGPA", String.format("%.2f", overallGPA));
        request.setAttribute("totalCredits", totalCredits);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp");
        dispatcher.forward(request, response);
    }
}
