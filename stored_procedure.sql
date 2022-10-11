-- STORED PROCEDURE to insert new books into the products table

DELIMITER //

CREATE PROCEDURE InsertBook(IN title VARCHAR(100), IN b_author VARCHAR(100), IN b_price DECIMAL(6,2),
							IN b_genre VARCHAR(30), IN b_rating DECIMAL(4,2))
BEGIN 
	INSERT INTO products(book_title, author, price, genre, rating)
    VALUES (title, b_author, b_price, b_genre, b_rating);
    
END //

DELIMITER ;

SELECT * FROM products;

CALL InsertBook ('Practical Statistics for Data Scientists', 'Peter Bruce and Andrew Bruce', 
				74.99, 'Technology', 4.5);
                
SELECT * FROM products;

DROP PROCEDURE InsertBook;