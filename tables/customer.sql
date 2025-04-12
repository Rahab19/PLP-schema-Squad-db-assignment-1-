--customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);\

-- customer data
INSERT INTO customer (first_name, last_name, email, phone)
VALUES
('Wanjiku', 'Mwangi', 'wanjiku@example.com', '+254722123456'),
('Kamau', 'Ochieng', 'kamau@example.com', '+254733234567'),
('Auma', 'Onyango', 'auma@example.com', '+254711345678'),
('Njeri', 'Kipchoge', 'njeri@example.com', '+254700456789');

-- link customer to address
-- Method 1: Using INSERT IGNORE (skips duplicates)
INSERT IGNORE INTO customer_address (customer_id, address_id, status_id, is_default)
VALUES
(1, 1, 2, TRUE),
(1, 6, 3, FALSE),
(2, 3, 2, TRUE),
(3, 8, 2, TRUE),
(4, 10, 2, TRUE);

-- Method 2: Using ON DUPLICATE KEY UPDATE (requires all FKs to exist)
INSERT INTO customer_address (customer_id, address_id, status_id, is_default)
SELECT * FROM (
    SELECT 1 as c, 1 as a, 2 as s, TRUE as d UNION
    SELECT 1, 6, 3, FALSE UNION
    SELECT 2, 3, 2, TRUE UNION
    SELECT 3, 8, 2, TRUE UNION
    SELECT 4, 10, 2, TRUE
) as new_data
WHERE EXISTS (SELECT 1 FROM address_status WHERE status_id = new_data.s)
ON DUPLICATE KEY UPDATE
    status_id = VALUES(status_id),
    is_default = VALUES(is_default);

    -- all customers with addresses
    SELECT 
    c.first_name, c.last_name,
    a.street_address, a.city, a.postal_code,
    s.status_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status s ON ca.status_id = s.status_id
WHERE co.country_name = 'Kenya';