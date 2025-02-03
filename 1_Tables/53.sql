/*
Delete information about violations committed before February 1, 2020 from the fine table.
*/

DELETE FROM 
  fine 
WHERE 
  fine.date_violation < '2020-02-01';
SELECT 
  * 
FROM 
  fine;