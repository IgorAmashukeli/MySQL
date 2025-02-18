/*
Select groups of students according to the method of passing the steps:

Group I is those users who, after trying to solve a step correctly, make the wrong one (most likely in order to experiment or check how the examples work);
Group II is those users who make more than one correct attempt for one step (perhaps they are improving their solution or trying another option);
The third group is those users who could not solve the task of a certain step (all their attempts at this step were incorrect).
Output the group (I, II, III), the user's name, and the number of steps that the user performed using the appropriate method. The columns should be named Group, Student, and Number of Steps. 
Sort the information in ascending order of the group numbers, then in descending order of the number of steps, and finally by the student's name in alphabetical order.
*/



SELECT 
  GroupName, 
  StudentName, 
  СountSteps 
FROM 
  (
    SELECT 
      'I' AS GroupName, 
      student_name AS StudentName, 
      COUNT(step_id) AS СountSteps 
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
      StudentName 
    UNION ALL 
    SELECT 
      'II' AS GroupName, 
      student_name AS StudentName, 
      COUNT(step_id) AS СountSteps 
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
      ) <> (
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
          AND stp_std.result = 'correct'
      ) 
    GROUP BY 
      StudentName 
    UNION ALL 
    SELECT 
      'III' AS GroupName, 
      student_name AS StudentName, 
      COUNT(step_id) AS СountSteps 
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
          COUNT(submission_time) 
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
      ) = (
        SELECT 
          COUNT(submission_time) 
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
      ) 
    GROUP BY 
      StudentName
  ) AS final 
ORDER BY 
  GroupName, 
  СountSteps DESC, 
  StudentName;


/*another way to do it*/