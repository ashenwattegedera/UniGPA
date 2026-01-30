-- H2 Schema for UniGPA Testing
-- Uses H2 MySQL compatibility mode

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Degrees table
CREATE TABLE IF NOT EXISTS degrees (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Modules table
CREATE TABLE IF NOT EXISTS modules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    module_code VARCHAR(20) NOT NULL,
    module_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    grade VARCHAR(2) NOT NULL,
    semester INT NOT NULL,
    academic_year INT NOT NULL,
    degree_id BIGINT NOT NULL,
    FOREIGN KEY (degree_id) REFERENCES degrees(id) ON DELETE CASCADE
);
