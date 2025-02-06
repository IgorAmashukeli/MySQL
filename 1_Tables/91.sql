/*
Add the order number 5 to the buy_book table. 
This order must contain Pasternak's book "Lyrics" in two copies and Bulgakov's book "The White Guard" in one copy.
*/


INSERT INTO buy_book (buy_id, book_id, amount) 
SELECT 
  5, 
  book.book_id, 
  2 
FROM 
  book 
WHERE 
  book.title = 'Lyrics' 
UNION ALL 
SELECT 
  5, 
  book.book_id, 
  1 
FROM 
  book 
WHERE 
  book.title = 'The White Guard';
