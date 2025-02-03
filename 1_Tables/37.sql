/*
Put the names and initials of those employees who were on a business trip in Moscow in alphabetical order.
*/

SELECT 
  DISTINCT(name) 
FROM 
  trip 
WHERE 
  city = 'Москва' 
ORDER BY 
  name;
