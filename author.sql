CREATE DATABASE library_system;
-- After creating the DT, start using it

USE library_system;

-- Create the base table. For dataase integrity we use NOT NULL for names

CREATE TABLE author (author_id INT auto_increment PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
nationality VARCHAR(100)
);