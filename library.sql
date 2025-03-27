-- Creating the tables for the library database

-- Create Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE
);

-- Create Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Create Borrowers Table
CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

-- Create Loans Table
CREATE TABLE Loans (
    borrower_id INT,
    book_id INT,
    loan_date DATE,
    return_date DATE,
    PRIMARY KEY (borrower_id, book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


-- Create sample data

-- Insert Authors
INSERT INTO Authors (author_id, first_name, last_name, birth_date)
VALUES
(1, 'J.K.', 'Rowling', '1965-07-31'),
(2, 'George', 'Orwell', '1903-06-25');

-- Insert Books
INSERT INTO Books (book_id, title, author_id, publication_year, genre)
VALUES
(1, "Harry Potter and the Sorcerer's Stone", 1, 1997, 'Fantasy'),
(2, '1984', 2, 1949, 'Dystopian');

-- Insert Borrowers
INSERT INTO Borrowers (borrower_id, first_name, last_name, email, registration_date)
VALUES
(1, 'Robert', 'Taylor', 'robert.taylor@example.com', '2023-01-15'),
(2, 'Emma', 'Wilson', 'emma.wilson@example.com', '2023-02-20');

-- Insert Loans
INSERT INTO Loans (borrower_id, book_id, loan_date, return_date)
VALUES
(1, 1, '2023-03-01', '2025-03-21'),
(2, 2, '2022-03-05', '2022-03-30');
