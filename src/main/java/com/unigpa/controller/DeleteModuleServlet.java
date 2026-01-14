package com.unigpa.controller;

import com.unigpa.dao.ModuleDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.unigpa.model.User;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete-module")
public class DeleteModuleServlet extends HttpServlet {

    private ModuleDAO moduleDAO;

    @Override
    public void init() {
        moduleDAO = new ModuleDAO();
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

        int id = Integer.parseInt(request.getParameter("id"));
        moduleDAO.deleteModule(id, user.getId());
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
