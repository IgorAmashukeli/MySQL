/*
Add new books from the supply table to the book table based on the query generated above.
Then display the book table for viewing.
*/

INSERT INTO book (title, author_id, price, amount) 
SELECT 
  title, 
  author_id, 
  price, 
  amount 
FROM 
  author 
  INNER JOIN supply ON author.name_author = supply.author 
WHERE 
  supply.amount <> 0;
