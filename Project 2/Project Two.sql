-- Query to analyze the number of returns by state
SELECT State, COUNT(*) AS ReturnCount
FROM RMA
GROUP BY State
ORDER BY ReturnCount DESC;

-- Query to analyze the percentage of returns by product type
SELECT ProductType, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM RMA)) AS ReturnPercentage
FROM RMA
GROUP BY ProductType
ORDER BY ReturnPercentage DESC;
