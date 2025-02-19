/*
To improve academic performance, provide students with the opportunity to take the test again.

For students who have fewer than 3 attempts and a maximum score of < 70, 
add new attempts in the relevant subjects with the current date to the attempt table.
*/



INSERT INTO attempt (
  student_id, subject_id, date_attempt
) 
SELECT 
  student_id, 
  subject_id, 
  CURDATE() AS date_attempt 
FROM 
  attempt 
GROUP BY 
  student_id, 
  subject_id 
HAVING 
  COUNT(*) < 3 
  AND MAX(result) < 70;
SELECT 
  * 
FROM 
  attempt;

