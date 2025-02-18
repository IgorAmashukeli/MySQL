/*
Display the educational programs that have the largest enrollment plan, along with this value.
*/


SELECT 
  name_program, 
  plan 
FROM 
  program 
WHERE 
  plan = (
    SELECT 
      MAX(plan) 
    FROM 
      program
  );