-- address status table
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50) NOT NULL UNIQUE 
    -- e.g., 'Active', 'Inactive', 'Billing', 'Shipping'
);