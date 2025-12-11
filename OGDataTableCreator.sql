DROP TABLE IF EXISTS OGDataTable;
CREATE TABLE OGDataTable (
	orderID INT,
	customerID VARCHAR(255),
	employeeID INT,
	orderDate DATETIME,
	requiredDate DATETIME,
	shippedDate DATETIME,
	shipVia INT,
	Freight FLOAT,
	productID INT,
	unitPrice INT,
	quantity INT,
	discount INT,
	companyName VARCHAR(255),
	contactName VARCHAR(255),
	contactTitle VARCHAR(255),
	employees_lastName VARCHAR(255),
	employees_firstName VARCHAR(255),
	employees_title VARCHAR(255),
	productName VARCHAR(255),
	supplierID INT,
	categoryID INT,
	quantityPerUnit VARCHAR(255),
	unitPrice_1 INT,
	unitsInStock INT,
	unitsOnOrder INT,
	reorderLevel INT,
	discontinued INT,
	categoryName VARCHAR(255),
	suppliers_companyName VARCHAR(255),
	suppliers_contactName VARCHAR(255),
	suppliers_contactTitle VARCHAR(255)
);

LOAD DATA LOCAL INFILE '<LOCAL-PATH-HERE>/CompanyDataCleaned.csv'
INTO TABLE OGDataTable
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;