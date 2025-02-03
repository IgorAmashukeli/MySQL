/*
Display information about the employee's business trips, which were the shortest in time. 
Include columns name, city, date_first, and date_last in the result.
*/

select 
  MONTHNAME(date_first) AS Month, 
  COUNT(*) AS Amount 
FROM 
  trip 
GROUP BY 
  MONTHNAME(date_first) 
ORDER BY 
  Amount DESC, 
  Month ASC;