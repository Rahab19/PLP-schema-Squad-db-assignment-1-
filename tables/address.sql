-- address table
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
