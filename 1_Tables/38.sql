/*
For each city, count the number of times employees have visited it.  
The information is displayed in alphabetical order by city name. 
The calculated column should be named as the Quantity.
*/


SELECT 
  city, 
  COUNT(*) AS Amount 
FROM 
  trip 
GROUP BY 
  city 
ORDER BY 
  city;
