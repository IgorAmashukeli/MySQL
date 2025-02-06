/*
Display all Pavel Baranov's orders (order id, which books, at what price and in what quantity he ordered) sorted by order number and book titles.
*/


SELECT 
  buy.buy_id AS buy_id, 
  book.title AS title, 
  book.price AS price, 
  buy_book.amount AS amount 
FROM 
  client 
  INNER JOIN buy ON client.client_id = buy.client_id 
  INNER JOIN buy_book ON buy.buy_id = buy_book.buy_id 
  INNER JOIN book ON buy_book.book_id = book.book_id 
WHERE 
  client.name_client = 'Baranov Pavel' 
ORDER BY 
  buy.buy_id ASC, 
  book.title ASC;
