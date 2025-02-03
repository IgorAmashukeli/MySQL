/*
Display the last name, car number, and violation only for those drivers who have violated the same rule two or more times in the same car.
At the same time, all violations should be taken into account, regardless of whether they are paid for or not.
Sort the information in alphabetical order, first by the driver's last name, then by car number, and finally by violation.
*/


SELECT 
  name, 
  number_plate, 
  violation 
FROM 
  fine 
GROUP BY 
  name, 
  number_plate, 
  violation 
HAVING 
  COUNT(*) >= 2 
ORDER BY 
  name, 
  number_plate, 
  violation;
