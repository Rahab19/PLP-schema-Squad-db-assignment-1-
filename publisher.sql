Create the publisher table
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