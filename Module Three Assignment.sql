-- Select the database to use for operations
USE orton;

-- Rename the Branches table to Department
ALTER TABLE Branches RENAME TO Department;

-- Insert values into the Department table
INSERT INTO Department VALUES
    (1, 'Accounting'),
    (2, 'Human Resources'),
    (3, 'Information Systems'),
    (4, 'Marketing');

-- Select all records from the Department table to verify data
SELECT * FROM Department;

-- Retrieve all employees who work in the Accounting department (Department_ID = 1)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

-- Retrieve all employees who work in the Human Resources department (Department_ID = 2)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 2;

-- Retrieve all employees who work in the Information Systems department (Department_ID = 3)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3;

-- Retrieve all employees who work in the Marketing department (Department_ID = 4)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 4;

-- Insert multiple employee records into the Employee table
INSERT INTO Employee VALUES
    (107, 'Amanda', 'Atkinson', 1, 'Exempt', 'Full-Time', 90000),
    (108, 'Michael', 'Summerson', 2, 'Non-Exempt', 'Part-Time', 35000),
    (109, 'Brina', 'Anderson', 3, 'Exempt', 'Full-Time', 80000),
    (110, 'Trevor', 'Lenke', 1, 'Non-Exempt', 'Full-Time', 95000),
    (111, 'Phillip', 'Joneston', 2, 'Non-Exempt', 'Full-Time', 91000),
    (112, 'Mary', 'Wilson', 3, 'Exempt', 'Full-Time', 80000),
    (113, 'Johnny', 'Cooney', 2, 'Non-Exempt', 'Full-Time', 93000),
    (114, 'Christopher', 'Nolan', 2, 'Non-Exempt', 'Full-Time', 99000),
    (115, 'Mel', 'Miller', 3, 'Exempt', 'Full-Time', 80000),
    (116, 'Scott', 'Fisher', 3, 'Exempt', 'Full-Time', 80000);

-- Select all records from the Employee table to verify data
SELECT * FROM Employee;

-- Perform inner join to get employees working in the Accounting department (again)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

-- Perform inner join to get employees working in the Human Resources department (again)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 2;

-- Perform inner join to get employees working in the Information Systems department (again)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3;

-- Perform inner join to get employees working in the Marketing department (again)
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 4;

-- Perform inner join to get all employees along with their department names
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID;

-- Export records for employees in the Human Resources and Information Systems departments to a CSV file
SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3 OR Employee.Department_ID = 2
INTO OUTFILE '/home/codio/workspace/HRandIS-Employees.csv'
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';

