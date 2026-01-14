CREATE DATABASE IF NOT EXISTS uni_gpa;
USE uni_gpa;

CREATE TABLE IF NOT EXISTS modules (
    id INT AUTO_INCREMENT PRIMARY KEY,
    module_code VARCHAR(20) NOT NULL,
    module_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    grade VARCHAR(2) NOT NULL,
    semester INT NOT NULL,
    academic_year INT NOT NULL
);

-- Sample Data
INSERT INTO modules (module_code, module_name, credits, grade, semester, academic_year) VALUES 
('CS101', 'Intro to Computer Science', 3, 'A', 1, 1),
('MA101', 'Calculus I', 3, 'B+', 1, 1),
('PH101', 'Physics', 2, 'A-', 1, 1),
('CS102', 'Data Structures', 4, 'B', 2, 1),
('CS201', 'Database Systems', 3, 'A', 1, 2);
