DROP PROCEDURE IF EXISTS getProductsToRestock;
CREATE PROCEDURE getProductsToRestock()
SELECT 
	productID,
	productName,
	unitsInStock,
	unitsOnOrder,
	reorderLevel,
	(reorderLevel - (unitsInStock + unitsOnOrder)) AS shortage
FROM products
WHERE (unitsInStock + unitsOnOrder) < reorderLevel;
