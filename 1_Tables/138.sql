/*
Calculate how many students belong to each group. 
The columns should be named Group, Interval, and Quantity. 
Specify the boundaries of the interval.
*/



SELECT stu_ste3.group_type AS GroupType, 
    CASE
        WHEN group_type = "I" THEN "from 0 to 10"
        WHEN group_type = "II" THEN "from 11 to 15"
        WHEN group_type = "III" THEN "from 16 to 27"
        ELSE "bigger than 27"
    END AS Interval,
COUNT(*) AS CountInGroup
FROM
(SELECT 
  stu_ste2.student_name,
  CASE
      WHEN count_correct <= 10 THEN "I"
      WHEN count_correct <= 15 THEN "II"
      WHEN count_correct <= 27 THEN "III"
      ELSE "IV"
  END AS group_type
FROM 
  (
    SELECT 
      stu_ste.student_name, 
      COUNT(*) AS count_correct 
    FROM 
      (
        SELECT 
          student_name, 
          step_id 
        FROM 
          student 
          INNER JOIN step_student USING (student_id) 
        WHERE 
          result = 'correct' 
        GROUP BY 
          student_name, 
          step_id
      ) AS stu_ste 
    GROUP BY 
      stu_ste.student_name
  ) AS stu_ste2
) AS stu_ste3
GROUP BY stu_ste3.group_type
ORDER BY GroupType;