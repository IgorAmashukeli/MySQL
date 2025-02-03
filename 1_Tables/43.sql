/*
Print the last name with the initials and the total amount of daily allowances received 
for all business trips for those employees who have been on business trips more than 3 times,
in descending order of the amount of daily allowances. The last column is called the Amount.

The row of the trip table has been changed only for this task.:
*/

SELECT 
  name, 
  SUM(
    per_diem * (
      DATEDIFF(date_last, date_first) + 1
    )
  ) as Сумма 
FROM 
  trip 
GROUP BY 
  name 
HAVING 
  COUNT(*) > 3 
ORDER BY 
  Сумма DESC;