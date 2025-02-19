/*
Display the authors and titles of books and their price in two columns - rubles and kopecks.  Sort the information in descending order of kopecks.
*/


SELECT 
  author, 
  title, 
  FLOOR(price) AS Rubles, 
  ROUND(
    100 * (
      price - FLOOR(price)
    )
  ) AS Kopeks 
FROM 
  book 
ORDER BY 
  Kopeks DESC;
