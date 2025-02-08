/*
Output the questions that were included in the test for Ivan Semenov in the discipline "Fundamentals of SQL" 2020-05-17
(the value of the attempt_id for this attempt is 7). Specify which answer the student gave and whether it is correct or not (output True or False).
Include the question, the answer, and the calculated Result column in the result.
*/


SELECT 
  question.name_question, 
  answer.name_answer, 
  IF(
    is_correct, 'Correct', 'Incorrect'
  ) AS Результат 
FROM 
  question 
  INNER JOIN testing ON question.question_id = testing.question_id 
  AND subject_id = (
    SELECT 
      subject.subject_id 
    FROM 
      subject 
    WHERE 
      name_subject = 'Fundamentals of SQL'
  ) 
  AND (
    testing.attempt_id = (
      SELECT 
        attempt.attempt_id 
      FROM 
        attempt 
      WHERE 
        attempt.date_attempt = '2020-05-17' 
        AND attempt.student_id = (
          SELECT 
            student_id 
          FROM 
            student 
          WHERE 
            name_student = 'Semenov Ivan'
        )
    )
  ) 
  INNER JOIN answer ON testing.answer_id = answer.answer_id;