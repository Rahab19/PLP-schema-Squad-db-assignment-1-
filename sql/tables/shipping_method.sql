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
