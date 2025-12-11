DROP TABLE IF EXISTS orderProducts;
CREATE TABLE orderProducts AS
	SELECT DISTINCT orderID, productID, unitPrice, quantity, discount
	FROM OGDataTable;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders AS
	SELECT DISTINCT orderID, customerID, employeeID, orderDate, requiredDate, shippedDate, shipVia, Freight
	FROM OGDataTable;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers AS
	SELECT DISTINCT customerID, companyName, contactName, contactTitle
	FROM OGDataTable;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees AS
	SELECT DISTINCT employeeID, employees_lastName, employees_firstName, employees_title
	FROM OGDataTable;

DROP TABLE IF EXISTS products;
CREATE TABLE products AS
	SELECT DISTINCT productID, productName, supplierID, categoryID, quantityPerUnit, unitPrice_1, unitsInStock, unitsOnOrder, reorderLevel
	FROM OGDataTable;

DROP TABLE IF EXISTS suppliers;
CREATE TABLE suppliers AS
	SELECT DISTINCT supplierID, suppliers_companyName, suppliers_contactName, suppliers_contactTitle
	FROM OGDataTable;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories AS
	SELECT DISTINCT categoryID, categoryName
	FROM OGDataTable;

DROP TABLE IF EXISTS quantities;
CREATE TABLE quantities AS
	SELECT DISTINCT quantityPerUnit, discontinued
	FROM OGDataTable;