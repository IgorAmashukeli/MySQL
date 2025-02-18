/*
For a student named student_61, output all his attempts: the name of the step, the result, and the date of sending the attempt (submission_time). 
Sort the information by the date the attempt was sent and specify how many minutes have passed between sending neighboring attempts. 
The name of the step should be limited to 20 characters and add "...". The columns should be named Student, Step, Result, Shipping Date, Difference.
*/


SELECT 
  student.student_name AS StudentName, 
  CONCAT(
    LEFT(step.step_name, 20), 
    '...'
  ) AS StepName, 
  step_student.result AS ResultValue, 
  FROM_UNIXTIME(step_student.submission_time) AS SubmissionTime, 
  SEC_TO_TIME(
    IFNULL(
      step_student.submission_time - LAG(step_student.submission_time) OVER (
        ORDER BY 
          step_student.submission_time ASC
      ), 
      0
    )
  ) AS Difference 
FROM 
  step 
  INNER JOIN step_student USING(step_id) 
  INNER JOIN student USING(student_id) 
WHERE 
  student.student_name = 'student_61';