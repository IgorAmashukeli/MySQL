/*
For each author, calculate the total cost of books S (column name: Total_Cost), 
as well as the value-added tax (VAT) included in the total cost (column name: VAT), which is 18% (k=18), 
and the cost of books excluding VAT (column name: Cost_Without_VAT). 
Round the values to two decimal places.
*/


SELECT 
  author, 
  ROUND(
    SUM(price * amount), 
    2
  ) AS Total_Cost, 
  ROUND(
    (
      SUM(price * amount) * 0.18 / 1.18
    ), 
    2
  ) AS VAT, 
  ROUND(
    SUM(price * amount) / 1.18, 
    2
  ) AS Cost_Without_VAT 
FROM 
  book 
GROUP BY 
  author;