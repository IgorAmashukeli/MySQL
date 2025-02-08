/*
For each question, output the percentage of successful solutions, that is, 
the ratio of the number of correct answers to the total number of answers, rounded to 2 decimal places. 
Also, display the name of the subject to which the question relates and the total number of answers to this question. 
The result should include the name of the discipline, questions about it (the name the Question column),
as well as two calculated columns of All_results and Success. Sort the information first by the name of the discipline, 
then in descending order of success, and then by the text of the question in alphabetical order.

Since the texts of the questions can be long, trim them to 30 characters and add an ellipsis "...".
*/



SELECT 
  subject.name_subject, 
  CONCAT(
    SUBSTRING(question.name_question, 1, 30), 
    '...'
  ) AS Question, 
  COUNT(testing.answer_id) AS All_results, 
  ROUND(
    100 * AVG(answer.is_correct), 
    2
  ) AS Success 
FROM 
  subject 
  INNER JOIN question USING(subject_id) 
  LEFT JOIN testing USING(question_id) 
  INNER JOIN answer USING(answer_id) 
GROUP BY 
  question.name_question, 
  subject.name_subject 
ORDER BY 
  subject.name_subject, 
  Success DESC, 
  Question;
