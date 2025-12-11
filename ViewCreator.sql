DROP VIEW IF EXISTS employeePerformance;
CREATE VIEW employeePerformance AS
SELECT 
    o.employeeID,
    SUM(op.quantity) AS quantitySold,
    SUM(op.unitPrice * op.quantity * (1 - op.discount)) AS revenueGenerated
FROM orders AS o
JOIN orderProducts AS op ON o.orderID = op.orderID
GROUP BY o.employeeID;
