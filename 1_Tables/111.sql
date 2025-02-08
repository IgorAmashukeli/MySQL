/*
Randomly select three questions (query)
for the discipline in which the student who is last listed in the attempt table is going to be tested 
and add them to the table testing.id the last attempt to get the maximum id value from the attempt table.
*/



INSERT INTO testing (attempt_id, question_id) 
SELECT 
  attempt.attempt_id, 
  question.question_id 
FROM 
  question 
  INNER JOIN attempt USING(subject_id) 
WHERE 
  attempt.attempt_id = (
    SELECT 
      MAX(attempt.attempt_id) 
    FROM 
      attempt
  ) 
ORDER BY 
  RAND() 
LIMIT 
  3;