/*
Bring out the students (various students) who have the maximum results of their attempts.
Sort the information in alphabetical order by the student's last name.
*/


SELECT 
  DISTINCT(student.name_student), 
  (
    SELECT 
      MAX(attempt.result) As Maximum 
    FROM 
      student 
      LEFT JOIN attempt USING(student_id)
  ) AS result 
FROM 
  student 
  LEFT JOIN attempt USING(student_id) 
WHERE 
  attempt.result = (
    SELECT 
      MAX(attempt.result) As Maximum 
    FROM 
      student 
      LEFT JOIN attempt USING(student_id)
  ) 
ORDER BY 
  student.name_student;


/*
Other ways to do it: where result >= any results
*/

SELECT 
  DISTINCT name_student, 
  result 
FROM 
  student 
  INNER JOIN attempt USING(student_id) 
WHERE 
  result >= ALL(
    SELECT 
      result 
    FROM 
      attempt
  ) 
ORDER BY 
  name_student;


/*
Another way to do it: inner join with result equal to max
*/


SELECT 
  name_student, 
  result 
FROM 
  student s 
  INNER JOIN attempt a ON s.student_id = a.student_id 
  AND result = (
    SELECT 
      MAX(result) 
    FROM 
      attempt
  ) 
ORDER BY 
  1