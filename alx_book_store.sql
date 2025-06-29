-- Creating the database if it doesn't exist already
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Using the database
USE alx_book_store;

-- Drop Authors table if it exists (to avoid conflicts)
DROP TABLE IF EXISTS Authors;

-- Creating the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each author
    author_name VARCHAR(215) NOT NULL  -- Author's name (cannot be NULL)
);

-- Drop Books table if it exists (to avoid conflicts)
DROP TABLE IF EXISTS Books;

-- Creating the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each book
    title VARCHAR(130) NOT NULL,  -- Book title (cannot be NULL)
    author_id INT,  -- Foreign key to Authors table
    price DOUBLE NOT NULL,  -- Price of the book
    publication_date DATE,  -- Publication date of the book
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)  -- Enforcing the relationship with Authors
);

-- Drop Customers table if it exists (to avoid conflicts)
DROP TABLE IF EXISTS Customers;

-- Creating the Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each customer
    customer_name VARCHAR(215) NOT NULL,  -- Customer's name (cannot be NULL)
    email VARCHAR(215) NOT NULL UNIQUE,  -- Customer's email (must be unique)
    address TEXT NOT NULL  -- Customer's address (cannot be NULL)
);

-- Drop Orders table if it exists (to avoid conflicts)
DROP TABLE IF EXISTS Orders;

-- Creating the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order
    customer_id INT,  -- Foreign key to Customers table
    order_date DATE NOT NULL,  -- The date the order was placed (cannot be NULL)
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- Enforcing the relationship with Customers
);

-- Drop Order_Details table if it exists (to avoid conflicts)
DROP TABLE IF EXISTS Order_Details;

-- Creating the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order detail entry
    order_id INT,  -- Foreign key to Orders table
    book_id INT,  -- Foreign key to Books table
    quantity DOUBLE NOT NULL,  -- Quantity of the book ordered (cannot be NULL)
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),  -- Enforcing the relationship with Orders
    FOREIGN KEY (book_id) REFERENCES Books(book_id)  -- Enforcing the relationship with Books
);

-- End of schema setup
-- All tables have been successfully created with necessary relationships and constraints.
