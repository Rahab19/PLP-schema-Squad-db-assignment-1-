CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    publication_year YEAR,
    publisher_id INT,
    language_id INT,
    price DECIMAL(10, 2)
);
INSERT INTO book (title, publication_year, publisher_id, language_id, price) VALUES
('The Art of Coding', 2020, 1, 1, 29.99),
('Mysteries of the Universe', 2018, 2, 2, 19.95),
('Beginner''s Guide to SQL', 2021, 1, 1, 25.50),
('Mastering Web Development', 2019, 3, 3, 35.00),
('History of Ancient Civilizations', 2017, 4, 2, 22.75),
('Advanced Data Structures', 2022, 2, 1, 45.00),
('Creative Writing Essentials', 2020, 5, 3, 18.99),
('Modern Art Techniques', 2016, 3, 2, 27.50);


CREATE TABLE author (author_id INT auto_increment PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
nationality VARCHAR(100)
);
INSERT INTO author (first_name, last_name, date_of_birth, nationality) VALUES
('George', 'Orwell', '1903-06-25', 'British'),
('Jane', 'Austen', '1775-12-16', 'British'),
('Mark', 'Twain', '1835-11-30', 'American'),
('Chinua', 'Achebe', '1930-11-16', 'Nigerian'),
('Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombian'),
('Haruki', 'Murakami', '1949-01-12', 'Japanese'),
('J.K.', 'Rowling', '1965-07-31', 'British'),
('Leo', 'Tolstoy', '1828-09-09', 'Russian');


CREATE TABLE book_author(
book_id INT,
author_id INT,
PRIMARY KEY (book_id, author_id), 
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (author_id) REFERENCES author(author_id)
);
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);


CREATE TABLE book_language(id INT auto_increment PRIMARY KEY,
language_name VARCHAR(100) NOT NULL
);
INSERT INTO book_language (language_name) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Italian'),
('Chinese'),
('Japanese'),
('Arabic');

-- Create the publisher table
CREATE TABLE publisher(id INT auto_increment PRIMARY KEY,
publisher_name VARCHAR(100) NOT NULL,
publisher_address VARCHAR(100) NOT NULL
);

-- Update the book table with Foreign keys

 ALTER TABLE book
 ADD COLUMN publisher_id INT,
 ADD COLUMN language_id INT,
 ADD CONSTRAINT fk_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(id),
 ADD CONSTRAINT fk_language FOREIGN KEY(language_id) REFERENCES book_language(id);



CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- address status table
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO address_status (status_name) VALUES
('Active'),
('Inactive'),
('Billing'),
('Shipping');


-- country table
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    iso_code CHAR(2) UNIQUE


-- insert data
INSERT INTO country (country_name, iso_code) 
VALUES 
('Kenya', 'KE'),
('Tanzania', 'TZ'),
('Uganda', 'UG'),
('Rwanda', 'RW'),
('Ethiopia', 'ET'),
('Somalia', 'SO');

--address in kenya
INSERT INTO address (street_address, city, postal_code, country_id)
VALUES
('Kenyatta Avenue, 12th Floor', 'Nairobi', '00100', 1),
('Moi Avenue, ICEA Building', 'Nairobi', '00200', 1),
('Ngong Road, Adams Arcade', 'Nairobi', '00506', 1),
('Westlands, ABC Place', 'Nairobi', '00606', 1);

-- address major counties and towns
-- Mombasa
INSERT INTO address (street_address, city, postal_code, country_id)
VALUES 
('Nkrumah Road, Ambalal House', 'Mombasa', '80100', 1),
('Nyali Centre, Links Road', 'Mombasa', '80108', 1);

-- Kisumu
INSERT INTO address (street_address, city, postal_code, country_id)
VALUES 
('Oginga Odinga Street', 'Kisumu', '40100', 1),
('Kisumu Mall', 'Kisumu', '40123', 1);

-- Nakuru
INSERT INTO address (street_address, city, postal_code, country_id)
VALUES 
('Kenyatta Avenue', 'Nakuru', '20100', 1),
('Westside Mall', 'Nakuru', '20115', 1);

-- Eldoret
INSERT INTO address (street_address, city, postal_code, country_id)
VALUES 
('Uganda Road', 'Eldoret', '30100', 1),
('Elgon View Estate', 'Eldoret', '30112', 1);



CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

INSERT INTO customer (first_name, last_name, email, phone)
VALUES
('Wanjiku', 'Mwangi', 'wanjiku@example.com', '+254722123456'),
('Kamau', 'Ochieng', 'kamau@example.com', '+254733234567'),
('Auma', 'Onyango', 'auma@example.com', '+254711345678'),
('Njeri', 'Kipchoge', 'njeri@example.com', '+254700456789');



CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    status_id INT NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id),
    UNIQUE KEY (customer_id, address_id)
);
INSERT INTO customer_address (customer_id, address_id, status_id, is_default)
VALUES 
(1, 1, 1, TRUE),
(1, 2, 2, FALSE),
(2, 3, 1, TRUE),
(3, 4, 1, TRUE),
(4, 5, 2, FALSE),
(4, 6, 1, TRUE);


CREATE TABLE customer_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    order_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id)
);

INSERT INTO customer_order (customer_id, shipping_method_id, status, order_date) VALUES
    (1, 1, 'Processing', '2025-04-15'),
    (2, 2, 'Shipped', '2025-04-16'),
    (3, 3, 'Pending', '2025-04-17'),
    (4, 1, 'Processing', '2025-04-18'),
    (5, 2, 'Pending', '2025-04-19');


CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    delivery_date DATE,
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);
INSERT INTO order_history (order_id, status_id, delivery_date)
VALUES 
(1, 2, '2025-04-10'),
(2, 1, '2025-04-12'),
(3, 3, '2025-04-15');



CREATE TABLE order_status (
    status_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    description TEXT
);

INSERT INTO order_status (status_name, description) VALUES
    ('Pending', 'Order received but not processed'),
    ('Processing', 'Order being prepared'),
    ('Shipped', 'Order dispatched'),
    ('Delivered', 'Order received by customer');



CREATE TABLE shipping_method (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    delivery_speed VARCHAR(50) NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    delivery_days INT NOT NULL
);


INSERT INTO shipping_method VALUES
    (1, 'Standard', '3-5 days', 5.99, 4),
    (2, 'Express', '2 days', 12.99, 2),
    (3, 'Free', '5-10 days', 0.00, 7);

CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES
(1, 1, 2, 1500.00),
(1, 3, 1, 950.00),
(2, 2, 1, 1200.00),
(2, 5, 2, 800.00),
(3, 4, 1, 500.00);




--  Assign Roles and Privileges 

-- Create roles
CREATE ROLE librarian;
CREATE ROLE catalog_assistant;
CREATE ROLE viewer;
CREATE ROLE sys_admin;

-- Create users
CREATE USER 'lib1'@'localhost' IDENTIFIED BY 'lib123';
CREATE USER 'cat1'@'localhost' IDENTIFIED BY 'cat123';
CREATE USER 'view1'@'localhost' IDENTIFIED BY 'view123';
CREATE USER 'admin1'@'localhost' IDENTIFIED BY 'admin123';

-- Grant roles to users
GRANT librarian TO 'lib1'@'localhost';
GRANT catalog_assistant TO 'cat1'@'localhost';
GRANT viewer TO 'view1'@'localhost';
GRANT sys_admin TO 'admin1'@'localhost';

-- Privileges for the librarian
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.book TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.author TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON library_system.book_author TO librarian;
GRANT SELECT, INSERT, UPDATE ON library_system.book_language TO librarian;
GRANT SELECT, INSERT, UPDATE ON library_system.publisher TO librarian;

-- Privileges for the catalo_assistant
GRANT SELECT, INSERT ON library_system.book TO catalog_assistant;
GRANT SELECT, INSERT ON library_system.author TO catalog_assistant;
GRANT SELECT, INSERT ON library_system.book_author TO catalog_assistant;
GRANT SELECT ON library_system.publisher TO catalog_assistant;

-- Privileges for the viewer - can view books and author info
GRANT SELECT ON library_system.book TO viewer;
GRANT SELECT ON library_system.author TO viewer;
GRANT SELECT ON library_system.book_language TO viewer;
GRANT SELECT ON library_system.publisher TO viewer;

-- Privileges for the system admin - full access
GRANT ALL PRIVILEGES ON library_system.* TO sys_admin;

-- Assign roles for managing orders
CREATE USER 'order_manager'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.customer_order TO 'order_manager'@'localhost';

-- Assign roles for managing shipping methods
CREATE USER 'shipping_manager'@'localhost' IDENTIFIED BY 'password456';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.shipping_method TO 'shipping_manager'@'localhost';

-- Assign roles for warehouse staff
CREATE USER 'warehouse_staff'@'localhost' IDENTIFIED BY 'password789';
GRANT SELECT ON bookstore.order_history TO 'warehouse_staff'@'localhost';

-- Assign roles for admin access
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin'@'localhost';

-- Assign roles for managing order lines
CREATE USER 'order_line_manager'@'localhost' IDENTIFIED BY 'orderline123';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.order_line TO 'order_line_manager'@'localhost';

