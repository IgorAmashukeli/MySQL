/*
Create an ordering table to include the authors and titles of those books whose number of copies
in the book table is less than the average number of copies in the book table. 
Include the amount column in the table, 
where you can specify the same value for all books - the average number of copies of books in the book table.
*/


CREATE TABLE ordering AS 
SELECT 
  author, 
  title, 
  (
    SELECT 
      ROUND(
        AVG(amount)
      ) 
    FROM 
      book
  ) AS amount 
FROM 
  book 
WHERE 
  amount < (
    SELECT 
      ROUND(
        AVG(amount)
      ) 
    FROM 
      book
  );
SELECT 
  * 
FROM 
  ordering;