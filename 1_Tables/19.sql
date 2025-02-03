/*
Display the price of the cheapest book, the price of the most expensive book, and the average price of all books in the warehouse. 
Name the columns Minimum_Price, Maximum_Price, and Average_Price, respectively. 
Round the average price to two decimal places.
*/

SELECT 
  MIN(price) AS Minimum_Price, 
  MAX(price) AS Maximum_Price, 
  ROUND(
    AVG(price), 
    2
  ) AS Average_Price 
FROM 
  book;