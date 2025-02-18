/*
Calculate the rating of each student relative to the student who completed the most steps in the module 
(calculated as the ratio of the number of steps completed by the student to the maximum number of steps completed multiplied by 100).
 Output the module number, the student's name, the number of steps they have completed, and the relative rating. 
 Round the relative rating to one decimal place. The columns are named Module, Student, Passed_step, and Relative_rate, respectively. 
 The information should be sorted first by ascending module number, then by descending relative rating, and finally by student name in alphabetical order.
*/



SET 
  @sec_to_hour := 60 * 60;
SELECT 
  ROW_NUMBER() OVER (
    ORDER BY 
      SUM(submission_time - attempt_time) / COUNT(
        DISTINCT(student_id)
      )
  ) AS NumberName, 
  CONCAT(
    module_id, '.', lesson_position, ' ', 
    lesson_name
  ) AS LessonName, 
  ROUND(
    SUM(submission_time - attempt_time) / COUNT(
      DISTINCT(student_id)
    ) / @sec_to_hour, 
    2
  ) AS AverageTime 
FROM 
  module 
  INNER JOIN lesson USING(module_id) 
  INNER JOIN step USING(lesson_id) 
  INNER JOIN step_student USING(step_id) 
  INNER JOIN student USING(student_id) 
WHERE 
  submission_time - attempt_time <= 4 * @sec_to_hour 
GROUP BY 
  module_id, 
  lesson_position, 
  lesson_name;