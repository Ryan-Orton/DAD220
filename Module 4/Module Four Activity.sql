-- Use the QuantigrationRMA database
USE QuantigrationRMA;

-- Load data from the CSV file into the Customers table
LOAD DATA INFILE '/home/codio/workspace/customers.csv' 
INTO TABLE Customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Load data from the CSV file into the Orders table
LOAD DATA INFILE '/home/codio/workspace/orders.csv' 
INTO TABLE Orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Attempted data load for the RMA table
LOAD DATA INFILE '/home/codio/workspace/rma.csv' 
INTO TABLE RMA
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Query to return the count of orders for customers located only in Framingham, Massachusetts
SELECT COUNT(*) 
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Framingham' AND Customers.State = 'MA';

-- Query to select all customers located in Massachusetts
SELECT * 
FROM Customers 
WHERE State = 'MA';

-- Query to select specific customer records
SELECT * 
FROM Customers 
WHERE CustomerID IN (100004, 100005, 100006, 100007);

-- Insert records into the Customers table
INSERT INTO Customers (CustomerID, FirstName, LastName, StreetAddress, City, State, ZipCode, Telephone) VALUES
    (100004, 'Luke', 'Skywalker', '17 Maiden Lane', 'New York', 'NY', '10222', '212-555-1234'),
    (100005, 'Winston', 'Smith', '128 Sycamore Street', 'Greensboro', 'NC', '27401', '919-555-6623'),
    (100006, 'MaryAnne', 'Jenkins', '2 Coconut Way', 'Jupiter', 'FL', '33458', '321-555-8907'),
    (100007, 'Janet', 'Williams', '58 Redondo Beach Blvd', 'Torrence', 'CA', '90501', '310-555-5678');

-- Insert records into the Orders table
INSERT INTO Orders (OrderID, CustomerID, SKU, Description) VALUES
    (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
    (1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
    (1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
    (1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

-- Query to count customers in Woonsocket, Rhode Island
SELECT COUNT(*) 
FROM Customers 
WHERE City = 'Woonsocket' AND State = 'RI';

-- Query to select fields from the RMA table for a specific order
SELECT Status, Step 
FROM RMA 
WHERE OrderID = '5175';

-- Update status and step in the RMA table
UPDATE RMA 
SET Status = 'Complete', Step = 'Credit Customer Account' 
WHERE OrderID = '5175';

-- Delete records from the RMA table where the reason is 'Rejected'
DELETE FROM RMA 
WHERE Reason = 'Rejected';

-- Output the contents of the Orders table to a CSV file
SELECT * 
FROM Orders 
INTO OUTFILE '/home/codio/workspace/Orders_Output.csv' 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\r\n';
