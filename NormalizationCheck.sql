CREATE TABLE baseStuff AS
	SELECT DISTINCT orderID, productID, unitPrice, quantity, discount
	FROM OGDataTable;

CREATE TABLE orderIDStuff AS
	SELECT DISTINCT orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, Freight
	FROM OGDataTable;

CREATE TABLE customerIDStuff AS
	SELECT DISTINCT customerID, companyName, contactName, contactTitle
	FROM OGDataTable;

CREATE TABLE employeeIDStuff AS
	SELECT DISTINCT employeeID, employees_lastName, employees_firstName, employees_title
	FROM OGDataTable;

CREATE TABLE productIDStuff AS
	SELECT DISTINCT productID, productName, supplierID, categoryID, quantityPerUnit, unitPrice_1, unitsInStock, unitsOnOrder, reorderLevel
	FROM OGDataTable;

CREATE TABLE supplierIDStuff AS
	SELECT DISTINCT supplierID, suppliers_companyName, suppliers_contactName, suppliers_contactTitle
	FROM OGDataTable;

CREATE TABLE categoryIDStuff AS
	SELECT DISTINCT categoryID, categoryName
	FROM OGDataTable;

CREATE TABLE quantityPerUnitStuff AS
	SELECT DISTINCT quantityPerUnit, discontinued
	FROM OGDataTable;