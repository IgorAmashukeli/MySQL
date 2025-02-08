/*
If a student has made several attempts in the same discipline, then output the difference in days between the first and last attempt. 
The result should include the student's last name and first name, the name of the discipline, and the calculated Interval column. 
Output the information in ascending order of the difference.
Students who have made one attempt in the discipline should not be counted.
*/


SELECT 
  student.name_student, 
  subject.name_subject, 
  DATEDIFF(
    MAX(attempt.date_attempt), 
    MIN(attempt.date_attempt)
  ) AS IntervalData 
FROM 
  student 
  INNER JOIN attempt USING(student_id) 
  INNER JOIN subject USING(subject_id) 
GROUP BY 
  student.name_student, 
  subject.name_subject 
HAVING 
  MIN(attempt.date_attempt) <> MAX(attempt.date_attempt) 
ORDER BY 
  IntervalData;
