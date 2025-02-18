/*
To display applicants who want to enroll in the educational program "Mechatronics and Robotics" in a form sorted by last name.
*/



SELECT 
  enrollee.name_enrollee 
FROM 
  program 
  INNER JOIN program_enrollee ON program.program_id = program_enrollee.program_id 
  AND program.name_program = 'Mechatronics and Robotics' 
  INNER JOIN enrollee USING(enrollee_id) 
ORDER BY 
  enrollee.name_enrollee;