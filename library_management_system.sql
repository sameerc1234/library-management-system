CREATE DATABASE LibraryDB;

USE LibraryDB;

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255),
    year_of_publication YEAR,
    genre VARCHAR(100),
    copies_available INT DEFAULT 1
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    membership_date DATE NOT NULL
);

CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    role VARCHAR(50) NOT NULL
);
INSERT INTO Books (title, author, publisher, year_of_publication, genre, copies_available)
VALUES ("The Great Gatsby", "F. Scott Fitzgerald", "Scribner", 1925, "Fiction", 3);
INSERT INTO Members (first_name, last_name, email, phone, membership_date)
VALUES ("John", "Doe", "john.doe@example.com", "555-1234", CURDATE());
INSERT INTO Loans (book_id, member_id, loan_date, due_date)
VALUES (1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
UPDATE Loans
SET return_date = CURDATE()
WHERE loan_id = 1;
INSERT INTO Reservations (book_id, member_id, reservation_date)
VALUES (1, 2, CURDATE());