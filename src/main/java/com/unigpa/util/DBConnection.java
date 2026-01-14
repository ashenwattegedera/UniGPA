package com.unigpa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Environment Variable Helper
    private static String getEnv(String key, String defaultValue) {
        String value = System.getenv(key);
        return (value != null && !value.isEmpty()) ? value : defaultValue;
    }

    // Database Configuration
    // Fallback values are kept for local development convenience but can be removed
    // for strict security.
    private static final String HOST = getEnv("DB_HOST", "dailyfixer-do-user-28100413-0.e.db.ondigitalocean.com");
    private static final String PORT = getEnv("DB_PORT", "25060");
    private static final String DB_NAME = getEnv("DB_NAME", "uni_gpa");
    private static final String USER = getEnv("DB_USER", "doadmin");
    private static final String PASSWORD = getEnv("DB_PASSWORD", "AVNS_K5A8m8iVoVX4PwYeXAs");

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
        // Construct JDBC URL with sslMode=REQUIRED
        String url = String.format("jdbc:mysql://%s:%s/%s?sslMode=REQUIRED&serverTimezone=UTC",
                HOST, PORT, DB_NAME);

        return DriverManager.getConnection(url, USER, PASSWORD);
    }
}