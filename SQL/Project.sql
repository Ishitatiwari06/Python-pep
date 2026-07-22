--   LIBRARY MANAGEMENT SYSTEM
create database Librarydb;
use Librarydb;

-- we need 5 tables - Authors, Books, Members, Borrow_Records, Borrow_Details
CREATE TABLE Authors(
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE Books(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    price DECIMAL(10,2),
    available_copies INT DEFAULT 0,
    FOREIGN KEY(author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members(
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    join_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Borrow_Records(
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    borrow_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(20) DEFAULT 'BORROWED',
    FOREIGN KEY(member_id) REFERENCES Members(member_id)
);

CREATE TABLE Borrow_Details(
    borrow_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    borrow_id INT,
    book_id INT,
    quantity INT CHECK(quantity > 0),
    FOREIGN KEY(borrow_id) REFERENCES Borrow_Records(borrow_id),
    FOREIGN KEY(book_id) REFERENCES Books(book_id)
);

-- insert records

INSERT INTO Authors(author_name, country) VALUES
('J.K. Rowling', 'UK'),
('George Orwell', 'UK'),
('Chetan Bhagat', 'India'),
('Paulo Coelho', 'Brazil'),
('Dan Brown', 'USA'),
('Ruskin Bond', 'India'),
('Agatha Christie', 'UK'),
('R.K. Narayan', 'India'),
('J.R.R. Tolkien', 'UK'),
('Stephen King', 'USA'),
('R.L. Stine','USA');

INSERT INTO Books(title, author_id, category, price, available_copies) VALUES
('Harry Potter', 1, 'Fantasy', 599, 10),
('1984', 2, 'Fiction', 399, 8),
('Five Point Someone', 3, 'Novel', 299, 12),
('The Alchemist', 4, 'Motivational', 450, 15),
('Inferno', 5, 'Thriller', 650, 7),
('The Blue Umbrella', 6, 'Children', 250, 9),
('Murder on the Orient Express', 7, 'Mystery', 500, 6),
('Malgudi Days', 8, 'Classic', 350, 10),
('The Hobbit', 9, 'Fantasy', 700, 5),
('It', 10, 'Horror', 800, 4),
('Goosebumps',11,'Horror',350,62);

INSERT INTO Members(member_name, email, phone) VALUES
('Ishita Tiwari', 'ishita@gmail.com', '9876543210'),
('Rahul Sharma', 'rahul@gmail.com', '9876543211'),
('Priya Singh', 'priya@gmail.com', '9876543212'),
('Aman Verma', 'aman@gmail.com', '9876543213'),
('Neha Gupta', 'neha@gmail.com', '9876543214'),
('Rohit Kumar', 'rohit@gmail.com', '9876543215'),
('Sneha Jain', 'sneha@gmail.com', '9876543216'),
('Arjun Mehta', 'arjun@gmail.com', '9876543217'),
('Pooja Patel', 'pooja@gmail.com', '9876543218'),
('Karan Malhotra', 'karan@gmail.com', '9876543219');

INSERT INTO Borrow_Records(member_id, borrow_date, status) VALUES
(1, '2026-07-01', 'BORROWED'),
(2, '2026-07-02', 'RETURNED'),
(3, '2026-07-03', 'BORROWED'),
(4, '2026-07-04', 'BORROWED'),
(5, '2026-07-05', 'RETURNED'),
(6, '2026-07-06', 'BORROWED'),
(7, '2026-07-07', 'BORROWED'),
(8, '2026-07-08', 'RETURNED'),
(9, '2026-07-09', 'BORROWED'),
(10, '2026-07-10', 'BORROWED');

INSERT INTO Borrow_Details(borrow_id, book_id, quantity) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 5, 2),
(4, 2, 1),
(5, 7, 1),
(6, 4, 2),
(7, 6, 1),
(8, 8, 1),
(9, 9, 1),
(10, 11, 3);