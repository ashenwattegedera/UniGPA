package com.unigpa.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {

    // Define the BCrypt work factor (12 is a good balance between security and
    // performance)
    private static final int WORK_FACTOR = 12;

    /**
     * Hash a password using BCrypt
     * 
     * @param plainTextPassword The password to hash
     * @return The hashed password
     */
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt(WORK_FACTOR));
    }

    /**
     * Check if a plaintext password matches the hashed version
     * 
     * @param plainTextPassword The password to check
     * @param hashedPassword    The stored hashed password
     * @return true if matches, false otherwise
     */
    public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
            // Handle legacy plain text passwords gracefully if needed, or secure by default
            // fail
            // For this implementation, we will assume all passwords should be hashed.
            // If you want to support migration: return
            // plainTextPassword.equals(hashedPassword);
            return false;
        }
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }
}
