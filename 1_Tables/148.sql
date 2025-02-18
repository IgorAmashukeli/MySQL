


SELECT 
  Группа, 
  Студент, 
  Количество_шагов 
FROM 
  (
    SELECT 
      'I' AS Группа, 
      student_name AS Студент, 
      COUNT(step_id) AS Количество_шагов 
    FROM 
      (
        SELECT 
          student_name, 
          step_id 
        FROM 
          student 
          INNER JOIN step_student USING(student_id) 
        GROUP BY 
          student_name, 
          step_id
      ) stp_std0 
    WHERE 
      (
        SELECT 
          MIN(submission_time) 
        FROM 
          (
            SELECT 
              student_name, 
              step_id, 
              submission_time, 
              result 
            FROM 
              student 
              INNER JOIN step_student USING(student_id)
          ) AS stp_std 
        WHERE 
          stp_std.student_name = stp_std0.student_name 
          AND stp_std.step_id = stp_std0.step_id 
          AND stp_std.result = 'correct'
      ) <= (
        SELECT 
          MAX(submission_time) 
        FROM 
          (
            SELECT 
              student_name, 
              step_id, 
              submission_time, 
              result 
            FROM 
              student 
              INNER JOIN step_student USING(student_id)
          ) AS stp_std 
        WHERE 
          stp_std.student_name = stp_std0.student_name 
          AND stp_std.step_id = stp_std0.step_id 
          AND stp_std.result = 'wrong'
      ) 
    GROUP BY 
      Студент 
    UNION ALL 
    SELECT 
      'II' AS Группа, 
      Студент, 
      COUNT(
        Количество_шагов
      ) AS Количество_шагов 
    FROM 
      (
        SELECT 
          student_name AS Студент, 
          step_id AS Количество_шагов 
        FROM 
          student 
          INNER JOIN step_student USING(student_id) 
        WHERE 
          step_student.result = 'correct' 
        GROUP BY 
          student_name, 
          step_id 
        HAVING 
          COUNT(*) >= 2
      ) AS sec_tbl 
    GROUP BY 
      Студент 
    UNION ALL 
    SELECT 
      'III' AS Группа, 
      student_name AS Студент, 
      COUNT(step_id) AS Количество_шагов 
    FROM 
      (
        SELECT 
          student_name, 
          step_id 
        FROM 
          student 
          INNER JOIN step_student USING(student_id) 
        GROUP BY 
          student_name, 
          step_id
        HAVING COUNT(*) = SUM(IF(step_student.result = 'wrong', 1, 0))
    ) stp_std0 
    GROUP BY Студент 