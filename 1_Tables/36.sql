/*
To display information about the business trips of those employees whose last
name ends with the letter "a" in descending order from the date of the last day of the business trip.
Try to include the username, city, period of day, speed of the first, date of the last.
*/

SELECT 
  name, 
  city, 
  per_diem, 
  date_first, 
  date_last 
FROM 
  trip 
WHERE 
  name LIKE "%a _._." 
ORDER BY 
  date_last DESC;