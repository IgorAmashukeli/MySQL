/*
For a student named student_59, output the following information for all his attempts:

step information: module number, symbol '.', lesson position in the module, 
symbol '.', step position in the module;
the sequence number of the attempt for each step is determined by the increasing time of sending the attempt;
the result of the attempt;
The time of the attempt (converted to the time format) is defined as the difference between the time when the attempt was sent and the time when it started. 
If the attempt lasted more than 1 hour, then the time of the attempt should be replaced by the average time of all user attempts in all steps, 
excluding those that lasted more than 1 hour.;
Relative attempt time is defined as the ratio of the attempt time (taking into account the replacement of the attempt time) to the total time of all step attempts, 
rounded to two decimal places.
The columns should be named Student, Step, Test Number, Result, Test Time, and Relative Time. Sort the information first by ascending step id, 
and then by ascending attempt number (determined by the time the attempt was sent).
Important. All calculations should be performed in seconds, rounded up, and converted to a time format only for displaying the result.
*/



SET 
  @hour := 60 * 60;
WITH prel_table (stud, step_id, stp, nm, res, tm) AS (
  SELECT 
    student_name AS stud, 
    step_id, 
    CONCAT(
      module_id, '.', lesson_position, '.', 
      step_position
    ) AS stp, 
    submission_time AS nm, 
    step_student.result AS res, 
    IF(
      submission_time - attempt_time < @hour, 
      submission_time - attempt_time, 
      (
        SUM(
          IF(
            submission_time - attempt_time < @hour, 
            submission_time - attempt_time, 0
          )
        ) OVER(PARTITION BY student_name)
      ) / (
        COUNT(
          IF(
            submission_time - attempt_time < @hour, 
            submission_time - attempt_time, NULL
          )
        ) OVER(PARTITION BY student_name)
      )
    ) AS tm 
  FROM 
    lesson 
    INNER JOIN step USING(lesson_id) 
    INNER JOIN step_student USING(step_id) 
    INNER JOIN student USING(student_id) 
  WHERE 
    student_name = 'student_59' 
  ORDER BY 
    step_id, 
    nm
) 
SELECT 
  stud AS StudentName, 
  stp AS StepName, 
  ROW_NUMBER() OVER(
    PARTITION BY stp 
    ORDER BY 
      nm
  ) AS AttemptNumber, 
  res AS ResultValue, 
  SEC_TO_TIME(
    ROUND(tm)
  ) AS AttemptTime, 
  ROUND(
    100 * tm / (
      SUM(tm) OVER(PARTITION BY step_id)
    ), 
    2
  ) AS RelativeTime 
FROM 
  prel_table 
ORDER BY 
  step_id, 
  AttemptNumber;



