/*
Display how many attempts students have made in each discipline, as well as the average result of attempts, rounded to 2 decimal places.
The result of an attempt is the percentage of correct answers to the test questions, which is listed in the result column.
Include the name of the discipline in the result,
as well as the calculated columns Amount and Average. The information is displayed in descending order of average results.
*/



SELECT 
  subject.name_subject, 
  COUNT(attempt.date_attempt) AS Amount, 
  ROUND(
    AVG(attempt.result), 
    2
  ) AS Average 
FROM 
  subject 
  LEFT JOIN attempt USING(subject_id) 
GROUP BY 
  subject.name_subject 
ORDER BY 
  СреднеAverageе DESC;