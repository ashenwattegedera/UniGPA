package com.unigpa.controller;

import com.unigpa.dao.ModuleDAO;
import com.unigpa.model.Module;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.unigpa.model.User;

import java.io.IOException;

@WebServlet("/edit-module")
public class UpdateModuleServlet extends HttpServlet {

    private ModuleDAO moduleDAO;

    @Override
    public void init() {
        moduleDAO = new ModuleDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Module module = moduleDAO.getModuleById(id);
        request.setAttribute("module", module);
        request.getRequestDispatcher("/WEB-INF/views/edit-module.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        int credits = Integer.parseInt(request.getParameter("credits"));
        String grade = request.getParameter("grade");
        int semester = Integer.parseInt(request.getParameter("semester"));
        int year = Integer.parseInt(request.getParameter("year"));

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        Module module = new Module(id, code, name, credits, grade, semester, year);
        module.setUserId(user.getId());
        moduleDAO.updateModule(module);

        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
