-- Adding Primary Keys --
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


-- Foreign Keys --
ALTER TABLE orders
    ADD CONSTRAINT fkOrdertoCustomer
    FOREIGN KEY (customerID) REFERENCES customers(customerID);

ALTER TABLE orders
    ADD CONSTRAINT fkOrdertoEmployee
    FOREIGN KEY (employeeID) REFERENCES employees(employeeID);

ALTER TABLE products
    ADD CONSTRAINT fkProducttoQuantity
    FOREIGN KEY (quantityPerUnit) REFERENCES quantities(quantityPerUnit);

ALTER TABLE products
    ADD CONSTRAINT fkProducttoSupplier
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID);

ALTER TABLE products
    ADD CONSTRAINT fkProducttoCategories
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID);

ALTER TABLE orderProducts
    ADD CONSTRAINT fkOPtoProducts
    FOREIGN KEY (productID) REFERENCES products(productID);

ALTER TABLE orderProducts
    ADD CONSTRAINT fkOPtoOrders
    FOREIGN KEY (orderID) REFERENCES orders(orderID);


-- Ensuring Cascading Deletes When Appropriate --
ALTER TABLE orderProducts
    DROP FOREIGN KEY fkOPtoOrders,
    ADD CONSTRAINT fkOPtoOrders
        FOREIGN KEY (orderID) REFERENCES orders(orderID)
        ON DELETE CASCADE;

ALTER TABLE orderProducts
    DROP FOREIGN KEY fkOPtoProducts,
    ADD CONSTRAINT fkOPtoProducts
    FOREIGN KEY (productID) REFERENCES products(productID)
    ON DELETE CASCADE;