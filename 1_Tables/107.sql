/*
Calculate the test results. The result of the attempt is calculated as the number of correct answers divided by 3 
(the number of questions in each attempt) and multiplied by 100. Round the result to two decimal places. 
Print the student's last name, the name of the subject, the date and the result. 
The last column is the name of the Result. Sort the information first by the student's last name, then in descending order of the date of the attempt.
*/


SELECT 
  student.name_student, 
  subject.name_subject, 
  attempt.date_attempt, 
  reses.res AS Result 
FROM 
  attempt 
  INNER JOIN (
    SELECT 
      attempt_id, 
      ROUND(
        100 * AVG(answer.is_correct), 
        2
      ) AS res 
    FROM 
      answer 
      INNER JOIN testing ON answer.answer_id = testing.answer_id 
    GROUP BY 
      testing.attempt_id
  ) AS reses ON attempt.attempt_id = reses.attempt_id 
  INNER JOIN student ON student.student_id = attempt.student_id 
  INNER JOIN subject ON subject.subject_id = attempt.subject_id 
ORDER BY 
  student.name_student, 
  attempt.date_attempt DESC;