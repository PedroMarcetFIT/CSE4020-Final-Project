ALTER TABLE orders
ADD CONSTRAINT unique_orderID UNIQUE (orderID);

ALTER TABLE customers
ADD CONSTRAINT unique_customerID UNIQUE (customerID);

ALTER TABLE customers
ADD CONSTRAINT unique_companyName UNIQUE (companyName);

ALTER TABLE customers
ADD CONSTRAINT unique_contactName UNIQUE (contactName);

ALTER TABLE employees
ADD CONSTRAINT unique_employeeID UNIQUE (employeeID);
ALTER TABLE employees
ADD CONSTRAINT unique_employees_lastName UNIQUE (employees_lastName);
ALTER TABLE employees
ADD CONSTRAINT unique_employees_firstName UNIQUE (employees_firstName);

ALTER TABLE products
ADD CONSTRAINT unique_productID UNIQUE (productID);
ALTER TABLE products
ADD CONSTRAINT unique_productName UNIQUE (productName);

ALTER TABLE suppliers
ADD CONSTRAINT unique_supplierID UNIQUE (supplierID);
ALTER TABLE suppliers
ADD CONSTRAINT unique_suppliers_companyName UNIQUE (suppliers_companyName);

ALTER TABLE categories
ADD CONSTRAINT unique_categoryID UNIQUE (categoryID);
ALTER TABLE categories
ADD CONSTRAINT unique_categoryName UNIQUE (categoryName);

ALTER TABLE quantities
ADD CONSTRAINT unique_quantityPerUnit UNIQUE (quantityPerUnit);

ALTER TABLE orderProducts
ADD PRIMARY KEY (orderID, productID);

ALTER TABLE orders
ADD PRIMARY KEY (orderID);

ALTER TABLE customers
ADD PRIMARY KEY (customerID);

ALTER TABLE employees
ADD PRIMARY KEY (employeeID);

ALTER TABLE products
ADD PRIMARY KEY (productID);

ALTER TABLE suppliers
ADD PRIMARY KEY (supplierID);

ALTER TABLE categories
ADD PRIMARY KEY (categoryID);

ALTER TABLE quantities
ADD PRIMARY KEY (quantityPerUnit);