/*
Delete all authors and all their books, the total number of books of which is less than 20.
*/


DELETE FROM 
  author 
WHERE 
  author_id IN (
    SELECT 
      book.author_id 
    FROM 
      book 
    GROUP BY 
      book.author_id 
    HAVING 
      SUM(amount) < 20
  );
SELECT 
  * 
FROM 
  author;
SELECT 
  * 
FROM 
  book;