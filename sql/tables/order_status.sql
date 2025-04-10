-- order_status table

CREATE TABLE order_status (
    status_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL,
    description TEXT
) ;

INSERT INTO order_status (status_name, description) V>
    ('Pending', 'Order received but payment not confi>
    ('Processing', 'Order verified and being prepared>
    ('Shipped', 'Order dispatched with tracking'),
    ('Delivered', 'Order received by customer'),
    ('Cancelled', 'Order cancelled before shipping'),
    ('Returned', 'Order returned after delivery');
