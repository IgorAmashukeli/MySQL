/*
Display information about each order: its number, who generated it (user's last name) 
and its cost (the sum of the products of the number of books ordered and their prices),
sorted by order number. The last column is the name of the Cost.
*/


SELECT 
  buy_book.buy_id, 
  client.name_client, 
  SUM(book.price * buy_book.amount) AS Cost 
FROM 
  client 
  INNER JOIN buy USING(client_id) 
  INNER JOIN buy_book USING(buy_id) 
  INNER JOIN book USING(book_id) 
GROUP BY 
  buy_book.buy_id, 
  client.name_client 
ORDER BY 
  buy_id ASC;

