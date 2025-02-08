/*
Randomly select 3 questions on the discipline "Fundamentals of databases". 
Include the question_id and name_question columns in the result.
*/



SELECT 
  question.question_id, 
  question.name_question 
FROM 
  question 
  INNER JOIN subject USING(subject_id) 
WHERE 
  subject.name_subject = 'Fundamentals of databases' 
ORDER BY 
  RAND() 
LIMIT 
  3;
