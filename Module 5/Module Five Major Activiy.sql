-- Load sales data into the Sales table
LOAD DATA INFILE '/home/codio/workspace/SalesData.csv'
INTO TABLE Sales
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Query to analyze sales data by state to determine where the company has the largest customer base
SELECT State, COUNT(*) AS CustomerCount
FROM Sales
GROUP BY State
ORDER BY CustomerCount DESC;

-- Query to determine the top three products sold in the United States
SELECT SKU, COUNT(*) AS SalesCount
FROM Sales
GROUP BY SKU
ORDER BY SalesCount DESC
LIMIT 3;

-- Query to determine the top three products sold in the southeastern region of the United States
SELECT SKU, COUNT(*) AS SalesCount
FROM Sales
WHERE State IN ('VA', 'NC', 'SC', 'GA')
GROUP BY SKU
ORDER BY SalesCount DESC
LIMIT 3;

-- Load returns data into the Returns table
LOAD DATA INFILE '/home/codio/workspace/ReturnsData.csv'
INTO TABLE Returns
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n';

-- Query to determine the top three products returned in the United States
SELECT SKU, COUNT(*) AS ReturnCount
FROM Returns
GROUP BY SKU
ORDER BY ReturnCount DESC
LIMIT 3;

-- Query to determine the top three products returned in the northwestern region of the United States
SELECT SKU, COUNT(*) AS ReturnCount
FROM Returns
WHERE State IN ('WA', 'OR', 'ID', 'MT')
GROUP BY SKU
ORDER BY ReturnCount DESC
LIMIT 3;
