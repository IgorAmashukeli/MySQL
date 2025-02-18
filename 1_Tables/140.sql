/*
For each step, output the percentage of correct decisions. Arrange the information in ascending order of the percentage of correct decisions. 
The result columns should be named for the StepName and Success, and the percentage of successful decisions rounded to the nearest integer.
*/


/*first way*/
WITH correct_answers (
  step_name_correct, count_correct
) AS (
  SELECT 
    step_name, 
    COUNT(*) 
  FROM 
    step 
    INNER JOIN step_student USING(step_id) 
  WHERE 
    result = 'correct' 
  GROUP BY 
    step_name
), 
wrong_answers (step_name_wrong, count_wrong) AS (
  SELECT 
    step_name, 
    COUNT(*) 
  FROM 
    step 
    INNER JOIN step_student USING(step_id) 
  WHERE 
    result = 'wrong' 
  GROUP BY 
    step_name
) 
SELECT 
  step_name_wrong AS StepName, 
  IF(IFNULL(count_correct, 0) = 0, 0, ROUND(
    100 * IFNULL(count_correct, 0) / (
      IFNULL(count_correct, 0) + count_wrong
    ))
  ) AS SuccessRate 
FROM 
  correct_answers 
  RIGHT JOIN wrong_answers ON correct_answers.step_name_correct = wrong_answers.step_name_wrong 
UNION 
SELECT 
  step_name_correct AS StepName, 
  IF(count_correct = 0, 0, ROUND(
    100 * count_correct / (
      IFNULL(count_wrong, 0) + count_correct
    ))
  ) AS SuccessRate 
FROM 
  correct_answers 
  LEFT JOIN wrong_answers ON correct_answers.step_name_correct = wrong_answers.step_name_wrong 
ORDER BY 
  SuccessRate, 
  StepName;




/*another way*/
WITH correct_answers (
  step_name_correct, count_correct
) AS (
  SELECT 
    step_name, 
    COUNT(*) 
  FROM 
    step 
    INNER JOIN step_student USING(step_id) 
  WHERE 
    result = 'correct' 
  GROUP BY 
    step_name
), 
total_answers (step_name_total, count_total) AS (
  SELECT 
    step_name, 
    COUNT(*) 
  FROM 
    step 
    INNER JOIN step_student USING(step_id) 
  GROUP BY 
    step_name
) 
SELECT step_name_total AS StepName, IF(IFNULL(count_correct, 0) = 0, 0, ROUND(
    100 * IFNULL(count_correct, 0) / (
      IFNULL(count_correct, 0) + count_wrong
    ))
  ) AS SuccessRate
FROM
correct_answers
RIGHT JOIN total_answers ON correct_answers.step_name_correct = total_answers.step_name_total
ORDER BY SuccessRate, StepName;



/*third way*/
SELECT 
  step_name AS StepName, 
  ROUND(
    AVG(
      IF(result = 'correct', 1, 0)
    ) * 100
  ) AS SuccessRate 
FROM 
  step 
  INNER JOIN step_student USING(step_id) 
GROUP BY 
  step_id 
ORDER BY 
  SuccessRate, 
  StepName;
