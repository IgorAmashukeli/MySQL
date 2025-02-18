/*
Include a new str_id column of the whole type in the applicant_order table and place it before the first one.
*/


ALTER TABLE 
  applicant_order 
ADD 
  str_id INT FIRST;
SELECT 
  * 
FROM 
  applicant_order;