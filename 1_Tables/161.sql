/*
For an odd number of books, calculate the difference between the maximum cost (price * quantity) and the cost of all copies of a particular book. 
Sort by this difference in descending order. Output the title, author, quantity, difference with the maximum cost
*/

SELECT 
  title, 
  author, 
  amount, 
  MAX(price * amount) OVER() - price * amount AS ThedifferenceWithMaxCost 
FROM 
  book 
WHERE 
  amount % 2 = 1 
ORDER BY 
  ThedifferenceWithMaxCost DESC;

