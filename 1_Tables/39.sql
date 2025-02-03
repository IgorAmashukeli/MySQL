/*
Bring out two cities where employees were most often on business trips. 
The calculated column should be named as the Amount.
*/

SELECT 
  city, 
  COUNT(*) AS Amount 
FROM 
  trip 
GROUP BY 
  city 
ORDER BY 
  COUNT(*) DESC 
LIMIT 
  2;