/*
Print out how many people have applied for each educational program and the competition for it 
(the number of applications submitted divided by the number of places according to the plan), rounded to 2 decimal places. 
In the request, print the name of the faculty to which the educational program belongs, the name of the educational program, 
the plan for the recruitment of applicants for the educational program (plan), 
the number of applications submitted (Number) and the Competition. Sort the information in descending order of the contest.
*/


SELECT 
  department.name_department, 
  program.name_program, 
  MAX(program.plan) AS plan, 
  COUNT(program_enrollee.enrollee_id) AS Competition, 
  ROUND(
    (
      COUNT(program_enrollee.enrollee_id) / MAX(program.plan)
    ), 
    2
  ) AS Competition 
FROM 
  program 
  LEFT JOIN program_enrollee USING(program_id) 
  LEFT JOIN department USING(department_id) 
GROUP BY 
  program.name_program, 
  department.name_department 
ORDER BY 
  Competition DESC;