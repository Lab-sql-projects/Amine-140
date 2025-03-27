-- Creating the tables for the database

CREATE DATABASE education_db;

USE education_db;

-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_of_birth DATE
);

-- Create Professors Table
CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(100)
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

-- Create Enrollments Table
CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


-- Inserting Data into the Tables

-- Insert Students
INSERT INTO Students (student_id, first_name, last_name, email, date_of_birth)
VALUES
(1, 'Amine', 'Elbouhali', 'aminalbouhali@gmail.com', '2003-06-21'),
(2, 'Kadour', 'Benmsik', 'kadourbenmsik@gmail.com', '1945-01-01'),
(3, 'Achraf', 'Lkwayri', 'acharflak872@gmail.com', '1999-02-10');

-- Insert Professors
INSERT INTO Professors (professor_id, first_name, last_name, email, department)
VALUES
(1, 'Dr. Emily', 'Stone', 'emily.stone@scu.cn', 'Computer Science'),
(2, 'Dr. Mark', 'Davis', 'mark.davis@scu.cn', 'Mathematics');

-- Insert Courses
INSERT INTO Courses (course_id, course_name, professor_id)
VALUES
(101, 'Software Engineering', 1),
(102, 'Calculus I', 2);

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 101, '2024-09-01'),
(2, 102, '2024-09-01'),
(3, 101, '2024-09-01');
