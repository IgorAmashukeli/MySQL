/*
Withdraw the amount of the daily allowance (the product of the number of business trip days and the amount of the daily allowance) for business trips,
the first day of which fell on February or March 2020. ]
The value of the daily allowance for each business trip is entered in the per_diem column.
Print the employee's last name and initials, the city, the first day of the business trip, and the amount of the daily allowance.
The last column is called the Amount.
Sort the information first in alphabetical order by the last names of the employees, and then in descending order of the amount of the daily allowance.
*/


SELECT 
  name, 
  city, 
  date_first, 
  per_diem * (
    DATEDIFF(date_last, date_first) + 1
  ) AS Сумма 
FROsM
  trip 
WHERE 
  YEAR(date_first) = '2020' 
  AND (
    (
      MONTH(date_first) = '02' 
      OR MONTH(date_first) = '03'
    )
  ) 
ORDER BY 
  name ASC, 
  Сумма DESC;