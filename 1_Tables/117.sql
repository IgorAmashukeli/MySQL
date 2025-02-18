/*
Print the number of applicants who have passed the Unified State Exam in each subject, 
the maximum, minimum and average scores for the subject of the Unified State Exam. 
The calculated columns should be named as the Number, Maximum, Minimum, and Average. 
Sort the information by the name of the subject in alphabetical order, round the average value to one decimal place.
*/



SELECT 
  subject.name_subject, 
  COUNT(subject_id) AS Amount, 
  MAX(result) AS MaxRes, 
  MIN(result) AS MinRes, 
  ROUND(
    AVG(result), 
    1
  ) AS AvgRes 
FROM 
  subject 
  LEFT JOIN enrollee_subject USING(subject_id) 
GROUP BY 
  subject.name_subject 
ORDER BY 
  subject.name_subject;