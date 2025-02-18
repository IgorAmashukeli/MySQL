/*
To display the educational programs for which the subject "Computer Science" is required for admission. 
Sort programs in reverse alphabetical order
*/



SELECT 
  program.name_program 
FROM 
  subject 
  INNER JOIN program_subject ON subject.subject_id = program_subject.subject_id 
  AND subject.name_subject = 'Computer Science' 
  INNER JOIN program USING(program_id) 
ORDER BY 
  program.name_program DESC;