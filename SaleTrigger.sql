CREATE TRIGGER log_insert_order
AFTER INSERT ON orderProducts
FOR EACH ROW
    UPDATE products
    SET unitsInStock = unitsInStock - NEW.quantity,
        unitsOnOrder = unitsOnOrder + NEW.quantity
    WHERE productID = NEW.productID;
