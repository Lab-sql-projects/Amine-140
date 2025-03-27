-- Create tables for Online Learning Platform database

-- Create Assignments Table
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    assignment_name VARCHAR(100),
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Create Instructors Table
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create Course-Instructor Relationship (Many-to-Many)
CREATE TABLE Course_Instructors (
    course_id INT,
    instructor_id INT,
    PRIMARY KEY (course_id, instructor_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);


-- Create sample data for olp database

-- Insert Instructors
INSERT INTO Instructors (instructor_id, first_name, last_name, email)
VALUES
(1, 'Sarah', 'Lee', 'sarah.lee@university.com'),
(2, 'David', 'Kim', 'david.kim@university.com');

-- Insert Assignments
INSERT INTO Assignments (assignment_id, course_id, assignment_name, due_date)
VALUES
(1, 101, 'Homework 1: Software Engineering', '2023-09-15'),
(2, 102, 'Homework 1: Calculus Problems', '2023-09-20');

-- Assign Instructors to Courses
INSERT INTO Course_Instructors (course_id, instructor_id)
VALUES
(101, 1),
(102, 2);
