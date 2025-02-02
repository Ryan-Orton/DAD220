-- Load the classicmodels database
SOURCE mysqlsampledatabase.sql;

-- Use the classicmodels database and verify tables
USE classicmodels;
SHOW TABLES;

-- Retrieve employee records for San Francisco
SELECT firstName, lastName, jobTitle, offices.city
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE state = 'CA';

-- Retrieve employee records for New York
SELECT firstName, lastName, jobTitle, offices.city
FROM employees
INNER JOIN offices ON employees.officeCode = offices.officeCode
WHERE state = 'NY';

-- Retrieve order details for specific order numbers
SELECT * FROM orderdetails WHERE orderNumber = 10330;
SELECT * FROM orderdetails WHERE orderNumber = 10338;
SELECT * FROM orderdetails WHERE orderNumber = 10194;

-- Describe the Payments table and delete records for a specific customer
DESCRIBE payments;
SELECT * FROM payments WHERE customerNumber = 103;

DELETE FROM payments WHERE customerNumber = 103;

SELECT * FROM payments WHERE customerNumber = 103;  -- Verify the deletion

-- Retrieve customer records for Barry Jones (employeeNumber = 1504)
SELECT customers.*
FROM customers
INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE employees.employeeNumber = 1504;

-- Retrieve records for customers in Massachusetts and their sales reps
SELECT customers.*, employees.firstName, employees.lastName
FROM customers
INNER JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE customers.state = 'MA';

-- Add a new customer record with your information
INSERT INTO customers (
    customerNumber, customerName, contactLastName, contactFirstName,
    phone, addressLine1, addressLine2, city, state, postalCode, country,
    salesRepEmployeeNumber, creditLimit
) VALUES (
    500, 'YourLastName Corp', 'YourLastName', 'YourFirstName',
    '123-456-7890', '123 Main St', NULL, 'YourCity', 'YourState',
    '12345', 'YourCountry', 1504, 100000.00
);

-- Verify the new customer record
SELECT * FROM customers;