-- Assign roles for viewing order lines only
CREATE USER 'order_line_viewer'@'localhost' IDENTIFIED BY 'viewonly123';
GRANT SELECT ON bookstore.order_line TO 'order_line_viewer'@'localhost';

-- Assign roles for admin access specific to order_line
CREATE USER 'order_line_admin'@'localhost' IDENTIFIED BY 'adminline123';
GRANT ALL PRIVILEGES ON bookstore.order_line TO 'order_line_admin'@'localhost';

FLUSH PRIVILEGES;

--  Test Queries to Retrieve data

-- Retrieve all customer orders
SELECT * FROM customer_order;

-- Retrieve all shipping methods
SELECT * FROM shipping_method;

-- Retrieve all order statuses
SELECT * FROM order_status;

-- Retrieve all order history records
SELECT * FROM order_history;

-- Retrieve all customers' data
SELECT * FROM customer;

-- Retrieve all order line records
SELECT * FROM order_line;


-- Roles table
CREATE TABLE roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);

-- Permissions Table 
CREATE TABLE permissions (
    permission_id INT PRIMARY KEY AUTO_INCREMENT,
    permission_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Junction Table
CREATE TABLE role_permissions (
    role_id INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id)
);
ALTER TABLE customer 
ADD COLUMN role_id INT DEFAULT 2, 
ADD FOREIGN KEY (role_id) REFERENCES roles(role_id);
ADD FOREIGN KEY (role_id) REFERENCES roles(role_id);

-- Insert core roles
INSERT INTO roles (role_name, description) VALUES
('Admin', 'Full system access'),
('Customer', 'Can manage own profile/addresses'),
('Guest', 'Read-only access');

-- Insert permissions
INSERT INTO permissions (permission_name, description) VALUES
('manage_users', 'Create/update/delete users'),
('manage_own_profile', 'Update personal details'),
('view_products', 'Browse products'),
('purchase', 'Make purchases');

-- Assign permissions to roles
INSERT INTO role_permissions VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 2), (2, 3), (2, 4);           

-- Query to check user permission to purchase
SELECT COUNT(*) > 0 AS can_purchase
FROM customer c
JOIN role_permissions rp ON c.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
WHERE c.customer_id = 3 AND p.permission_name = 'purchase';

-- Check customer role
SELECT c.first_name, c.last_name, r.role_name
FROM customer c
JOIN roles r ON c.role_id = r.role_id;

-- Role assignment
CREATE TABLE role_assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL COMMENT 'User getting the role',
    assigned_by INT NOT NULL COMMENT 'Admin who assigned this',
    role_id INT NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (assigned_by) REFERENCES customer(customer_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

-- Accessible tables
CREATE TABLE accessible_tables (
    table_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50) NOT NULL UNIQUE
);

-- Permissions to specific tables
CREATE TABLE permission_tables (
    permission_id INT,
    table_id INT,
    PRIMARY KEY (permission_id, table_id),
    FOREIGN KEY (permission_id) REFERENCES permissions(permission_id),
    FOREIGN KEY (table_id) REFERENCES accessible_tables(table_id)
);

-- Insert data
INSERT INTO accessible_tables (table_name) VALUES
('customer'),
('address'),
('orders'),
('products');

-- Link permissions to tables )
INSERT INTO permission_tables VALUES
(1, 1), 
(2, 1),  
(3, 4),  
(4, 3);  

-- Query of modified user assignments
INSERT INTO role_assignments (customer_id, assigned_by, role_id)
VALUES (3, 1, 2);  

-- Permission check
SELECT COUNT(*) > 0 AS can_purchase
FROM customer c
JOIN role_permissions rp ON c.role_id = rp.role_id
JOIN permissions p ON rp.permission_id = p.permission_id
JOIN permission_tables pt ON p.permission_id = pt.permission_id
JOIN accessible_tables t ON pt.table_id = t.table_id
WHERE c.customer_id = 3 
AND p.permission_name = 'purchase'
AND t.table_name = 'orders';

-- who assigned role to who
SELECT 
    c.email AS user,
    r.role_name,
    admin.email AS assigned_by,
    ra.assigned_at
FROM role_assignments ra
JOIN customer c ON ra.customer_id = c.customer_id
JOIN roles r ON ra.role_id = r.role_id
JOIN customer admin ON ra.assigned_by = admin.customer_id;

-- Role assignment history
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    r.role_name,
    CONCAT(a.first_name, ' ', a.last_name) AS assigned_by_admin,
    ra.assigned_at
FROM customer c
JOIN roles r ON c.role_id = r.role_id
LEFT JOIN role_assignments ra ON c.customer_id = ra.customer_id
LEFT JOIN customer a ON ra.assigned_by = a.customer_id
ORDER BY c.customer_id;
