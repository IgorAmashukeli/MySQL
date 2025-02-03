/*

Display the titles and authors of books whose prices are within the range of 540.50 to 800 (inclusive) 
and whose quantity is either 2, 3, 5, or 7

*/


SELECT 
  title, 
  author  
FROM 
  book 
WHERE 
  (
    price >= 540.5 
    AND price <= 800
  ) 
  AND amount IN (2, 3, 5, 7);