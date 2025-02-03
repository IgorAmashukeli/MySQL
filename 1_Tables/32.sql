/*
Add from the supply table to the book table only those books whose authors are not in the book.
*/


INSERT INTO book (title, author, price, amount) 
SELECT 
  title, 
  author, 
  price, 
  amount 
FROM 
  supply 
WHERE 
  author NOT IN (
    SELECT 
      author 
    FROM 
      book
  );
SELECT 
  title, 
  author, 
  price, 
  amount 
FROM 
  book;