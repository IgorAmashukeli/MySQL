/*
Students can be tested in one or more disciplines (not necessarily all). 
Display the discipline and the number of unique students (name the Number column) who have been tested in it. 
Sort the information first in descending order of quantity, and then by the name of the discipline. 
The result should also include the subjects that the students did not take the test for, in this case, specify the number of students 0.
*/



SELECT 
  subject.name_subject, 
  COUNT(
    DISTINCT(attempt.student_id)
  ) AS Amount 
FROM 
  subject 
  LEFT JOIN attempt USING(subject_id) 
GROUP BY 
  subject.subject_id, 
  subject.name_subject 
ORDER BY 
  Amount DESC, 
  subject.name_subject;
