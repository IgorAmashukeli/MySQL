/*
Analyze in what order and at what interval the user sent the last correctly completed task of each lesson. Consider only students who have completed 
at least one step of all three lessons. The database contains student attempts for three lessons of the course, so the analysis should be carried out only for these lessons.

For students who have completed at least one step in each lesson, find the last completed step of each lesson - the last step, and specify:

student's name;
the lesson number, consisting of the module number and the dot position of each lesson in the module;
The time of sending is the time when the decision is submitted for verification.;
the difference in the time of sending between the current and the previous extreme step in days, with a dash ("-") for the first step, and the number of days rounded up to a whole.
The columns are named Student, Lesson, Max_time, and Interval, respectively. Sort the results by student's name in alphabetical order, and then in ascending time of submission.
*/



SET 
  @count_lessons = 3;
SET 
  @sec_day = 60 * 60 * 24;
WITH mts_table (st, ls, mts) AS (
  SELECT 
    DISTINCT student_name AS st, 
    CONCAT(module_id, '.', lesson_position) AS ls, 
    MAX(submission_time) OVER(
      PARTITION BY student_name, module_id, 
      lesson_position
    ) AS mts 
  FROM 
    lesson 
    INNER JOIN step USING(lesson_id) 
    INNER JOIN step_student USING(step_id) 
    INNER JOIN student USING(student_id) 
  WHERE 
    step_student.result = 'correct' 
    AND student_name IN (
      SELECT 
        student_name 
      FROM 
        lesson 
        INNER JOIN step USING(lesson_id) 
        INNER JOIN step_student USING(step_id) 
        INNER JOIN student USING(student_id) 
      WHERE 
        step_student.result = 'correct' 
      GROUP BY 
        student_name 
      HAVING 
        COUNT(
          DISTINCT(lesson_id)
        ) = @count_lessons
    ) 
  ORDER BY 
    student_name, 
    mts
) 
SELECT 
  st AS StudentName, 
  ls AS LessonName, 
  FROM_UNIXTIME(mts) AS MaxTime, 
  IFNULL(
    CEIL(
      (
        mts - LAG(mts) OVER (
          PARTITION BY st 
          ORDER BY 
            st, 
            mts
        )
      ) / @sec_day
    ), 
    '-'
  ) AS Interval
  FROM mts_table;


/*another way to do*/
SET 
  @count_lessons = 3;
SET 
  @sec_day = 60 * 60 * 24;
SELECT 
  StudentName, 
  LessonName, 
  MaxTime, 
  Interval 
FROM 
  (
    SELECT 
      student_name AS StudentName, 
      concat(module_id, '.', lesson_position) as LessonName, 
      FROM_UNIXTIME(
        MAX(submission_time)
      ) AS MaxTIme, 
      IFNULL(
        CEIL(
          (
            MAX(submission_time) - LAG(
              MAX(submission_time)
            ) OVER (
              PARTITION BY student_name 
              ORDER BY 
                student_name, 
                MAX(submission_time)
            )
          ) / @sec_day
        ), 
        '-'
      ) AS Interval, 
      COUNT(*) over (PARTITION BY student_name) AS my_count 
    FROM 
      lesson 
      INNER JOIN step USING(lesson_id) 
      INNER JOIN step_student USING(step_id) 
      INNER JOIN student USING(student_id) 
    WHERE 
      step_student.result = 'correct' 
    GROUP BY 
      student_name, 
      concat(module_id, '.', lesson_position) 
    ORDER BY 
      student_name, 
      MaxTIme
  ) AS sub_table 
WHERE 
  my_count = 3;
