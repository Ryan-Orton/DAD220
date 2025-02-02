USE orton;

CREATE TABLE Employee (
    Employee_ID SMALLINT,
    First_Name VARCHAR(40),
    Last_Name VARCHAR(60),
    Department_ID SMALLINT,
    Classification VARCHAR(10),
    Status VARCHAR(10),
    Salary DECIMAL(7,2)
);

CREATE TABLE Branches (
    Department_ID SMALLINT,
    Department_Name VARCHAR(50)
);

DESCRIBE Employee;
DESCRIBE Branches;

INSERT INTO Employee VALUES
    (100, 'John', 'Smith', 1, 'Exempt', 'Full-Time', 90000),
    (101, 'Mary', 'Jones', 2, 'Non-Exempt', 'Part-Time', 35000),
    (102, 'Mary', 'Williams', 3, 'Exempt', 'Full-Time', 80000);

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
    (103, 'Gwen', 'Johnson', 4, NULL, 'Full-Time', 40000),
    (104, 'Michael', 'Jones', 4, 'Non-Exempt', 'Full-Time', 90000),
    (105, 'YourFirstName', 'YourLastName', 1, 'Non-Exempt', 'Full-Time', 65000);  -- Adjust Salary value as needed

SELECT * FROM Employee;

INSERT INTO Employee VALUES 
    (106, 'Famous', 'Character', 2, 'Exempt', 'Part-Time', 75000);  -- Replace with your chosen details

SELECT First_Name, Last_Name, Employee_ID, Department_ID FROM Employee;
