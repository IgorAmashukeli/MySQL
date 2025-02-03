/*
Display information (author, book, and quantity) about books where the number of copies in the book table is not duplicated.
*/

SELECT 
  author, 
  title, 
  amount 
FROM 
  book 
WHERE 
  amount IN (
    SELECT 
      amount 
    FROM 
      book 
    GROUP BY 
      amount 
    HAVING 
      COUNT(*) = 1
  );
