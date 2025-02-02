USE orton;

ALTER TABLE Branches RENAME TO Department;

INSERT INTO Department VALUES
    (1, 'Accounting'),
    (2, 'Human Resources'),
    (3, 'Information Systems'),
    (4, 'Marketing');

SELECT * FROM Department;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 2;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 4;

INSERT INTO Employee VALUES
    (100, 'John', 'Smith', 1, 'Exempt', 'Full-Time', 90000),
    (101, 'Mary', 'Jones', 2, 'Non-Exempt', 'Part-Time', 35000),
    (102, 'Mary', 'Williams', 3, 'Exempt', 'Full-Time', 80000),
    (103, 'Gwen', 'Johnson', 4, NULL, 'Full-Time', 40000),
    (104, 'Michael', 'Jones', 4, 'Non-Exempt', 'Full-Time', 90000),
    (105, 'YourFirstName', 'YourLastName', 1, 'Non-Exempt', 'Full-Time', 65000),  -- Adjust Salary value as needed
    (106, 'Famous', 'Character', 2, 'Exempt', 'Part-Time', 75000),  -- Replace with chosen details
    (107, 'Jane', 'Doe', 1, 'Exempt', 'Full-Time', 70000),
    (108, 'Sam', 'Smith', 2, 'Non-Exempt', 'Part-Time', 45000),
    (109, 'Alice', 'Brown', 3, 'Exempt', 'Full-Time', 80000),
    (110, 'Bob', 'Taylor', 4, 'Non-Exempt', 'Full-Time', 50000),
    (111, 'Chris', 'Evans', 1, 'Exempt', 'Full-Time', 72000),
    (112, 'Emma', 'Watson', 2, 'Non-Exempt', 'Part-Time', 48000),
    (113, 'Robert', 'Downey', 3, 'Exempt', 'Full-Time', 85000),
    (114, 'Scarlett', 'Johansson', 4, 'Non-Exempt', 'Full-Time', 51000),
    (115, 'Tom', 'Holland', 1, 'Exempt', 'Full-Time', 76000);

SELECT * FROM Employee;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 1;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 2;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 4;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID;

SELECT First_Name, Last_Name, Department.Department_Name
FROM Employee
INNER JOIN Department ON Employee.Department_ID = Department.Department_ID
WHERE Employee.Department_ID = 3 OR Employee.Department_ID = 2
INTO OUTFILE '/home/codio/workspace/HRandIS-Employees.csv'
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
