/*
Display educational programs for which the minimum USE score in each subject is greater than or equal to 40 points. 
The programs are displayed in alphabetical order.
*/



SELECT 
  DISTINCT(program.name_program) 
FROM 
  program 
  INNER JOIN program_subject ON program.program_id = program_subject.program_id 
GROUP BY 
  program.name_program 
HAVING 
  MIN(program_subject.min_result) >= 40 
ORDER BY 
  program.name_program;