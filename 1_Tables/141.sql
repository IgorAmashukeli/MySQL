/*
Calculate the user's progress by course. Progress is calculated as the ratio of correctly completed steps to the total number of steps, 
rounded to the nearest integer. Our database does not contain data on solutions for all steps, so the total number of steps is defined 
as the number of different steps in the step_student table.

For those users who have completed all the steps (progress = 100%), issue a "Certificate with honors". 
Those with progress greater than or equal to 80% will receive a "Certificate". For the remaining entries in the Result column, set an empty row ("").
Sort the information in descending order of progress, then by user name in alphabetical order.
*/



WITH count_steps_table (count_steps) AS (
  SELECT 
    COUNT(DISTINCT step_id) AS count_steps 
  FROM 
    step_student
) 
SELECT 
  student_name AS StudentName, 
  ROUND(
    100 * COUNT(DISTINCT step_id) / MAX(count_steps_table.count_steps)
  ) AS Progress, 
  IF(
    ROUND(
      100 * COUNT(DISTINCT step_id) / MAX(count_steps_table.count_steps)
    ) = 100, 
    'Certificate with excellence', 
    IF(
      ROUND(
        100 * COUNT(DISTINCT step_id) / MAX(count_steps_table.count_steps)
      ) >= 80, 
      'Certificate', 
      ''
    )
  ) AS ResultNum  
FROM 
  student 
  INNER JOIN step_student USING(student_id) 
  INNER JOIN count_steps_table 
WHERE 
  result = 'correct' 
GROUP BY 
  StudentName 
ORDER BY 
  Progress DESC, 
  StudentName;