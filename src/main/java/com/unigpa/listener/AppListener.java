package com.unigpa.listener;

import com.unigpa.util.DBConnection;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.Statement;
import java.util.stream.Collectors;

@WebListener
public class AppListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing Database Schema...");
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement()) {

            // Read schema file from resources
            InputStream is = getClass().getClassLoader().getResourceAsStream("db_schema.sql");
            if (is == null) {
                System.err.println("db_schema.sql not found in resources!");
                return;
            }

            String sql = new BufferedReader(new InputStreamReader(is))
                    .lines().collect(Collectors.joining("\n"));

            // Allow multiple statements (simple split by ;)
            String[] statements = sql.split(";");
            for (String s : statements) {
                if (!s.trim().isEmpty()) {
                    try {
                        stmt.execute(s);
                    } catch (Exception e) {
                        System.err.println("Error executing statement: " + s);
                        e.printStackTrace();
                    }                                                    
                }
            }
            System.out.println("Database Schema Initialized.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
