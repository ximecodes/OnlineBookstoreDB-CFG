-- STORED FUNCTION to categorize sales by price amount

DELIMITER //
CREATE FUNCTION category_sales (price DECIMAL(10,2))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE type_sale VARCHAR(50);
    IF price <= 10.00 THEN
		SET type_sale = 'Small Sale';
	ELSEIF (price > 10.00 
			AND price <= 50.00) THEN
		SET type_sale = 'Medium Sale';
	ELSEIF price > 50.00 THEN
		SET type_sale = 'Large Sale';
    END IF;
    RETURN (type_sale);
    
    END // price
    
    DELIMITER ;
    
DROP FUNCTION category_sales;


SELECT CONCAT(c_fname, ' ', c_lname) AS customer,
DATE_FORMAT(order_date, '%d/%m/%Y') AS 'order date',
item_price AS price,
category_sales(item_price) AS 'type of sale'
FROM order_items oi
INNER JOIN orders o
	ON oi.order_id = o.order_id
INNER JOIN customers c
	ON o.customer_id = c.customers_id
ORDER BY price;
