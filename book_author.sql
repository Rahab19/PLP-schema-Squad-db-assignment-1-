-- Create the book_author junction table

CREATE TABLE book_author(
book_id INT,
author_id INT,
PRIMARY KEY (book_id, author_id), 
FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (author_id) REFERENCES author(author_id)
);