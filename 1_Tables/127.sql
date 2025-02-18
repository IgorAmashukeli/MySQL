/*
Create an auxiliary applicanttable where you can include the id of the educational program, 
the applicant's id, the amount of applicants' points (the itog column), sorted first by the id of the educational program, 
and then in descending order of the amount of points (use the query from the previous lesson).
*/


CREATE TABLE applicant AS (
  SELECT 
    program_enrollee.program_id, 
    program_enrollee.enrollee_id, 
    SUM(enrollee_subject.result) AS itog 
  FROM 
    enrollee_subject 
    INNER JOIN program_enrollee USING(enrollee_id) 
    INNER JOIN program_subject ON program_subject.subject_id = enrollee_subject.subject_id 
    AND program_subject.program_id = program_enrollee.program_id 
  GROUP BY 
    program_enrollee.program_id, 
    program_enrollee.enrollee_id 
  ORDER BY 
    program_id, 
    itog DESC
);

