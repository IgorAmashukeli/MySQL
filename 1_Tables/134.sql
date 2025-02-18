/*
Create the no_universty table, which includes students who could not enroll in any specialty. 
Include the student's last name and first name and their final score in the table.
*/


CREATE TABLE no_university (
  SELECT 
    name_enrollee, 
    itog 
  FROM 
    program 
    INNER JOIN applicant_order USING(program_id) 
    INNER JOIN enrollee USING(enrollee_id) 
  GROUP BY 
    name_enrollee, 
    itog 
  HAVING 
    SUM(
      IF(str_id > plan, 1, 0)
    ) = COUNT(*)
);
SELECT 
  * 
FROM 
  no_university;

