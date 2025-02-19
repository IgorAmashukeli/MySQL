


SELECT 
  Группа, 
  Студент, 
  Количество_шагов 
FROM 
  (
        SELECT 
    'I' AS Группа, 
    stdnt AS Студент, 
    COUNT(stp) AS Количество_шагов 
    FROM 
    (
        SELECT 
        student_name AS stdnt, 
        step_id AS stp, 
        result AS res, 
        LAG(result) OVER(
            PARTITION BY student_name, 
            step_id 
            ORDER BY 
            submission_time
        ) AS res_prev 
        FROM 
        student 
        INNER JOIN step_student USING(student_id)
    ) AS reses 
    WHERE 
    res IS NOT NULL 
    AND res_prev IS NOT NULL 
    AND res = 'wrong' 
    AND res_prev = 'correct' 
    GROUP BY 
    stdnt

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
  ) AS final 
ORDER BY 
  Группа, 
  Количество_шагов DESC, 
  Студент;