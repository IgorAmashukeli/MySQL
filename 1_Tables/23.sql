/*
Display information (author, title, and price) about books whose prices are less than or equal to the average book price in the warehouse.
Present the information sorted in descending order of price.
Calculate the average as the mean book price.
*/


SELECT author, title, price FROM book
WHERE price <= (
    SELECT AVG(price)
    FROM book
)
ORDER BY price DESC;