/*
Create an invoice (buy_pay table) for the payment of an order with the number 5, which includes the name of the books,
their authors, price, number of books ordered and cost.
The last column is the name of the Cost. Enter the information in the table sorted by book titles.
*/


CREATE TABLE buy_pay (
  title VARCHAR(50), 
  author VARCHAR(50), 
  price DECIMAL(8, 2), 
  amount INT, 
  Сost DECIMAL(8, 2)
);
INSERT INTO buy_pay 
SELECT 
  book.title, 
  author.name_author, 
  book.price, 
  buy_book.amount, 
  (book.price * buy_book.amount) AS Сost 
FROM 
  author 
  INNER JOIN book ON author.author_id = book.author_id 
  INNER JOIN buy_book ON book.book_id = buy_book.book_id 
  AND buy_book.buy_id = 5 
ORDER BY 
  book.title;
