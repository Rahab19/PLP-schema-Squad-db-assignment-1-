-- order_status table

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
    
