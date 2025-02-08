/*
Calculate the number of attempts and the average score in subjects for each student (as previously done).
For students who have fewer than 3 attempts and a score of < 60, add new attempts in the relevant subjects with the current date to the attempt table.
*/


INSERT INTO attempt (
  student_id, subject_id, date_attempt
) 
SELECT 
  attempt.student_id, 
  attempt.subject_id, 
  NOW() 
FROM 
  student 
  INNER JOIN attempt USING(student_id) 
GROUP BY 
  attempt.student_id, 
  attempt.subject_id 
HAVING 
  ROUND(
    AVG(attempt.result), 
    2
  ) < 60 
  AND COUNT(*) < 3;
SELECT 
  * 
FROM 
  attempt;