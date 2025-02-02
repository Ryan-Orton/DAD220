-- Create the QuantigrationUpdates database
CREATE DATABASE QuantigrationUpdates;
SHOW DATABASES;

-- Connect to the QuantigrationUpdates database and create the Customers table
USE QuantigrationUpdates;

CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(25),
    ZipCode INT,
    Telephone VARCHAR(15),
    PRIMARY KEY (CustomerID)
);

-- Create the Orders table with a foreign key to the Customers table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    SKU VARCHAR(20),
    Description VARCHAR(50),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the RMA table with a foreign key to the Orders table
CREATE TABLE RMA (
    RMAID INT,
    OrderID INT,
    Step VARCHAR(50),
    Status VARCHAR(15),
    Reason VARCHAR(15),
    PRIMARY KEY (RMAID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Load data from CSV files into the respective tables
LOAD DATA INFILE '/home/codio/workspace/customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/codio/workspace/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/home/codio/workspace/rma.csv'
INTO TABLE RMA
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';

-- Query to count orders for customers located only in Framingham, Massachusetts
SELECT COUNT(*) AS OrderCount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.City = 'Framingham' AND Customers.State = 'MA';

-- Query to select all customers located in Massachusetts
SELECT * 
FROM Customers
WHERE State = 'MA';

-- Insert new records into the Customers and Orders tables
INSERT INTO Customers VALUES 
    (100004, 'Luke', 'Skywalker', '15 Maiden Lane', 'New York', 'NY', 10222, '212-555-1234'),
    (100005, 'Winston', 'Smith', '123 Sycamore Street', 'Greensboro', 'NC', 27401, '919-555-6623'),
    (100006, 'MaryAnne', 'Jenkins', '1 Coconut Way', 'Jupiter', 'FL', 33458, '321-555-8907'),
    (100007, 'Janet', 'Williams', '55 Redondo Beach Blvd', 'Torrence', 'CA', 90501, '310-555-5678');

INSERT INTO Orders VALUES 
    (1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
    (1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
    (1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
    (1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

-- Query to count records where the city is Woonsocket and the state is Rhode Island
SELECT COUNT(*) AS WoonsocketCount
FROM Customers
WHERE City = 'Woonsocket' AND State = 'RI';

-- Query to select the current status and step for a record in the RMA table with OrderID 5175
SELECT Status, Step
FROM RMA
WHERE OrderID = 5175;

-- Update the status and step for OrderID 5175
UPDATE RMA
SET Status = 'Complete', Step = 'Credit Customer Account'
WHERE OrderID = 5175;

-- Delete all records from the RMA table where the reason is 'Rejected'
DELETE FROM RMA
WHERE Reason = 'Rejected';

-- Rename all instances of "Customer" to "Collaborator" in the database
RENAME TABLE Customers TO Collaborators;

-- Export the contents of the Orders table to a CSV file
SELECT * 
FROM Orders
INTO OUTFILE '/home/codio/workspace/Orders_Output.csv'
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n';
