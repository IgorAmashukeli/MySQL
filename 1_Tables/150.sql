/*
Display all information from the book table, ordered in ascending order of the length of the book title.
*/



SELECT 
  book_id, 
  title, 
  author, 
  price, 
  amount 
FROM 
  book 
ORDER BY 
  LENGTH(title);