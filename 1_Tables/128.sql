/*
Delete entries from the applicant table created in the previous step 
if the applicant for the selected educational program did not score the minimum score in at least one subject 
(use the query from the previous lesson).
*/


DELETE FROM 
  applicant USING applicant 
  INNER JOIN program_enrollee ON program_enrollee.program_id = applicant.program_id 
  AND program_enrollee.enrollee_id = applicant.enrollee_id 
  INNER JOIN program_subject ON program_enrollee.program_id = program_subject.program_id 
  INNER JOIN enrollee_subject ON enrollee_subject.enrollee_id = program_enrollee.enrollee_id 
  AND enrollee_subject.subject_id = program_subject.subject_id 
WHERE 
  enrollee_subject.result < program_subject.min_result;
SELECT 
  * 
FROM 
  applicant;
