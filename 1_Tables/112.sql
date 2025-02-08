/*
The student has passed the test (that is, all his answers are listed in the testing table), 
then you need to calculate the result (query) and enter it in the attempt table for the corresponding attempt.  
The result of the attempt is calculated as the number of correct answers divided by 3 (the number of questions in each attempt) 
and multiplied by 100. Round the result to the nearest integer.
Let's assume that we know the id of the attempt for which the result is calculated, in our case it is 8.
*/



UPDATE
  attempt
  INNER JOIN 
  (
      SELECT testing.attempt_id, ROUND(100 * AVG(answer.is_correct)) as avg_res
      FROM
      testing
      INNER JOIN answer ON testing.answer_id = answer.answer_id
      GROUP BY testing.attempt_id
      
  ) antest
  SET attempt.result = antest.avg_res
  WHERE attempt.attempt_id = (
      SELECT MAX(testing.attempt_id)
      FROM testing
  );

SELECT * FROM attempt;