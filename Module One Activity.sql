-- Create a new database named 'orton'
CREATE DATABASE orton;

-- Display all databases to verify the creation of the 'orton' database
SHOW DATABASES;

-- Select the 'orton' database for use
USE orton;

-- Create a new table named 'tb2' with a column 'user_id' of type VARCHAR(50)
CREATE TABLE tb2 (user_id VARCHAR(50));

-- Display all tables in the 'orton' database to verify that the 'tb2' table was created
SHOW TABLES;

-- Describe the structure of the 'tb2' table to show its columns and data types
DESCRIBE tb2;

-- Add a new column named 'newfield' of type VARCHAR(25) to the 'tb2' table
ALTER TABLE tb2 ADD newfield VARCHAR(25);

-- Describe the structure of the 'tb2' table again to verify that the new column has been added
DESCRIBE tb2;
