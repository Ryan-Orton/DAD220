-- Create the Parts Maintenance table
CREATE TABLE Parts_Maintenance (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(100),
    FailureCause VARCHAR(100),
    ReplacementDate DATE,
    Region VARCHAR(50)
);

-- Load data from the FleetMaintenanceRecords CSV file into the Parts Maintenance table
LOAD DATA INFILE '/home/codio/workspace/FleetMaintenanceRecords.csv'
INTO TABLE Parts_Maintenance
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Query to find the most frequently replaced parts
SELECT PartName, COUNT(*) AS ReplacementCount
FROM Parts_Maintenance
GROUP BY PartName
ORDER BY ReplacementCount DESC;

-- Query to find the region with the most part failures and replacements
SELECT Region, COUNT(*) AS ReplacementCount
FROM Parts_Maintenance
GROUP BY Region
ORDER BY ReplacementCount DESC;

-- Query to find parts most often replaced due to corrosion or rust
SELECT PartName, COUNT(*) AS CorrosionCount
FROM Parts_Maintenance
WHERE FailureCause IN ('Corrosion', 'Rust')
GROUP BY PartName
ORDER BY CorrosionCount DESC;

-- Query to find parts most often replaced due to mechanical failure or accidents
SELECT PartName, COUNT(*) AS FailureCount
FROM Parts_Maintenance
WHERE FailureCause IN ('Mechanical Failure', 'Accident', 'Flat Tire')
GROUP BY PartName
ORDER BY FailureCount DESC;
