/*
Display information about business trips to all cities except Moscow and St. Petersburg (last names and initials of employees, city,
duration of business trip in days,
with the first and last day referring to the business trip period).
The last column should be named for the Duration.
The information should be displayed in descending order of the duration of the trip, and then in descending order
of the names of the cities (in reverse alphabetical order).
*/


SELECT 
  name, 
  city, 
  DATEDIFF(date_last, date_first) + 1 AS Duration 
FROM 
  trip 
WHERE 
  city <> 'Moscow' 
  AND city <> 'St. Petersburg' 
ORDER BY 
  Duration DESC, 
  city DESC;