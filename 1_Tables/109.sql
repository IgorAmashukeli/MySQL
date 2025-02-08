/*
Find the question to which the maximum number of correct answers was given - 
"The easiest" and the question to which the minimum number of correct answers was given - "The most difficult"

(UPD based on student comments: 
find the easiest and most difficult questions for students based on the percentage of correct answers from the total number of attempts).

Select the subject, these two questions, and the indication of whether this is the most difficult or easiest question.
*/




SELECT 
  subject.name_subject, 
  CONCAT(
    SUBSTRING(question.name_question, 1, 30), 
    '...'
  ) AS question, 
  'The most difficult' 
FROM 
  subject 
  INNER JOIN question USING(subject_id) 
  LEFT JOIN testing USING(question_id) 
  INNER JOIN answer USING(answer_id) 
GROUP BY 
  question.name_question, 
  subject.name_subject 
HAVING 
  ROUND(
    (
      AVG(answer.is_correct)
    ), 
    2
  ) <= ALL(
    SELECT 
      ROUND(
        (
          AVG(answer.is_correct)
        ), 
        2
      ) AS SuccessRate 
    FROM 
      subject 
      INNER JOIN question USING(subject_id) 
      LEFT JOIN testing USING(question_id) 
      INNER JOIN answer USING(answer_id) 
    GROUP BY 
      question.name_question, 
      subject.name_subject
  ) 
UNION ALL 
SELECT 
  subject.name_subject, 
  CONCAT(
    SUBSTRING(question.name_question, 1, 30), 
    '...'
  ) AS question, 
  'The most easiest' 
FROM 
  subject 
  INNER JOIN question USING(subject_id) 
  LEFT JOIN testing USING(question_id) 
  INNER JOIN answer USING(answer_id) 
GROUP BY 
  question.name_question, 
  subject.name_subject 
HAVING 
  ROUND(
    (
      AVG(answer.is_correct)
    ), 
    2
  ) >= ALL(
    SELECT 
      ROUND(
        (
          AVG(answer.is_correct)
        ), 
        2
      ) AS SuccessRate 
    FROM 
      subject 
      INNER JOIN question USING(subject_id) 
      LEFT JOIN testing USING(question_id) 
      INNER JOIN answer USING(answer_id) 
    GROUP BY 
      question.name_question, 
      subject.name_subject
  );

