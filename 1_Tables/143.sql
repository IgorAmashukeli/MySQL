

/*
Calculate the average time it takes for users to complete a lesson using the following algorithm:

for each user, calculate the step completion time as the sum of the time spent on each attempt 
(the attempt time is the difference between the time the task was submitted and the time the attempt started), 
while attempts that lasted more than 4 hours are not taken into account, since the user could simply leave the task open in the browser and return to it the next day. day;
Calculate the total time spent on each lesson for each student.;
calculate the average lesson completion time in hours, round the result to 2 decimal places;
to display information in ascending order of time, numbering the lines, for each lesson, specify the module number and its position in it.
The columns of the result should be named Number, Lesson, Average Time.
*/


SET 
  @sec_hour := 60 * 60;
SET 
  @row_num := 0;
SELECT 
  (@row_num := @row_num + 1) AS CurNumber, 
  LessonName, 
  AvgTime 
FROM 
  (
    SELECT 
      DISTINCT CONCAT(
        module_id, '.', lesson_position, ' ', 
        LessonName
      ) AS Урок, 
      ROUND(
        AVG(
          SUM(submission_time - attempt_time)
        ) OVER (
          PARTITION BY module_id, lesson_position
        ) / @sec_hour, 
        2
      ) AS AvgTime 
    FROM 
      module 
      INNER JOIN lesson USING(module_id) 
      INNER JOIN step USING(lesson_id) 
      INNER JOIN step_student USING(step_id) 
      INNER JOIN student USING(student_id) 
    WHERE 
      submission_time - attempt_time <= 4 * @sec_hour 
    GROUP BY 
      student_id, 
      module_id, 
      lesson_position, 
      LessonName 
    ORDER BY 
      AvgTime
  ) AS without_num;


/*another way to do it*/
SET 
  @sec_to_hour := 60 * 60;
SELECT 
  ROW_NUMBER() OVER (
    ORDER BY 
      SUM(submission_time - attempt_time) / COUNT(
        DISTINCT(student_id)
      )
  ) AS Номер, 
  CONCAT(
    module_id, '.', lesson_position, ' ', 
    lesson_name
  ) AS Урок, 
  ROUND(
    SUM(submission_time - attempt_time) / COUNT(
      DISTINCT(student_id)
    ) / @sec_to_hour, 
    2
  ) AS Среднее_время 
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


/