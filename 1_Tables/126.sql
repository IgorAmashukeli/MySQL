/*
"Second chance"

Print the names of the students who could have enrolled in the program based on their scores, 
but did not apply for it.

For example, our beloved Pavel Baranov did not pass the scores in his programs, 
but could have enrolled in "Mathematics and Computer Science
*/


SELECT 
  not_program_enrollee.name_program, 
  not_program_enrollee.name_enrollee 
FROM 
  
  /*selecting such programs, that doesn't list in program_enrollee (they are null, when left joined with full join)*/
  (
    SELECT 
      DISTINCT program.name_program, 
      program.program_id, 
      enrollee.enrollee_id, 
      enrollee.name_enrollee 
    FROM 
      program CROSS 
      JOIN enrollee 
      LEFT JOIN program_enrollee ON program_enrollee.enrollee_id = enrollee.enrollee_id 
      AND program_enrollee.program_id = program.program_id 
    WHERE 
      program_enrollee.program_id IS NULL
  ) AS not_program_enrollee 


  /*and selecting needed subjects for this programs*/
  INNER JOIN program_subject USING(program_id) 


  /*joining two tables of (program, enrollee, subject) : 
  the second lists such tuples, where enrollee didn't apply for program and all submitted subjects
  */
  LEFT JOIN (
    SELECT 
      not_program_enrollee2.name_program, 
      enrollee_subject.enrollee_id, 
      enrollee_subject.subject_id, 
      enrollee_subject.result 
    FROM 

      /*joining such programs with the subject that students did*/
      enrollee_subject 
      INNER JOIN (

        /*again selecting such programs, that doesn't list in program_enrollee (they are null, when left joined with full join)*/
        SELECT 
          DISTINCT program.name_program, 
          program.program_id, 
          enrollee.enrollee_id 
        FROM 
          program CROSS 
          JOIN enrollee 
          LEFT JOIN program_enrollee ON program_enrollee.enrollee_id = enrollee.enrollee_id 
          AND program_enrollee.program_id = program.program_id 
        WHERE 
          program_enrollee.program_id IS NULL
      ) AS not_program_enrollee2 ON enrollee_subject.enrollee_id = not_program_enrollee2.enrollee_id


  ) 
  AS na_en_su ON not_program_enrollee.name_program = na_en_su.name_program
  AND not_program_enrollee.enrollee_id = na_en_su.enrollee_id 
  AND program_subject.subject_id = na_en_su.subject_id 


/*grouping by program and student*/
GROUP BY 
  not_program_enrollee.name_program, 
  not_program_enrollee.name_enrollee 
HAVING 

  /*means: number of rows is equal to number of non-null rows in na_en_su.subjec_id
  it can be null <=> the student didn't even take such exam
  so it filters students and programs such that all the exams were taken
  */
  COUNT(*) = COUNT(na_en_su.subject_id) 

  /*finally we create a special column, where check, if the taken exam result is >= to min result for subject
  we compare the number of such subjects to total subjects
  */
  AND SUM(
    IF(
      na_en_su.result >= program_subject.min_result, 
      1, 0
    )
  ) = COUNT(*) 
    /*with these two checks in having, we filter only students, who took all exams and got requred marks:
    note, that if you filter only by the result, using join, you will just select students, who passed all
    such exams that they require AMONG those they taken: for example, if they pass 3/4 exams and 4th exam is not
    even taken, this will be added to the result
    */

ORDER BY 
  name_program, 
  name_enrollee;