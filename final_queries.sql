-- QUERIES

-- Where are customers from?
SELECT country, count(country) AS customers
FROM c_addresses
GROUP BY country
ORDER BY customers DESC;


-- VIEW sales per month
CREATE VIEW v_sales_month AS
SELECT MONTHNAME(order_date) AS month,
YEAR(order_date) AS year,
COUNT(item_id) AS 'no. of sales',
SUM(item_price) AS 'total sales (US$)'
FROM orders OD
RIGHT JOIN order_items OI
	ON OD.order_id = OI.order_id
GROUP BY month, year
ORDER BY order_date;

SELECT * FROM v_sales_month;

DROP VIEW v_sales_month;


-- SUBQUERY
SELECT item_price AS 'highest sale (US$)',
DATE_FORMAT(order_date, '%d/%m/%Y') AS 'order date'
FROM order_items oi
LEFT JOIN orders o
	ON oi.order_id = o.order_id
WHERE item_price = (SELECT MAX(item_price) 
					FROM order_items);


-- VIEW (USING 3 TABLES)
-- Orders with products, buyers, unitary and total price, quantity, status of the orders
CREATE VIEW v_detailed_orders AS
SELECT book_title AS 'book title', 
CONCAT(c_fname, ' ', c_lname) AS customer,
price AS 'unitary price',
quantity,
item_price AS 'total price',
status
FROM products p
INNER JOIN order_items oi
	ON p.product_id = oi.product_id
INNER JOIN orders o
	ON o.order_id = oi.order_id
INNER JOIN customers c
	ON c.customers_id = o.customer_id
ORDER BY book_title;

SELECT * FROM v_detailed_orders;

DROP VIEW v_detailed_orders;


