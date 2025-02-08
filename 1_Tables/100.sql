/*
Bring out the students who took the discipline "Fundamentals of databases", specify the date of the attempt and the result.
Display the information in descending order of the test results.
*/


SELECT 
  name_student, 
  attempt.date_attempt, 
  attempt.result 
FROM 
  subject 
  INNER JOIN attempt USING(subject_id) 
  INNER JOIN student USING(student_id) 
WHERE 
  subject.name_subject = 'Fundamentals of databases' 
ORDER BY 
  attempt.result DESC;
