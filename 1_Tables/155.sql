/*
Bring out the authors who have books with a value of more than 500 and a quantity of more than 1 piece in stock. 
Consider books only by those authors who have at least 2 works in stock. Output the author, the number of different works by the author, 
the minimum price and the number of books in stock. Sort the information by the author's last name in alphabetical order.
*/


SELECT author, COUNT(*) AS CountBooks, 
MIN(price) AS MinPrice, SUM(amount) AS BookAmount FROM
book
GROUP BY author
HAVING COUNT(*) >= 2 AND SUM(IF(price > 500 AND amount > 1, 1, 0)) >= 1;