/*
When analyzing the remaining books in the warehouse, 
it was decided to additionally order books by authors who have a total number of copies of books less than 10. 
The table should display the authors, the smallest and the largest number of their books.
*/

SELECT 
  author AS Author, 
  MIN(amount) AS MinAmount, 
  MAX(amount) AS MaxAmount 
FROM 
  book 
GROUP BY 
  author 
HAVING 
  SUM(amount) < 10;
