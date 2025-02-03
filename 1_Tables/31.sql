/*
Add all books from the supply table to the book table, except books written by Bulgakov M.A. and Dostoevsky F.M.
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
  (
    author <> 'Bulgakov M.A.'
  ) 
  AND (
    author <> 'Dostoevsky F.M.'
  );
