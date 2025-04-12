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