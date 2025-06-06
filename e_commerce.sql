USE E_COMMERCE;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Alice', 'alice@example.com', 'Mumbai'),
(2, 'Bob', 'bob@example.com', 'Delhi'),
(3, 'Charlie', 'charlie@example.com', 'Bangalore'),
(4, 'Diana', 'diana@example.com', 'Hyderabad');

DROP TABLE CUSTOMER;

SELECT * FROM CUSTOMERS;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Headphones', 'Electronics', 2000),
(3, 'Coffee Maker', 'Home Appliances', 3500),
(4, 'Smartphone', 'Electronics', 25000),
(5, 'Office Chair', 'Furniture', 7000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(101, 1, '2024-01-15'),
(102, 2, '2024-02-12'),
(103, 1, '2024-03-05'),
(104, 3, '2024-03-20');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    item_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 101, 1, 1, 60000),
(2, 101, 2, 2, 2000),
(3, 102, 3, 1, 3500),
(4, 103, 4, 1, 25000),
(5, 103, 5, 1, 7000),
(6, 104, 2, 1, 2000);

SELECT c.name, o.order_id, oi.product_id, oi.quantity, oi.item_price
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id;

