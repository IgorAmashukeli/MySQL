/*
Reduce the number of books in stock that were included in order number 5.
*/


UPDATE 
  book 
  INNER JOIN buy_book ON book.book_id = buy_book.book_id 
  AND buy_book.buy_id = 5 
SET 
  book.amount = book.amount - buy_book.amount;