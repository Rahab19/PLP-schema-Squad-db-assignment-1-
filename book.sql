CREATE TABLE book(book_id INT auto_increment PRIMARY KEY,
title VARCHAR(100) NOT NULL,
publication_year YEAR,
publisher_id INT,
language_id int
);