-- Select the 'orton' database to use for operations
USE orton;

-- Create the 'Employee' table with columns for employee details
CREATE TABLE Employee (
    Employee_ID SMALLINT,         -- Unique identifier for each employee
    First_Name VARCHAR(40),       -- Employee's first name
    Last_Name VARCHAR(60),        -- Employee's last name
    Department_ID SMALLINT,       -- ID referencing the department the employee belongs to
    Classification VARCHAR(10),   -- Employee classification (e.g., 'Exempt', 'Non-Exempt')
    Status VARCHAR(10),           -- Employment status (e.g., 'Full-Time', 'Part-Time')
    Salary DECIMAL(7,2)           -- Employee's salary with up to 7 digits and 2 decimal places
);

-- Create the 'Branches' table to store department information
CREATE TABLE Branches (
    Department_ID SMALLINT,       -- Unique identifier for each department
    Department_Name VARCHAR(50)   -- Name of the department
);

-- Display the structure of the 'Employee' table to verify column definitions
DESCRIBE Employee;

-- Display the structure of the 'Branches' table to verify column definitions
DESCRIBE Branches;

-- Insert initial employee records into the 'Employee' table
INSERT INTO Employee VALUES
    (100, 'John', 'Smith', 1, 'Exempt', 'Full-Time', 90000),      -- Employee 100: John Smith
    (101, 'Mary', 'Jones', 2, 'Non-Exempt', 'Part-Time', 35000),  -- Employee 101: Mary Jones
    (102, 'Mary', 'Williams', 3, 'Exempt', 'Full-Time', 80000);   -- Employee 102: Mary Williams

-- Select all records from the 'Employee' table to verify data insertion
SELECT * FROM Employee;

-- Insert additional employee records into the 'Employee' table
INSERT INTO Employee VALUES 
    (103, 'Gwen', 'Johnson', 4, NULL, 'Full-Time', 40000),        -- Employee 103: Gwen Johnson (null classification)
    (104, 'Michael', 'Jones', 4, 'Non-Exempt', 'Full-Time', 90000), -- Employee 104: Michael Jones
    (105, 'Ryan', 'Orton', 1, 'Non-Exempt', 'Full-Time', 99000); -- Employee 105: Ryan Orton

-- Select all records from the 'Employee' table to verify data insertion
SELECT * FROM Employee;

-- Insert a record for a famous or fictional character
INSERT INTO Employee VALUES 
    (106, 'Famous', 'Character', 2, 'Exempt', 'Part-Time', 75000);  -- Replace with your chosen details

-- Select specific fields from the 'Employee' table: first name, last name, employee ID, and department ID
SELECT First_Name, Last_Name, Employee_ID, Department_ID FROM Employee;

