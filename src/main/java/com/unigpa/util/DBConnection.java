package com.unigpa.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
    private static final Properties properties = new Properties();

    // Database Configuration
    private static final String HOST;
    private static final String PORT;
    private static final String DB_NAME;
    private static final String USER;
    private static final String PASSWORD;
    private static final String SSL_MODE;
    private static final String SERVER_TIMEZONE;
    private static final String MODE;

    // Static block to load properties and register driver
    static {
        // Load properties from application.properties
        try (InputStream input = DBConnection.class.getClassLoader()
                .getResourceAsStream("application.properties")) {
            if (input != null) {
                properties.load(input);
            } else {
                System.err.println("Warning: application.properties not found, using environment variables only");
            }
        } catch (IOException e) {
            System.err.println("Warning: Error loading application.properties: " + e.getMessage());
        }

        // Get mode (local or production), environment variable takes priority
        String envMode = System.getenv("DB_MODE");
        MODE = (envMode != null && !envMode.isEmpty()) ? envMode : properties.getProperty("db.mode", "local");

        System.out.println("Database Mode: " + MODE);

        // Load configuration based on mode
        String prefix = "db." + MODE + ".";
        HOST = getConfig("DB_HOST", prefix + "host", "localhost");
        PORT = getConfig("DB_PORT", prefix + "port", "3306");
        DB_NAME = getConfig("DB_NAME", prefix + "name", "uni_gpa");
        USER = getConfig("DB_USER", prefix + "user", "root");
        PASSWORD = getConfig("DB_PASSWORD", prefix + "password", "");
        SSL_MODE = getConfig("DB_SSL_MODE", prefix + "sslMode", "DISABLED");
        SERVER_TIMEZONE = properties.getProperty("db.serverTimezone", "UTC");

        // Register MySQL driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading MySQL Driver", e);
        }
    }

    /**
     * Gets configuration value with priority: Environment Variable > Properties
     * File > Default
     */
    private static String getConfig(String envKey, String propKey, String defaultValue) {
        // First check environment variable
        String envValue = System.getenv(envKey);
        if (envValue != null && !envValue.isEmpty()) {
            return envValue;
        }
        // Then check properties file
        String propValue = properties.getProperty(propKey);
        if (propValue != null && !propValue.isEmpty()) {
            return propValue;
        }
        // Fall back to default
        return defaultValue;
    }

    /**
     * Returns the current database mode (local or production)
     */
    public static String getMode() {
        return MODE;
    }

    public static Connection getConnection() throws SQLException {
        // Construct JDBC URL with SSL and timezone settings
        String url = String.format("jdbc:mysql://%s:%s/%s?sslMode=%s&serverTimezone=%s",
                HOST, PORT, DB_NAME, SSL_MODE, SERVER_TIMEZONE);

        return DriverManager.getConnection(url, USER, PASSWORD);
    }
}