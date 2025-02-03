/*
Find which book will generate the most revenue, as a percentage
*/

SELECT 
  author, 
  title, 
  price, 
  amount, 
  ROUND(
    100 * (price * amount) / (
      SELECT 
        SUM(price * amount) AS total_price 
      FROM 
        book
    ), 
    2
  ) AS income_percent 
FROM 
  book 
ORDER BY 
  income_percent DESC;