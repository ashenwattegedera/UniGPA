package com.unigpa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // HARDCODED CREDENTIALS AS PER PROMPT INSTRUCTIONS FOR SIMPLICITY
    // In production, use environment variables or a properties file.
    private static final String URL = "jdbc:mysql://localhost:3306/uni_gpa?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "admin"; // Default placeholder

    // Static block to register driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading MySQL Driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}