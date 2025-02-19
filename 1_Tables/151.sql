/*
Delete books from the book and supply tables with prices ending at 99 kopecks. 
For example, a book with a price of 670.99 should be deleted.
*/


SET 
  @ending := 0.99;
DELETE FROM 
  book 
WHERE 
  book.price - FLOOR(book.price) = @ending;
DELETE FROM 
  supply 
WHERE 
  supply.price - FLOOR(supply.price) = @ending;
SELECT 
  * 
FROM 
  book;
SELECT 
  * 
FROM 
  supply;

