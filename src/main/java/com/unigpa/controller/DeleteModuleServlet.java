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

@WebServlet("/delete-module")
public class DeleteModuleServlet extends HttpServlet {

    private ModuleDAO moduleDAO;
    private DegreeDAO degreeDAO;

    @Override
    public void init() {
        moduleDAO = new ModuleDAO();
        degreeDAO = new DegreeDAO();
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

        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);

                // Fetch module to find degree
                Module module = moduleDAO.getModuleById(id);
                if (module != null) {
                    Degree degree = degreeDAO.getDegreeById(module.getDegreeId());
                    if (degree != null && degree.getUserId() == user.getId()) {
                        moduleDAO.deleteModule(id, degree.getId());
                        response.sendRedirect(request.getContextPath() + "/degree-details?id=" + degree.getId());
                        return;
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
