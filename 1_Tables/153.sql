/*
Output the authors and the total cost of their books, if at least one of their books has a price higher than the average in stock. 
The average price is calculated as a simple average using avg(). Sort the information in descending order of the total cost.
*/




SELECT 
  author, 
  SUM(price * amount) AS Cost 
FROM 
  book 
GROUP BY 
  author 
HAVING 
  SUM(
    IF(
      price > (
        SELECT 
          AVG(price) 
        FROM 
          book
      ), 
      1, 
      0
    )
  ) >= 1 
ORDER BY 
  Cost DESC;