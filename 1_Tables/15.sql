/*

Select distinct (unique) elements of the amount column from the book table

*/

-- the first approach
SELECT 
  DISTINCT amount 
FROM 
  book;


-- the second approach
SELECT 
  amount 
FROM 
  book 
GROUP BY 
  amount;