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
