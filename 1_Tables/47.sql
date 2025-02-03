/*
Enter in the fine table the amounts of fines that the driver must pay, according to the data from the traffic_violation table. 
In this case, the amounts should be entered only in the empty fields of the sum_fine column.
*/


UPDATE 
  fine as f, 
  traffic_violation as t 
SET 
  f.sum_fine = IF(
    f.sum_fine IS NULL, t.sum_fine, f.sum_fine
  ) 
WHERE 
  t.violation = f.violation;
SELECT 
  * 
FROM 
  fine;