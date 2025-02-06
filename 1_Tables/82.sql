/*

*/



SELECT 
  buy_step.buy_id, 
  step.name_step 
FROM 
  step 
  INNER JOIN buy_step USING (step_id) 
WHERE 
  buy_step.date_step_end iS NULL 
  AND buy_step.date_step_beg IS NOT NULL;