/*
Count the number of copies of books by each author from the author table.  
Display those authors whose number of books is less than 10, sorted in ascending order.
The last column should name the BookCount.
*/


SELECT 
  name_author, 
  SUM(amount) AS BookCount 
FROM 
  author 
  LEFT JOIN book ON author.author_id = book.author_id 
GROUP BY 
  name_author 
HAVING 
  (BookCount < 10) 
  OR (BookCount IS NULL) 
ORDER BY 
  BookCount;











