/*
Implement a keyword search. Print the steps that the keywords MAX and AVG are associated with at the same time. 
For the steps, specify the module id, the lesson position in the module, the step position in the lesson separated by a dot, 
and a space after the step position before the title. The step position in the lesson should be displayed as two digits 
(if the step position is less than 10, then put 0 before the number). Column name the Step. Sort the information by the first column in alphabetical order.
*/

/*two ways of adding leading 0*/
/*CONCAT(0, step.step_position)*/
/*LPAD(step.step_position, 2, '0')*/


select 
  CONCAT(
    module.module_id, 
    '.', 
    lesson.lesson_position, 
    '.', 
    IF(
      step.step_position >= 10, 
      step.step_position, 
      CONCAT(0, step.step_position)
    ), 
    ' ', 
    step.step_name
  ) AS Step 
FROM 
  module 
  INNER JOIN lesson USING(module_id) 
  INNER JOIN step USING(lesson_id) 
  INNER JOIN step_keyword USING(step_id) 
  INNER JOIN keyword USING(keyword_id) 
GROUP BY 
  step_id 
HAVING 
  SUM(
    IF(keyword_name = 'MAX', 1, 0)
  ) > 0 
  AND SUM(
    IF(keyword_name = 'AVG', 1, 0)
  ) 
ORDER BY 
  Step;