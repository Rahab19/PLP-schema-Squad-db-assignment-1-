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
