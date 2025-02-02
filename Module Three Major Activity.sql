-- Create the Quantigration RMA database
CREATE DATABASE QuantigrationRMA;

-- Display all databases to verify the creation of the database
SHOW DATABASES;

-- Create the Customers table to store customer information
CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(25),
    ZipCode VARCHAR(10),
    Telephone VARCHAR(15)
);

-- Create the Orders table to store order information with a foreign key referencing Customers
CREATE TABLE Orders (
    OrderID INT NOT NULL PRIMARY KEY,
    CustomerID INT,
    SKU VARCHAR(20),
    Description VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the RMA table to store RMA information with a foreign key referencing Orders
CREATE TABLE RMA (
    RMAID INT NOT NULL PRIMARY KEY,
    OrderID INT,
    Step VARCHAR(50),
    Status VARCHAR(15),
    Reason VARCHAR(15),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert records into the Customers table
INSERT INTO Customers VALUES (100, 'Ryan', 'Orton', '123 Watermelon Dr.', 'Orlando', 'FL', '34787', '770-770-7700');
INSERT INTO Customers VALUES (101, 'Hailey', 'Miller', '123 Cherry Dr.', 'Orlando', 'FL', '34787', '778-778-7788');
INSERT INTO Customers VALUES (102, 'Bob', 'Smith', '123 Prune Dr.', 'Orlando', 'FL', '34787', '771-771-7711');
INSERT INTO Customers VALUES (103, 'Lucas', 'Buford', '123 Grape Dr.', 'Orlando', 'FL', '34787', '772-772-7722');
INSERT INTO Customers VALUES (104, 'Lexie', 'Lee', '123 Cookie Dr.', 'Orlando', 'FL', '34787', '773-773-7733');
INSERT INTO Customers VALUES (105, 'Sam', 'Lee', '123 Stroden Dr.', 'Orlando', 'FL', '34787', '774-774-7744');
INSERT INTO Customers VALUES (106, 'Crangis', 'McBasketball', '123 Garfield Dr.', 'Orlando', 'FL', '34787', '775-775-7755');
INSERT INTO Customers VALUES (107, 'Stephen', 'Spielberg', '123 ET Dr.', 'Orlando', 'FL', '34787', '776-776-7766');
INSERT INTO Customers VALUES (108, 'Chris', 'Nolan', '123 Tenet Dr.', 'Orlando', 'FL', '34787', '777-777-7777');
INSERT INTO Customers VALUES (109, 'Steve', 'McQueen', '123 Kachow St.', 'Orlando', 'FL', '34787', '779-779-7799');

-- Create a view named Collaborator based on the Customers table
CREATE VIEW Collaborator AS 
SELECT 
    CustomerID AS CollaboratorID, 
    FirstName, 
    LastName, 
    Street, 
    City, 
    State, 
    ZipCode, 
    Telephone 
FROM Customers;

-- Display the structure of the Collaborator view
DESCRIBE Collaborator;

-- Select a few records from the Collaborator view to verify its creation
SELECT * FROM Collaborator LIMIT 5;
