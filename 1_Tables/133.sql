/*
Create a student table in which to include applicants who may be 
recommended for admission in accordance with the recruitment plan. 
Sort the information first in alphabetical order by program name, and then in descending order of the final score.
*/

CREATE TABLE student (
  SELECT 
    program.name_program, 
    enrollee.name_enrollee, 
    itog 
  FROM 
    enrollee 
    INNER JOIN applicant_order USING(enrollee_id) 
    INNER JOIN program USING(program_id) 
  WHERE 
    applicant_order.str_id <= program.plan 
  ORDER BY 
    program.name_program, 
    itog DESC
);

