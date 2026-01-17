package com.unigpa.test;

import com.unigpa.dao.ModuleDAO;
import com.unigpa.dao.UserDAO;
import com.unigpa.model.Module;
import com.unigpa.model.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Random;

public class TestAuth {
    public static void main(String[] args) {
        System.out.println("Starting Auth Test...");

        UserDAO userDAO = new UserDAO();
        // ModuleDAO moduleDAO = new ModuleDAO(); // Module logic requires degree now

        String uniqueEmail = "test" + System.currentTimeMillis() + "@example.com";
        User user = new User();
        user.setName("Test User");
        user.setEmail(uniqueEmail);

        // Emulate RegisterServlet behavior: Hash password before setting
        String rawPassword = "password123";
        user.setPassword(com.unigpa.util.PasswordUtil.hashPassword(rawPassword));

        System.out.println("1. Registering User: " + uniqueEmail);
        try {
            userDAO.registerUser(user);
            System.out.println("   [SUCCESS] User registered with ID: " + user.getId());
        } catch (SQLException e) {
            System.err.println("   [FAILED] Registration failed.");
            e.printStackTrace();
            return;
        }

        System.out.println("2. Verifying Login...");
        // LoginServlet passes raw password to UserDAO.loginUser
        User loggedInUser = userDAO.loginUser(uniqueEmail, rawPassword);
        if (loggedInUser != null && loggedInUser.getId() == user.getId()) {
            System.out.println("   [SUCCESS] Login successful.");
        } else {
            System.err.println("   [FAILED] Login failed.");
        }

        /*
         * System.out.println("3. Adding Module for User...");
         * Module module = new Module("CS101", "Intro to CS", 3, "A", 1, 1);
         * module.setUserId(user.getId());
         * moduleDAO.addModule(module);
         * System.out.println("   [SUCCESS] Module added.");
         * 
         * System.out.println("4. Fetching Modules for User...");
         * List<Module> userModules = moduleDAO.getModulesByUserId(user.getId());
         * if (userModules.size() == 1 &&
         * userModules.get(0).getModuleCode().equals("CS101")) {
         * System.out.println("   [SUCCESS] Modules fetched correctly.");
         * } else {
         * System.err.println("   [FAILED] Module fetch incorrect. Found: " +
         * userModules.size());
         * }
         * 
         * System.out.println("5. Verifying Data Isolation (fetching for random ID)..."
         * );
         * List<Module> otherModules = moduleDAO.getModulesByUserId(user.getId() + 1);
         * // Assuming random ID doesn't clash
         * // immediately
         * if (otherModules.isEmpty()) {
         * System.out.println("   [SUCCESS] Empty list for other user.");
         * } else {
         * System.err.println("   [FAILED] Found modules for non-existent user?!");
         * }
         */

        System.out.println("Test Complete.");
    }
}
