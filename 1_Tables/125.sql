/*
Print the name of the educational program and the last name of those applicants who applied for this educational program but cannot be enrolled in it. 
These applicants have a result in one or more subjects of the Unified State Exam, necessary for admission to this educational program, less than the minimum score. 
The information should be displayed in a form sorted first by programs, and then by the names of applicants.

For example, Pavel Baranov scored 41 points in Physics, and for the Applied Mechanics educational program, 
the minimum score in this subject is set at 45 points. Therefore, the applicant cannot enroll in this program.
*/



/*one of the ways*/
SELECT 
  program.name_program, 
  enrollee.name_enrollee 
FROM 
  program_enrollee 
  RIGHT JOIN enrollee USING(enrollee_id) 
  RIGHT JOIN enrollee_subject USING(enrollee_id) 
  RIGHT JOIN program_subject USING(subject_id) 
  INNER JOIN program ON program.program_id = program_enrollee.program_id 
WHERE 
  program_subject.program_id = program_enrollee.program_id 
  AND enrollee_subject.result < program_subject.min_result 
GROUP BY 
  enrollee.name_enrollee, 
  program.name_program 
ORDER BY 
  program.name_program, 
  enrollee.name_enrollee;


/*another way*/


SELECT 
  DISTINCT program.name_program, 
  enrollee.name_enrollee 
FROM 
  program_enrollee 
  RIGHT JOIN enrollee USING(enrollee_id) 
  RIGHT JOIN enrollee_subject USING(enrollee_id) 
  RIGHT JOIN program_subject USING(subject_id) 
  INNER JOIN program ON program.program_id = program_enrollee.program_id 
WHERE 
  program_subject.program_id = program_enrollee.program_id 
  AND enrollee_subject.result < program_subject.min_result 
ORDER BY 
  program.name_program, 
  enrollee.name_enrollee;
