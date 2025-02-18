/*
Display the educational programs that require the subjects "Computer Science" and "Mathematics" in sorted form by program name.
*/



SELECT 
  mat_inf.name_program AS name_program 
FROM 
    (
        SELECT mat.name_program FROM
      (
        SELECT 
          program.name_program, 
          subject.subject_id 
        FROM 
          subject 
          INNER JOIN program_subject ON subject.subject_id = program_subject.subject_id 
          AND subject.name_subject = 'Math'
          INNER JOIN program ON program_subject.program_id = program.program_id
      ) AS mat 
      INNER JOIN (
        SELECT 
          program.name_program, 
          subject.subject_id 
        FROM 
          subject 
          INNER JOIN program_subject ON subject.subject_id = program_subject.subject_id 
          AND subject.name_subject = 'ComputerScience'
          INNER JOIN program ON program_subject.program_id = program.program_id
      ) AS inf ON mat.name_program = inf.name_program
    ) AS mat_inf
    ORDER BY name_program;



/*other ways*/
SELECT 
  program.name_program 
FROM 
  subject 
  INNER JOIN program_subject USING(subject_id) 
  INNER JOIN program USING(program_id) 
GROUP BY 
  program.name_program 
HAVING 
  SUM(
    subject.name_subject IN (
      'Math', 'ComputerScience'
    )
  ) = 2 
ORDER BY 
  program.name_program;



/*or*/
SELECT 
  program.name_program 
FROM 
  subject 
  INNER JOIN program_subject USING(subject_id) 
  INNER JOIN program USING(program_id) 
WHERE 
  subject.name_subject IN (
    'Math', 'ComputerScience'
  ) 
GROUP BY 
  program.name_program 
HAVING 
  COUNT(*) = 2 
ORDER BY 
  program.name_program;



