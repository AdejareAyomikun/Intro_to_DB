CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id foreign key REFERENCES Authors(author_id) ON DELETE CASCADE,
    price VARCHAR(50) NOT NULL,
    publication_date DATE,
),
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL,
),
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
),
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id foreign key REFERENCES Customers(customer_id) ON DELETE CASCADE,
    order_date DATE NOT NULL,
),
CREATE TABLE Order_Details(
    orderdetailid INT PRIMARY KEY,
    order_id foreign key REFERENCES Orders(order_id),
    book_id foreign key REFERENCES Books(book_id),
    quantity DOUBLE NOT NULL,
);