/*
Print the numbers of all paid orders and the dates when they were paid.
*/



SELECT buy_id, date_step_end FROM
buy_step INNER JOIN step
ON buy_step.step_id = step.step_id
WHERE name_step = 'Payment' AND date_step_end IS NOT NULL;
