/*
Calculate the number of points of each applicant for each educational program for which he has applied based on the results of the Unified State Exam. 
The result should include the name of the educational program, the last name and the first name of the applicant, as well as a column with the total points, 
which should be called itog. The information should be displayed in the form sorted first by the educational program, 
and then in descending order of the total points.
*/



SELECT 
  program.name_program, 
  enrollee.name_enrollee, 
  SUM(result) AS itog 
FROM 
  program_enrollee 
  RIGHT JOIN enrollee USING(enrollee_id) 
  INNER JOIN enrollee_subject USING(enrollee_id) 
  INNER JOIN program_subject USING(subject_id) 
  INNER JOIN program ON program_enrollee.program_id = program.program_id 
WHERE 
  program_enrollee.program_id = program_subject.program_id 
GROUP BY 
  enrollee.name_enrollee, 
  program.name_program 
ORDER BY 
  program.name_program, 
  itog DESC;
