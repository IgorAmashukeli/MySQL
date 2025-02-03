/*
Create an ordering table to include the authors and titles of those books whose number in the book table is less than the maximum (15).
For all books in the ordering table, specify a value that will allow you to align the number of books to the maximum in the book table.
*/


CREATE TABLE ordering 
SELECT 
  author, 
  title, 
  (
    (
      SELECT 
        MAX(amount) 
      FROM 
        book
    ) - book.amount
  ) AS amount 
FROM 
  book 
WHERE 
  book.amount < (
    SELECT 
      MAX(amount) 
    FROM 
      book
  );
SELECT 
  * 
FROM 
  ordering;