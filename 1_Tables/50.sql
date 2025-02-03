/*
In the fine table, double the amount of unpaid fines for the records selected in the previous step.

-- you can use subrequest in UPDATE clause with alias (otherwise you can't update the query with select from the same table)

-- Moreover, update of multiple tables works, because prev_query table was created as table of groups. It means
that each group is unique. And therefore the first row which satisfies condition on 3 ANDs is the one and only one that is needed
*/


UPDATE 
  fine, 
  (
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
  ) AS prev_query 
SET 
  fine.sum_fine = fine.sum_fine * 2 
WHERE 
  (fine.date_payment IS NULL) 
  AND (fine.name = prev_query.name) 
  AND (
    fine.number_plate = prev_query.number_plate
  ) 
  AND (
    fine.violation = prev_query.violation
  );
SELECT 
  * 
FROM 
  fine;